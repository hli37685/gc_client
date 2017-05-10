-------------------------------------------------------------------------
-- Desc:    二人麻将玩家我自己
-- Author:  zengzx
-- Date:    2017.4.11
-- Last: 
-- Content:  
--    
-- Copyright (c) Shusi Entertainment All right reserved.
--------------------------------------------------------------------------
local TmjMyPlayer = class("TmjMyPlayer",requireForGameLuaFile("TmjPlayer"))
local TmjConfig = import("..cfg.TmjConfig")
local TmjHelper = import("..cfg.TmjHelper")
local TmjCardTip = import("..cfg.TmjCardTip")
local TmjOperationFactory = requireForGameLuaFile("TmjOperationFactory")
local TmjTingHuInfo = requireForGameLuaFile("TmjTingHuInfo")

local TmjHeadNode = requireForGameLuaFile("TmjHeadNode_1_CCS")
local scheduler = cc.Director:getInstance():getScheduler()

function TmjMyPlayer:ctor(pInfo)
	TmjMyPlayer.super.ctor(self,pInfo)
	self.pType = TmjConfig.PlayerType.Type_self
	self.cardStartPos = cc.p(100,60)
	self.extraCardPos = cc.p(100,60)
	self.outCardPos = cc.p(200,200)
	self.getCardPos = cc.p(1150,60) -- 摸到牌的位置 
	self.headPos = cc.p(50,200)
	
	self.outCardMaxLength = 8
	self.cardDirection = TmjConfig.DealDirection.L_2_R --牌的方向
	self.choosedCardIndex = 0 --被选中的牌
	self.curChooseIndex = 0 --当前这轮触摸的位置
	self.rechooseCur = false -- 是否重新选择当前牌
	
	self.isChooseTingCard = false --是否在选择听牌
	
	self.showChooseIndex = nil --显示听牌提示的索引值
	
	
end

function TmjMyPlayer:onEnter()
	self:onTouch(handler(self,self.onTouchListener),false,true)
--[[	local cards = {
		{val = TmjConfig.Card.R_1,position = display.center },
		{val = TmjConfig.Card.R_1,position = display.center },
		{val = TmjConfig.Card.R_2,position = display.center },
		{val = TmjConfig.Card.R_3,position = display.center },
		{val = TmjConfig.Card.R_4,position = display.center },
		{val = TmjConfig.Card.R_5,position = display.center },
		{val = TmjConfig.Card.R_6,position = display.center },
		{val = TmjConfig.Card.R_7,position = display.center },
		{val = TmjConfig.Card.R_8,position = display.center },
		{val = TmjConfig.Card.R_9,position = display.center },
		{val = TmjConfig.Card.R_1,position = display.center },
		{val = TmjConfig.Card.R_9,position = display.center },
		{val = TmjConfig.Card.R_9,position = display.center },
		--{val = TmjConfig.Card.R_7,position = display.center },

	}
	self:createCards(cards)
	self:showFrontCard()
	performWithDelay(self,function ()
		local inputCard = {val = TmjConfig.Card.R_1,position = display.center }
		self:getPreToPlay(inputCard)
		--self:getOneCard(inputCard)
		--self:doOperation(TmjConfig.cardOperation.GetOne,inputCard)
		--self:removeOenColorCard()
		
		local inputCard = {val = TmjConfig.Card.R_1,position = display.center }
		local result = self:checkOperation(inputCard.val,TmjCardTip.CardOperation.Peng)		
		if result then
			ssdump(result,"result")
			self:doOperation(TmjConfig.cardOperation.Peng,inputCard)
			result = self:checkOperation(inputCard.val,TmjCardTip.CardOperation.BuGang)
			if result then
				self:doOperation(TmjConfig.cardOperation.BuGang,inputCard)
			end
		else
			print("pass.....")
		end
		
		--self:getOneCard(inputCard)
		
		
	end,4)--]]
	
end

function TmjMyPlayer:onTouchListener(event)
	if event.name == "began" then
		self.curChooseIndex = nil
		self.choosedCardIndex = nil
		if self.isTingState then
			return false --听牌的时候，不能触摸牌了
		end
		self.curChooseIndex = self:chooseCard(event.x,event.y)
		return true
	elseif event.name == "moved" then
		
		self.curChooseIndex = self:chooseCard(event.x,event.y)
	elseif event.name == "ended" then
		--self:chooseCard(event.x,event.y)
		--print(self.curChooseIndex,self.choosedCardIndex)
		if self.curChooseIndex == self.choosedCardIndex then
			if self.rechooseCur and self.isPlayCard then
				self.rechooseCur = false
				--self:playCard(self.choosedCardIndex)
				local localVal = nil
				if self.choosedCardIndex>0 then
					localVal = self.handCards[self.choosedCardIndex].info.val
				else
					localVal = self.getCard.info.val
				end
				if localVal then
					if self.isChooseTingCard then --如果是要听 那么打牌的时候要发送听的请求
						TmjGameManager:getInstance():requestTing()
					end
					TmjGameManager:getInstance():requestPlayCard(localVal)
					
				else
					sslog(self.logTag,"要打什么牌，没有这个东西")
				end
				self.curChooseIndex = nil
				self.choosedCardIndex = nil
			else
				self.rechooseCur = true
			end
		else
			self.rechooseCur = false
			self:putDownCards()
		end
		
	elseif event.name == "cancelled" then
		--self:putDownCards()
		self:putDownCards()
	end
end

--根据位置 选中一个牌
--@return 是否有牌被选中
function TmjMyPlayer:chooseCard(x,y)
	local chooseIndex = 0
	local function isContainsTouch(index,x,y,TmjCard)
		if TmjCard:isContainsTouch(cc.p(x,y)) then			
			
			self.choosedCardIndex = index
			local state = TmjCard:getState()
			if state~=TmjConfig.CardState.State_Up then
				self.rechooseCur = false --重置选择当前选中标签
			end
			TmjCard:changeState(TmjConfig.CardState.State_Up)
			--如果是选择听牌，那么还需要把，选择这张牌后，胡那张牌列出来
			if self.isChooseTingCard then
				self:showTingHuInfo(index)
				TmjCard:setTingTag(true)
			end
			chooseIndex = index
		else
			--if self.choosedCardIndex ~= i then
			TmjCard:changeState(TmjConfig.CardState.State_Down)
			TmjCard:setTingTag(false)
			--end
		end
		--return chooseIndex
	end
	
	table.walk(self.handCards,function (TmjCard,i)
		local TmjCard = TmjCard.node
		isContainsTouch(i,x,y,TmjCard)
		
	end)
	--摸到的牌判断
	if self.getCard and TmjHelper.isLuaNodeValid(self.getCard.node) then
		local TmjCard = self.getCard.node
		isContainsTouch(-1,x,y,TmjCard) -- -1代表摸到的牌
	end
	return chooseIndex
end
--放下手牌
function TmjMyPlayer:putDownCards()
	sslog(self.logTag,"放下所有手牌")
	table.walk(self.handCards,function (TmjCard,i)
		local TmjCard = TmjCard.node
		TmjCard:changeState(TmjConfig.CardState.State_Down)
		TmjCard:setTingTag(false)
	end)
	if self.getCard and TmjHelper.isLuaNodeValid(self.getCard.node) then
		local TmjCard = self.getCard.node
		TmjCard:changeState(TmjConfig.CardState.State_Down)
		TmjCard:setTingTag(false)
	end
	self.choosedCardIndex = 0
end
--当有完整牌的时候，判断手牌可以操作的
--@param isOther 是否是其他人打的牌 否则是自己摸的
--@param inputCard 最后一张牌 可以是其他人打的牌 也可能是自己摸到的牌
--@return 返回可以操作的集合
function TmjMyPlayer:checkFullCard(isOther,inputCard)
	if not inputCard or inputCard.val==nil then
		sslog(self.logTag,"判断完整牌异常")
		ssdump(inputCard,"操作牌数据")
		return
	end
	--判断操作，如果满足，放入到操作集合中
		--@param val 牌值
		--@param operation 操作类型
		--@param tOperation 操作集合
	local function checkToInsert(val,operation,tOperation)
		local result = self:checkOperation(val,operation)
		if result then
			table.insert(tOperation,{type = operation,weight = TmjCardTip.operationWeight[operation] or 0,result = result })
		end
	end
	--排序操作集合，用于在UI上显示顺序
	local function sortOperations(tOperation)
		--todo
		--根据权重倒叙排序
--[[		TmjHelper.quickSort(tOperation,function (t1,t2)
			return t1.weight >= t2.weight
		end)--]]
	end
	local operations = {}
	if self.isTingState then --如果处于听状态，只能判断胡，杠，补杠，暗杠
		if isOther then
			checkToInsert(inputCard.val,TmjCardTip.CardOperation.Gang,operations)
		else
			checkToInsert(inputCard.val,TmjCardTip.CardOperation.AnGang,operations)
			checkToInsert(inputCard.val,TmjCardTip.CardOperation.BuGang,operations)
			--checkToInsert(inputCard.val,TmjCardTip.CardOperation.Ting,operations)
		end
		
	else --没有听的时候，就多了
		
		if isOther then
			checkToInsert(inputCard.val,TmjCardTip.CardOperation.Peng,operations)
			checkToInsert(inputCard.val,TmjCardTip.CardOperation.Chi,operations)
			checkToInsert(inputCard.val,TmjCardTip.CardOperation.Gang,operations)
		else
			checkToInsert(inputCard.val,TmjCardTip.CardOperation.AnGang,operations)
			checkToInsert(inputCard.val,TmjCardTip.CardOperation.BuGang,operations)
			checkToInsert(inputCard.val,TmjCardTip.CardOperation.Ting,operations)
		end
	end
	--里边没有听 并且长度大于1
	local function hasNoTingOperation(tOperation)
		if tOperation or not next(tOperation) then
			return false
		end
		local noTing = true
		for _,v in pairs(tOperation) do
			if v.type == TmjCardTip.CardOperation.Ting then
				noTing = false
				break
			end
		end
		
		return noTing and table.nums(tOperation)>1
	end
	--checkToInsert(inputCard.val,TmjCardTip.CardOperation.Hu,operations)
	local result = self:checkOperation(inputCard.val,TmjCardTip.CardOperation.Hu)
	--这里操作中，如果没有听 那么其他操作需要取消操作 不管有没有胡
	if hasNoTingOperation(operations) then --除了胡，有可以操作的 那么这个时候，胡的操作是必须的，胡是连着过的
		table.insert(operations,{type = TmjCardTip.CardOperation.Hu,weight = TmjCardTip.operationWeight[TmjCardTip.CardOperation.Hu] or 0,result = result })
	else --里边没有，那就只有判断能不能胡了
		checkToInsert(inputCard.val,TmjCardTip.CardOperation.Hu,operations)
	end
		
	sortOperations(operations)
	--里边的吃需要单独重新配置
	table.walk(operations,function (v,k)
		if v.type == TmjCardTip.CardOperation.Chi then
			--吃的提示牌里边，需要将输入牌值放入里边，并且根据所有提示长短，配置横竖
			local oldresult = CustomHelper.copyTab(v.result)
			
			for _,chiTable in pairs(oldresult) do
				table.insert(chiTable,inputCard.val)
			end
			v.result = {}
			v.result.data = oldresult
			--1 横向 horizontal		2 纵向 vertical
			if table.nums(operations)>2 then --超过两个，吃，胡 还有其他牌竖着放
				v.result.orientation = 2
			else
				v.result.orientation = 1
			end
			
			
			
		end
	end)
	return operations
end

--设置头像信息
--@headInfo 头像信息
--@key gold  用户金币
--@key nickname  用户昵称
--@key headId  头像ID
--@key huaCount  花个数
--@key doubleCount  加倍数量
function TmjMyPlayer:setHeadInfo(headInfo)
	TmjMyPlayer.super.setHeadInfo(self,TmjHeadNode,headInfo)
end

function TmjMyPlayer:createCards(cards,isInstance,dealCallbackFun)
	TmjMyPlayer.super.createCards(self,cards,isInstance,dealCallbackFun)
	self:showFrontCard()
end

--设置听状态
function TmjMyPlayer:setTingState(isTing)
	if not self.isTingState and isTing then --之前没听，现在听了，UI变化
		self:putDownCards()
		self:reSetCardGray()
		--显示听
		
		if not TmjHelper.isLuaNodeValid(self.tingNode) then
			self.tingNode = ccui.Button:create("game_res/desk/ting.png","game_res/desk/ting.png")
			self.tingNode:addTo(self,40)
			self.tingNode:setPosition(cc.p(display.width/2,self.cardStartPos.y))
			self.tingNode:addTouchEventListener(function (ref,eventType)
				if eventType==ccui.TouchEventType.began then
					TmjConfig.playButtonSound()
				elseif eventType == ccui.TouchEventType.ended then
					sslog(self.logTag,"点击听图标")
					
				end
			end)
			sslog(self.logTag,"显示听牌的UI")
		end

	elseif not isTing then --不是听
		if TmjHelper.isLuaNodeValid(self.tingNode) then
			self.tingNode:removeFromParent()
			self.tingNode = nil
		end
	end
	TmjMyPlayer.super.setTingState(self,isTing)
	--自己在听状态下，不能打牌的
	
end

--显示可以操作的界面
--吃，胡，碰，杠，听，加倍，取消等
--@param operations 可以显示的操作
--@param isPreCard 是否上一个玩家的出牌提示
function TmjMyPlayer:showOperationPanel(operations,isPreCard)
	--先关闭
	self:closeOperationPanel()
	table.sort(operations,function (t1,t2)
		return t1.weight <= t2.weight
	end)

	
	ssdump(operations,"我能干什么",5)
	TmjOperationFactory:setStartPos(cc.p(display.width,250))
	TmjOperationFactory:setCancelTingFun(handler(self,self.reSetCardGray))
	self.isPreCard = isPreCard
	self.curOperations = operations
	
	table.walk(operations,function (v,k)
		TmjOperationFactory:createOperationWidget(TmjGameScene,v.type,v.result,handler(self,self.doChooseOperation))
	end)
	
end

function TmjMyPlayer:closeTingHuInfo()
	self.showChooseIndex = nil
	local TmjGameScene = display.getRunningScene():getChildByName("TmjGameScene")
	if TmjGameScene:getChildByName("huinfo") then
		TmjGameScene:removeChildByName("huinfo")
	end
end

--选择听牌的时候，显示胡牌信息
--@param chooseIndex 选择牌的位置
function TmjMyPlayer:showTingHuInfo(chooseIndex)
	--选择的是手牌
	if self.showChooseIndex and self.showChooseIndex == chooseIndex then
		return --不用管了
	end
	self.showChooseIndex = chooseIndex
	local chooseVal = nil
	if chooseIndex >0 then
		chooseVal = self.handCards[chooseIndex] and self.handCards[chooseIndex].info.val or nil
	
	else --选择的是摸的牌
		chooseVal = self.getCard and self.getCard.info.val or nil
	end
	if not chooseVal or not self.tingResult[chooseVal] then
		sslog(self.logTag,"选择的听牌异常")
		return
	end
	local showResult = {}
	table.walk(self.tingResult[chooseVal],function (val,k)
		
		table.insert(showResult,{ val= val,count = TmjGameManager:getInstance():getRestCardCount(val),fan = 88 })
	end)
	
	--self.tingResult
	local TmjGameScene = display.getRunningScene():getChildByName("TmjGameScene")
	TmjGameScene:removeChildByName("huinfo")
	local huinfo = TmjTingHuInfo:create(showResult)
	huinfo:setName("huinfo")
	TmjGameScene:addChild(huinfo,TmjConfig.LayerOrder.GAME_HUTIP_LAYER)
	
end

--选择了听的状态
-- 页面中非听牌的牌，显示灰色，然后点击听牌 显示胡牌的信息
--@param result 听牌的数据
function TmjMyPlayer:doChooseTing(result)
	ssdump(result,"听牌信息")
	self.isChooseTingCard = true
	self.tingResult = result --听牌数据
	self:putDownCards()
	--是否在听牌中
	local function containsTingCard(tingCards,inputVal)
		if not tingCards or not inputVal then
			return false
		end
		for tingVal,v in pairs(tingCards) do
			if tingVal==inputVal then
				return true
			end
		end
		return false
	end
	
	for _,TmjCard in pairs(self.handCards) do
		local info = TmjCard.info
		TmjCard = TmjCard.node
		if containsTingCard(result,info.val) then
			TmjCard:reSetGray()
		else
			TmjCard:setGray()
		end
	end
end
--放弃听牌的重置牌操作
function TmjMyPlayer:reSetCardGray()
	self.isChooseTingCard = false
	self:putDownCards()
	if self.handCards then
		table.walk(self.handCards,function (TmjCard,k)
			TmjCard = TmjCard.node
			TmjCard:reSetGray()
		end)
	end
end

function TmjMyPlayer:doChooseOperation(operation,index)
	if operation==TmjConfig.cardOperation.Hu then
		if index==1 then --胡
			--self:doOperation(TmjConfig.cardOperation.Hu)
			TmjGameManager:getInstance():requestHu()
		elseif index == 2 then --加倍
			TmjGameManager:getInstance():requestDouble()
		elseif index == 3 then --过
			if self.isPlayCard then
				self:closeOperationPanel() --自己出牌的时候，直接关闭
			else
				TmjGameManager:getInstance():requestPass()
			end
			TmjOperationFactory:clearOperation()
		end
	elseif operation == TmjConfig.cardOperation.Chi then
		--self:doOperation(operation)
	
		TmjGameManager:getInstance():requestChi(index)
	elseif operation == TmjConfig.cardOperation.Peng then
		--self:doOperation(operation,index)
		TmjGameManager:getInstance():requestPeng()
	elseif operation == TmjConfig.cardOperation.Gang 
	or operation==TmjConfig.cardOperation.AnGang
	or operation==TmjConfig.cardOperation.BuGang then
		--self:doOperation(operation,index)
		TmjGameManager:getInstance():requestGang(TmjConfig.convertToServerCard(index))
		
	elseif operation == TmjConfig.cardOperation.Ting then
		self:doChooseTing(index)
		return
	end
	
	if self.isPreCard then
		if self._decisionScheduler then
			scheduler:unscheduleScriptEntry(self._decisionScheduler)
			self._decisionScheduler = nil
		end
		TmjMyPlayer.super.getPreToPlay(self,nil)
	else --我自己的牌提示，关闭界面
		--TmjOperationFactory:clearOperation()
		if self._playScheduler then
			scheduler:unscheduleScriptEntry(self._playScheduler)
			self._playScheduler = nil
		end
	end
end

--关闭操作界面
function TmjMyPlayer:closeOperationPanel()
	sslog(self.logTag,"关闭操作界面")
	--同时关闭听胡界面
	self:closeTingHuInfo()
	TmjOperationFactory:clearOperation()
	self:reSetCardGray() --重置灰色
end
--判断自己是否是听状态，是那就直接出牌
--@param 还剩余的操作时间
function TmjMyPlayer:checkTingToPlay(hasOperation)
	if not self.isTingState then
		sslog(self.logTag,"我并不在听状态")
		return
	end
	if hasOperation then --有操作选择
		return --就等待了
	end
	self:checkToSetLastHandCard()
	if self.getCard then
		TmjGameManager:getInstance():requestPlayCard(self.getCard.info.val)
	else
		sslog(self.logTag,"我的手牌没有，怎么打")
	end
	
end
--设置是否轮到我出牌
function TmjMyPlayer:setIsPlayCard(isplayCard)
	TmjMyPlayer.super.setIsPlayCard(self,isplayCard)
	if self._playScheduler then
		scheduler:unscheduleScriptEntry(self._playScheduler)
		self._playScheduler = nil
	end
	if self.isPlayCard then --轮到我出牌 倒计时
		self.curCountTime = self.leftTime
		self._playScheduler = scheduler:scheduleScriptFunc(handler(self,self._onPlayInterval), 1, false)	
	else --不该我出牌，移除

	end

end

function TmjMyPlayer:_onPlayInterval(dt)
	self.curCountTime = self.curCountTime - 1
	if self.curCountTime<=0 then
		if self._playScheduler then
			scheduler:unscheduleScriptEntry(self._playScheduler)
		end
		self.curCountTime = self.leftTime
		local val = nil
		if self.getCard then
			val = self.getCard.info.val
		end
		if val then
			TmjGameManager:getInstance():requestPlayCard(val)
		end
		
	else
		
	end
end
function TmjMyPlayer:_onDecisionInterval(dt)
	self.curCountTime = self.curCountTime - 1
	if self.curCountTime <=0 then
		if self._decisionScheduler then
			scheduler:unscheduleScriptEntry(self._decisionScheduler)
		end
		self.curCountTime = self.leftTime
		TmjGameManager:getInstance():requestPass()
	end
end

--上家出牌后，轮到我操作，是否吃，碰，胡，杠
-- 显示操作倒计时
--@param cardInfo 创建牌的信息
function TmjMyPlayer:getPreToPlay(cardInfo)
	--todo
	--TmjMyPlayer.super.getPreToPlay(self,cardInfo)
	ssdump(cardInfo,"上家打的什么牌啊")
	local operations = self:checkFullCard(true,cardInfo)
	ssdump(operations,"上家打的牌可以有那些操作",5)
	if next(operations) then --其他玩家出牌的时候，如果我没什么操作，就不提示了
		self:showOperationPanel(operations,true)
		--上一个打牌我考虑的倒计时
		--cardInfo.decisionTime
		
		if self._decisionScheduler then
			scheduler:unscheduleScriptEntry(self._decisionScheduler)
		end
		self.curCountTime = self.leftTime
		print(self.curCountTime)
		self._decisionScheduler = scheduler:scheduleScriptFunc(handler(self,self._onDecisionInterval), 1, false)
	else
		--TmjMyPlayer.super.getPreToPlay(self,cardInfo)
	end
	
	for _,v in pairs(operations) do
		if v.type==TmjCardTip.CardOperation.Peng then --可以补杠
			
			--self:doOperation(TmjConfig.cardOperation.Peng,cardInfo)
			--self:getOneCard(cardInfo)
			break
		end
	end
end
--自己手上的时候，显示能不能听，胡，杠
--@param lastCardVal 最后一张牌的牌值 如果是空的 则表示一首牌，否则是恢复对局的时候，自己摸的牌
function TmjMyPlayer:showStartHuOperation(lastCardVal)
	--self.cardsArray
	local inputVal = lastCardVal
	if lastCardVal then
		if self.cardsArray[lastCardVal] and self.cardsArray[lastCardVal]>0 then
			local tempGetCard = self.getCard
			if self.getCard and self.getCard.info.val==lastCardVal then
				--不用处理了
			elseif self.getCard then
				--手上的牌替换
				local replaceVal = self.getCard.info.val
				self.getCard.info.val = lastCardVal
				self.getCard.node:init({ val=lastCardVal })
				self.getCard.node:showFront()
				for _,card in pairs(self.handCards) do
					if card.info.val==lastCardVal then
						
						card.info.val = replaceVal
						card.node:init({val=replaceVal  })
						card.node:showFront()
						break
					end
				end
				self:sortOpenCards(true) --排序刷新一下
			end
			
			
			self.cardsArray[lastCardVal] = self.cardsArray[lastCardVal] - 1
		end
	else
		--从摸的牌中处理
		if self.getCard then
			self.cardsArray[self.getCard.info.val] = self.cardsArray[self.getCard.info.val] - 1
			inputVal = self.getCard.info.val
		else
			local lastCard = self.handCards[table.nums(self.handCards)]
			self.cardsArray[lastCard.info.val] = self.cardsArray[lastCard.info.val] - 1
			inputVal = lastCard.info.val
		end
		
	end
	local hasOperation = false --能够操作
	if inputVal then
		local operations = self:checkFullCard(false,{val = inputVal })
		ssdump(operations,"自己的牌可以有那些操作",5)
		if next(operations) then --其他玩家出牌的时候，如果我没什么操作，就不提示了
			self:showOperationPanel(operations,true)
			hasOperation = true
		end
	end
	return hasOperation
end


--摸到一张牌
--	不放到手牌中 重写的时候 子类自己放
--@param cardInfo 摸到的牌数组，服务器发送过来的 [摸到的牌,扔掉的花牌,摸到的牌]
function TmjMyPlayer:getOneCard(cardInfo)
	--这里摸牌的时候，长度
	local cardLen = table.nums(cardInfo)
	--最后一张牌的回调
	local function getLastFun(card)
		--牌摸完了
		ssdump(self.handCards,"我目前手上的牌",10)
		if self.operationFun then
			self.operationFun(self.pType,TmjConfig.cardOperation.GetOne)
		end
		
		local operations = self:checkFullCard(false,card)
		ssdump(operations,"自己摸的牌可以有那些操作",10)
		--ssdump(self.handCards,"手里的牌有那些",5)
		--这儿传第几张牌
		self:showOperationPanel(operations,false)
		if not next(operations) then
			self:checkTingToPlay(false) --没操作，那么判断听 打牌
		end
		--self:doOperation(TmjConfig.cardOperation.Play,-1)
		for _,v in pairs(operations) do
			if v.type==TmjCardTip.CardOperation.BuGang then --可以补杠
				
				--self:doOperation(TmjConfig.cardOperation.BuGang,cardInfo)
			elseif v.type == TmjCardTip.CardOperation.Ting then
				--要打哪张牌
				--v.result.discard = table.keys(v.result)[1]
				--self:doOperation(TmjConfig.cardOperation.Ting,v.result)
			end
		end
	end

	--循环播放摸到牌的动画
	local function loopPlayGetCard(index)
		local card = cardInfo[index]
		ssdump(card,"要播放摸牌的数据")
		if not card.position then
			card.position = display.center
			sslog(self.logTag,"设置要摸牌的位置")
		end
		self:playGetCardAnim(card,function ()
			--摸到的牌是花，播放补花动画
			if index==cardLen then
				getLastFun(self.getCard.info)
			else
				
				if self.getCard and TmjHelper.isLuaNodeValid(self.getCard.node) then
					self.getCard.node:removeFromParent()
					ssdump(cardInfo[index + 1],"花牌数据")
					sslog(self.logTag,"播放摸到牌的补花动画")
					
				end
				index = index + 2
				loopPlayGetCard(index)
			end

		end)
		
	end
	--self.getCard
	
	--需要播放牌的动画
	--摸到牌的位置，默认放在右手边
	loopPlayGetCard(1)

end
--播放摸到一张牌的动画 包括数据处理
--@param cardInfo 一个单张牌的数据
--@param callback
function TmjMyPlayer:playGetCardAnim(cardInfo,callback)
	ssdump(self.handCards,"我目前手上的牌",10)
	ssdump(cardInfo,"播放摸到一张牌的动画")
	TmjMyPlayer.super.getOneCard(self,cardInfo)
	--self.getCard
	self.getCard.node:changeState(TmjConfig.CardState.State_Down)
	--需要播放牌的动画
	--摸到牌的位置，默认放在右手边
	self:runGetCardAnim(self.getCard,callback)
end

--把牌打出去
--@param cardIndex 牌的位置或者牌信息
function TmjMyPlayer:playCard(cardIndex)
	self:closeOperationPanel()--服务器已经告诉我打牌了，关闭操作对话框
	sslog(self.logTag,"服务器通知我打一张牌")
	if type(cardIndex)=="table" then
		for i,TmjCard in pairs(self.handCards) do
			local info = TmjCard.info
			if info.val == cardIndex.val then
				cardIndex = i
				break
			end
		end
		--手牌中没有
		if type(cardIndex)=="table" then
			cardIndex = -1
		end
	end
	
	sslog(self.logTag,"把牌打出去 "..cardIndex)
	local choosedCard = nil
	if cardIndex > 0 then
		choosedCard = self.handCards[cardIndex].node
	else
		choosedCard = self.getCard and self.getCard.node or nil
	end
	
	if choosedCard then
		choosedCard:changeState(TmjConfig.CardState.State_Discard)
		TmjMyPlayer.super.playCard(self,cardIndex)
--[[		if cardIndex>0 then
			TmjMyPlayer.super.playCard(self,self:removeCardAt(cardIndex))
		else
			TmjMyPlayer.super.playCard(self,self.getCard)
		end--]]
	else
		sslog(self.logTag,"哪有这张牌啊，打了一张没有的牌"..cardIndex)
	end
	
end

--吃
--@param cardInfo 吃的牌信息
--@key outCard 外界的牌
--@key handCards 手上的牌，需要和外边的牌进行吃的
--@key createTag 是否创建新的牌 这个标识只在恢复对局的时候，新的牌不从手上移除
function TmjMyPlayer:chiCard(cardInfo)
	--todo
	sslog(self.logTag,"吃")
	--播放吃的动画
	if not cardInfo.createTag then --非新建的才播放
		TmjConfig.playAmature("ermj_px_eff","ani_03",nil,display.center,false)
	end
	
	self:closeOperationPanel()--服务器已经告诉我打牌了，关闭操作对话框
	local outCard = self:createOneCard(cardInfo.outCard)
	
	local tempChiArr = {}
	--table.insert(self.extraCards,outCard)
	table.insert(tempChiArr,outCard)
	for _,v in ipairs(cardInfo.handCards) do
		local removedCard = nil
		if cardInfo.createTag == true then
			removedCard = self:createOneCard(v)
		else
			removedCard = self:removeHandCard(v.val)
		end
		if removedCard then
			table.insert(tempChiArr,removedCard)
		else
			sslog(self.logTag,"吃的时候出问题了，没这牌："..v)
		end
	end
	TmjHelper.sortCards(tempChiArr)
	local val = {}
	table.walk(tempChiArr,function (v,k)
		table.insert(val,v.info.val)
	end)
	table.insert(self.extraCards,{arr = tempChiArr,type = TmjConfig.cardOperation.Chi,val = val })
	--table.merge(self.extraCards,tempChiArr)
	--self.extraCardPos
	--更新这些牌的位置
	self:setExtraPosition(tempChiArr)
	--吃了后把最右边的牌，放到摸牌位置
	if cardInfo.createTag == false then
		self:checkToSetLastHandCard()
	end
	
	TmjMyPlayer.super.chiCard(self,cardInfo)
end
--碰
--@param cardInfo 外界的牌
--@key createTag 是否创建新的牌 这个标识只在恢复对局的时候，新的牌不从手上移除
function TmjMyPlayer:pengCard(cardInfo)
	--todo
	self:closeOperationPanel()--服务器已经告诉我打牌了，关闭操作对话框
	sslog(self.logTag,"碰")
	--播放碰的动画
	if not cardInfo.createTag then --非新建的才播放
		TmjConfig.playAmature("ermj_px_eff","ani_01",nil,display.center,false)
	end
	
	local outCard = self:createOneCard(cardInfo)
	--self.extraCards
	local tempPengArr = {}
	--table.insert(self.extraCards,outCard)
	table.insert(tempPengArr,outCard)
	for i=1,2 do
		local removedCard = nil
		if cardInfo.createTag == true then
			removedCard = self:createOneCard(cardInfo)
		else
			removedCard = self:removeHandCard(cardInfo.val)
		end
		
		if removedCard then
			table.insert(tempPengArr,removedCard)
		else
			sslog(self.logTag,"碰的时候出问题了，没这牌："..v)
		end
	end
	TmjHelper.sortCards(tempPengArr)
	local val = {}
	table.walk(tempPengArr,function (v,k)
		table.insert(val,v.info.val)
	end)
	table.insert(self.extraCards,{arr = tempPengArr,type = TmjConfig.cardOperation.Peng,val = val })
	
	--table.merge(self.extraCards,tempChiArr)
	
	--更新这些牌的位置
	self:setExtraPosition(tempPengArr)
	--碰后把最右边的牌，放到摸牌位置
	if cardInfo.createTag == false then
		self:checkToSetLastHandCard()
	end
	
	TmjMyPlayer.super.pengCard(self,cardInfo)
end
--杠
--@param cardInfo 外界的牌
--@key createTag 是否创建新的牌 这个标识只在恢复对局的时候，新的牌不从手上移除
function TmjMyPlayer:gangCard(cardInfo)
	--todo
	sslog(self.logTag,"杠")
	--播放杠的动画
	if not cardInfo.createTag then --非新建的才播放
		TmjConfig.playAmature("ermj_px_eff","ani_02",nil,display.center,false)
	end
	
	self:closeOperationPanel()--服务器已经告诉我打牌了，关闭操作对话框
	local outCard = self:createOneCard(cardInfo)
	--self.extraCards
	local tempGangArr = {}
	--table.insert(self.extraCards,outCard)
	table.insert(tempGangArr,outCard)
	for i=1,3 do
		local removedCard = nil
		if cardInfo.createTag == true then
			removedCard = self:createOneCard(cardInfo)
		else
			removedCard = self:removeHandCard(cardInfo.val)
		end
		if removedCard then
			table.insert(tempGangArr,removedCard)
		else
			sslog(self.logTag,"杠的时候出问题了，没这牌："..v)
		end
	end
	TmjHelper.sortCards(tempGangArr)
	local val = {}
	table.walk(tempGangArr,function (v,k)
		table.insert(val,v.info.val)
	end)
	table.insert(self.extraCards,{arr = tempGangArr,type = TmjConfig.cardOperation.Gang,val = val })
	--table.merge(self.extraCards,tempChiArr)
	--更新这些牌的位置
	self:setExtraPosition(tempGangArr)
	TmjMyPlayer.super.gangCard(self,cardInfo)
end
--补杠
--@param cardInfo 摸到的牌
--@key createTag 是否创建新的牌 这个标识只在恢复对局的时候，新的牌不从手上移除
function TmjMyPlayer:buGangCard(cardInfo)
	--todo
	sslog(self.logTag,"补杠")
	--播放杠的动画
	if not cardInfo.createTag then --非新建的才播放
		TmjConfig.playAmature("ermj_px_eff","ani_02",nil,display.center,false)
	end
	
	self:closeOperationPanel()--服务器已经告诉我打牌了，关闭操作对话框
	if cardInfo.createTag==true then --如果是恢复对局的牌
		
		local tempGangArr = {}

		for i=1,4 do
			local removedCard = self:createOneCard(cardInfo)
	
			if removedCard then
				table.insert(tempGangArr,removedCard)
			else
				sslog(self.logTag,"补杠的时候出问题了，没这牌：")
			end
		end
		TmjHelper.sortCards(tempGangArr)
		local val = {}
		table.walk(tempGangArr,function (v,k)
			table.insert(val,v.info.val)
		end)
		table.insert(self.extraCards,{arr = tempGangArr,type = TmjConfig.cardOperation.BuGang,val = val })
		--table.merge(self.extraCards,tempChiArr)
		--更新这些牌的位置
		self:setExtraPosition(tempGangArr)
		
	else
		if not self.getCard or not TmjHelper.isLuaNodeValid(self.getCard.node) then
			sslog(self.logTag,"没有摸到牌，不能暗杠")
			return 
		end
		
		local function findBuGangCards(cardinfo)
			local tempBuGangArrData = nil
			for _,v in pairs(self.extraCards) do
				if v.type == TmjConfig.cardOperation.Peng and v.val[1] == cardInfo.val then --之前是碰的牌
					tempBuGangArrData = v
					break
				end
			end
			return tempBuGangArrData
		end
		local tempBuGangArrData = findBuGangCards(cardInfo)
		--如果这里没找到，那就是数据异常了
		if not tempBuGangArrData then
			sslog(self.logTag,"补杠操作异常，额外牌中没有能补杠当前的牌的对子")
			ssdump(self.extraCards,"额外的牌",5)
			ssdump(self.getCard,"摸的牌",5)
			return
		end
		tempBuGangArrData.type = TmjConfig.cardOperation.BuGang --把碰改成按杠
		
		table.insert(tempBuGangArrData.arr,self.getCard)
		--更新这些牌的位置
		self:setExtraBuGangPosition(tempBuGangArrData.arr)
	
	end
	TmjMyPlayer.super.buGangCard(self,cardInfo)
end
--暗杠
--@param cardInfo 
--@key createTag 是否创建新的牌 这个标识只在恢复对局的时候，新的牌不从手上移除
function TmjMyPlayer:anGangCard(cardInfo)
	sslog(self.logTag,"暗杠")
	--播放杠的动画
	if not cardInfo.createTag then --非新建的才播放
		TmjConfig.playAmature("ermj_px_eff","ani_02",nil,display.center,false)
	end
	
	self:closeOperationPanel()--服务器已经告诉我打牌了，关闭操作对话框
	if cardInfo.createTag==true then --如果是恢复对局的牌
		
		local tempGangArr = {}

		for i=1,4 do
			local newCard = self:createOneCard(cardInfo)
	
			if newCard then
				table.insert(tempGangArr,newCard)
			else
				sslog(self.logTag,"暗杠的时候出问题了，没这牌：")
			end
		end
		TmjHelper.sortCards(tempGangArr)
		local val = {}
		table.walk(tempGangArr,function (v,k)
			table.insert(val,v.info.val)
		end)
		table.insert(self.extraCards,{arr = tempGangArr,type = TmjConfig.cardOperation.AnGang,val = val })
		--table.merge(self.extraCards,tempChiArr)
		--更新这些牌的位置
		self:setExtraPosition(tempGangArr)
		
	else
		
		if not self.getCard or not TmjHelper.isLuaNodeValid(self.getCard.node) then
			sslog(self.logTag,"没有摸到牌，不能暗杠")
			return 
		end
		local outCard = self.getCard --这里的外部的牌就是摸到的
		--self.extraCards
		local tempGangArr = {}
		--table.insert(self.extraCards,outCard)
		table.insert(tempGangArr,outCard)
		for i=1,3 do
			local removedCard = self:removeHandCard(cardInfo.val)
			if removedCard then
				table.insert(tempGangArr,removedCard)
			else
				sslog(self.logTag,"暗杠的时候出问题了，没这牌："..v)
			end
		end
		TmjHelper.sortCards(tempGangArr)
		local val = {}
		table.walk(tempGangArr,function (v,k)
			table.insert(val,v.info.val)
		end)
		table.insert(self.extraCards,{arr = tempGangArr,type = TmjConfig.cardOperation.AnGang,val = val })
		--table.merge(self.extraCards,tempChiArr)
		--更新这些牌的位置
		self:setExtraPosition(tempGangArr)
	end
	TmjMyPlayer.super.anGangCard(self,cardInfo)
end
--听 播放听动画
--@param cardInfo 听牌的组合 数字-->{能胡的牌 }
--@key discard 表示打的哪张牌
function TmjMyPlayer:tingCard(cardInfo)
	--todo
	sslog(self.logTag,"听")
	if not cardInfo or not cardInfo.discard then
		--
		sslog(self.logTag,"听牌错误，听牌结构异常")
		ssdump(cardInfo,"听牌参数")
		return
	end
	local disCardIndex = -1
	for i,card in pairs(self.handCards) do
		if card.info.val==cardInfo.discard then
			disCardIndex = i
			break
		end
	end
	self:playCard(disCardIndex)
	
end
--胡
--@param cardInfo 外界的牌
function TmjMyPlayer:huCard(cardInfo)
	--todo
	sslog(self.logTag,"胡")
	--播放胡的动画
	TmjConfig.playAmature("ermj_px_eff","ani_04",nil,display.center,false)
	
	self:closeOperationPanel()--服务器已经告诉我打牌了，关闭操作对话框
end
--补花
--@param cardInfo 发过来补花的牌的数量 如果补花中的牌也有花
function TmjMyPlayer:buHuaCard(cardInfo)
	--todo
	sslog(self.logTag,"补花")
	--是否把最后一个牌放在摸牌位置
	local notShowGet = (not self.isBanker) and (self:getColorCard()~=nil)
	--先删除手上的花牌
	local function loopRemoveHandHuaCard(handOverCB)
		local colorCard = self:getColorCard()
		if colorCard then
			--播放补花动画
			self:removeHandCard(colorCard.info.val)
			ssdump(colorCard,"删除的花牌",5)
			colorCard.node:removeFromParent()
			colorCard = nil
			loopRemoveHandHuaCard(handOverCB)
		else
			--
			print("手牌补花完成")
			if handOverCB then
				handOverCB()
			end
		end
	end
	--摸到牌的补花动画 如果有
	
	local function loopGetCardBuHua(cardInfo,index)
		
		if index<=table.nums(cardInfo) then
				
			if cardInfo[index].val >=TmjConfig.Card.R_Spring then
				--继续播放动画
				print("这张牌也是花牌",cardInfo[index].val)
			else
				--调用父类的得到一张牌的，然后加到手牌中去
				if not notShowGet and index==table.nums(cardInfo) then
					self:doOperation(TmjConfig.cardOperation.GetOne,cardInfo[index])
				else
					TmjMyPlayer.super.getOneCard(self,cardInfo[index])
					
					table.insert(self.handCards,self.getCard)
					TmjHelper.sortCards(self.handCards)
					self:showFrontCard()
					self:refreshCard(false)
				end
				if index==table.nums(cardInfo) then
					TmjMyPlayer.super.buHuaCard(self,cardInfo)
				end
				--self:doOperation(TmjConfig.cardOperation.GetOne,cardInfo[index])
			end
			index = index + 1
			loopGetCardBuHua(cardInfo,index)
		
		end
		
	end
	
	loopRemoveHandHuaCard(loopGetCardBuHua(cardInfo,1))
	
	
	--将cardInfo中非花的牌加入到手牌中
	
end


--根据牌的顺序ID获取牌的位置
--@param index 牌的索引值
--@param cardSize 单个牌的尺寸
function TmjMyPlayer:getHandCardPosition(index,cardSize)
	local cardPos = TmjMyPlayer.super.getHandCardPosition(self,index,cardSize)
	cardPos = cc.pAdd(cardPos,cc.p((index-1)*(cardSize.width + self.cardOffset),0))
	return cardPos
end
--获取打出去牌的位置
--这里要判断打出去的牌的位置放在哪
--@param index 打出牌的是第几张
--@param cardSize 每张牌的大小，这个大小应该是倒下去牌的大小
function TmjMyPlayer:getOutPosition(index,cardSize)
	--self.outCardMaxLength
	local x = (index-1) % self.outCardMaxLength
	local y = math.floor((index - 1) / self.outCardMaxLength)	
	local outPos = cc.pAdd(self.outCardPos,cc.p(x*cardSize.width,y*cardSize.height ))
	--outPos.y = outPos.y + 200
	return outPos
end
--根据传入的牌组合，放到额外牌位置
function TmjMyPlayer:setExtraPosition(tempCardArr)
	--self.extraCardPos
	local maxWidth = 0
	
	for i,v in pairs(tempCardArr) do
		v.node:changeState(TmjConfig.CardState.State_Extra)
		v.node:setLocalZOrder(i)
		local nodeWidth = v.node:getContentSize().width
		if i<=3 then --前三张牌
			v.node:setPosition(cc.pAdd(self.extraCardPos,cc.p((i-1)*nodeWidth,0)))
			maxWidth = maxWidth + nodeWidth
		else --第四张牌 目前外边只有最多只有四张
			v.node:setPosition(cc.pAdd(self.extraCardPos,cc.p(nodeWidth,30)))
		end
	end
	--更新额外牌的位置起始位置
	--移动的位置
	local moveDiff = cc.p(maxWidth +10,0)
	self.extraCardPos = cc.pAdd(self.extraCardPos,moveDiff)
	self.cardStartPos = cc.pAdd(self.cardStartPos,moveDiff)
	--刷新位置
	self:refreshCard(false)
	ssdump(self.extraCards,"额外牌信息",5)
end

--播放打牌的动画
function TmjMyPlayer:runOutCardAnim()
	--最后一张牌的位置动画
	local lastNode = self.outCards[#self.outCards].node
	
	local outPos = self:getOutPosition(#self.outCards,lastNode:getContentSize())
	lastNode:stopAllActions()
	local curPos = cc.p(lastNode:getPositionX(),lastNode:getPositionY())
	local len = cc.pGetDistance(outPos,curPos)
	local speed = 4000
	local seqAction = transition.sequence({cc.MoveTo:create(len/speed,outPos),cc.CallFunc:create(handler(self,self.freshOutCard))})
	lastNode:runAction(seqAction)
end

--播放摸牌的动画
--@param tGetcard 摸到牌的数据结构
--@param getCardCB 播放玩摸牌回调
function TmjMyPlayer:runGetCardAnim(tGetcard,getCardCB)
	
	if not tGetcard or not TmjHelper.isLuaNodeValid(tGetcard.node) then
		return --还没摸牌
	end
	getCardCB = getCardCB or function () sslog(self.logTag,"摸牌动画结束");ssdump(tGetcard,"摸到的牌数据") end
	--self.outCardPos
	tGetcard.node:stopAllActions()
	tGetcard.node:setCardPosition(self.getCardPos,false)
	--self.getCardPos.y = self.getCardPos.y + 100
	local curPos = cc.p(tGetcard.node:getPositionX(),tGetcard.node:getPositionY())
	local len = cc.pGetDistance(self.getCardPos,curPos)
	local speed = 4000
	local seqAction = transition.sequence({
		cc.MoveTo:create(len/speed,self.getCardPos),
		cc.CallFunc:create(getCardCB)
	})
	tGetcard.node:runAction(seqAction)
end

return TmjMyPlayer
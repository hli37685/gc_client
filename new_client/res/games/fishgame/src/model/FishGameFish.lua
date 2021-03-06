local FishGameConfig = requireForGameLuaFile("FishGameConfig")
local FishVisual = requireForGameLuaFile("FishVisual")
local Troop = requireForGameLuaFile("Troop")
local Path = requireForGameLuaFile("Path")
local BoundingBox = requireForGameLuaFile("BoundingBox")
local Fishes = requireForGameLuaFile("Fishes")
local Visual = requireForGameLuaFile("Visual")


local FishGameFish = class("FishGameFish",function()
    return game.fishgame2d.Fish:create()
end)

function FishGameFish:ctor(data,parent)
    self:registerStatusChangedHandler(handler(self,self.onStateUpdated))
    self:setId(data.fish_id)
    self:setTypeId(data.type_id)
    self:setRefershId(data.refersh_id or 0)
    self:setFishType(data.fis_type)

    self._parent = parent

    local fishConfig = Fishes[data.type_id]
    self:setLockLevel(fishConfig.lockLvl)
    self:setVisualId(fishConfig.visualId)

    -- 路径
    local moveCompent
    if data.path_id > 0 then
        moveCompent = game.fishgame2d.MoveByPath:create()
        moveCompent:setPathID(data.path_id,data.troop)

        if data.troop then
            local data = Troop[data.path_id]

            moveCompent:setDuration(data.duration)
            for __,vv in ipairs(data.data) do
                moveCompent:addPathMoveData(vv.type,vv.direction or 0,vv.duration,vv.start_time,vv.end_time,
                    vv.count,
                    vv.position[1][1],vv.position[2][1],vv.position[3][1],vv.position[4][1],
                    vv.position[1][2],vv.position[2][2],vv.position[3][2],vv.position[4][2]
                )
            end
        else
            local data = Path[data.path_id]

            moveCompent:setDuration(data.duration)
            for __,vv in ipairs(data.data) do
                moveCompent:addPathMoveData(vv.type,vv.direction or 0,vv.duration,vv.start_time,vv.end_time,
                    vv.count,
                    vv.position[1][1],vv.position[2][1],vv.position[3][1],vv.position[4][1],
                    vv.position[1][2],vv.position[2][2],vv.position[3][2],vv.position[4][2]
                )
            end
        end

        moveCompent:setOffest(cc.p(data.offest_x,data.offest_y));

    else
        moveCompent = game.fishgame2d.MoveByDirection:create()
        moveCompent:setDirection(data.dir);
        moveCompent:setPosition(data.offest_x,data.offest_y);
        moveCompent:setRebound(data.path_id == -1);

    end
    moveCompent:setSpeed(data.fish_speed)
    moveCompent:setDelay(data.delay or 0)

    self:setMoveCompent(moveCompent)


    -- TODO 添加默认的BUFF效果
    for _, v in ipairs(fishConfig.buff) do
        self:addBuff(v.typeId, v.param, v.life)
    end

    -- TODO 添加效果
    local ft = data.fis_type
    for _, v in ipairs(fishConfig.effect) do
        local pef = game.fishgame2d.EffectFactory:CreateEffect(v.typeId)
        if pef then
            local paramSize = pef:getParamSize()
            for i = 0, paramSize - 1 do
                local nValue = 0
                if i < #v.data then
                    nValue = v.data[i + 1]
                end

                if (ft == SpecialFishType.ESFT_SANYUAN and i == 1) then
                    pef:setParam(i, nValue * 3);
                elseif (ft == SpecialFishType.ESFT_SIXI and i == 1) then
                    pef:setParam(i, nValue * 4);
                else
                    pef:setParam(i, nValue);
                end
            end
            self:addEffect(pef);
        end
    end
--    -- 特殊鱼 --
--    if (ft == SpecialFishType.ESFT_KINGANDQUAN) then
--        local pef = game.fishgame2d.EffectFactory:CreateEffect(EffectType.ETP_PRODUCE)
--        if (pef) then
--            pef:setParam(0, self:getTypeID());
--            pef:setParam(1, 3);
--            pef:setParam(2, 30);
--            pef:setParam(3, 1);
--            self:AddEffect(pef);
--        end
--    end
--    if ft == SpecialFishType.ESFT_KINGANDQUAN
--            or ft == SpecialFishType.ESFT_KING
--    then
--        dump(data)
--
--        local pef = game.fishgame2d.EffectFactory:CreateEffect(EffectType.ETP_KILL)
--        if pef then
--            pef:setParam(0, 2)
--            pef:setParam(1, self:getTypeId());
--
--            local ist = CGameConfig.GetInstance().KingFishMap[self:getTypeId()]
--            if ist then
--                pef:setParam(2, ist.nMaxScore)
--            end
--            self:AddEffect(pef);
--        end
--
--        local pef = game.fishgame2d.EffectFactory:CreateEffect(EffectType.ETP_ADDMONEY)
--        if pef then
--            pef:setParam(0, 1);
--            pef:setParam(1, 10);
--            self:AddEffect(pef)
--        end
--    end

    -- buff
--    self:AddBuff()

    -- bounding box
    local boundingBox = BoundingBox[fishConfig.boundingBox]

    for _,v in ipairs(boundingBox.BBList) do
        self:addBoundingBox(v.fRadio,v.nOffestX,v.nOffestY)
    end

    local serverTime = GameManager:getInstance():getHallManager():getSubGameManager():getDataManager():getServerTime()
    self:onUpdate((serverTime - data.create_tick) / 1000,true)
    self:setState(EOS_LIVE)
end

function FishGameFish:onHit()
    local node = self:getVisualContent()
    if not node then return end

    node:setColor(cc.c3b(0xFF, 0x11, 0))
    node:runAction(transition.sequence({
        cc.DelayTime:create(0.1),
        cc.CallFunc:create(function(sender)
            sender:setColor(display.COLOR_WHITE)
        end)
    }))

end

function FishGameFish:onStateUpdated(state)
    self:removeAllChildren()

    if state == EOS_LIVE then
        local visualId = self:getVisualId()

        local visualConfig = Visual[visualId]

        local nodeContent = display.newNode()
        nodeContent:setCascadeColorEnabled(true)

        local nodeShadow = display.newNode()
        for _,v in ipairs(visualConfig.live) do
            local gZOrder = FishGameConfig.FishVisualZOrder[v.image]

            local t_animation = ccs.Armature:create( v.image )
            t_animation:setScale(v.scale)
            t_animation:getAnimation():play(v.name)
            t_animation:setGlobalZOrder(gZOrder)
            t_animation:move(v.offset[1],v.offset[2])
            nodeContent:addChild(t_animation)

            if not v.hideShadow then
                local t_shadow = ccs.Armature:create( v.image  )
                t_shadow:setScale(v.scale)
                t_shadow:getAnimation():play(v.name)
                t_shadow:setGlobalZOrder(gZOrder)
                t_shadow:setColor(display.COLOR_BLACK)
                t_shadow:setOpacity(0xFF * 0.5)
                t_shadow:move(v.offset[1],v.offset[2])
                nodeShadow:addChild(t_shadow)
            end
        end

        self._parent:addChild(nodeContent,visualId * 2 + 1)
        self._parent:addChild(nodeShadow,visualId * 2)

        self:setVisualContent(nodeContent)
        self:setVisualShadow(nodeShadow)

        self.nodeContent = nodeContent
    elseif state == EOS_DEAD then

        local visualId = self:getVisualId()

        local visualConfig = Visual[visualId]

        local nodeContent = display.newNode()
        local nodeShadow = display.newNode()

        local count = 0
        for _,v in ipairs(visualConfig.die) do
            local t_animation = ccs.Armature:create( v.image )
            local t_shadow = ccs.Armature:create( v.image  )
            t_animation:getAnimation():play(v.name)
            t_shadow:getAnimation():play(v.name)
            t_shadow:setColor(display.COLOR_BLACK)
            t_shadow:setOpacity(0xFF * 0.5)

            t_animation:move(v.offset[1],v.offset[2])
            t_shadow:move(v.offset[1],v.offset[2])

            local gZOrder = FishGameConfig.FishVisualZOrder[v.image]
            t_animation:setGlobalZOrder(gZOrder)

            nodeContent:addChild(t_animation)

            t_animation:getAnimation():setMovementEventCallFunc(function(sender, type, id)
                if type == ccs.MovementEventType.start then
                elseif type == ccs.MovementEventType.complete
                    or type == ccs.MovementEventType.loopComplete
                then
                    sender:setVisible(false)

--                    count = count + 1
--                    if count >= #visualConfig.die then
--                    end
                end
            end)
        end


        self._parent:addChild(nodeContent,visualId * 2 + 1)
        self._parent:addChild(nodeShadow,visualId * 2)

        self:setVisualContent(nodeContent)
        self:setVisualShadow(nodeShadow)

        -- 播放死亡音乐
        GameManager:getInstance():getHallManager():getSubGameManager():getSoundManager():playFishSound(self:getTypeId())
    elseif state == EOS_DESTORED then

    end

    -- 显示测试信息
    -- self:showDebugInfo(state)
end

function FishGameFish:showDebugInfo(state)
    local node = display.newNode()
    local drawNode = cc.DrawNode:create();
    drawNode:drawDot(cc.p(0,0), 80, cc.c4f(1, 0,0, 0.1));
    drawNode:drawLine(cc.p(-100,0),cc.p(100,0),cc.c4f(0, 1,0, 0.1))
    drawNode:drawLine(cc.p(0,-100),cc.p(0,100),cc.c4f(0, 1,0, 0.1))

    if state == EOS_LIVE then
        local fishConfig = Fishes[self:getTypeId()]
        local boundingBox = BoundingBox[fishConfig.boundingBox]

        for _,v in ipairs(boundingBox.BBList) do
            drawNode:drawDot(cc.p(v.nOffestX, v.nOffestY), v.fRadio, cc.c4f(1, 1, 1, 0.5));
        end
    end
    local visualId = self:getVisualId()

    drawNode:addTo(node)
    self._parent:addChild(node,visualId * 2)

    self:setVisualDebug(node)
end

--function FishGameFish:setState(state)
--    if state == self:getState() then return end
--    self:ExecuteEffects(nil,{},false)
--
--    game.fishgame2d.MyObject.setState(self,state)
--end

function FishGameFish:addTo(parent)
    self._parent = parent

    return self
end

return FishGameFish


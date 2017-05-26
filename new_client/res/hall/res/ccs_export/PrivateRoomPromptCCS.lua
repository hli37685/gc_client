--------------------------------------------------------------
-- This file was automatically generated by Cocos Studio.
-- Do not make changes to this file.
-- All changes will be lost.
--------------------------------------------------------------

local luaExtend = require "LuaExtend"

-- using for layout to decrease count of local variables
local layout = nil
local localLuaFile = nil
local innerCSD = nil
local innerProject = nil
local localFrame = nil

local Result = {}
------------------------------------------------------------
-- function call description
-- create function caller should provide a function to 
-- get a callback function in creating scene process.
-- the returned callback function will be registered to 
-- the callback event of the control.
-- the function provider is as below :
-- Callback callBackProvider(luaFileName, node, callbackName)
-- parameter description:
-- luaFileName  : a string, lua file name
-- node         : a Node, event source
-- callbackName : a string, callback function name
-- the return value is a callback function
------------------------------------------------------------
function Result.create(callBackProvider)

local result={}
setmetatable(result, luaExtend)

--Create Layer
local Layer=cc.Node:create()
Layer:setName("Layer")
layout = ccui.LayoutComponent:bindLayoutComponent(Layer)
layout:setSize({width = 1280.0000, height = 720.0000})

--Create Panel_1
local Panel_1 = ccui.Layout:create()
Panel_1:ignoreContentAdaptWithSize(false)
Panel_1:setClippingEnabled(false)
Panel_1:setBackGroundColorType(1)
Panel_1:setBackGroundColor({r = 0, g = 0, b = 0})
Panel_1:setBackGroundColorOpacity(126)
Panel_1:setTouchEnabled(true);
Panel_1:setLayoutComponentEnabled(true)
Panel_1:setName("Panel_1")
Panel_1:setTag(338)
Panel_1:setCascadeColorEnabled(true)
Panel_1:setCascadeOpacityEnabled(true)
Panel_1:setAnchorPoint(0.5000, 0.5000)
Panel_1:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_1)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Layer:addChild(Panel_1)

--Create alert_panel
local alert_panel = ccui.Layout:create()
alert_panel:ignoreContentAdaptWithSize(false)
alert_panel:setBackGroundImage("hall_res/private_game_room/bb_srfj_xtc_di.png",0)
alert_panel:setClippingEnabled(false)
alert_panel:setBackGroundColorOpacity(102)
alert_panel:setTouchEnabled(true);
alert_panel:setLayoutComponentEnabled(true)
alert_panel:setName("alert_panel")
alert_panel:setTag(339)
alert_panel:setCascadeColorEnabled(true)
alert_panel:setCascadeOpacityEnabled(true)
alert_panel:setAnchorPoint(0.5000, 0.5000)
alert_panel:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(alert_panel)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.9039)
layout:setPercentHeight(0.9278)
layout:setSize({width = 1157.0000, height = 668.0000})
layout:setLeftMargin(61.5000)
layout:setRightMargin(61.5000)
layout:setTopMargin(26.0000)
layout:setBottomMargin(26.0000)
Panel_1:addChild(alert_panel)

--Create Button_Close
local Button_Close = ccui.Button:create()
Button_Close:ignoreContentAdaptWithSize(false)
Button_Close:loadTextureNormal("hall_res/tongyong/bb_ty_gb.png",0)
Button_Close:loadTexturePressed("hall_res/tongyong/bb_ty_gb1.png",0)
Button_Close:loadTextureDisabled("hall_res/tongyong/bb_ty_gb1.png",0)
Button_Close:setTitleFontSize(14)
Button_Close:setTitleColor({r = 65, g = 65, b = 70})
Button_Close:setScale9Enabled(true)
Button_Close:setCapInsets({x = 15, y = 11, width = 37, height = 46})
Button_Close:setLayoutComponentEnabled(true)
Button_Close:setName("Button_Close")
Button_Close:setTag(397)
Button_Close:setCascadeColorEnabled(true)
Button_Close:setCascadeOpacityEnabled(true)
Button_Close:setPosition(970.0000, 510.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_Close)
layout:setPositionPercentX(0.8384)
layout:setPositionPercentY(0.7635)
layout:setPercentWidth(0.0579)
layout:setPercentHeight(0.1018)
layout:setSize({width = 67.0000, height = 68.0000})
layout:setLeftMargin(936.5000)
layout:setRightMargin(153.5000)
layout:setTopMargin(124.0000)
layout:setBottomMargin(476.0000)
alert_panel:addChild(Button_Close)

--Create Button_Confirm
local Button_Confirm = ccui.Button:create()
Button_Confirm:ignoreContentAdaptWithSize(false)
Button_Confirm:loadTextureNormal("hall_res/tongyong/bb_grxx_quxiao.png",0)
Button_Confirm:loadTexturePressed("hall_res/tongyong/bb_grxx_quxiao1.png",0)
Button_Confirm:loadTextureDisabled("hall_res/tongyong/bb_grxx_quxiao1.png",0)
Button_Confirm:setTitleFontSize(14)
Button_Confirm:setTitleColor({r = 65, g = 65, b = 70})
Button_Confirm:setScale9Enabled(true)
Button_Confirm:setCapInsets({x = 15, y = 11, width = 257, height = 78})
Button_Confirm:setLayoutComponentEnabled(true)
Button_Confirm:setName("Button_Confirm")
Button_Confirm:setTag(96)
Button_Confirm:setCascadeColorEnabled(true)
Button_Confirm:setCascadeOpacityEnabled(true)
Button_Confirm:setPosition(404.9500, 220.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_Confirm)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.3500)
layout:setPositionPercentY(0.3293)
layout:setPercentWidth(0.2481)
layout:setPercentHeight(0.1497)
layout:setSize({width = 287.0000, height = 100.0000})
layout:setLeftMargin(261.4500)
layout:setRightMargin(608.5500)
layout:setTopMargin(398.0000)
layout:setBottomMargin(170.0000)
alert_panel:addChild(Button_Confirm)

--Create Button_Enter_Room
local Button_Enter_Room = ccui.Button:create()
Button_Enter_Room:ignoreContentAdaptWithSize(false)
Button_Enter_Room:loadTextureNormal("hall_res/tongyong/bb_srfj_fj.png",0)
Button_Enter_Room:loadTexturePressed("hall_res/tongyong/bb_srfj_fj1.png",0)
Button_Enter_Room:loadTextureDisabled("hall_res/tongyong/bb_srfj_fj1.png",0)
Button_Enter_Room:setTitleFontSize(14)
Button_Enter_Room:setTitleColor({r = 65, g = 65, b = 70})
Button_Enter_Room:setScale9Enabled(true)
Button_Enter_Room:setCapInsets({x = 15, y = 11, width = 257, height = 78})
Button_Enter_Room:setLayoutComponentEnabled(true)
Button_Enter_Room:setName("Button_Enter_Room")
Button_Enter_Room:setTag(1487)
Button_Enter_Room:setCascadeColorEnabled(true)
Button_Enter_Room:setCascadeOpacityEnabled(true)
Button_Enter_Room:setPosition(752.0500, 220.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_Enter_Room)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.6500)
layout:setPositionPercentY(0.3293)
layout:setPercentWidth(0.2481)
layout:setPercentHeight(0.1497)
layout:setSize({width = 287.0000, height = 100.0000})
layout:setLeftMargin(608.5500)
layout:setRightMargin(261.4500)
layout:setTopMargin(398.0000)
layout:setBottomMargin(170.0000)
alert_panel:addChild(Button_Enter_Room)

--Create gold_bg
local gold_bg = ccui.ImageView:create()
gold_bg:ignoreContentAdaptWithSize(false)
gold_bg:loadTexture("hall_res/hall/bb_dating_choumashuru.png",0)
gold_bg:setLayoutComponentEnabled(true)
gold_bg:setName("gold_bg")
gold_bg:setTag(1495)
gold_bg:setCascadeColorEnabled(true)
gold_bg:setCascadeOpacityEnabled(true)
gold_bg:setPosition(404.9500, 450.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(gold_bg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.3500)
layout:setPositionPercentY(0.6737)
layout:setPercentWidth(0.1945)
layout:setPercentHeight(0.0898)
layout:setSize({width = 225.0000, height = 60.0000})
layout:setLeftMargin(292.4500)
layout:setRightMargin(639.5500)
layout:setTopMargin(188.0000)
layout:setBottomMargin(420.0000)
alert_panel:addChild(gold_bg)

--Create top_gold_text
local top_gold_text = ccui.TextAtlas:create([[9990922]],
													"hall_res/hall/bb_tubiao_shuzi.png",
													16,
													24,
													"/")
top_gold_text:setLayoutComponentEnabled(true)
top_gold_text:setName("top_gold_text")
top_gold_text:setTag(1497)
top_gold_text:setCascadeColorEnabled(true)
top_gold_text:setCascadeOpacityEnabled(true)
top_gold_text:setAnchorPoint(1.0000, 0.5000)
top_gold_text:setPosition(194.9651, 30.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(top_gold_text)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.8665)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.4978)
layout:setPercentHeight(0.4000)
layout:setSize({width = 112.0000, height = 24.0000})
layout:setLeftMargin(82.9651)
layout:setRightMargin(30.0349)
layout:setTopMargin(18.0000)
layout:setBottomMargin(18.0000)
gold_bg:addChild(top_gold_text)

--Create bank_bg
local bank_bg = ccui.ImageView:create()
bank_bg:ignoreContentAdaptWithSize(false)
bank_bg:loadTexture("hall_res/hall/bb_dating_yinghangshuru.png",0)
bank_bg:setLayoutComponentEnabled(true)
bank_bg:setName("bank_bg")
bank_bg:setTag(1498)
bank_bg:setCascadeColorEnabled(true)
bank_bg:setCascadeOpacityEnabled(true)
bank_bg:setPosition(752.0500, 450.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(bank_bg)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.6500)
layout:setPositionPercentY(0.6737)
layout:setPercentWidth(0.1945)
layout:setPercentHeight(0.0898)
layout:setSize({width = 225.0000, height = 60.0000})
layout:setLeftMargin(639.5500)
layout:setRightMargin(292.4500)
layout:setTopMargin(188.0000)
layout:setBottomMargin(420.0000)
alert_panel:addChild(bank_bg)

--Create top_bank_text
local top_bank_text = ccui.TextAtlas:create([[9990922]],
													"hall_res/hall/bb_tubiao_shuzi.png",
													16,
													24,
													"/")
top_bank_text:setLayoutComponentEnabled(true)
top_bank_text:setName("top_bank_text")
top_bank_text:setTag(1499)
top_bank_text:setCascadeColorEnabled(true)
top_bank_text:setCascadeOpacityEnabled(true)
top_bank_text:setAnchorPoint(1.0000, 0.5000)
top_bank_text:setPosition(204.9651, 30.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(top_bank_text)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.9110)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.4978)
layout:setPercentHeight(0.4000)
layout:setSize({width = 112.0000, height = 24.0000})
layout:setLeftMargin(92.9651)
layout:setRightMargin(20.0349)
layout:setTopMargin(18.0000)
layout:setBottomMargin(18.0000)
bank_bg:addChild(top_bank_text)

--Create Text_Prompt
local Text_Prompt = ccui.Text:create()
Text_Prompt:ignoreContentAdaptWithSize(true)
Text_Prompt:setTextAreaSize({width = 0, height = 0})
Text_Prompt:setFontSize(27)
Text_Prompt:setString([[

]])
Text_Prompt:setLayoutComponentEnabled(true)
Text_Prompt:setName("Text_Prompt")
Text_Prompt:setTag(1501)
Text_Prompt:setCascadeColorEnabled(true)
Text_Prompt:setCascadeOpacityEnabled(true)
Text_Prompt:setPosition(578.5000, 350.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_Prompt)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5240)
layout:setLeftMargin(578.5000)
layout:setRightMargin(578.5000)
layout:setTopMargin(318.0000)
layout:setBottomMargin(350.0000)
alert_panel:addChild(Text_Prompt)

--Create Image_Prompt_Container
local Image_Prompt_Container = ccui.ImageView:create()
Image_Prompt_Container:ignoreContentAdaptWithSize(false)
Image_Prompt_Container:loadTexture("hall_res/tongyong/common_transparent.png",0)
Image_Prompt_Container:setLayoutComponentEnabled(true)
Image_Prompt_Container:setName("Image_Prompt_Container")
Image_Prompt_Container:setTag(198)
Image_Prompt_Container:setCascadeColorEnabled(true)
Image_Prompt_Container:setCascadeOpacityEnabled(true)
Image_Prompt_Container:setPosition(578.5000, 350.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_Prompt_Container)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5240)
layout:setPercentWidth(0.0035)
layout:setPercentHeight(0.0060)
layout:setSize({width = 4.0000, height = 4.0000})
layout:setLeftMargin(576.5000)
layout:setRightMargin(576.5000)
layout:setTopMargin(316.0000)
layout:setBottomMargin(348.0000)
alert_panel:addChild(Image_Prompt_Container)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result


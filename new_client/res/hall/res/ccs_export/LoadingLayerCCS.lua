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
Panel_1:setBackGroundImage("hall_res/loading/bb_loading_bj.jpg",0)
Panel_1:setClippingEnabled(false)
Panel_1:setBackGroundColorOpacity(102)
Panel_1:setTouchEnabled(true);
Panel_1:setLayoutComponentEnabled(true)
Panel_1:setName("Panel_1")
Panel_1:setTag(72)
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

--Create Panel_2
local Panel_2 = ccui.Layout:create()
Panel_2:ignoreContentAdaptWithSize(false)
Panel_2:setClippingEnabled(true)
Panel_2:setBackGroundColorOpacity(102)
Panel_2:setTouchEnabled(true);
Panel_2:setLayoutComponentEnabled(true)
Panel_2:setName("Panel_2")
Panel_2:setTag(73)
Panel_2:setCascadeColorEnabled(true)
Panel_2:setCascadeOpacityEnabled(true)
Panel_2:setAnchorPoint(0.5000, 0.0000)
Panel_2:setPosition(640.0000, 104.3074)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_2)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.1449)
layout:setPercentWidth(0.7555)
layout:setPercentHeight(0.0472)
layout:setSize({width = 967.0000, height = 34.0000})
layout:setLeftMargin(156.5000)
layout:setRightMargin(156.5000)
layout:setTopMargin(581.6926)
layout:setBottomMargin(104.3074)
Panel_1:addChild(Panel_2)

--Create Image_2
local Image_2 = ccui.ImageView:create()
Image_2:ignoreContentAdaptWithSize(false)
Image_2:loadTexture("hall_res/loading/bb_loading_jztd.png",0)
Image_2:setLayoutComponentEnabled(true)
Image_2:setName("Image_2")
Image_2:setTag(82)
Image_2:setCascadeColorEnabled(true)
Image_2:setCascadeOpacityEnabled(true)
Image_2:setPosition(483.5000, 17.1678)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_2)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5049)
layout:setPercentWidth(1.0052)
layout:setPercentHeight(1.0000)
layout:setSize({width = 972.0000, height = 34.0000})
layout:setLeftMargin(-2.5000)
layout:setRightMargin(-2.5000)
layout:setTopMargin(-0.1678)
layout:setBottomMargin(0.1678)
Panel_2:addChild(Image_2)

--Create progress_bar
local progress_bar = ccui.LoadingBar:create()
progress_bar:loadTexture("hall_res/loading/bb_loading_jzt.png",0)
progress_bar:ignoreContentAdaptWithSize(false)
progress_bar:setPercent(99)
progress_bar:setLayoutComponentEnabled(true)
progress_bar:setName("progress_bar")
progress_bar:setTag(75)
progress_bar:setCascadeColorEnabled(true)
progress_bar:setCascadeOpacityEnabled(true)
progress_bar:setPosition(483.5000, 17.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(progress_bar)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 967.0000, height = 34.0000})
Panel_2:addChild(progress_bar)

--Create progress_arrow
local progress_arrow = ccui.ImageView:create()
progress_arrow:ignoreContentAdaptWithSize(false)
progress_arrow:loadTexture("hall_res/loading/bb_loading_jzt2_03.png",0)
progress_arrow:setLayoutComponentEnabled(true)
progress_arrow:setName("progress_arrow")
progress_arrow:setTag(72)
progress_arrow:setCascadeColorEnabled(true)
progress_arrow:setCascadeOpacityEnabled(true)
progress_arrow:setAnchorPoint(1.0000, 0.5000)
progress_arrow:setPosition(52.3147, 17.3026)
layout = ccui.LayoutComponent:bindLayoutComponent(progress_arrow)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.0541)
layout:setPositionPercentY(0.5089)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.0476)
layout:setPercentHeight(1.0000)
layout:setSize({width = 46.0000, height = 34.0000})
layout:setLeftMargin(6.3147)
layout:setRightMargin(914.6853)
layout:setTopMargin(-0.3026)
layout:setBottomMargin(0.3026)
progress_bar:addChild(progress_arrow)

--Create ArmatureNode_2
local ArmatureNode_2 = ccs.Armature:create()
ArmatureNode_2:setName("ArmatureNode_2")
ArmatureNode_2:setTag(70)
ArmatureNode_2:setCascadeColorEnabled(true)
ArmatureNode_2:setCascadeOpacityEnabled(true)
ArmatureNode_2:setPosition(3.0000, 18.2549)
layout = ccui.LayoutComponent:bindLayoutComponent(ArmatureNode_2)
layout:setPositionPercentX(0.0652)
layout:setPositionPercentY(0.5369)
layout:setLeftMargin(3.0000)
layout:setRightMargin(43.0000)
layout:setTopMargin(15.7451)
layout:setBottomMargin(18.2549)
ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("anim/eff_99yl_ui_loading/eff_99yl_ui_loading.ExportJson")
ArmatureNode_2:init("eff_99yl_ui_loading")
ArmatureNode_2:getAnimation():play("ani_04",-1, 1)
progress_arrow:addChild(ArmatureNode_2)

--Create tips_text
local tips_text = ccui.Text:create()
tips_text:ignoreContentAdaptWithSize(true)
tips_text:setTextAreaSize({width = 0, height = 0})
tips_text:setFontSize(28)
tips_text:setString([[运气不佳时，试试等一会儿再下注。]])
tips_text:setLayoutComponentEnabled(true)
tips_text:setName("tips_text")
tips_text:setTag(76)
tips_text:setCascadeColorEnabled(true)
tips_text:setCascadeOpacityEnabled(true)
tips_text:setPosition(640.0000, 61.2822)
tips_text:setTextColor({r = 170, g = 202, b = 229})
layout = ccui.LayoutComponent:bindLayoutComponent(tips_text)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.0851)
layout:setPercentWidth(0.3500)
layout:setPercentHeight(0.0389)
layout:setSize({width = 448.0000, height = 28.0000})
layout:setLeftMargin(416.0000)
layout:setRightMargin(416.0000)
layout:setTopMargin(644.7178)
layout:setBottomMargin(47.2822)
Panel_1:addChild(tips_text)

--Create Text_Version
local Text_Version = ccui.Text:create()
Text_Version:ignoreContentAdaptWithSize(false)
Text_Version:setFontSize(22)
Text_Version:setString([[

]])
Text_Version:setTextHorizontalAlignment(2)
Text_Version:setTextVerticalAlignment(1)
Text_Version:setLayoutComponentEnabled(true)
Text_Version:setName("Text_Version")
Text_Version:setTag(80)
Text_Version:setCascadeColorEnabled(true)
Text_Version:setCascadeOpacityEnabled(true)
Text_Version:setAnchorPoint(1.0000, 0.5000)
Text_Version:setPosition(1271.4710, 21.1811)
Text_Version:setOpacity(127)
Text_Version:setTextColor({r = 170, g = 202, b = 229})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_Version)
layout:setPositionPercentX(0.9933)
layout:setPositionPercentY(0.0294)
layout:setPercentWidth(0.2344)
layout:setPercentHeight(0.0333)
layout:setSize({width = 300.0000, height = 24.0000})
layout:setLeftMargin(971.4713)
layout:setRightMargin(8.5287)
layout:setTopMargin(686.8189)
layout:setBottomMargin(9.1811)
Panel_1:addChild(Text_Version)

--Create ArmatureNode_1
local ArmatureNode_1 = ccs.Armature:create()
ArmatureNode_1:setName("ArmatureNode_1")
ArmatureNode_1:setTag(117)
ArmatureNode_1:setCascadeColorEnabled(true)
ArmatureNode_1:setCascadeOpacityEnabled(true)
ArmatureNode_1:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ArmatureNode_1)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(640.0000)
layout:setRightMargin(640.0000)
layout:setTopMargin(360.0000)
layout:setBottomMargin(360.0000)
ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("anim/eff_99yl_ui_loading/eff_99yl_ui_loading.ExportJson")
ArmatureNode_1:init("eff_99yl_ui_loading")
ArmatureNode_1:getAnimation():play("ani_01",-1, 1)
Panel_1:addChild(ArmatureNode_1)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result


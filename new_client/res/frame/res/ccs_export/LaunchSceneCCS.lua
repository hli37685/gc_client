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

--Create Scene
local Scene=cc.Node:create()
Scene:setName("Scene")

--Create Panel_1
local Panel_1 = ccui.Layout:create()
Panel_1:ignoreContentAdaptWithSize(false)
Panel_1:setBackGroundImage("frame_res/bb_loading_bj.jpg",0)
Panel_1:setClippingEnabled(false)
Panel_1:setBackGroundColorOpacity(102)
Panel_1:setTouchEnabled(true);
Panel_1:setLayoutComponentEnabled(true)
Panel_1:setName("Panel_1")
Panel_1:setTag(9)
Panel_1:setCascadeColorEnabled(true)
Panel_1:setCascadeOpacityEnabled(true)
Panel_1:setAnchorPoint(0.5000, 0.5000)
Panel_1:setPosition(640.0000, 357.1200)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_1)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.4960)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
layout:setTopMargin(2.8800)
layout:setBottomMargin(-2.8800)
Scene:addChild(Panel_1)

--Create Panel_Progress
local Panel_Progress = ccui.Layout:create()
Panel_Progress:ignoreContentAdaptWithSize(false)
Panel_Progress:setClippingEnabled(false)
Panel_Progress:setBackGroundColorOpacity(102)
Panel_Progress:setTouchEnabled(true);
Panel_Progress:setLayoutComponentEnabled(true)
Panel_Progress:setName("Panel_Progress")
Panel_Progress:setTag(15)
Panel_Progress:setCascadeColorEnabled(true)
Panel_Progress:setCascadeOpacityEnabled(true)
Panel_Progress:setAnchorPoint(0.5000, 0.0000)
Panel_Progress:setPosition(637.4400, 8.7610)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_Progress)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.4980)
layout:setPositionPercentY(0.0122)
layout:setPercentWidth(0.9478)
layout:setPercentHeight(0.2778)
layout:setSize({width = 1213.2220, height = 200.0000})
layout:setLeftMargin(30.8288)
layout:setRightMargin(35.9487)
layout:setTopMargin(511.2390)
layout:setBottomMargin(8.7610)
Panel_1:addChild(Panel_Progress)

--Create tip_text
local tip_text = ccui.Text:create()
tip_text:ignoreContentAdaptWithSize(true)
tip_text:setTextAreaSize({width = 0, height = 0})
tip_text:setFontSize(30)
tip_text:setString([[获取配置中..]])
tip_text:enableShadow({r = 0, g = 0, b = 0, a = 255}, {width = 1, height = -1}, 0)
tip_text:setLayoutComponentEnabled(true)
tip_text:setName("tip_text")
tip_text:setTag(16)
tip_text:setCascadeColorEnabled(true)
tip_text:setCascadeOpacityEnabled(true)
tip_text:setPosition(606.6112, 69.4900)
tip_text:setTextColor({r = 170, g = 202, b = 229})
layout = ccui.LayoutComponent:bindLayoutComponent(tip_text)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.3475)
layout:setPercentWidth(0.1484)
layout:setPercentHeight(0.1500)
layout:setSize({width = 180.0000, height = 30.0000})
layout:setLeftMargin(516.6112)
layout:setRightMargin(516.6112)
layout:setTopMargin(115.5100)
layout:setBottomMargin(54.4900)
Panel_Progress:addChild(tip_text)

--Create ArmatureNode_1
local ArmatureNode_1 = ccs.Armature:create()
ArmatureNode_1:setName("ArmatureNode_1")
ArmatureNode_1:setTag(15)
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

--Create Panel_4
local Panel_4 = ccui.Layout:create()
Panel_4:ignoreContentAdaptWithSize(false)
Panel_4:setClippingEnabled(true)
Panel_4:setBackGroundColorOpacity(102)
Panel_4:setLayoutComponentEnabled(true)
Panel_4:setName("Panel_4")
Panel_4:setTag(91)
Panel_4:setCascadeColorEnabled(true)
Panel_4:setCascadeOpacityEnabled(true)
Panel_4:setAnchorPoint(0.5000, 0.0000)
Panel_4:setPosition(640.0000, 94.8346)
layout = ccui.LayoutComponent:bindLayoutComponent(Panel_4)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.1317)
layout:setPercentWidth(0.7594)
layout:setPercentHeight(0.0472)
layout:setSize({width = 972.0000, height = 34.0000})
layout:setLeftMargin(154.0000)
layout:setRightMargin(154.0000)
layout:setTopMargin(591.1654)
layout:setBottomMargin(94.8346)
Panel_1:addChild(Panel_4)

--Create Image_1
local Image_1 = ccui.ImageView:create()
Image_1:ignoreContentAdaptWithSize(false)
Image_1:loadTexture("frame_res/bb_loading_jztd.png",0)
Image_1:setLayoutComponentEnabled(true)
Image_1:setName("Image_1")
Image_1:setTag(13)
Image_1:setCascadeColorEnabled(true)
Image_1:setCascadeOpacityEnabled(true)
Image_1:setPosition(486.0000, 18.3940)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_1)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5410)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 972.0000, height = 34.0000})
layout:setTopMargin(-1.3940)
layout:setBottomMargin(1.3940)
Panel_4:addChild(Image_1)

--Create download_progress_bar
local download_progress_bar = ccui.LoadingBar:create()
download_progress_bar:loadTexture("frame_res/bb_loading_jzt.png",0)
download_progress_bar:ignoreContentAdaptWithSize(false)
download_progress_bar:setPercent(4)
download_progress_bar:setLayoutComponentEnabled(true)
download_progress_bar:setName("download_progress_bar")
download_progress_bar:setTag(17)
download_progress_bar:setCascadeColorEnabled(true)
download_progress_bar:setCascadeOpacityEnabled(true)
download_progress_bar:setPosition(486.0000, 17.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(download_progress_bar)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.9949)
layout:setPercentHeight(1.0000)
layout:setSize({width = 967.0000, height = 34.0000})
layout:setLeftMargin(2.5000)
layout:setRightMargin(2.5000)
Image_1:addChild(download_progress_bar)

--Create progress_arrow
local progress_arrow = ccui.ImageView:create()
progress_arrow:ignoreContentAdaptWithSize(false)
progress_arrow:loadTexture("frame_res/bb_loading_jzt2_03.png",0)
progress_arrow:setLayoutComponentEnabled(true)
progress_arrow:setName("progress_arrow")
progress_arrow:setTag(92)
progress_arrow:setCascadeColorEnabled(true)
progress_arrow:setCascadeOpacityEnabled(true)
progress_arrow:setAnchorPoint(1.0000, 0.5000)
progress_arrow:setPosition(69.2127, 17.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(progress_arrow)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.0712)
layout:setPositionPercentY(0.5000)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(0.0473)
layout:setPercentHeight(0.9706)
layout:setSize({width = 46.0000, height = 33.0004})
layout:setLeftMargin(23.2127)
layout:setRightMargin(902.7873)
layout:setTopMargin(0.4998)
layout:setBottomMargin(0.4998)
Image_1:addChild(progress_arrow)

--Create ArmatureNode_2
local ArmatureNode_2 = ccs.Armature:create()
ArmatureNode_2:setName("ArmatureNode_2")
ArmatureNode_2:setTag(93)
ArmatureNode_2:setCascadeColorEnabled(true)
ArmatureNode_2:setCascadeOpacityEnabled(true)
ArmatureNode_2:setPosition(1.3651, 17.9520)
layout = ccui.LayoutComponent:bindLayoutComponent(ArmatureNode_2)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.0297)
layout:setPositionPercentY(0.5440)
layout:setLeftMargin(1.3651)
layout:setRightMargin(44.6349)
layout:setTopMargin(15.0484)
layout:setBottomMargin(17.9520)
ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("anim/eff_99yl_ui_loading/eff_99yl_ui_loading.ExportJson")
ArmatureNode_2:init("eff_99yl_ui_loading")
ArmatureNode_2:getAnimation():play("ani_04",-1, 1)
progress_arrow:addChild(ArmatureNode_2)

--Create progress_text
local progress_text = ccui.Text:create()
progress_text:ignoreContentAdaptWithSize(true)
progress_text:setTextAreaSize({width = 0, height = 0})
progress_text:setFontSize(30)
progress_text:setString([[0%]])
progress_text:setLayoutComponentEnabled(true)
progress_text:setName("progress_text")
progress_text:setTag(6)
progress_text:setCascadeColorEnabled(true)
progress_text:setCascadeOpacityEnabled(true)
progress_text:setVisible(false)
progress_text:setPosition(486.0000, 17.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(progress_text)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.0309)
layout:setPercentHeight(0.8824)
layout:setSize({width = 30.0000, height = 30.0000})
layout:setLeftMargin(471.0000)
layout:setRightMargin(471.0000)
layout:setTopMargin(2.0000)
layout:setBottomMargin(2.0000)
Image_1:addChild(progress_text)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Scene
return result;
end

return Result


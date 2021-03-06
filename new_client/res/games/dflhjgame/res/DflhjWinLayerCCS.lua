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

--Create base_layout
local base_layout = ccui.Layout:create()
base_layout:ignoreContentAdaptWithSize(false)
base_layout:setClippingEnabled(false)
base_layout:setBackGroundColorType(1)
base_layout:setBackGroundColor({r = 26, g = 26, b = 26})
base_layout:setBackGroundColorOpacity(81)
base_layout:setTouchEnabled(true);
base_layout:setLayoutComponentEnabled(true)
base_layout:setName("base_layout")
base_layout:setTag(62)
base_layout:setCascadeColorEnabled(true)
base_layout:setCascadeOpacityEnabled(true)
layout = ccui.LayoutComponent:bindLayoutComponent(base_layout)
layout:setPercentWidthEnabled(true)
layout:setPercentHeightEnabled(true)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Layer:addChild(base_layout)

--Create ArmatureNode_1
local ArmatureNode_1 = ccs.Armature:create()
ArmatureNode_1:setName("ArmatureNode_1")
ArmatureNode_1:setTag(63)
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
ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("game_res/anim_res/dfdc_win_eff/dfdc_win_eff.ExportJson")
ArmatureNode_1:init("dfdc_win_eff")
ArmatureNode_1:getAnimation():play("ani_01")
ArmatureNode_1:getAnimation():gotoAndPause(0)
base_layout:addChild(ArmatureNode_1)

--Create ArmatureNode_2
local ArmatureNode_2 = ccs.Armature:create()
ArmatureNode_2:setName("ArmatureNode_2")
ArmatureNode_2:setTag(64)
ArmatureNode_2:setCascadeColorEnabled(true)
ArmatureNode_2:setCascadeOpacityEnabled(true)
ArmatureNode_2:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(ArmatureNode_2)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setLeftMargin(640.0000)
layout:setRightMargin(640.0000)
layout:setTopMargin(360.0000)
layout:setBottomMargin(360.0000)
ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("game_res/anim_res/zj_jinbiyu/zj_jinbiyu.ExportJson")
ArmatureNode_2:init("zj_jinbiyu")
ArmatureNode_2:getAnimation():play("ani_01")
ArmatureNode_2:getAnimation():gotoAndPause(0)
base_layout:addChild(ArmatureNode_2)

--Create btn_win
local btn_win = ccui.Button:create()
btn_win:ignoreContentAdaptWithSize(false)
btn_win:loadTextureNormal("game_res/win_layout/an_d-win.png",0)
btn_win:loadTexturePressed("game_res/win_layout/an_d-win2.png",0)
btn_win:loadTextureDisabled("game_res/win_layout/an_d-win2.png",0)
btn_win:setTitleFontSize(14)
btn_win:setTitleColor({r = 65, g = 65, b = 70})
btn_win:setScale9Enabled(true)
btn_win:setCapInsets({x = 15, y = 11, width = 315, height = 55})
btn_win:setLayoutComponentEnabled(true)
btn_win:setName("btn_win")
btn_win:setTag(67)
btn_win:setCascadeColorEnabled(true)
btn_win:setCascadeOpacityEnabled(true)
btn_win:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(btn_win)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.2695)
layout:setPercentHeight(0.1069)
layout:setSize({width = 345.0000, height = 77.0000})
layout:setLeftMargin(467.5000)
layout:setRightMargin(467.5000)
layout:setTopMargin(321.5000)
layout:setBottomMargin(321.5000)
base_layout:addChild(btn_win)

--Create label_winnum
local label_winnum = ccui.TextAtlas:create([[123/456]],
													"game_res/win_layout/shuzhi_win.png",
													31,
													39,
													"/")
label_winnum:setLayoutComponentEnabled(true)
label_winnum:setName("label_winnum")
label_winnum:setTag(68)
label_winnum:setCascadeColorEnabled(true)
label_winnum:setCascadeOpacityEnabled(true)
label_winnum:setPosition(172.5000, 38.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(label_winnum)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.6290)
layout:setPercentHeight(0.5065)
layout:setSize({width = 217.0000, height = 39.0000})
layout:setLeftMargin(64.0000)
layout:setRightMargin(64.0000)
layout:setTopMargin(19.0000)
layout:setBottomMargin(19.0000)
btn_win:addChild(label_winnum)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result


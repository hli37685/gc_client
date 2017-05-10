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

--Create Image_bg
local Image_bg = ccui.ImageView:create()
Image_bg:ignoreContentAdaptWithSize(false)
Image_bg:loadTexture("game_res/desk/pipeijiemian.jpg",0)
Image_bg:setTouchEnabled(true);
Image_bg:setLayoutComponentEnabled(true)
Image_bg:setName("Image_bg")
Image_bg:setTag(8)
Image_bg:setCascadeColorEnabled(true)
Image_bg:setCascadeOpacityEnabled(true)
Image_bg:setPosition(640.0000, 360.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_bg)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 1280.0000, height = 720.0000})
Layer:addChild(Image_bg)

--Create ArmatureNode_match
local ArmatureNode_match = ccs.Armature:create()
ArmatureNode_match:setName("ArmatureNode_match")
ArmatureNode_match:setTag(52)
ArmatureNode_match:setCascadeColorEnabled(true)
ArmatureNode_match:setCascadeOpacityEnabled(true)
ArmatureNode_match:setPosition(611.2925, 241.3715)
layout = ccui.LayoutComponent:bindLayoutComponent(ArmatureNode_match)
layout:setPositionPercentX(0.4776)
layout:setPositionPercentY(0.3352)
layout:setLeftMargin(611.2925)
layout:setRightMargin(668.7075)
layout:setTopMargin(478.6285)
layout:setBottomMargin(241.3715)
ccs.ArmatureDataManager:getInstance():addArmatureFileInfo("game_res/animation/ermj_px_eff/ermj_px_eff.ExportJson")
ArmatureNode_match:init("ermj_px_eff")
ArmatureNode_match:getAnimation():play("ani_11",-1, 1)
Image_bg:addChild(ArmatureNode_match)

--Create Button_cancel
local Button_cancel = ccui.Button:create()
Button_cancel:ignoreContentAdaptWithSize(false)
Button_cancel:loadTextureNormal("game_res/desk/anniu.png",0)
Button_cancel:setTitleFontSize(14)
Button_cancel:setTitleColor({r = 65, g = 65, b = 70})
Button_cancel:setScale9Enabled(true)
Button_cancel:setCapInsets({x = 15, y = 11, width = 169, height = 44})
Button_cancel:setLayoutComponentEnabled(true)
Button_cancel:setName("Button_cancel")
Button_cancel:setTag(24)
Button_cancel:setCascadeColorEnabled(true)
Button_cancel:setCascadeOpacityEnabled(true)
Button_cancel:setPosition(640.0000, 156.9448)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_cancel)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.2180)
layout:setPercentWidth(0.1555)
layout:setPercentHeight(0.0917)
layout:setSize({width = 199.0000, height = 66.0000})
layout:setLeftMargin(540.5000)
layout:setRightMargin(540.5000)
layout:setTopMargin(530.0552)
layout:setBottomMargin(123.9448)
Image_bg:addChild(Button_cancel)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result


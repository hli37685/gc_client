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

--Create Node
local Node=cc.Node:create()
Node:setName("Node")

--Create Image_headbg
local Image_headbg = ccui.ImageView:create()
Image_headbg:ignoreContentAdaptWithSize(false)
Image_headbg:loadTexture("game_res/desk/touxiang.png",0)
Image_headbg:setLayoutComponentEnabled(true)
Image_headbg:setName("Image_headbg")
Image_headbg:setTag(93)
Image_headbg:setCascadeColorEnabled(true)
Image_headbg:setCascadeOpacityEnabled(true)
Image_headbg:setPosition(-0.3899, 29.5833)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_headbg)
layout:setSize({width = 82.0000, height = 105.0000})
layout:setLeftMargin(-41.3899)
layout:setRightMargin(-40.6101)
layout:setTopMargin(-82.0833)
layout:setBottomMargin(-22.9167)
Node:addChild(Image_headbg)

--Create Image_icon
local Image_icon = ccui.ImageView:create()
Image_icon:ignoreContentAdaptWithSize(false)
Image_icon:loadTexture("Default/ImageFile.png",0)
Image_icon:setLayoutComponentEnabled(true)
Image_icon:setName("Image_icon")
Image_icon:setTag(17)
Image_icon:setCascadeColorEnabled(true)
Image_icon:setCascadeOpacityEnabled(true)
Image_icon:setPosition(41.0001, 64.0001)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_icon)
layout:setPositionPercentX(0.5000)
layout:setPositionPercentY(0.6095)
layout:setPercentWidth(0.9756)
layout:setPercentHeight(0.7619)
layout:setSize({width = 80.0000, height = 80.0000})
layout:setLeftMargin(1.0001)
layout:setRightMargin(0.9999)
layout:setTopMargin(0.9999)
layout:setBottomMargin(24.0001)
Image_headbg:addChild(Image_icon)

--Create Text_gold
local Text_gold = ccui.Text:create()
Text_gold:ignoreContentAdaptWithSize(true)
Text_gold:setTextAreaSize({width = 0, height = 0})
Text_gold:setFontSize(20)
Text_gold:setString([[0]])
Text_gold:setLayoutComponentEnabled(true)
Text_gold:setName("Text_gold")
Text_gold:setTag(101)
Text_gold:setCascadeColorEnabled(true)
Text_gold:setCascadeOpacityEnabled(true)
Text_gold:setPosition(41.7972, 11.6381)
Text_gold:setTextColor({r = 255, g = 229, b = 152})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_gold)
layout:setPositionPercentX(0.5097)
layout:setPositionPercentY(0.1108)
layout:setPercentWidth(0.1220)
layout:setPercentHeight(0.1905)
layout:setSize({width = 10.0000, height = 20.0000})
layout:setLeftMargin(36.7972)
layout:setRightMargin(35.2028)
layout:setTopMargin(83.3619)
layout:setBottomMargin(1.6381)
Image_headbg:addChild(Text_gold)

--Create Text_id
local Text_id = ccui.Text:create()
Text_id:ignoreContentAdaptWithSize(true)
Text_id:setTextAreaSize({width = 0, height = 0})
Text_id:setFontSize(20)
Text_id:setString([[UserName]])
Text_id:setLayoutComponentEnabled(true)
Text_id:setName("Text_id")
Text_id:setTag(102)
Text_id:setCascadeColorEnabled(true)
Text_id:setCascadeOpacityEnabled(true)
Text_id:setPosition(41.8256, -13.8173)
layout = ccui.LayoutComponent:bindLayoutComponent(Text_id)
layout:setPositionPercentX(0.5101)
layout:setPositionPercentY(-0.1316)
layout:setPercentWidth(0.9756)
layout:setPercentHeight(0.1905)
layout:setSize({width = 80.0000, height = 20.0000})
layout:setLeftMargin(1.8256)
layout:setRightMargin(0.1744)
layout:setTopMargin(108.8173)
layout:setBottomMargin(-23.8173)
Image_headbg:addChild(Text_id)

--Create Image_double
local Image_double = ccui.ImageView:create()
Image_double:ignoreContentAdaptWithSize(false)
Image_double:loadTexture("game_res/desk/jiabei.png",0)
Image_double:setLayoutComponentEnabled(true)
Image_double:setName("Image_double")
Image_double:setTag(94)
Image_double:setCascadeColorEnabled(true)
Image_double:setCascadeOpacityEnabled(true)
Image_double:setPosition(55.6057, 146.6956)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_double)
layout:setSize({width = 191.0000, height = 106.0000})
layout:setLeftMargin(-39.8943)
layout:setRightMargin(-151.1057)
layout:setTopMargin(-199.6956)
layout:setBottomMargin(93.6956)
Node:addChild(Image_double)

--Create AtlasLabel_double
local AtlasLabel_double = ccui.TextAtlas:create([[0]],
													"game_res/desk/jiabeishuzi.png",
													30,
													41,
													"/")
AtlasLabel_double:setLayoutComponentEnabled(true)
AtlasLabel_double:setName("AtlasLabel_double")
AtlasLabel_double:setTag(97)
AtlasLabel_double:setCascadeColorEnabled(true)
AtlasLabel_double:setCascadeOpacityEnabled(true)
AtlasLabel_double:setAnchorPoint(0.0000, 0.5000)
AtlasLabel_double:setPosition(75.1482, 86.1222)
layout = ccui.LayoutComponent:bindLayoutComponent(AtlasLabel_double)
layout:setPositionPercentX(0.3934)
layout:setPositionPercentY(0.8125)
layout:setPercentWidth(0.1571)
layout:setPercentHeight(0.3868)
layout:setSize({width = 30.0000, height = 41.0000})
layout:setLeftMargin(75.1482)
layout:setRightMargin(85.8518)
layout:setTopMargin(-0.6222)
layout:setBottomMargin(65.6222)
Image_double:addChild(AtlasLabel_double)

--Create Image_hua
local Image_hua = ccui.ImageView:create()
Image_hua:ignoreContentAdaptWithSize(false)
Image_hua:loadTexture("game_res/desk/hua.png",0)
Image_hua:setLayoutComponentEnabled(true)
Image_hua:setName("Image_hua")
Image_hua:setTag(95)
Image_hua:setCascadeColorEnabled(true)
Image_hua:setCascadeOpacityEnabled(true)
Image_hua:setPosition(70.3541, 33.3210)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_hua)
layout:setSize({width = 39.0000, height = 91.0000})
layout:setLeftMargin(50.8541)
layout:setRightMargin(-89.8541)
layout:setTopMargin(-78.8210)
layout:setBottomMargin(-12.1790)
Node:addChild(Image_hua)

--Create Text_hua
local Text_hua = ccui.Text:create()
Text_hua:ignoreContentAdaptWithSize(true)
Text_hua:setTextAreaSize({width = 0, height = 0})
Text_hua:setFontSize(20)
Text_hua:setString([[x0]])
Text_hua:setLayoutComponentEnabled(true)
Text_hua:setName("Text_hua")
Text_hua:setTag(96)
Text_hua:setCascadeColorEnabled(true)
Text_hua:setCascadeOpacityEnabled(true)
Text_hua:setPosition(19.8311, 39.0882)
Text_hua:setTextColor({r = 255, g = 229, b = 152})
layout = ccui.LayoutComponent:bindLayoutComponent(Text_hua)
layout:setPositionPercentX(0.5085)
layout:setPositionPercentY(0.4295)
layout:setPercentWidth(0.5128)
layout:setPercentHeight(0.2198)
layout:setSize({width = 20.0000, height = 20.0000})
layout:setLeftMargin(9.8311)
layout:setRightMargin(9.1689)
layout:setTopMargin(41.9118)
layout:setBottomMargin(29.0882)
Image_hua:addChild(Text_hua)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Node
return result;
end

return Result


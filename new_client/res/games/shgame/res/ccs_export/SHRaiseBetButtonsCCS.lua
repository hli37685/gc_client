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

--Create Button_1
local Button_1 = ccui.Button:create()
Button_1:ignoreContentAdaptWithSize(false)
Button_1:loadTextureNormal("game_res/mainView/sh_button_add_1.png",0)
Button_1:setTitleFontSize(14)
Button_1:setTitleColor({r = 65, g = 65, b = 70})
Button_1:setScale9Enabled(true)
Button_1:setCapInsets({x = 15, y = 11, width = 214, height = 62})
Button_1:setLayoutComponentEnabled(true)
Button_1:setName("Button_1")
Button_1:setTag(15)
Button_1:setCascadeColorEnabled(true)
Button_1:setCascadeOpacityEnabled(true)
Button_1:setPosition(0.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_1)
layout:setSize({width = 244.0000, height = 84.0000})
layout:setLeftMargin(-122.0000)
layout:setRightMargin(-122.0000)
layout:setTopMargin(-84.0000)
Node:addChild(Button_1)

--Create Image_add
local Image_add = ccui.ImageView:create()
Image_add:ignoreContentAdaptWithSize(false)
Image_add:loadTexture("game_res/mainView/sh_wenzi_jia.png",0)
Image_add:setLayoutComponentEnabled(true)
Image_add:setName("Image_add")
Image_add:setTag(19)
Image_add:setCascadeColorEnabled(true)
Image_add:setCascadeOpacityEnabled(true)
Image_add:setPosition(85.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_add)
layout:setPositionPercentX(0.3484)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1926)
layout:setPercentHeight(0.5833)
layout:setSize({width = 47.0000, height = 49.0000})
layout:setLeftMargin(61.5000)
layout:setRightMargin(135.5000)
layout:setTopMargin(17.5000)
layout:setBottomMargin(17.5000)
Button_1:addChild(Image_add)

--Create AtlasLabel_1
local AtlasLabel_1 = ccui.TextAtlas:create([[64]],
													"game_res/mainView/sh_button_szt.png",
													28,
													38,
													"/")
AtlasLabel_1:setLayoutComponentEnabled(true)
AtlasLabel_1:setName("AtlasLabel_1")
AtlasLabel_1:setTag(20)
AtlasLabel_1:setCascadeColorEnabled(true)
AtlasLabel_1:setCascadeOpacityEnabled(true)
AtlasLabel_1:setAnchorPoint(0.0000, 0.5000)
AtlasLabel_1:setPosition(120.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(AtlasLabel_1)
layout:setPositionPercentX(0.4918)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.2295)
layout:setPercentHeight(0.4524)
layout:setSize({width = 56.0000, height = 38.0000})
layout:setLeftMargin(120.0000)
layout:setRightMargin(68.0000)
layout:setTopMargin(23.0000)
layout:setBottomMargin(23.0000)
Button_1:addChild(AtlasLabel_1)

--Create Button_2
local Button_2 = ccui.Button:create()
Button_2:ignoreContentAdaptWithSize(false)
Button_2:loadTextureNormal("game_res/mainView/sh_button_add_2.png",0)
Button_2:setTitleFontSize(14)
Button_2:setTitleColor({r = 65, g = 65, b = 70})
Button_2:setScale9Enabled(true)
Button_2:setCapInsets({x = 15, y = 11, width = 214, height = 62})
Button_2:setLayoutComponentEnabled(true)
Button_2:setName("Button_2")
Button_2:setTag(16)
Button_2:setCascadeColorEnabled(true)
Button_2:setCascadeOpacityEnabled(true)
Button_2:setPosition(0.0000, 152.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_2)
layout:setSize({width = 244.0000, height = 84.0000})
layout:setLeftMargin(-122.0000)
layout:setRightMargin(-122.0000)
layout:setTopMargin(-194.0000)
layout:setBottomMargin(110.0000)
Node:addChild(Button_2)

--Create Image_add
local Image_add = ccui.ImageView:create()
Image_add:ignoreContentAdaptWithSize(false)
Image_add:loadTexture("game_res/mainView/sh_wenzi_jia.png",0)
Image_add:setLayoutComponentEnabled(true)
Image_add:setName("Image_add")
Image_add:setTag(22)
Image_add:setCascadeColorEnabled(true)
Image_add:setCascadeOpacityEnabled(true)
Image_add:setPosition(85.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_add)
layout:setPositionPercentX(0.3484)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1926)
layout:setPercentHeight(0.5833)
layout:setSize({width = 47.0000, height = 49.0000})
layout:setLeftMargin(61.5000)
layout:setRightMargin(135.5000)
layout:setTopMargin(17.5000)
layout:setBottomMargin(17.5000)
Button_2:addChild(Image_add)

--Create AtlasLabel_2
local AtlasLabel_2 = ccui.TextAtlas:create([[64]],
													"game_res/mainView/sh_button_szt.png",
													28,
													38,
													"/")
AtlasLabel_2:setLayoutComponentEnabled(true)
AtlasLabel_2:setName("AtlasLabel_2")
AtlasLabel_2:setTag(23)
AtlasLabel_2:setCascadeColorEnabled(true)
AtlasLabel_2:setCascadeOpacityEnabled(true)
AtlasLabel_2:setAnchorPoint(0.0000, 0.5000)
AtlasLabel_2:setPosition(120.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(AtlasLabel_2)
layout:setPositionPercentX(0.4918)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.2295)
layout:setPercentHeight(0.4524)
layout:setSize({width = 56.0000, height = 38.0000})
layout:setLeftMargin(120.0000)
layout:setRightMargin(68.0000)
layout:setTopMargin(23.0000)
layout:setBottomMargin(23.0000)
Button_2:addChild(AtlasLabel_2)

--Create Button_3
local Button_3 = ccui.Button:create()
Button_3:ignoreContentAdaptWithSize(false)
Button_3:loadTextureNormal("game_res/mainView/sh_button_add_3.png",0)
Button_3:setTitleFontSize(14)
Button_3:setTitleColor({r = 65, g = 65, b = 70})
Button_3:setScale9Enabled(true)
Button_3:setCapInsets({x = 15, y = 11, width = 214, height = 62})
Button_3:setLayoutComponentEnabled(true)
Button_3:setName("Button_3")
Button_3:setTag(17)
Button_3:setCascadeColorEnabled(true)
Button_3:setCascadeOpacityEnabled(true)
Button_3:setPosition(2.0121, 262.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_3)
layout:setSize({width = 244.0000, height = 84.0000})
layout:setLeftMargin(-119.9879)
layout:setRightMargin(-124.0121)
layout:setTopMargin(-304.0000)
layout:setBottomMargin(220.0000)
Node:addChild(Button_3)

--Create Image_add
local Image_add = ccui.ImageView:create()
Image_add:ignoreContentAdaptWithSize(false)
Image_add:loadTexture("game_res/mainView/sh_wenzi_jia.png",0)
Image_add:setLayoutComponentEnabled(true)
Image_add:setName("Image_add")
Image_add:setTag(24)
Image_add:setCascadeColorEnabled(true)
Image_add:setCascadeOpacityEnabled(true)
Image_add:setPosition(85.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_add)
layout:setPositionPercentX(0.3484)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1926)
layout:setPercentHeight(0.5833)
layout:setSize({width = 47.0000, height = 49.0000})
layout:setLeftMargin(61.5000)
layout:setRightMargin(135.5000)
layout:setTopMargin(17.5000)
layout:setBottomMargin(17.5000)
Button_3:addChild(Image_add)

--Create AtlasLabel_3
local AtlasLabel_3 = ccui.TextAtlas:create([[64]],
													"game_res/mainView/sh_button_szt.png",
													28,
													38,
													"/")
AtlasLabel_3:setLayoutComponentEnabled(true)
AtlasLabel_3:setName("AtlasLabel_3")
AtlasLabel_3:setTag(25)
AtlasLabel_3:setCascadeColorEnabled(true)
AtlasLabel_3:setCascadeOpacityEnabled(true)
AtlasLabel_3:setAnchorPoint(0.0000, 0.5000)
AtlasLabel_3:setPosition(120.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(AtlasLabel_3)
layout:setPositionPercentX(0.4918)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.2295)
layout:setPercentHeight(0.4524)
layout:setSize({width = 56.0000, height = 38.0000})
layout:setLeftMargin(120.0000)
layout:setRightMargin(68.0000)
layout:setTopMargin(23.0000)
layout:setBottomMargin(23.0000)
Button_3:addChild(AtlasLabel_3)

--Create Button_4
local Button_4 = ccui.Button:create()
Button_4:ignoreContentAdaptWithSize(false)
Button_4:loadTextureNormal("game_res/mainView/sh_button_add_4.png",0)
Button_4:setTitleFontSize(14)
Button_4:setTitleColor({r = 65, g = 65, b = 70})
Button_4:setScale9Enabled(true)
Button_4:setCapInsets({x = 15, y = 11, width = 214, height = 62})
Button_4:setLayoutComponentEnabled(true)
Button_4:setName("Button_4")
Button_4:setTag(18)
Button_4:setCascadeColorEnabled(true)
Button_4:setCascadeOpacityEnabled(true)
Button_4:setPosition(-3.0125, 372.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Button_4)
layout:setSize({width = 244.0000, height = 84.0000})
layout:setLeftMargin(-125.0125)
layout:setRightMargin(-118.9875)
layout:setTopMargin(-414.0000)
layout:setBottomMargin(330.0000)
Node:addChild(Button_4)

--Create Image_add
local Image_add = ccui.ImageView:create()
Image_add:ignoreContentAdaptWithSize(false)
Image_add:loadTexture("game_res/mainView/sh_wenzi_jia.png",0)
Image_add:setLayoutComponentEnabled(true)
Image_add:setName("Image_add")
Image_add:setTag(26)
Image_add:setCascadeColorEnabled(true)
Image_add:setCascadeOpacityEnabled(true)
Image_add:setPosition(85.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(Image_add)
layout:setPositionPercentX(0.3484)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.1926)
layout:setPercentHeight(0.5833)
layout:setSize({width = 47.0000, height = 49.0000})
layout:setLeftMargin(61.5000)
layout:setRightMargin(135.5000)
layout:setTopMargin(17.5000)
layout:setBottomMargin(17.5000)
Button_4:addChild(Image_add)

--Create AtlasLabel_4
local AtlasLabel_4 = ccui.TextAtlas:create([[64]],
													"game_res/mainView/sh_button_szt.png",
													28,
													38,
													"/")
AtlasLabel_4:setLayoutComponentEnabled(true)
AtlasLabel_4:setName("AtlasLabel_4")
AtlasLabel_4:setTag(27)
AtlasLabel_4:setCascadeColorEnabled(true)
AtlasLabel_4:setCascadeOpacityEnabled(true)
AtlasLabel_4:setAnchorPoint(0.0000, 0.5000)
AtlasLabel_4:setPosition(120.0000, 42.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(AtlasLabel_4)
layout:setPositionPercentX(0.4918)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(0.2295)
layout:setPercentHeight(0.4524)
layout:setSize({width = 56.0000, height = 38.0000})
layout:setLeftMargin(120.0000)
layout:setRightMargin(68.0000)
layout:setTopMargin(23.0000)
layout:setBottomMargin(23.0000)
Button_4:addChild(AtlasLabel_4)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Node
return result;
end

return Result


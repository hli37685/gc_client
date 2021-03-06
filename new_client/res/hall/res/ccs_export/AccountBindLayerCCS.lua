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
layout:setSize({width = 950.0000, height = 620.0000})

--Create account_bind_view
local account_bind_view = ccui.Layout:create()
account_bind_view:ignoreContentAdaptWithSize(false)
account_bind_view:setClippingEnabled(false)
account_bind_view:setBackGroundColorOpacity(102)
account_bind_view:setTouchEnabled(true);
account_bind_view:setLayoutComponentEnabled(true)
account_bind_view:setName("account_bind_view")
account_bind_view:setTag(177)
account_bind_view:setCascadeColorEnabled(true)
account_bind_view:setCascadeOpacityEnabled(true)
account_bind_view:setAnchorPoint(0.0000, 1.0000)
account_bind_view:setPosition(0.0000, 620.0000)
layout = ccui.LayoutComponent:bindLayoutComponent(account_bind_view)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentY(1.0000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.0000)
layout:setSize({width = 950.0000, height = 620.0000})
Layer:addChild(account_bind_view)

--Create nickname_input_panel
local nickname_input_panel = ccui.Layout:create()
nickname_input_panel:ignoreContentAdaptWithSize(false)
nickname_input_panel:setClippingEnabled(false)
nickname_input_panel:setBackGroundColorOpacity(102)
nickname_input_panel:setTouchEnabled(true);
nickname_input_panel:setLayoutComponentEnabled(true)
nickname_input_panel:setName("nickname_input_panel")
nickname_input_panel:setTag(312)
nickname_input_panel:setCascadeColorEnabled(true)
nickname_input_panel:setCascadeOpacityEnabled(true)
nickname_input_panel:setAnchorPoint(0.0000, 0.5000)
nickname_input_panel:setPosition(259.5979, 509.5994)
layout = ccui.LayoutComponent:bindLayoutComponent(nickname_input_panel)
layout:setPositionPercentX(0.2733)
layout:setPositionPercentY(0.8219)
layout:setPercentWidth(0.4800)
layout:setPercentHeight(0.0919)
layout:setSize({width = 456.0000, height = 57.0000})
layout:setLeftMargin(259.5979)
layout:setRightMargin(234.4021)
layout:setTopMargin(81.9006)
layout:setBottomMargin(481.0994)
account_bind_view:addChild(nickname_input_panel)

--Create labelTitle
local labelTitle = ccui.Text:create()
labelTitle:ignoreContentAdaptWithSize(true)
labelTitle:setTextAreaSize({width = 0, height = 0})
labelTitle:setFontSize(38)
labelTitle:setString([[输入昵称:]])
labelTitle:setLayoutComponentEnabled(true)
labelTitle:setName("labelTitle")
labelTitle:setTag(175)
labelTitle:setCascadeColorEnabled(true)
labelTitle:setCascadeOpacityEnabled(true)
labelTitle:setAnchorPoint(1.0000, 0.5000)
labelTitle:setPosition(-8.4800, 26.9900)
layout = ccui.LayoutComponent:bindLayoutComponent(labelTitle)
layout:setPositionPercentX(-0.0186)
layout:setPositionPercentY(0.4735)
layout:setPercentWidth(0.3750)
layout:setPercentHeight(0.6667)
layout:setSize({width = 171.0000, height = 38.0000})
layout:setLeftMargin(-179.4800)
layout:setRightMargin(464.4800)
layout:setTopMargin(11.0100)
layout:setBottomMargin(7.9900)
nickname_input_panel:addChild(labelTitle)

--Create nickname_input_bg
local nickname_input_bg = ccui.ImageView:create()
nickname_input_bg:ignoreContentAdaptWithSize(false)
nickname_input_bg:loadTexture("hall_res/account/bb_grxx_bdzh_ditiao.png",0)
nickname_input_bg:setLayoutComponentEnabled(true)
nickname_input_bg:setName("nickname_input_bg")
nickname_input_bg:setTag(178)
nickname_input_bg:setCascadeColorEnabled(true)
nickname_input_bg:setCascadeOpacityEnabled(true)
nickname_input_bg:setAnchorPoint(0.0000, 0.5000)
nickname_input_bg:setPosition(0.0000, 28.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(nickname_input_bg)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.1404)
layout:setSize({width = 456.0000, height = 65.0000})
layout:setTopMargin(-4.0000)
layout:setBottomMargin(-4.0000)
nickname_input_panel:addChild(nickname_input_bg)

--Create phonenum_input_panel
local phonenum_input_panel = ccui.Layout:create()
phonenum_input_panel:ignoreContentAdaptWithSize(false)
phonenum_input_panel:setClippingEnabled(false)
phonenum_input_panel:setBackGroundColorOpacity(102)
phonenum_input_panel:setTouchEnabled(true);
phonenum_input_panel:setLayoutComponentEnabled(true)
phonenum_input_panel:setName("phonenum_input_panel")
phonenum_input_panel:setTag(313)
phonenum_input_panel:setCascadeColorEnabled(true)
phonenum_input_panel:setCascadeOpacityEnabled(true)
phonenum_input_panel:setAnchorPoint(0.0000, 0.5000)
phonenum_input_panel:setPosition(259.5979, 441.3099)
layout = ccui.LayoutComponent:bindLayoutComponent(phonenum_input_panel)
layout:setPositionPercentX(0.2733)
layout:setPositionPercentY(0.7118)
layout:setPercentWidth(0.4800)
layout:setPercentHeight(0.0919)
layout:setSize({width = 456.0000, height = 57.0000})
layout:setLeftMargin(259.5979)
layout:setRightMargin(234.4021)
layout:setTopMargin(150.1901)
layout:setBottomMargin(412.8099)
account_bind_view:addChild(phonenum_input_panel)

--Create labelTitle
local labelTitle = ccui.Text:create()
labelTitle:ignoreContentAdaptWithSize(true)
labelTitle:setTextAreaSize({width = 0, height = 0})
labelTitle:setFontSize(38)
labelTitle:setString([[手机号码:]])
labelTitle:setLayoutComponentEnabled(true)
labelTitle:setName("labelTitle")
labelTitle:setTag(176)
labelTitle:setCascadeColorEnabled(true)
labelTitle:setCascadeOpacityEnabled(true)
labelTitle:setAnchorPoint(1.0000, 0.5000)
labelTitle:setPosition(-8.4800, 26.9900)
layout = ccui.LayoutComponent:bindLayoutComponent(labelTitle)
layout:setPositionPercentX(-0.0186)
layout:setPositionPercentY(0.4735)
layout:setPercentWidth(0.3750)
layout:setPercentHeight(0.6667)
layout:setSize({width = 171.0000, height = 38.0000})
layout:setLeftMargin(-179.4800)
layout:setRightMargin(464.4800)
layout:setTopMargin(11.0100)
layout:setBottomMargin(7.9900)
phonenum_input_panel:addChild(labelTitle)

--Create phonenum_input_bg
local phonenum_input_bg = ccui.ImageView:create()
phonenum_input_bg:ignoreContentAdaptWithSize(false)
phonenum_input_bg:loadTexture("hall_res/account/bb_grxx_bdzh_ditiao.png",0)
phonenum_input_bg:setLayoutComponentEnabled(true)
phonenum_input_bg:setName("phonenum_input_bg")
phonenum_input_bg:setTag(180)
phonenum_input_bg:setCascadeColorEnabled(true)
phonenum_input_bg:setCascadeOpacityEnabled(true)
phonenum_input_bg:setAnchorPoint(0.0000, 0.5000)
phonenum_input_bg:setPosition(0.0000, 28.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(phonenum_input_bg)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.1404)
layout:setSize({width = 456.0000, height = 65.0000})
layout:setTopMargin(-4.0000)
layout:setBottomMargin(-4.0000)
phonenum_input_panel:addChild(phonenum_input_bg)

--Create verifycode_input_panel
local verifycode_input_panel = ccui.Layout:create()
verifycode_input_panel:ignoreContentAdaptWithSize(false)
verifycode_input_panel:setClippingEnabled(false)
verifycode_input_panel:setBackGroundColorOpacity(102)
verifycode_input_panel:setTouchEnabled(true);
verifycode_input_panel:setLayoutComponentEnabled(true)
verifycode_input_panel:setName("verifycode_input_panel")
verifycode_input_panel:setTag(314)
verifycode_input_panel:setCascadeColorEnabled(true)
verifycode_input_panel:setCascadeOpacityEnabled(true)
verifycode_input_panel:setAnchorPoint(0.0000, 0.5000)
verifycode_input_panel:setPosition(259.5979, 369.1501)
layout = ccui.LayoutComponent:bindLayoutComponent(verifycode_input_panel)
layout:setPositionPercentX(0.2733)
layout:setPositionPercentY(0.5954)
layout:setPercentWidth(0.4800)
layout:setPercentHeight(0.0919)
layout:setSize({width = 456.0000, height = 57.0000})
layout:setLeftMargin(259.5979)
layout:setRightMargin(234.4021)
layout:setTopMargin(222.3499)
layout:setBottomMargin(340.6501)
account_bind_view:addChild(verifycode_input_panel)

--Create labelTitle
local labelTitle = ccui.Text:create()
labelTitle:ignoreContentAdaptWithSize(true)
labelTitle:setTextAreaSize({width = 0, height = 0})
labelTitle:setFontSize(38)
labelTitle:setString([[验证码:]])
labelTitle:setLayoutComponentEnabled(true)
labelTitle:setName("labelTitle")
labelTitle:setTag(177)
labelTitle:setCascadeColorEnabled(true)
labelTitle:setCascadeOpacityEnabled(true)
labelTitle:setAnchorPoint(1.0000, 0.5000)
labelTitle:setPosition(-8.4800, 26.9900)
layout = ccui.LayoutComponent:bindLayoutComponent(labelTitle)
layout:setPositionPercentX(-0.0186)
layout:setPositionPercentY(0.4735)
layout:setPercentWidth(0.2917)
layout:setPercentHeight(0.6667)
layout:setSize({width = 133.0000, height = 38.0000})
layout:setLeftMargin(-141.4800)
layout:setRightMargin(464.4800)
layout:setTopMargin(11.0100)
layout:setBottomMargin(7.9900)
verifycode_input_panel:addChild(labelTitle)

--Create verifycode_input_bg
local verifycode_input_bg = ccui.ImageView:create()
verifycode_input_bg:ignoreContentAdaptWithSize(false)
verifycode_input_bg:loadTexture("hall_res/account/bb_grxx_bdzh_ditiao.png",0)
verifycode_input_bg:setLayoutComponentEnabled(true)
verifycode_input_bg:setName("verifycode_input_bg")
verifycode_input_bg:setTag(182)
verifycode_input_bg:setCascadeColorEnabled(true)
verifycode_input_bg:setCascadeOpacityEnabled(true)
verifycode_input_bg:setAnchorPoint(0.0000, 0.5000)
verifycode_input_bg:setPosition(0.0000, 28.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(verifycode_input_bg)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.1404)
layout:setSize({width = 456.0000, height = 65.0000})
layout:setTopMargin(-4.0000)
layout:setBottomMargin(-4.0000)
verifycode_input_panel:addChild(verifycode_input_bg)

--Create verify_code_btn
local verify_code_btn = ccui.Button:create()
verify_code_btn:ignoreContentAdaptWithSize(false)
verify_code_btn:loadTextureNormal("hall_res/tongyong/bb_dxgm_hqyzm.png",0)
verify_code_btn:loadTexturePressed("hall_res/tongyong/bb_dxgm_hqyzm1.png",0)
verify_code_btn:loadTextureDisabled("hall_res/tongyong/bb_dxgm_hqyzm1.png",0)
verify_code_btn:setTitleFontSize(28)
verify_code_btn:setTitleColor({r = 65, g = 65, b = 70})
verify_code_btn:setScale9Enabled(true)
verify_code_btn:setCapInsets({x = 15, y = 11, width = 148, height = 42})
verify_code_btn:setLayoutComponentEnabled(true)
verify_code_btn:setName("verify_code_btn")
verify_code_btn:setTag(184)
verify_code_btn:setCascadeColorEnabled(true)
verify_code_btn:setCascadeOpacityEnabled(true)
verify_code_btn:setAnchorPoint(0.0000, 0.5000)
verify_code_btn:setPosition(456.0000, 26.4993)
layout = ccui.LayoutComponent:bindLayoutComponent(verify_code_btn)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(1.0000)
layout:setPositionPercentY(0.4649)
layout:setPercentWidth(0.3904)
layout:setPercentHeight(1.1228)
layout:setSize({width = 178.0000, height = 64.0000})
layout:setLeftMargin(456.0000)
layout:setRightMargin(-178.0000)
layout:setTopMargin(-1.4993)
layout:setBottomMargin(-5.5007)
verifycode_input_panel:addChild(verify_code_btn)

--Create pwd_input_panel
local pwd_input_panel = ccui.Layout:create()
pwd_input_panel:ignoreContentAdaptWithSize(false)
pwd_input_panel:setClippingEnabled(false)
pwd_input_panel:setBackGroundColorOpacity(102)
pwd_input_panel:setTouchEnabled(true);
pwd_input_panel:setLayoutComponentEnabled(true)
pwd_input_panel:setName("pwd_input_panel")
pwd_input_panel:setTag(315)
pwd_input_panel:setCascadeColorEnabled(true)
pwd_input_panel:setCascadeOpacityEnabled(true)
pwd_input_panel:setAnchorPoint(0.0000, 0.5000)
pwd_input_panel:setPosition(259.5979, 298.2791)
layout = ccui.LayoutComponent:bindLayoutComponent(pwd_input_panel)
layout:setPositionPercentX(0.2733)
layout:setPositionPercentY(0.4811)
layout:setPercentWidth(0.4800)
layout:setPercentHeight(0.0919)
layout:setSize({width = 456.0000, height = 57.0000})
layout:setLeftMargin(259.5979)
layout:setRightMargin(234.4021)
layout:setTopMargin(293.2209)
layout:setBottomMargin(269.7791)
account_bind_view:addChild(pwd_input_panel)

--Create labelTitle
local labelTitle = ccui.Text:create()
labelTitle:ignoreContentAdaptWithSize(true)
labelTitle:setTextAreaSize({width = 0, height = 0})
labelTitle:setFontSize(38)
labelTitle:setString([[输入密码:]])
labelTitle:setLayoutComponentEnabled(true)
labelTitle:setName("labelTitle")
labelTitle:setTag(178)
labelTitle:setCascadeColorEnabled(true)
labelTitle:setCascadeOpacityEnabled(true)
labelTitle:setAnchorPoint(1.0000, 0.5000)
labelTitle:setPosition(-8.4800, 25.4904)
layout = ccui.LayoutComponent:bindLayoutComponent(labelTitle)
layout:setPositionPercentX(-0.0186)
layout:setPositionPercentY(0.4472)
layout:setPercentWidth(0.3750)
layout:setPercentHeight(0.6667)
layout:setSize({width = 171.0000, height = 38.0000})
layout:setLeftMargin(-179.4800)
layout:setRightMargin(464.4800)
layout:setTopMargin(12.5096)
layout:setBottomMargin(6.4904)
pwd_input_panel:addChild(labelTitle)

--Create pwd_input_bg
local pwd_input_bg = ccui.ImageView:create()
pwd_input_bg:ignoreContentAdaptWithSize(false)
pwd_input_bg:loadTexture("hall_res/account/bb_grxx_bdzh_ditiao.png",0)
pwd_input_bg:setLayoutComponentEnabled(true)
pwd_input_bg:setName("pwd_input_bg")
pwd_input_bg:setTag(185)
pwd_input_bg:setCascadeColorEnabled(true)
pwd_input_bg:setCascadeOpacityEnabled(true)
pwd_input_bg:setAnchorPoint(0.0000, 0.5000)
pwd_input_bg:setPosition(0.0000, 28.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(pwd_input_bg)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.1404)
layout:setSize({width = 456.0000, height = 65.0000})
layout:setTopMargin(-4.0000)
layout:setBottomMargin(-4.0000)
pwd_input_panel:addChild(pwd_input_bg)

--Create pwd2_input_panel
local pwd2_input_panel = ccui.Layout:create()
pwd2_input_panel:ignoreContentAdaptWithSize(false)
pwd2_input_panel:setClippingEnabled(false)
pwd2_input_panel:setBackGroundColorOpacity(102)
pwd2_input_panel:setTouchEnabled(true);
pwd2_input_panel:setLayoutComponentEnabled(true)
pwd2_input_panel:setName("pwd2_input_panel")
pwd2_input_panel:setTag(316)
pwd2_input_panel:setCascadeColorEnabled(true)
pwd2_input_panel:setCascadeOpacityEnabled(true)
pwd2_input_panel:setAnchorPoint(0.0000, 0.5000)
pwd2_input_panel:setPosition(259.5979, 229.9894)
layout = ccui.LayoutComponent:bindLayoutComponent(pwd2_input_panel)
layout:setPositionPercentX(0.2733)
layout:setPositionPercentY(0.3710)
layout:setPercentWidth(0.4800)
layout:setPercentHeight(0.0919)
layout:setSize({width = 456.0000, height = 57.0000})
layout:setLeftMargin(259.5979)
layout:setRightMargin(234.4021)
layout:setTopMargin(361.5106)
layout:setBottomMargin(201.4894)
account_bind_view:addChild(pwd2_input_panel)

--Create labelTitle
local labelTitle = ccui.Text:create()
labelTitle:ignoreContentAdaptWithSize(true)
labelTitle:setTextAreaSize({width = 0, height = 0})
labelTitle:setFontSize(38)
labelTitle:setString([[确认密码:]])
labelTitle:setLayoutComponentEnabled(true)
labelTitle:setName("labelTitle")
labelTitle:setTag(179)
labelTitle:setCascadeColorEnabled(true)
labelTitle:setCascadeOpacityEnabled(true)
labelTitle:setAnchorPoint(1.0000, 0.5000)
labelTitle:setPosition(-8.4800, 26.9900)
layout = ccui.LayoutComponent:bindLayoutComponent(labelTitle)
layout:setPositionPercentX(-0.0186)
layout:setPositionPercentY(0.4735)
layout:setPercentWidth(0.3750)
layout:setPercentHeight(0.6667)
layout:setSize({width = 171.0000, height = 38.0000})
layout:setLeftMargin(-179.4800)
layout:setRightMargin(464.4800)
layout:setTopMargin(11.0100)
layout:setBottomMargin(7.9900)
pwd2_input_panel:addChild(labelTitle)

--Create pwd2_input_bg
local pwd2_input_bg = ccui.ImageView:create()
pwd2_input_bg:ignoreContentAdaptWithSize(false)
pwd2_input_bg:loadTexture("hall_res/account/bb_grxx_bdzh_ditiao.png",0)
pwd2_input_bg:setLayoutComponentEnabled(true)
pwd2_input_bg:setName("pwd2_input_bg")
pwd2_input_bg:setTag(187)
pwd2_input_bg:setCascadeColorEnabled(true)
pwd2_input_bg:setCascadeOpacityEnabled(true)
pwd2_input_bg:setAnchorPoint(0.0000, 0.5000)
pwd2_input_bg:setPosition(0.0000, 28.5000)
layout = ccui.LayoutComponent:bindLayoutComponent(pwd2_input_bg)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentY(0.5000)
layout:setPercentWidth(1.0000)
layout:setPercentHeight(1.1404)
layout:setSize({width = 456.0000, height = 65.0000})
layout:setTopMargin(-4.0000)
layout:setBottomMargin(-4.0000)
pwd2_input_panel:addChild(pwd2_input_bg)

--Create bind_btn
local bind_btn = ccui.Button:create()
bind_btn:ignoreContentAdaptWithSize(false)
bind_btn:loadTextureNormal("hall_res/account/bb_grxx_ljbd_normal.png",0)
bind_btn:loadTexturePressed("hall_res/account/bb_grxx_ljbd_pressed.png",0)
bind_btn:loadTextureDisabled("hall_res/account/bb_grxx_ljbd_pressed.png",0)
bind_btn:setTitleFontSize(14)
bind_btn:setTitleColor({r = 65, g = 65, b = 70})
bind_btn:setScale9Enabled(true)
bind_btn:setCapInsets({x = 15, y = 11, width = 257, height = 78})
bind_btn:setLayoutComponentEnabled(true)
bind_btn:setName("bind_btn")
bind_btn:setTag(189)
bind_btn:setCascadeColorEnabled(true)
bind_btn:setCascadeOpacityEnabled(true)
bind_btn:setPosition(487.5950, 123.9360)
layout = ccui.LayoutComponent:bindLayoutComponent(bind_btn)
layout:setPositionPercentX(0.5133)
layout:setPositionPercentY(0.1999)
layout:setPercentWidth(0.3021)
layout:setPercentHeight(0.1613)
layout:setSize({width = 287.0000, height = 100.0000})
layout:setLeftMargin(344.0950)
layout:setRightMargin(318.9050)
layout:setTopMargin(446.0640)
layout:setBottomMargin(73.9360)
account_bind_view:addChild(bind_btn)

--Create verify_code_tip
local verify_code_tip = ccui.Text:create()
verify_code_tip:ignoreContentAdaptWithSize(true)
verify_code_tip:setTextAreaSize({width = 0, height = 0})
verify_code_tip:setFontSize(28)
verify_code_tip:setString([[60秒后可再次获取]])
verify_code_tip:setLayoutComponentEnabled(true)
verify_code_tip:setName("verify_code_tip")
verify_code_tip:setTag(190)
verify_code_tip:setCascadeColorEnabled(true)
verify_code_tip:setCascadeOpacityEnabled(true)
verify_code_tip:setVisible(false)
verify_code_tip:setAnchorPoint(0.0000, 0.5000)
verify_code_tip:setPosition(720.9550, 436.5420)
verify_code_tip:setTextColor({r = 229, g = 229, b = 229})
layout = ccui.LayoutComponent:bindLayoutComponent(verify_code_tip)
layout:setPositionPercentXEnabled(true)
layout:setPositionPercentYEnabled(true)
layout:setPositionPercentX(0.7589)
layout:setPositionPercentY(0.7041)
layout:setPercentWidth(0.2358)
layout:setPercentHeight(0.0452)
layout:setSize({width = 224.0000, height = 28.0000})
layout:setLeftMargin(720.9550)
layout:setRightMargin(5.0450)
layout:setTopMargin(169.4580)
layout:setBottomMargin(422.5420)
account_bind_view:addChild(verify_code_tip)

--Create Animation
result['animation'] = ccs.ActionTimeline:create()
  
result['animation']:setDuration(0)
result['animation']:setTimeSpeed(1.0000)
--Create Animation List

result['root'] = Layer
return result;
end

return Result



local HallClientDesc =  {
	loginTip				 = "登录中,请稍后...",
	rchargeTip				 = "正在生成订单,请稍后...",
	reconnection			 = "重连中...",
	get_player_info_tip		 = "获取玩家信息中...",
	entering_gamescene_tip	 = "正在进入游戏,请稍后...",
	LC_Login_1				 = "重复登录",
	LC_Login_2				 = "数据库操作返回错误",
	LC_Login_3				 = "密码错误",
    LC_Login_15              = "账号已经冻结,请联系客服",
	LC_Login_27				 = "该账号还未注册,无法登陆",
	LC_Login_4				 = "没有找到默认大厅",
	LC_Login_32				 = "登录维护中,请稍后重试",
	LC_Login_33				 = "频繁登录",
	LC_Login_34				 =	"上次登录未完成",
	LC_Login_35				 =	"已经在登录排队中",
	SC_RequestSms_5			 = "短信验证没有开启",
	SC_RequestSms_6			 = "短信验证已经发送,请稍后重试",
	SC_RequestSms_8		 	 = "获取短信失败,请稍后重试",
	SC_RequestSms_28		 = "手机号位数不对,请核对后再试",
	SC_RequestSms_29		 = "此手机号码无效,请核对后再试",
	SC_RequestSms_30		 = "手机号已被使用",
	SC_ResetAccount_7		 = "完善账号失败",
	SC_ResetAccount_16		 = "完善账号失败,该手机已绑定",
	SC_ResetAccount_17		 = "完善账号失败,该昵称已被占用",
	SC_ResetAccount_8		 = "短信验证失败",
	LC_Login_8				 = "短信验证失败",
	SC_RequestSms_9			 = "短信获取失败,请稍后重试",
	SC_SetPassword_8		 = "短信验证失败",
	SC_SetPassword_10		 = "修改密码失败",
	SC_SetPassword_13		 = "新旧密码一样",
	SC_SetNickname_11		 = "设置昵称失败",
	SC_SetNickname_18    	 = "设置昵称失败，该昵称已被占用",
	SC_SetNickname_26		 = "昵称不能为字母数字下划线和汉字以外的字符",
	SC_EnterRoomAndSitDown_2 = "已经在游戏中",
	SC_BankDeposit_6		 = "银行未登陆",
	SC_BankDraw_7			 = "取出金额不对,请重新输入",
	SC_BankDeposit_7		 = "存入金额不对,请重新输入",
	SC_BankTransfer_7		 = "转账金额不对,请重新输入",
	SC_BankTransfer_8		 = "没有找到收款人",
	SC_LoginValidatebox_14   = "验证码不对",
	SC_CashMoneyResult_1     = "当前拥有金币数量不足以提现",
	SC_CashMoneyResult_2	 = "系统异常，无法提现",
    SC_CashMoneyResult_9     = "支付宝信息为空，无法提现",
    BandAlipay_Need_BindAccount = "游客无法绑定支付宝，请先绑定账号",
	SC_BandAlipay_1			 = "支付宝姓名或账号格式不对，请重新输入",
	SC_BandAlipay_2			 = "该支付宝账号已经绑定在其它账号",
	SC_BandAlipay_3			 = "绑定失败，请稍后重试",
	SC_EnterRoomAndSitDown_4 = "金币不足",
    SC_EnterRoomAndSitDown_13 = "账号已经冻结,请联系客服",
    SC_EnterRoomAndSitDown_11 =	"没有找到游戏服务器",
    -- SC_EnterRoomAndSitDown_14 = "服务器维护中",
    -- SC_StandUpAndExitRoom_14 = "服务器维护中",
	SC_GameMaintain_14		 = "游戏维护中，请稍后重试",	
	SC_CashMaintain_14		 = "提现维护中，请稍后重试",
	SC_OxBetCoin_1           = "已达到庄家最大下注金额",
	SC_OxBetCoin_2           = "玩家金币不足",
	SC_OxBetCoin_3           = "玩家不满足最低下注金币限制",
	SC_OxBetCoin_4           = "未知错误"
}
return HallClientDesc;

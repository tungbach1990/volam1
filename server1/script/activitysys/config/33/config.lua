Include("\\script\\activitysys\\config\\33\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "服务器启动加载npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "宋金得分大于1000小于3000",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TongKim1000NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim1000", "10 D﹜ Th鮪g", 1}},
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "宋金得分大于3000",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_QuocKhanhVN","TongKim3000NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim3000", "30 D﹜ Th鮪g", 1}},
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "闯关过第17关",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","VuotAi17NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi17", "10 D﹜ Th鮪g", 1}},
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "闯关过第28关",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},15,"Event_QuocKhanhVN","VuotAi28NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi28", "15 D﹜ Th鮪g", 1}},
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡杀死水贼头领",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDauLinh", "10 D﹜ Th鮪g", 1}},
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "风陵渡杀死水贼大头领",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","TieuDietThuyTacDaiDauLinhNhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDaiDauLinh", "20 D﹜ Th鮪g", 1}},
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "炎帝闯过第十关",
	nStartDate = 201109010000,
	nEndDate  = 201109120000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","VuotAiViemDe10NhanDayThung"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAiViemDe10", "20 D﹜ Th鮪g", 1}},
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "NpcOnDeath",
	szName = "Nhi謒 v� S竧 th� ",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},2,"Event_QuocKhanhVN","TieuDietBossSatThu"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietBossSatThu", "2 D﹜ Th鮪g", 1}},
	},
}
tbConfig[10] = --一个细节
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "杀死黄金BOSS",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_QuocKhanhVN","TieuDietBossTheGioi"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietBossTheGioi", "30 D﹜ Th鮪g", 1}},
	},
}
tbConfig[11] = --一个细节
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "第二阶段宋金大于1000小于3000",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TongKim1000NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_QuocKhanhVN","TongKim1000NhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim1000", "10 D﹜ Th鮪g v� 4 N課 Tr緉g", 1}},
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "FinishSongJin",
	szName = "第二阶段宋金得分大于3000",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},30,"Event_QuocKhanhVN","TongKim3000NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},8,"Event_QuocKhanhVN","TongKim3000NhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TongKim3000", "30 D﹜ Th鮪g v� 8 N課 Tr緉g", 1}},
	},
}
tbConfig[13] = --一个细节
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "第二阶段闯关过第17关",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","VuotAi17NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},2,"Event_QuocKhanhVN","VuotAi17NhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi17", "10 D﹜ Th鮪g v� 2 N課 Tr緉g", 1}},
	},
}
tbConfig[14] = --一个细节
{
	nId = 14,
	szMessageType = "Chuanguan",
	szName = "第二阶段闯关过第28关",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},15,"Event_QuocKhanhVN","VuotAi28NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_QuocKhanhVN","VuotAi28NhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAi28", "15 D﹜ Th鮪g v� 4 N課 Tr緉g", 1}},
	},
}
tbConfig[15] = --一个细节
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "第二阶段风陵渡杀死水贼头领",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},10,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},2,"Event_QuocKhanhVN","TieuDietThuyTacDauLinhNhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDauLinh", "10 D﹜ Th鮪g v� 2 N課 Tr緉g", 1}},
	},
}
tbConfig[16] = --一个细节
{
	nId = 16,
	szMessageType = "NpcOnDeath",
	szName = "第二阶段风陵渡杀死水贼大头领",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","TieuDietThuyTacDaiDauLinhNhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},4,"Event_QuocKhanhVN","TieuDietThuyTacDaiDauLinhNhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "TieuDietThuyTacDaiDauLinh", "20 D﹜ Th鮪g v� 4 N課 Tr緉g", 1}},
	},
}
tbConfig[17] = --一个细节
{
	nId = 17,
	szMessageType = "YDBZguoguan",
	szName = "第二阶段炎帝闯过第十关",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2976,1,0,0},nExpiredTime=20111001,},20,"Event_QuocKhanhVN","VuotAiViemDe10NhanDayThung"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2981,1,0,0},nExpiredTime=20111001,},5,"Event_QuocKhanhVN","VuotAiViemDe10NhanNenTrang"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "VuotAiViemDe10", "20 D﹜ Th鮪g v� 5 N課 Tr緉g", 1}},
	},
}
tbConfig[18] = --一个细节
{
	nId = 18,
	szMessageType = "ClickNpc",
	szName = "国旗台对话",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"Tng Уi"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"N閜 D﹜ Th鮪g",19} },
		{"AddDialogOpt",	{"фi Ph竜 Hoa Qu鑓 Kh竛h",20} },
	},
}
tbConfig[19] = --一个细节
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "N閜 D﹜ Th鮪g",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"N閜 D﹜ Th鮪g",1,0,0,0},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"D﹜ Th鮪g",{tbProp={6,1,2976,1,0,0},},1} },
		{"ThisActivity:CheckTask",	{TKSG_HandinStringCount,"1000-<ComposeCount>","M鏸 nh﹏ v藅 ch� n閜 t鑙 產 1000 v藅 ph萴 [D﹜ Th鮪g] trong su鑤 th阨 gian di詎 ra ho箃 ng","<="} },
	},
	tbActition = 
	{
		{"ThisActivity:HandinString",	{nil} },
		{"ThisActivity:AddTask",	{TKSG_HandinStringCount,1} },
	},
}
tbConfig[20] = --一个细节
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "фi Ph竜 Hoa Qu鑓 Kh竛h",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {"Ph竜 Hoa Qu鑓 Kh竛h",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"D﹜ Th鮪g",{tbProp={6,1,2976,1,0,0},},1} },
		{"AddOneMaterial",	{"D秈 L鬭 M祏 п",{tbProp={6,1,2977,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKG_ConvertFireworksCount,1} },
		{"ThisActivity:ConvertFireworks",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2979,1,0,0},nExpiredTime=20111001,},1,"Event_QuocKhanhVN","GhepPhaoHoaQuocKhanh"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "GhepPhaoHoaQuocKhanh", "Ph竜 Hoa Qu鑓 Kh竛h", 1}},
	},
}
tbConfig[21] = --一个细节
{
	nId = 21,
	szMessageType = "ClickNpc",
	szName = "цi tho筰 v韎 H籲g Nga",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"H籲g Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"фi B竛h Trung Thu H祅 Nguy謙",22} },
	},
}
tbConfig[22] = --一个细节
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "фi B竛h Trung Thu H祅 Nguy謙",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {"B竛h Trung Thu H祅 Nguy謙",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{"N課 Tr緉g",{tbProp={6,1,2981,1,0,0},},1} },
		{"AddOneMaterial",	{"L錸g n 竛h Tr╪g",{tbProp={6,1,2978,1,0,0},},1} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_ConvertMooncakeCount,1} },
		{"ThisActivity:ConvertMooncake",	{nil} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2980,1,0,0},nExpiredTime=20111001,},1,"Event_QuocKhanhVN","DoiBanhTrungThu"} },
		{"tbVngTransLog:Write", {strQK_TranslogFolder, nQK_PromotionID, "DoiBanhTrungThu", "B竛h Trung Thu H祅 Nguy謙", 1}},
	},
}
tbConfig[23] = --一个细节
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "S� d鬾g Ph竜 Hoa Qu鑓 Kh竛h",
	nStartDate = 201109010000,
	nEndDate  = 201110010000,
	tbMessageParam = {{tbProp={6,1,2979,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , l莕 sau h穣 n nh�!",">="} },
		{"ThisActivity:CheckTask",	{TKSG_UseFireworksCount,1500,"M鏸 nh﹏ v藅 ch� s� d鬾g t鑙 產 1500 v藅 ph萴 [Ph竜 Hoa Qu鑓 Kh竛h] trong su鑤 th阨 gian di詎 ra ho箃 ng","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"H祅h trang 輙 nh蕋 ph秈 c遪 3 ch� tr鑞g"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TKSG_UseFireworksCount,1} },
		{"ThisActivity:UseFirworks",	{nil} },
	},
}
tbConfig[24] = --一个细节
{
	nId = 24,
	szMessageType = "ItemScript",
	szName = "S� d鬾g B竛h Trung Thu H祅 Nguy謙",
	nStartDate = 201109120000,
	nEndDate  = 201110010000,
	tbMessageParam = {{tbProp={6,1,2980,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 ngi kh玭g , l莕 sau h穣 n nh�!",">="} },
		{"ThisActivity:CheckTaskDaily",	{TKSG_UseMooncakeCount,15,"M鏸 ng祔 m鏸 nh﹏ v藅 ch� 頲 s� d鬾g t鑙 產 15 v藅 ph萴 [B竛h Trung Thu H祅 Nguy謙]","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"H祅h trang 輙 nh蕋 ph秈 c遪 3 ch� tr鑞g"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TKSG_UseMooncakeCount,1} },
		{"ThisActivity:UseMooncake",	{nil} },
	},
}

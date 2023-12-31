Include("\\script\\activitysys\\config\\15\\head.lua")
Include("\\script\\activitysys\\config\\15\\variables.lua")

local tbAward = {}
pActivity.tbAward = tbAward

-- bBroadcast: 屏幕中间黄色滚动标记值（不添加该标记值，则不会出现屏幕中间黄色滚动）
-- A奖励
tbAward["award_a"] = nil

-- B奖励
tbAward["award_b"] = 
{
	-- {szName="B筩h H� B秓 Th筩h",tbProp={6,1,3184,1,0,0},nCount=1,nRate=0.15},
	-- {szName="B筩h H� Thi猲 Th筩h",tbProp={6,1,3185,1,0,0},nCount=1,nRate=0.08},
	-- {szName="B筩h H� Th莕 Th筩h",tbProp={6,1,3186,1,0,0},nCount=1,nRate=0.04,bBroadcast=1},
	-- {szName="B筩h H� L謓h",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.06,bBroadcast=1},
	-- {szName="B筩h H� Kim B礽",tbProp={6,1,3183,1,0,0},nCount=1,nRate=0.05,bBroadcast=1},
	-- {szName="Huy襫 Tinh Kho竛g Th筩h ",tbProp={6,1,147,9,0,0},nCount=1,nRate=0.05},
	-- {szName="T� M穘g Th筩h",tbProp={6,1,3000,1,0,0},nCount=1,nRate=0.2},
	-- {szName="Kim � Kim B礽",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.1},
	-- {szName="B秓 Rng Kim � Kh玦 ( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.03,bBroadcast=1},
	-- {szName="B秓 Rng Kim � Y ( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B秓 Rng Kim � H礽 ( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B秓 Rng Kim � Y猽 Цi ( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B秓 Rng Kim � H� Uy觧( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B秓 Rng Kim � H筺g Li猲( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B秓 Rng Kim � B閕( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.03,bBroadcast=1},
	-- {szName="B秓 Rng Kim � Thng Gi韎( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.02,bBroadcast=1},
	-- {szName="B秓 Rng Kim � H� Gi韎( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.02,bBroadcast=1},
	-- {szName="B秓 Rng Kim � V� Kh�( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B筩h H� Ph竧 Qu竛 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={2,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B筩h H� Kim Kh秈 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.003,bBroadcast=1},
	-- {szName="B筩h H� H筺g Li猲 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B筩h H� H� Uy觧 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B筩h H� Ng鋍 B閕 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={9,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B筩h H� H礽 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B筩h H� Y猽 Цi - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B筩h H� Thng Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B筩h H� H� Gi韎 Ch� - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B筩h H� Kh� Gi韎 - T� ch鋘 h� ph竔",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},bBroadcast=1,nRate=0.002},
	-- {szName="Ng� H祅h K� Th筩h",tbProp={6,1,2125,1,0,0},nCount=1,nRate=15},
	-- {szName="Anh H飊g Thi誴",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	-- {szName="Qu� Ho祅g Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	-- {szName="S竧 Th� Gi秐 l� h閜",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	-- {szName="у Ph� B筩h H� Kh玦",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.2},
	-- {szName="у Ph� B筩h H� Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.05},
	-- {szName="у Ph� B筩h H� H礽",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.2},
	-- {szName="у Ph� B筩h H� Y猽 Цi",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.2},
	-- {szName="у Ph� B筩h H� H� Uy觧",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.2},
	-- {szName="у Ph� B筩h H� H筺g Li猲",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.2},
	-- {szName="у Ph� B筩h H� B閕",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.2},
	-- {szName="у Ph� B筩h H� Thng Gi韎",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.2},
	-- {szName="B筩h H� у Ph� H� Gi韎",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.2},
	-- {szName="у Ph� B筩h H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.05},
	-- {szName="Ch﹏ Nguy猲 Кn (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=20, nBindState=-2},
	-- {szName="Ch﹏ Nguy猲 Кn (i)",tbProp={6,1,30229,1,0,0},nCount=1,nRate=7, nBindState=-2},
	-- {szName="H� M筩h Кn",tbProp={6,1,3203,1,0,0},nCount=4,nRate=20},
	-- {szName="B竎h ni猲 th蕋 tinh th秓",tbProp={6,1,1674,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	-- {szName="Thi猲 ni猲 th蕋 tinh th秓",tbProp={6,1,1675,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	-- {szName="V筺 Ni猲 Ng� Th竔 Hoa",tbProp={6,1,2265,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
	-- {szName="Nh蕋 K� C祅 Kh玭 Ph�",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	-- {szName="C祅 Kh玭 Song Tuy謙 B閕",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200,bBroadcast=1},
	-- {szName = "觤 Kinh Nghi謒", nExp=6000000,nRate=21.325},
	-- {szName = "觤 Kinh Nghi謒", nExp=8000000,nRate=6},
	-- {szName = "觤 Kinh Nghi謒", nExp=10000000,nRate=4},
	-- {szName = "觤 Kinh Nghi謒", nExp=20000000,nRate=1},
}

-- C奖励
tbAward["award_c"] = 
{
	-- {szName="C祅 Kh玭 Song Tuy謙 B閕",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200,bBroadcast=1},
	-- {szName="у Ph� B筩h H� Kh玦",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.05},
	-- {szName="у Ph� B筩h H� Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.05},
	-- {szName="у Ph� B筩h H� H礽",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.05},
	-- {szName="у Ph� B筩h H� Y猽 Цi",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.05},
	-- {szName="у Ph� B筩h H� H� Uy觧",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.05},
	-- {szName="у Ph� B筩h H� H筺g Li猲",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.05},
	-- {szName="у Ph� B筩h H� B閕",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.05},
	-- {szName="у Ph� B筩h H� Thng Gi韎",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.05},
	-- {szName="B筩h H� у Ph� H� Gi韎",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.05},
	-- {szName="у Ph� B筩h H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.03},
	-- {szName = "觤 Kinh Nghi謒", nExp=20000000,nRate=50},
	-- {szName = "觤 Kinh Nghi謒", nExp=50000000,nRate=18},
	-- {szName = "觤 Kinh Nghi謒", nExp=100000000,nRate=9.5},
	-- {szName = "觤 Kinh Nghi謒", nExp=200000000,nRate=4},
	-- {szName = "觤 Kinh Nghi謒", nExp=500000000,nRate=2},
	-- {szName="B秓 Rng Kim � Kh玦 ( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=1,bBroadcast=1},
	-- {szName="B秓 Rng Kim � Y ( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B秓 Rng Kim � H礽 ( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B秓 Rng Kim � Y猽 Цi ( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B秓 Rng Kim � H� Uy觧( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B秓 Rng Kim � H筺g Li猲( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B秓 Rng Kim � B閕( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=1,bBroadcast=1},
	-- {szName="B秓 Rng Kim � Thng Gi韎( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B秓 Rng Kim � H� Gi韎( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B秓 Rng Kim � V� Kh�( l鵤 ch鋘 m玭 ph竔)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.5,bBroadcast=1},
	-- {szName="B筩h H� B秓 Th筩h",tbProp={6,1,3184,1,0,0},nCount=1,nRate=3},
	-- {szName="B筩h H� Thi猲 Th筩h",tbProp={6,1,3185,1,0,0},nCount=1,nRate=2},
	-- {szName="B筩h H� Th莕 Th筩h",tbProp={6,1,3186,1,0,0},nCount=1,nRate=1,bBroadcast=1},
	-- {szName="B筩h H� L謓h",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.02,bBroadcast=1},
}

-- D奖励
tbAward["award_d"] = nil

tbAward["award_special"] = 
{
	-- [200]={szName = "觤 Kinh Nghi謒", nExp=300000000,},
	-- [400]={szName = "觤 Kinh Nghi謒", nExp=600000000,},
	-- [800]={szName="Ch﹏ Nguy猲 Кn (trung)",tbProp={6,1,30228,1,0,0},nCount=400,nBindState=-2},
	-- [1200]={szName="H� M筩h Кn",tbProp={6,1,3203,1,0,0},nCount=1000},
	-- [1600]={szName="B筩h H� Th莕 Th筩h",tbProp={6,1,3186,1,0,0},nCount=1,bBroadcast=1},
	-- [2000]={szName="C祅 Kh玭 Song Tuy謙 B閕",tbProp={6,1,2219,1,0,0},nCount = 1,bBroadcast=1,nExpiredTime=43200},	
}
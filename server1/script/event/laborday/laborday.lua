--5.1劳动节活动脚本
--By LiuKuo 2005.4.20
IncludeLib("NPCINFO")

BOSSLASTDATE = tonumber(date("%d")) --上一次黄金Boss被召唤的日期 只记录天
BOSSMAXCOUNT = 3	--每天单服可以召出的黄金Boss的最大数，每台gameserver的上限，共24个
BOSSNOWCOUNT = 0 --当前召唤的黄金Boss数

--以下地图禁用
ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

--黄金Boss	{ID,Name,Series}
GoldenBoss = {{562, "Чo Thanh Ch﹏ Nh﹏", 4},
			  {563, "Gia Lu藅 T� Ly", 3},
			  {564, "Ho祅 Nhan Tuy誸 Y", 3},
			  {565, "an M閏 Du� ", 3},
			  {566, "C� B竎h", 0},
			  {567, "Chung Linh T� ", 2},
			  {568, "H� Linh Phi猽", 2},
			  {582, "Lam Y Y", 1},
			  {583, "M筺h Thng Lng", 3},
			  {739, "Vng T� ", 0},
			  {740, "Huy襫 Gi竎 Чi S� ", 0},
			  {741, "Л阯g B蕋 Nhi詍", 1},
			  {742, "B筩h Doanh Doanh", 1},
			  {743, "Thanh Hi觰 S� Th竔 ", 2},
			  {744, "Y猲 Hi觰 Tr竔", 2},
			  {745, "H� Nh﹏ Ng� ", 3},
			  {746, "Кn T� Nam", 4},
			  {747, "Tuy襫 C� T� ", 4},
			  {748, "H祅 M玭g", 1},
			  {751, "Чi M� H� ", 0}}

--大马虎Boss {ID,Name,Series}
DamahuBoss = {{751, "Чi M� H� ", 0},
			  {752, "Чi M� H� ", 0},
			  {753, "Чi M� H� ", 1},
			  {754, "Чi M� H� ", 1},
			  {755, "Чi M� H� ", 2},
			  {756, "Чi M� H� ", 2},
			  {757, "Чi M� H� ", 3},
			  {758, "Чi M� H� ", 3},
			  {759, "Чi M� H� ", 4},
			  {760, "Чi M� H� ", 4}}
			  
--小Boss	{ID,Name}
NormalBoss = {{511, "Trng T玭g Ch輓h"},
			  {513, "Di謚 Nh� "},
			  {523, "Li評 Thanh Thanh"},
			  {725, "Th駓 t芻 u l躰h"}}
			  
--杀手任务Boss	{ID,Name,面具编号}
MiniBoss = {{851, "B� Hi猽 Tr莕", 79},
			{852, "Ki襲 жnh Thi猲", 80},
			{853, "猽 D辌h o", 81},
			{854, "T﹜ M玭 V� Gi韎", 82},
			{855, "H藆  Kh蕋 Ki誱", 83},
			{856, "鴑g  Ti猽 Phong", 84},
			{857, "Vi猲 Ni謒 T辌h", 85},
			{858, "Tr� Thi猲 M蒼", 86}}

--蓝怪npc	{ID,Name}	同一行不同的id对应不同等级蓝怪的droprate
GoldenNpc = {{859, 859, 859, 859, 860, 861, 862, 863, "B筩h h� "},
			 {864, 864, 864, 864, 865, 866, 867, 868, "H綾 Di謕 H莡 "},
			 {869, 869, 869, 869, 870, 871, 872, 873, "S琻 T芻 "},
			 {874, 874, 874, 874, 875, 876, 877, 878, "Th駓 T芻 "},
			 {879, 879, 879, 879, 880, 881, 882, 883, "Phi Sa "},
			 {884, 884, 884, 884, 885, 886, 887, 888, "L穘h Thng"},
			 {889, 889, 889, 889, 890, 891, 892, 893, "Ng﹏ Nha "},
			 {894, 894, 894, 894, 895, 896, 897, 898, "Th鮝 Phong"},
			 {899, 899, 899, 899, 900, 901, 902, 903, "M玭g C� V� s� "},
			 {904, 904, 904, 904, 905, 906, 907, 908, "Sng o"}}
			 
--普通npc	{ID,Name}
NormalNpc = {{2, "B筩h h� "},
			 {37, "H綾 Di謕 H莡 "},
			 {169, "S琻 T芻 "},
			 {674, "Th駓 T芻 "},
			 {703, "Phi Sa "},
			 {708, "L穘h Thng"},
			 {589, "Ng﹏ Nha "},
			 {713, "Th鮝 Phong"},
			 {673, "M玭g C� V� s� "},
			 {598, "Sng o"}}

function CallBoss( Level, Series )
	local W,X,Y = GetWorldPos();
	local nMapId = W;
	if ( GetFightState() == 0 ) then	--非战斗区禁用
		Msg2Player("Kh玭g � trong tr筺g th竔 chi課 u th� kh玭g th� s� d鬾g");
		return 1
	end
	for i = 249, 318 do	--洗髓岛山洞
		if ( i == nMapId ) then
			Msg2Player("N琲 y kh玭g th� s� d鬾g v藅 ph萴 n祔 ");
			return 1
		end
	end	
	for i = 375, 415 do	--新增宋金战场地图 送信任务地图 比武大会地图
		if ( i == nMapId ) then
			Msg2Player("N琲 y kh玭g th� s� d鬾g v藅 ph萴 n祔 ");
			return 1
		end
	end	
	for i = 1, getn( ForbiddenMap ) do		--特殊地图禁用
		if( ForbiddenMap[i] == nMapId ) then
			Msg2Player("N琲 y kh玭g th� s� d鬾g v藅 ph萴 n祔 ");
			return 1
		end
	end
	local nNowDate = tonumber(date("%d"));
	
	if ( nNowDate == BOSSLASTDATE ) then	--如果上次召唤日期是当天的话
		if ( BOSSNOWCOUNT >= BOSSMAXCOUNT ) then	--大于召唤最大数则不能再召唤黄金Boss
			print("S� Boss Ho祅g Kim b筺 g鋓  qu� gi韎 h筺.")
			nBossRate =  random( 101, 10000);
		else
			nBossRate = random( 1, 10000);
		end
	else	--如果上次召唤日期与当前不是同一天
		BOSSLASTDATE = nNowDate;	--更新最近的日期
		BOSSNOWCOUNT = 0;	--当前召唤数置0
		nBossRate = random( 1, 10000);
	end
	
	if( Level < 90 ) then
		nBossRate =  random( 101, 10000);
	end
	
	if( nBossRate <= 100 ) then		--召唤黄金Boss
		local i = random( 1, getn(GoldenBoss));
		local GoldenBossId = GoldenBoss[i][1];
		local GoldenBossName = GoldenBoss[i][2];
		local GoldenBossSeries = GoldenBoss[i][3];
		if( GoldenBossId == 748 ) then	--韩蒙五行随机
			GoldenBossSeries = random( 0, 4);
		end
		if( GoldenBossId == 751 ) then	--随机大马虎
			i = random( 1, getn(DamahuBoss));
			GoldenBossId = DamahuBoss[i][1];
			GoldenBossName = DamahuBoss[i][2];
			GoldenBossSeries = DamahuBoss[i][3];
		end
		AddNpcEx( GoldenBossId, 95, GoldenBossSeries, SubWorldID2Idx(W), X * 32, (Y +  5)* 32, 1, GoldenBossName, 1 );
		BOSSNOWCOUNT = BOSSNOWCOUNT + 1;	--当前召唤的黄金Boss数加1
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] g鋓 Boss Ho祅g Kim:"..GoldenBossName);
		Msg2Player("B筺 g鋓 Boss Ho祅g Kim:"..GoldenBossName);
	elseif ( nBossRate > 100 and nBossRate <= 300 ) then	--召唤小Boss
		local i = random( 1, getn(NormalBoss));
		local NormalBossId = NormalBoss[i][1];
		local NormalBossName = NormalBoss[i][2];
		AddNpcEx( NormalBossId, 95, Series, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, NormalBossName, 1 );
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] G鋓 m閠 ti觰 boss:"..NormalBossName);
		Msg2Player("B筺 g鋓 m閠 ti觰 Boss:"..NormalBossName);
	elseif ( nBossRate > 300 and nBossRate <= 3000 ) then	--召唤杀手Boss
		local i = floor( Level - 20 ) / 10 + 1;	--根据杀手锏的等级选择召唤的杀手Boss
		local MiniBossId = MiniBoss[i][1];
		local MiniBossName = MiniBoss[i][2];
		local MaskId = MiniBoss[i][3];
	 	AddNpcEx( MiniBossId, Level + 5, Series, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, MiniBossName, 1 );
	 	Msg2Player("B筺 g鋓 m閠 Boss s竧 th�:"..MiniBossName);
	 	AddItem( 0, 11, MaskId, 1, 0, 0 );	--根据召出的Boss给玩家一个面具
	 	Msg2Player("B筺 nh薾 頲 m閠 M苩 n� ");
	elseif ( nBossRate > 3000 and nBossRate <= 6000 ) then	--召唤蓝怪
		local i =  random( 1, getn(GoldenNpc));		--随机选一个蓝怪npc
		local j =  floor( Level - 20 ) / 10 + 1;	--根据杀手锏的等级取对应droprate的蓝怪
		local GoldenNpcId = GoldenNpc[i][j];
		local GoldenNpcName = GoldenNpc[i][9];
		NPCINFO_AddBlueNpc( Series, GoldenNpcId, Level, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, GoldenNpcName, 15 );	--增加蓝怪的脚本，最后一个数是蓝怪模版
		Msg2Player("B筺 g鋓 m閠 boss xanh:"..GoldenNpcName);
	else	--召唤普通怪
		local i = random( 1, getn(NormalNpc));
		local NormalNpcId = NormalNpc[i][1];
		local NormalNpcName = NormalNpc[i][2];
		AddNpcEx( NormalNpcId, Level + 5, Series, SubWorldID2Idx(W), X* 32, (Y +  5) * 32, 1, NormalNpcName, 0 );
		AddNpcEx( NormalNpcId, Level + 5, Series, SubWorldID2Idx(W), X * 32, (Y -  5) * 32, 1, NormalNpcName, 0 );
		Msg2Player("B筺 ch� c� th� g鋓 m閠 s� qu竔 th玭g thng ");
	end
	return 0	
end

-- 文件名　：xmas2007_itemsnowman.lua
-- 创建者　：zhongchaolong
-- 创建时间：2007-12-01 16:05:50

IncludeLib("NPCINFO")
IncludeLib("TASKSYS")
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\event\\xmas07_makesnowman\\head.lua")
Include("\\script\\lib\\pay.lua")

xmas2007_SnowManItem_forbitmap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

xmas2007_tbSnowManBoss = 
{
	--[物品PID] = {名称,bossID}
	[1634] = {szName = "Ho祅g Tuy誸 Nh﹏", nBossId = 1329},
	[1635] = {szName = "T� Tuy誸 Nh﹏", nBossId = 1330},
	[1636] = {szName = "L鬰 Tuy誸 Nh﹏", nBossId = 1331},
}
xmas2007_SnowManItem_tbItemList = 
{
	--[物品PID] = {名称,物品prop，概率%}
	[1634] = {
		{"T� Th駓 Tinh",{4,238,1,1,0,0},6.00},
		{"L鬰 Th駓 Tinh",{4,239,1,1,0,0},5.00},
		{"Lam Th駓 Tinh",{4,240,1,1,0,0},5.00},
		{"Ti猲 Th秓 L� c bi謙",{6,1,1181,1,0,0},5.00},
		{"Ti猲 Th秓 L� ",{6,1,71,1,0,0},10.00},
		{"Ph骳 Duy猲 L� (Чi) ",{6,1,124,1,0,0},30.00},
		{"Tinh H錸g B秓 Th筩h",{4,353,1,1,0,0},5.60},
		{"An bang b╪g tinh th筩h h筺g li猲",{0,164},0.01},
		{"An bang k� huy誸 th筩h gi韎 ch�",{0,167},0.02},
		{"An bang c骳 hoa th筩h ch� ho祅",{0,165},0.02},
		{"An bang 甶襫 ho祅g th筩h ng鋍 b閕",{0,166},0.05},
		{"мnh qu鑓 � sa ph竧 qu竛",{0,160},0.06},
		{"мnh qu鑓 thanh sa trng sam",{0,159},0.06},
		{"мnh qu鑓 ng﹏ t祄 y猽 i",{0,163},0.06},
		{"мnh qu鑓 x輈h quy猲 nhuy詎 ngoa",{0,161},0.06},
		{"мnh qu鑓 t� ng h� uy觧",{0,162},0.06},
		{"Hoa Tuy誸 ",{6,0,1013,1,0,0},8.25},
		{"Qu� m祏 Xanh",{6,0,1012,1,0,0},8.25},
		{"Hoa h錸g",{6,0,20,1,0,0},8.25},
		{"M苩 n� - Tu莕 L閏",{0,11,405,1,0,0},0.60},
		{"M苩 n� - g Gi� N玡l (H錸g ph蕁) ",{0,11,398,1,0,0},0.45},
		{"M苩 n� - g Gi� N玡l (xanh) ",{0,11,397,1,0,0},0.45},
		{"M苩 n� - g Gi� N玡l (tr緉g) ",{0,11,399,1,0,0},0.45},
		{"M苩 n� - g Gi� N玡l (v祅g) ",{0,11,400,1,0,0},0.45},
		{"M苩 n� - g Gi� N玡l () ",{0,11,394,1,0,0},0.45},
		{"M苩 n� - Thi猲 S� Gi竛g Sinh () ",{0,11,395,1,0,0},0.45},
		{"M苩 n� - Thi猲 S� Gi竛g Sinh (xanh) ",{0,11,401,1,0,0},0.45},
		{"M苩 n� - Thi猲 S� Gi竛g Sinh (tr緉g) ",{0,11,403,1,0,0},0.45},
		{"M苩 n� - Thi猲 S� Gi竛g Sinh (v祅g) ",{0,11,404,1,0,0},0.45},
		{"M苩 n� - Thi猲 S� Gi竛g Sinh (H錸g ph蕁) ",{0,11,402,1,0,0},0.45},
		{"M苩 n� - Tinh Linh () ",{0,11,423,1,0,0},0.45},
		{"M苩 n� - Tinh Linh (L鬰) ",{0,11,396,1,0,0},0.45},
		{"M苩 n� - Tinh Linh (v祅g) ",{0,11,424,1,0,0},0.45},
		{"M苩 n� - Tinh Linh (t輒) ",{0,11,422,1,0,0},0.45},
		{"M苩 n� Ho祅g Tuy誸 Nh﹏",{0,11,425,1,0,0},0.45},
		{"M苩 n� T� Tuy誸 Nh﹏",{0,11,426,1,0,0},0.45},
		{"M苩 n� L鬰 Tuy誸 Nh﹏",{0,11,427,1,0,0},0.45},
	},
	[1636] =
	{
		{"Ti猲 Th秓 L� c bi謙",{6,1,1181,1,0,0},0.50},
		{"Ti猲 Th秓 L� ",{6,1,71,1,0,0},9.50},
		{"B竎h Qu� L� ",{6,1,73,1,0,0},10.00},
		{"Thi猲 s琻  B秓 L� ",{6,1,72,1,0,0},10.00},
		{"Ph骳 Duy猲 L� (Чi) ",{6,1,124,1,0,0},5.00},
		{"Ph骳 Duy猲 L� (Trung) ",{6,1,123,1,0,0},10.00},
		{"Qu� Hoa T鰑",{6,1,125,1,0,0},5.00},
		{"M苩 n� - Tu莕 L閏",{0,11,405,1,0,0},12.50},
		{"Hoa Tuy誸 ",{6,0,1013,1,0,0},12.50},
		{"Qu� m祏 Xanh",{6,0,1012,1,0,0},8.25},
		{"Hoa h錸g",{6,0,20,1,0,0},12.50},
	}
}
function main(nItemIndex)
	local _, _, PID			= GetItemProp(nItemIndex);
	local szItemName		= GetItemName(nItemIndex);
	local tbSnowManBossInfo	= xmas2007_tbSnowManBoss[PID];
	local nCurExp			= GetTask(xmas2007_SnowManItem_TSK_ExpLimit);
	local nExp				= 1000000
	local nTotalRate		= 100000;
	local nRate				= floor(nTotalRate*5/100)
	if xmas07_makeSnowMan_isUsePeriod() == 0 then
		Msg2Player("V藅 ph萴  qu� h筺 s� d鬾g, s� b� m蕋 甶.")
		return 0
	end
	if xmas2007_SnowManItem_CheckForbitMap() == 1 then
		return 1
	end
	if IsCharged() == 0 or GetLevel() < 50 then
		Msg2Player("Ngi ch琲 c蕄 50 tr� l猲  n筽 th� m韎 c� th� s� d鬾g v藅 ph萴 n祔.")
		return 1;
	end
	if nCurExp >= xmas2007_SnowManItem_ExpMax then
		Msg2Player("S� d鬾g ngi Tuy誸  vt gi韎 h筺 甶觤 kinh nghi謒, kh玭g th� s� d鬾g n鱝.")
		return 1;
	else
		AddOwnExp(nExp);
		SetTask(xmas2007_SnowManItem_TSK_ExpLimit,nCurExp+nExp);
	end
	
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tUse a %s.",xmas07_makeSnowMan_ActName,
            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
	if random(1,nTotalRate) <= nRate then
		local W,X,Y=GetWorldPos()
		local nSeries = random(0,4)
		AddNpcEx(tbSnowManBossInfo.nBossId, 90, nSeries, SubWorld, X*32, Y*32,1, tbSnowManBossInfo.szName, 2)
		
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tcall a boss %s.",xmas07_makeSnowMan_ActName,
            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
	end
	xmas2007_SnowManItem_GiveRandomItem(xmas2007_SnowManItem_tbItemList[PID])
	return 0;
end



function xmas2007_SnowManItem_CheckForbitMap()
	local W,X,Y=GetWorldPos()
	local nMapId = W;
	local i;
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

	for i = 1, getn( xmas2007_SnowManItem_forbitmap ) do		--特殊地图禁用
		if( xmas2007_SnowManItem_forbitmap[i] == nMapId ) then
			Msg2Player("N琲 y kh玭g th� s� d鬾g v藅 ph萴 n祔 ");
			return 1
		end
	end
	
	if (CheckAllMaps(nMapId) == 1) then
		Msg2Player("Tri謚 h錳 l謓h b礽 kh玭g th� s� d鬾g t筰 khu v鵦 c th� n祔.");
		return 1
	end
	return 0		
end
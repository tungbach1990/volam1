Include("\\script\\lib\\basic.lua");
Include("\\script\\lib\\file.lua")
Include("\\script\\config.lua")
IncludeLib("LEAGUE")
QY_GOLDBOSS_DPOS_INFO = {
					[739]	= {"V��ng T� ",		739, 	95,	341,	0,	"\\settings\\maps\\������\\Į����ԭ\\wangzuoboss.txt"},
					[740]	= {"Huy�n Gi�c ��i S� ", 	740, 	95,	322, 	0, 	"\\settings\\maps\\������\\����ɽ´\\xuanjuedashiboss.txt"},
					[741]	= {"���ng B�t Nhi�m", 	741, 	95, 336, 	1, 	"\\settings\\maps\\��ԭ����\\������ϰ�\\herenwoboss.txt"},
					[742]	= {"B�ch Doanh Doanh", 	742, 	95, 336,	1, 	"\\settings\\maps\\��ԭ����\\����ɱ���\\baiyingyingboss.txt"},
					[743]	= {"Thanh Tuy�t S� Th�i", 	743, 	95, 341, 	2, 	"\\settings\\maps\\������\\Į����ԭ\\qingxiaoshitaiboss.txt"},
					[744]	= {"Y�n Hi�u Tr�i", 	744, 	95, 336, 	2, 	"\\settings\\maps\\��ԭ����\\����ɱ���\\yanxiaoqianboss.txt"},
					[745]	= {"H� Nh�n Ng� ", 	745, 	95, 321, 	3, 	"\\settings\\maps\\������\\����ɽ´\\xuanjiziboss.txt"},
					[746]	= {"��n T� Nam", 	746, 	95, 341, 	4, 	"\\settings\\maps\\������\\Į����ԭ\\shansinanboss.txt"},
					[747]	= {"Tuy�n C� T� ", 	747, 	95, 340, 	4, 	"\\settings\\maps\\��������\\Ī�߿�\\tangburanboss.txt"},
					[748]	= {"H�n M�ng", 		748, 	95, 342, 	1, 	"\\settings\\maps\\������\\��ɽ��\\hanmengboss.txt"},
					[565]	= {"�oan M�c Du� ",	565, 	95, 227, 	3,	"\\settings\\maps\\��������\\ɳĮ�Թ�\\duanmuruiboss.txt"},
					[582]	= {"Lam Y Y", 	582, 	95, 181, 	1,	"\\settings\\maps\\������\\��ˮ���Թ�\\lanyiyiboss.txt"},
					[567]	= {"Chung Linh T� ", 	567, 	95, 181, 	2,	"\\settings\\maps\\������\\��ˮ���Թ�\\zhonglingxiuboss.txt"},
					[583]	= {"M�nh Th��ng L��ng", 	583, 	95, 341, 	3,	"\\settings\\maps\\������\\Į����ԭ\\wangzuoboss.txt"},
					[1365]	= {"Huy�n Nan ��i S�", 	1365, 	95, 342, 	0, 	"\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
					[1368]	= {"Thanh Li�n T�", 	1368, 	95, 875, 	4,	"\\settings\\maps\\��������\\ɳĮ�Թ�\\qinglianziboss.txt"},
					[1366]	= {"���ng Phi Y�n", 	1366, 	95, 342, 	1, 	"\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
					[1367]	= {"T� ��i Nh�c", 	1367,	95, 342,	4, 	"\\settings\\maps\\������\\��ɽ��\\big_goldboss.txt"},
}
---------------------------------------------------------------------------------------------
function QY_MakeBoss_RandInCity(bossid, bosslvl, series, mapid, posx, posy, bossname, str)
	local mapidx = SubWorldID2Idx(mapid)
	if (mapidx < 0) then
		return
	end
	local npcindex = AddNpcEx(bossid, bosslvl, series, mapidx, posx*32, posy*32, 1, bossname, 1)
	if (npcindex > 0) then
		SetNpcDeathScript(npcindex, "\\script\\missions\\boss\\bossdeath.lua");
		WriteLog(date("%H:%M")..","..bossid..","..bosslvl..","..series..","..SubWorldIdx2ID(mapidx)..","..posx..","..posy..","..bossname)
		AddGlobalNews(str)

		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour == 19) then
			-- �ƽ�BOSS����
			SetNpcParam(npcindex, 1, 1); -- �Ƿ���19:30�Ļƽ�BOSS
			RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "AddGoldBossCount", 0);
		end
	end
	
end

function CallBossDown_Outter(bossid, str)
	local mapid = QY_GOLDBOSS_DPOS_INFO[bossid][4]
	mapidx = SubWorldID2Idx(mapid)
	if (mapidx < 0) then
		return
	end
	local bossname = QY_GOLDBOSS_DPOS_INFO[bossid][1]
	local bosslvl = QY_GOLDBOSS_DPOS_INFO[bossid][3]
	local series = QY_GOLDBOSS_DPOS_INFO[bossid][5]
	local filepos = QY_GOLDBOSS_DPOS_INFO[bossid][6]
	posx, posy = getadata(filepos)
	local npcindex = AddNpcEx(bossid, bosslvl, series, mapidx, posx*32, posy*32, 1, bossname, 1)
	SetNpcDeathScript(npcindex, "\\script\\missions\\boss\\bossdeath.lua");
	AddGlobalNews(str)
	WriteLog(date("%H:%M")..","..bossid..","..bosslvl..","..series..","..SubWorldIdx2ID(mapidx)..","..posx..","..posy..","..bossname)
	local nHour = tonumber(date("%H"));
	if (nHour == 19 and npcindex > 0) then
		-- �ƽ�BOSS����
		SetNpcParam(npcindex, 1, 1); -- �Ƿ���19:30�Ļƽ�BOSS
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "AddGoldBossCount", 0);
	end
end

QY_NEWBOSS_FIXURE_INFO = {
	[1] = {
					---Name					ID,LEVEL,SERVERS,MAPID,X,Y,	NORMALX,NORMALY,SZMSG
					{"����Ӣ������",	1194,95,0,	181,1635*32,3077*32,	1632*32,3065*32,"Cao th� Thi�u L�m - Lo�n Th� Anh H�o - xu�t hi�n t�i L��ng Th�y ��ng!"},
					{"׷����ʿ",			1195,95,1,	319,1671*32,3761*32,	1666*32,3747*32,"Cao th� ���ng M�n - Truy M�nh C� S� - xu�t hi�n t�i L�m Du Quan!"},
					{"��������",			1198,95,2,	167,1571*32,3107*32,	1559*32,3116*32,"Cao th� Th�y Y�n -H� �i�p B�i B�i - xu�t hi�n t�i �i�m Th��ng S�n!"},
					{"��¥��������",1199,95,3,	123,1621*32,3329*32,	1620*32,3343*32,"Cao th� C�i Bang - Ng�c H�i V�ng Ng� - xu�t hi�n t�i L�o H� ��ng!"},
					{"�ŵ���",				1201,95,4,	 90,1789*32,3391*32,	1789*32,3376*32,"Cao th� V� �ang - C� ��o Phong - xu�t hi�n t�i Ph�c Ng�u S�n!"},
									},
	[2] = {
					{"�ǻ��Ů��",		1202,95,4,	 41,2042*32,2911*32,	2037*32,2896*32,"Cao th� C�n Lu�n - Nh� H�a N� Nh�n - xu�t hi�n t�i Ph�c Ng�u S�n T�y!"},
					{"�����㡩�����̡�",1200,95,3,  21,2527*32,4197*32,	2518*32,4205*32,"Cao th� Thi�n Nh�n - Hoa Ph�n Thanh H��ng - xu�t hi�n t�i Thanh Th�nh S�n!"},
					{"��սѪ",				1197,95,2,	  9,2288*32,5762*32,	2278*32,5747*32,"Cao th� Nga Mi - Nga Chi�n Huy�t - xu�t hi�n t�i Tr��ng Giang Nguy�n ��u!"},
					{"����Ҳ�������",1196,95,1,	 93,1626*32,3187*32,	1620*32,3181*32,"Cao th� Ng� ��c - Th�n Ti�n - xu�t hi�n t�i Ti�n C�c ��ng!"},
					{"%����%",				1193,95,0,	 70,1798*32,3153*32,	1781*32,3153*32,"Cao th� Thi�n V��ng - Thi�n V��ng Qu�n Anh - xu�t hi�n t�i V� Di S�n!"},
									},

}
QY_NORMALBOSS_INFO	=
{
	[1]	= {n_level = 90, 	n_series = 1,	n_npcid = 523,	tb_coords = {{SubWorldID2Idx(4),1662,3171,"Kim Quang ��ng"}, {SubWorldID2Idx(5),1704,3513,"Kinh Ho�ng ��ng"},{SubWorldID2Idx(6),1424,3248,"T�a V�n ��ng"}, {SubWorldID2Idx(4),1580,3111,"Kim Quang ��ng"},  {SubWorldID2Idx(5),1547,3332,"Kinh Ho�ng ��ng"}, {SubWorldID2Idx(6),1584,3240,"T�a V�n ��ng"}, {SubWorldID2Idx(6),1670,3259,"T�a V�n ��ng"}, {SubWorldID2Idx(22),1897,3161,"B�ch V�n ��ng"}, {SubWorldID2Idx(22),1795,3235,"B�ch V�n ��ng"}},	sz_name = "Li�u Thanh Thanh"},
	[2]	= {n_level = 90, 	n_series = 2, 	n_npcid = 513,	tb_coords = {{SubWorldID2Idx(23),1884,3144,"Th�n Ti�n ��ng"}, {SubWorldID2Idx(23),1806,3228,"Th�n Ti�n ��ng"}, {SubWorldID2Idx(42),1674,3110,"Thi�n T�m ��ng"}, {SubWorldID2Idx(71),1640,3062,"B�ch Th�y ��ng"}, {SubWorldID2Idx(71),1612,3153,"B�ch Th�y ��ng"},  {SubWorldID2Idx(73),1528,3198,"Ph�c L�u ��ng"}, {SubWorldID2Idx(42),1568,2986,"Thi�n T�m ��ng"}, {SubWorldID2Idx(73),1503,3083,"Ph�c L�u ��ng"}},	sz_name = "Di�u Nh� "},
	[3]	= {n_level = 90, 	n_series = 4, 	n_npcid = 511,	tb_coords = {{SubWorldID2Idx(194),1602,3363,"Ng�c Hoa ��ng"}, {SubWorldID2Idx(91),1612,2972,"M� cung K� Qu�n ��ng"}, {SubWorldID2Idx(94),1548,3193,"Linh C�c ��ng"}, {SubWorldID2Idx(94),1676,3205,"Linh C�c ��ng"},{SubWorldID2Idx(91),1567,2762,"M� cung K� Qu�n ��ng"}, {SubWorldID2Idx(180),1512,3024,"Long Cung ��ng"}, {SubWorldID2Idx(180),1543,3173,"Long Cung ��ng"}, {SubWorldID2Idx(182),2196,3505,"Nghi�t Long ��ng"}, {SubWorldID2Idx(182),1679,3234,"Nghi�t Long ��ng"}, {SubWorldID2Idx(194),1720,3127,"Ng�c Hoa ��ng"}},	sz_name = "Tr��ng T�ng Ch�nh"},

};



function CallBossDown_Fixure()
	for i = 1, getn(QY_NORMALBOSS_INFO) do
		local nlvl, nseries, nid, tb_coords, szname	= 	QY_NORMALBOSS_INFO[i].n_level, QY_NORMALBOSS_INFO[i].n_series,
																QY_NORMALBOSS_INFO[i].n_npcid,
																QY_NORMALBOSS_INFO[i].tb_coords, QY_NORMALBOSS_INFO[i].sz_name;
		--local nworldidx = SubWorldID2Idx(nmap);
		 
		--if (nworldidx >= 0) then
			local nIdx		= random(getn(tb_coords));
			local nworldidx, nx, ny, nmaps	= tb_coords[nIdx][1], tb_coords[nIdx][2] * 32, tb_coords[nIdx][3]  * 32, tb_coords[nIdx][4];
			--local nx, ny	= tb_coords[nIdx][1] * 8 * 32, tb_coords[nIdx][2] * 16 * 32;
		if (nworldidx >= 0) then
			local nNpcIndex = AddNpcEx(nid, nlvl, nseries, nworldidx, nx, ny, 1, szname, 1);
			SetNpcScript(nNpcIndex,"\\script\\missions\\boss\\bosstieu.lua")
			SetNpcTimer(nNpcIndex, 60*60*18);
			WriteBossLog(format("%s:%s,%s,%d,%d", "BOSS ti�u Ho�ng Kim", szname, nmaps, nx, ny));
			
			local szNews = format("Boss ti�u Ho�ng Kim:<color=yellow>" ..szname.. "<color> �� xu�t hi�n t�i <color=green>"..nmaps.."<color>")
	        LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
			
		end
	end
	SubWorld = nOldSubWorld;
end;

function WriteBossLog(szLog)
	WriteLog("[CALLBOSS FIXURE]\t"..GetLocalDate("%Y-%m-%d %H:%M:%S\t")..szLog);
end;

------------ ���Ƿָ���----------------------------------------------
function getadata(file)
	local totalcount = GetTabFileHeight(file);
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

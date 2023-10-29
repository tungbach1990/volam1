IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")

-- ��ͨBOSS��: NPCID��BOSS�ȼ���BOSS���С�BOSS���ơ�BOSS���õ�ģ�棨��ʵ�����ã�
BattleBoss_tbCommonBoss = 
{
	{1465,	95,	0,	" %s qu�c t��ng qu�n", "V��ng T� "},
	{1466,	95,	1,	" %s qu�c t��ng qu�n", "���ng Phi Y�n"},
	{1467,	95,	1,	" %s qu�c t��ng qu�n", "B�ch Doanh Doanh"},
	{1468,	95,	2,	" %s qu�c t��ng qu�n", "Thanh Tuy�t S� Th�i"},
	{1469,	95,	2,	" %s qu�c t��ng qu�n", "Chung Linh T� "},
	{1470,	95,	3,	" %s qu�c t��ng qu�n", "H� Nh�n Ng� "},
	{1471,	95,	3,	" %s qu�c t��ng qu�n", "�oan M�c Du� "},
	{1472,	95,	4,	" %s qu�c t��ng qu�n", "Thanh Li�n T� "},
	{1473,	95,	4,	" %s qu�c t��ng qu�n", "��o Thanh Ch�n Nh�n"},
}

-- BigBOSS��: NPCID��BOSS�ȼ���BOSS����
BattleBoss_tbBigBoss = 
{
	{1474, 95, "T�ng qu�c ��i t��ng qu�n"},
	{1475, 95, "Kim qu�c ��i t��ng qu�n"},
}

-- ˫����������9����ͨBOSS
function BattleBoss_AddAllCommonBoss()
	local nBossID = 0;
	for nBossPosID = 1,9 do
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 1, nBossPosID);
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 2, nBossPosID);
	end
	Msg2MSAll(MISSIONID, "<color=yellow>T�ng Kim chi�n b�o: M�i b�n T�ng Kim s� c� ra 9 v� t��ng qu�n c�a t�ng ph�i �� ti�p vi�n!");
end

-- ˫����������·����3����ͨBOSS
function BattleBoss_AddSomeCommonBoss()
	local nBossID = 0;
	for nBossPosID = 4,6 do
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 1, nBossPosID);
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 2, nBossPosID);
	end
	Msg2MSAll(MISSIONID, "<color=yellow>T�ng Kim chi�n b�o: M�i b�n T�ng Kim s� c� ra 3 v� t��ng qu�n c�a t�ng ph�i �� ti�p vi�n!");
end

-- ָ����Ӫ���Ӵ�BOSS
function BattleBoss_AddBigBoss(nBossCamp)
	
	if (nBossCamp == 1) then
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>T�ng Kim chi�n b�o: C�p b�o! T�ng qu�n ��i t��ng qu�n �� xu�t hi�n!")
	else
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>T�ng Kim chi�n b�o: C�p b�o! Kim qu�n ��i t��ng qu�n �� xu�t hi�n!")
	end
	
	BattleBoss_AddBoss(0, nBossCamp, 0);
end

-- ��ս���м���Boss	
-- nBossID: 	Boss��ID 0ΪBigBoss������0Ϊ��ͨBoss
-- nBossCamp:	Boss����Ӫ 1Ϊ�� 2Ϊ��
-- nBossPosID:	Boss��λ��ID 0Ϊ��Ӫ��1-9 �ֱ�ΪӪ�����������·
function BattleBoss_AddBoss(nBossID, nBossCamp, nBossPosID)
	
	if nBossID < 0 or nBossID > getn(BattleBoss_tbCommonBoss) then
		return
	end
	if nBossPosID < 0 or nBossPosID > 9 then
		return
	end
	
	local szCampName;
	local szArea    = "Area_";
	local szMapFile = GetMapInfoFile(BT_GetGameData(GAME_MAPID));
	
	if nBossCamp == 1 then
		szArea = szArea..BT_GetGameData(GAME_CAMP1AREA);
		szCampName = "T�ng";
	elseif nBossCamp == 2 then
		szArea = szArea..BT_GetGameData(GAME_CAMP2AREA);
		szCampName = "Kim";
	else
		return		
	end
	
	-- ȷ��BOSS������
	local szBossPosFile = GetIniFileData(szMapFile, szArea, "bosspos");
	local nX = GetTabFileData(szBossPosFile, nBossPosID + 2, 1);
	local nY = GetTabFileData(szBossPosFile, nBossPosID + 2, 2);
	
	-- ȷ��BOSS��NPC����
	local nNpcID, nNpcLevel, nNpcSeries, szNpcName;
	
	if nBossID == 0 then
		-- ��BOSS
		nNpcID     = BattleBoss_tbBigBoss[nBossCamp][1];
		nNpcLevel  = BattleBoss_tbBigBoss[nBossCamp][2];
		nNpcSeries = random(1,5)-1;
		szNpcName  = BattleBoss_tbBigBoss[nBossCamp][3];
	else
		-- ��ͨBOSS
		nNpcID     = BattleBoss_tbCommonBoss[nBossID][1];
		nNpcLevel  = BattleBoss_tbCommonBoss[nBossID][2];
		nNpcSeries = BattleBoss_tbCommonBoss[nBossID][3];
		szNpcName  = format(BattleBoss_tbCommonBoss[nBossID][4], szCampName);	
	end
	
	-- ����BOSS
	local nNpcIdx = AddNpcEx(nNpcID, nNpcLevel, nNpcSeries, SubWorld, nX*32, nY*32, 1, szNpcName, 1);
	if nNpcIdx > 0 then
		SetNpcCurCamp(nNpcIdx, nBossCamp);
		SetNpcDeathScript(nNpcIdx, "\\script\\battles\\boss\\bossset.lua");
	end
	
end

-- BOSS����
function OnDeath(nNpcIndex)
	
	if (GetMissionV(MS_STATE) ~= 2) then
		return
	end
	
	-- �������������Npc��ͳ������
	if (PlayerIndex == nil or PlayerIndex == 0) then
		return
	end
	
	-- ȷ��ɱ����BOSS����� 0:���� 1:��ͨBOSS 2:BigBoss
	local nDeathBossType = 0;
	
	for i = 1,getn(BattleBoss_tbCommonBoss) do
		if GetNpcSettingIdx(nNpcIndex) == BattleBoss_tbCommonBoss[i][1] then
			nDeathBossType = 1;
			break
		end
	end
	
	for i = 1,getn(BattleBoss_tbBigBoss) do
		if GetNpcSettingIdx(nNpcIndex) == BattleBoss_tbBigBoss[i][1] then
			nDeathBossType = 2;
			break
		end
	end
	
	local nPointAward = 0;
	if nDeathBossType == 1 then
		-- ��ͨBOSS	 
		nPointAward = 2000;
		
		if (GetCurCamp() == 1) then
			local nNewKillBossCount = GetMissionV(MS_KILLBOSSCOUNT_S) + 1;
			SetMissionV(MS_KILLBOSSCOUNT_S, nNewKillBossCount);
			Msg2MSAll(MISSIONID, format("<color=yellow>B�o c�o chi�n d�ch: T�ng binh %s v�a l�y th� c�p t��ng qu�n phe Kim! S� l��ng t��ng qu�n c�a phe Kim b� phe T�ng s�t h�i l� %d.", GetName(), nNewKillBossCount));
		else
			local nNewKillBossCount = GetMissionV(MS_KILLBOSSCOUNT_J) + 1;
			SetMissionV(MS_KILLBOSSCOUNT_J, nNewKillBossCount);
			Msg2MSAll(MISSIONID, format("<color=yellow>B�o c�o chi�n d�ch: Kim binh %s v�a l�y th� c�p t��ng qu�n phe T�ng! S� l��ng t��ng qu�n c�a phe T�ng b� phe Kim s�t h�i l� %d.", GetName(), nNewKillBossCount));
		end
		 
	elseif nDeathBossType == 2 then
		-- ��BOSS
		nPointAward = 4000;
		
		if GetMissionV(MS_MARSHALDEATH) == 0 then
			SetMissionV(MS_MARSHALDEATH, GetCurCamp());
		else
			SetMissionV(MS_MARSHALDEATH, 0);
		end	
		
		if (GetCurCamp() == 1) then
			Msg2MSAll(MISSIONID, format("<color=yellow>B�o c�o chi�n d�ch: T�ng binh %s v�a m�i ti�u di�t ��i t��ng qu�n phe Kim!!!", GetName()));
		else
			Msg2MSAll(MISSIONID, format("<color=yellow>B�o c�o chi�n d�ch: Kim binh %s v�a m�i ti�u di�t ��i t��ng qu�n phe T�ng!!!", GetName()));
		end
		
	else 
		 return
	end
	
	bt_addtotalpoint(nPointAward);
	mar_addmissionpoint(nPointAward);
	Msg2Player(format("�� t�ng th��ng cho chi�n c�ng gi�t BOSS, c�c h� thu ���c ph�n th��ng %d �i�m t�ch l�y!", nPointAward));
	BT_SetData(PL_KILLNPC, BT_GetData(PL_KILLNPC) + 1);
	BT_SortLadder();
	BT_BroadSelf();
	return
end


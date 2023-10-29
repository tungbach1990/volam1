Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function CreateNpcTimer(nSubWorldIdx)
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);
	local tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[3];
	local tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[3];

	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- ������ͼ
	if tbMap == nil then
		return 0;
	end

	if tbMap.nGameState == 0 or tbMap.nGameState == 1 then
		return 0;
	end

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[1].nNpcId,
		tbNpcInfo[1].nLevel,
		random(0, 4),
		nSubWorldIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[1].szName,
		tbNpcInfo[1].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- ���������ű�
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_middlepillar.lua");
	end

	-- ˢ��Ϣ
	Msg2Map(tbMap.nMapId, "C� R�ng xu�t hi�n! H�y mau ch�ng tranh �o�t!");

	return 0;
end

-- nNpcIndexΪ����npc���������������ֱ��ʹ��PlayerIndex
function OnDeath(nNpcIndex)
	local nX, nY, nSubWorldIdx = GetNpcPos(nNpcIndex);
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);

	local nNpcCamp = GetTmpCamp(nNpcIndex);
	local nOppNpcCamp = 0;
	if nNpcCamp == 1 then
		nOppNpcCamp = 2;
	else
		nOppNpcCamp = 1;
	end

	-- �������
	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- ������ͼ
	if not tbMap then
		print(">> Error : tbMap is invalid!");
		return nil;
	end

	-- �����NPC���������ﴦ��
	if not PlayerIndex or PlayerIndex <= 0 then
		tbMap.tbCampScore[nNpcCamp] = tbMap.tbCampScore[nNpcCamp] + DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;
		tbMap:NotifyCurrentVSScore();

		local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
		if nJudgeResult <= 0 then									   -- ��δ���ж�ʤ������
			AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);		  -- 60�봴����NPC
			return nil;
		end

		tbMap:ProcessWhenFinish(nJudgeResult);
		return nil;
	end

	local szKillerName = GetName();									 -- ��������
	if not szKillerName then
		print(">> Error : szKillerName is invalid!");
		return nil;
	end

	local nKillerIndex = SearchPlayer(szKillerName);
	if not nKillerIndex then
		print(">> Error : nKillerIndex is invalid!");
		return nil;
	end

	-- ������ͳ�� 
	local tbKiller = tbMap:GetPlayer(szKillerName);
	if tbKiller then
		tbKiller.nKillPillarNum = tbKiller.nKillPillarNum + 1;					  -- �ܶ�����
		tbKiller.nKillMiddlePillarNum = tbKiller.nKillMiddlePillarNum + 1;		  -- ��ȡ������
		tbKiller.nScoreGetForCamp = tbKiller.nScoreGetForCamp + DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;
	end

	local nKillerCamp  = tbMap:GetCampByName(szKillerName);			 -- ������Ӫ

	local nOpponentCamp = -1;
	if nKillerCamp == 1 then
		nOpponentCamp = 2;
	else
		nOpponentCamp = 1;
	end

	-- �߻�˵��ɱ�ֵ���Ӫ�÷֣��������Ӫ���۷�
	tbMap.tbCampScore[nKillerCamp]   = tbMap.tbCampScore[nKillerCamp] + DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;

--	tbMap.tbCampScore[nOpponentCamp] = tbMap.tbCampScore[nOpponentCamp] - DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;
--	if  tbMap.tbCampScore[nOpponentCamp] < 0 then
--		 tbMap.tbCampScore[nOpponentCamp] = 0;
--	end

	tbMap:NotifyCurrentVSScore();

	-- ���������
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_SCORE_TOTAL, tbKiller.nScoreGetForCamp); -- Ϊ������ȡ�Ļ���
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_KILL_MIDDLE_PILLAR_NUM, tbKiller.nKillMiddlePillarNum); -- ��ȡ˧������
	-- ˢ��Ϣ
	local strMsg = "Phe %s, %s �� c��p ���c c� R�ng. Phe %s ���c %d �i�m, t�ng �i�m %d �i�m";
	local strVSMsg = format("T� s� �i�m T�ng Kim hi�n t�i c�a 2 b�n l�: %d:%d", tbMap.tbCampScore[1], tbMap.tbCampScore[2]);
	strMsg = format(
		strMsg,
		DungeonGlobalData.tbCampName[nKillerCamp],
		szKillerName,
		DungeonGlobalData.tbCampName[nKillerCamp],
		DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR,
		tbMap.tbCampScore[nKillerCamp]
	);
	Msg2Map(tbMap.nMapId, strMsg);
	Msg2Map(tbMap.nMapId, strVSMsg);

	-- �����ж�ʤ��
	local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
	if nJudgeResult <= 0 then										   -- ��δ���ж�ʤ������
		AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);			  -- 60�봴����NPC
		return nil;
	end

	tbMap:ProcessWhenFinish(nJudgeResult);
end




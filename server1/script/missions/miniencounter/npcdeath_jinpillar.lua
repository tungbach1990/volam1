Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function CreateNpcTimer(nSubWorldIdx)
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);

	local tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[2];
	local tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[2];
	local nPillarLv = 0;

	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- ������ͼ
	if tbMap == nil then
		return 0;
	end

	if tbMap.nGameState == 0 or tbMap.nGameState == 1 then
		return 0;
	end

	nPillarLv	   = tbMap.nJinPillarLv + 1;
	local nTotalLv  = getn(tbNpcInfo);
	if nPillarLv > nTotalLv then
		nPillarLv = nTotalLv;
	end
	tbMap.nJinPillarLv = nPillarLv;

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[nPillarLv].nNpcId,
		tbNpcInfo[nPillarLv].nLevel,
		random(0, 4),
		nSubWorldIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[nPillarLv].szName,
		tbNpcInfo[nPillarLv].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- ������Ӫ
		SetTmpCamp(2, nNpcIdx);

		-- ���������ű�
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_jinpillar.lua");
	end

	-- ˢ��Ϣ
	tbMap:Msg2Camp(2, "Th�ng so�i phe ta �� d�ng l�i c� Nguy�n So�i, h�i c�c chi�n s� h�y mau ch�ng ��n b�o v�!");
	tbMap:Msg2Camp(1, "Th�ng so�i phe Kim �� d�ng l�i c� Nguy�n So�i, h�i c�c chi�n s� h�y mau ch�ng c��p c� tr�m t��ng!");
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
	local tbMap  = EncounterMapManager.tbMapList[nMapId];		   -- ������ͼ
	if not tbMap then
		print(">> Error : tbMap is invalid!");
		return nil;
	end

	-- �����NPC���������ﴦ��
	if not PlayerIndex or PlayerIndex <= 0 then
		tbMap.tbCampScore[1] = tbMap.tbCampScore[1] + 1;
		tbMap.tbCampScore[2] = tbMap.tbCampScore[2] - 1;
		tbMap:NotifyCurrentVSScore();

		local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
		if nJudgeResult <= 0 then									   -- ��δ���ж�ʤ������
			AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);		  -- 60�봴����NPC
			return nil;
		end

		tbMap:ProcessWhenFinish(nJudgeResult);
		return nil;
	end

	-- ������ͳ��
	local szRoleName = GetName();
	local tbKiller   = tbMap:GetPlayer(szRoleName);
	if tbKiller then
		tbKiller.nKillPillarNum = tbKiller.nKillPillarNum + 1;
		tbKiller.nKillEnemyPillarNum = tbKiller.nKillEnemyPillarNum + 1;
		tbKiller.nScoreGetForCamp = tbKiller.nScoreGetForCamp + 1;
	end

	-- �η���Ӫ����+1(�߻�˵���÷�)
	tbMap.tbCampScore[1] = tbMap.tbCampScore[1] + 1;
	-- ����Ӫ����-1
	tbMap.tbCampScore[2] = tbMap.tbCampScore[2] - 1;
	if  tbMap.tbCampScore[2] < 0 then
		 tbMap.tbCampScore[2] = 0;
	end

	tbMap:NotifyCurrentVSScore();

	-- ���������
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_SCORE_TOTAL, tbKiller.nScoreGetForCamp); -- Ϊ������ȡ�Ļ���
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_KILL_ENEMY_PILLAR_NUM, tbKiller.nKillEnemyPillarNum); -- ���˧����

	-- ˢ��Ϣ
	local strMsg = "Phe T�ng l�c l��ng h�ng m�nh, �� tr�m %s c� chi�n c�a phe Kim, phe T�ng ���c 1 �i�m, phe Kim m�t 1 �i�m.";
	--local strMsg = "�η���������%sն���˽𷽵�ս�죬��ʧȥ1�֡�";
	local strVSMsg = format("T� s� �i�m T�ng Kim hi�n t�i c�a 2 b�n l�: %d:%d", tbMap.tbCampScore[1], tbMap.tbCampScore[2]);
	strMsg = format(strMsg, szRoleName);
	Msg2Map(tbMap.nMapId, strMsg);
	Msg2Map(tbMap.nMapId, strVSMsg);

	-- �����ж�ʤ��
	local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
	if nJudgeResult <= 0 then									   -- ��δ���ж�ʤ������
		AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);		  -- 60�봴����NPC
		return nil;
	end

	tbMap:ProcessWhenFinish(nJudgeResult);
end


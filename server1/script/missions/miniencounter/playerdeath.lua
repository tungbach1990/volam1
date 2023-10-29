Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function OnDeath(nNpcIndex)
	local nMapId = GetWorldPos();									   -- ��ͼID
	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- ������ͼ

	-- ��NPC�����ɱ����������߼�
	local szPlayerName = GetName();									 -- ����������
	local nPlayerCamp  = tbMap:GetCampByName(szPlayerName);			 -- ��������Ӫ
	local tbPlayer	 = tbMap:GetPlayerByCamp(nPlayerCamp, szPlayerName);
	local nX, nY	   = tbMap:GetNewWorldPos(nPlayerCamp);
	SetTempRevPos(nMapId, nX * 32, nY * 32);							-- ������ʱ������

	-- ����ʱ�����
	local nCurrentTime = GetCurrentTime();
	if nCurrentTime > tbPlayer.nLastDeadTime then
		tbPlayer.nLastDeadTime = nCurrentTime;
	end

	-- �����ɱ��������߼�
	local nKillerIndex = NpcIdx2PIdx(nNpcIndex);						-- ��������
	if nKillerIndex <= 0 then
		return nil;
	end

	local szKillerName = CallPlayerFunction(nKillerIndex, GetName);	 -- ��������
	local nKillerCamp  = tbMap:GetCampByName(szKillerName);			 -- ������Ӫ
	local tbKiller	 = tbMap:GetPlayerByCamp(nKillerCamp, szKillerName);

	-- ��ս����Ϣ
	local strMsg = format(
		"[%s]%s k�ch s�t [%s]%s r�i!",
		tbKiller:GetTitleString(),
		szKillerName,
		tbPlayer:GetTitleString(),
		szPlayerName
	);
	Msg2Map(tbMap.nMapId, strMsg);

	-- �������
	if nKillerCamp ~= nPlayerCamp then
		-- ɱ��������
		tbKiller.nKillPlayerNum = tbKiller.nKillPlayerNum + 1;

		-- ����������
		local nValidCombo = DungeonGlobalData:GetValidCombo(tbKiller.nTitleLv, tbPlayer.nTitleLv);

		tbPlayer.nComboTimes = 0;
		tbPlayer.nCurMaxKillComboNum = 0;
		tbKiller.nComboTimes = tbKiller.nComboTimes + nValidCombo;
		tbKiller.nCurMaxKillComboNum = tbKiller.nCurMaxKillComboNum + nValidCombo;

		if tbPlayer.nMaxKillComboNum < tbPlayer.nCurMaxKillComboNum then
			tbPlayer.nMaxKillComboNum = tbPlayer.nCurMaxKillComboNum;
		end

		if tbKiller.nMaxKillComboNum < tbKiller.nCurMaxKillComboNum then
			tbKiller.nMaxKillComboNum = tbKiller.nCurMaxKillComboNum;
		end

		-- �ӷֿ۷ּ���
		local nIncreasePoint = DungeonGlobalData:GetIncreaseScorePoint(tbKiller.nTitleLv, tbPlayer.nTitleLv);
		local nDecreasePoint = DungeonGlobalData:GetDecreaseScorePoint(tbKiller.nTitleLv, tbPlayer.nTitleLv);

		-- ��������
		tbPlayer.nEncounterScore = tbPlayer.nEncounterScore - nDecreasePoint;
		if tbPlayer.nEncounterScore < 0 then
			tbPlayer.nEncounterScore = 0;
		end
		
		tbKiller.nEncounterScore = tbKiller.nEncounterScore + nIncreasePoint;

		-- �ǻ����������
		tbKiller.nKillEnemyNum  = tbKiller.nKillEnemyNum + 1;
		tbPlayer.nDeathTotalNum = tbPlayer.nDeathTotalNum + 1;

		tbKiller:SetTaskValue(DungeonGlobalData.TASK_KILL_ENEMY_NUM, tbKiller.nKillEnemyNum);
		tbKiller:SetTaskValue(DungeonGlobalData.TASK_CUR_KILL_COMBO_NUM, tbKiller.nCurMaxKillComboNum);
		tbKiller:SetTaskValue(DungeonGlobalData.TASK_MAX_KILL_COMBO_NUM, tbKiller.nMaxKillComboNum);
		tbKiller:SetTaskValue(DungeonGlobalData.TASK_CUR_TITLE_INDEX, tbKiller.nTitleLv);

		tbPlayer:SetTaskValue(DungeonGlobalData.TASK_DEATH_TOTAL_NUM, tbPlayer.nDeathTotalNum);
		tbPlayer:SetTaskValue(DungeonGlobalData.TASK_CUR_KILL_COMBO_NUM, tbPlayer.nCurMaxKillComboNum);
		tbPlayer:SetTaskValue(DungeonGlobalData.TASK_MAX_KILL_COMBO_NUM, tbPlayer.nMaxKillComboNum);
		tbPlayer:SetTaskValue(DungeonGlobalData.TASK_CUR_TITLE_INDEX, tbPlayer.nTitleLv);

		-- ��ն����
		if tbKiller.nComboTimes >= 3 then
			tbKiller.nComboTimes = 0;
			tbKiller.nEncounterScore = tbKiller.nEncounterScore + 2;
			-- ����Ϣ
			local strMsg = format("[%s]%sth� l�c kh�ng th� ��, ho�n th�nh 3 l�n tr�m li�n ti�p!", tbKiller:GetTitleString(), szKillerName);
			Msg2Map(tbMap.nMapId, strMsg);
		end

		if tbMap then
			tbMap:SendFuLiTopTenData2Client();
		end
	end

	tbPlayer:RefreshTitle();
	CallPlayerFunction(nKillerIndex, tbKiller.RefreshTitle, tbKiller)

	tbPlayer:PrintInfo();
	tbKiller:PrintInfo();
end

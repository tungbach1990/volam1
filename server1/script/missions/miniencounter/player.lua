EncounterPlayer = {};

function EncounterPlayer:new(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local tb = {};
	tb.szRoleName = szRoleName;						-- ��ɫ��
	tb.nPlayerInMap = 0;								 -- ���״̬��0 - ��ʼ����1 - �����ڣ�-1 - ������
	tb.nEncounterScore = 0;								 -- ���������ͻս����
	tb.nScoreGetForCamp = 0;								 -- Ϊ������ȡ�Ļ���
	tb.nComboTimes = 0;								 -- ��ɱ��
	tb.nKillEnemyNum = 0;								 -- ɱ�������
	tb.nKillMiddlePillarNum = 0;							-- ���������
	tb.nKillEnemyPillarNum = 0;							-- ���˧����
	tb.nGetBattleBuffNum = 0;							-- ����䱦��
	tb.nMaxKillComboNum = 0;								-- �����ɱ��
	tb.nCurMaxKillComboNum = 0;							-- ��ǰ�����ն��
	tb.nDeathTotalNum = 0;								-- �����ܴ���

	tb.nCamp = 0;								 -- ��Ӫ��Ϣ
	tb.nTitleLv = 0;								 -- �ƺŵȼ�
	tb.nLastDeadTime = 0;								 -- �ϴ�����ʱ�䣬����������Trap���ж�

	-- ���ڷ�ˢ�ı���
	tb.nKillPlayerNum = 0;								 -- ����ɱ����
	tb.nKillSoldierNum = 0;								 -- ����ɱս��NPC��
	tb.nKillPillarNum = 0;								 -- ����������

	-- ��������
	tb.nCurrentPoint = 0;								 -- ���ܵ��ν����

	for k, v in self do
		tb[k] = v;
	end

	return tb;
end

--function EncounterPlayer:Create(szRoleName)
--	local tb = EncounterPlayer:new(szRoleName);
--	tb.nPlayerState = 1;
--	return tb;
--end

function EncounterPlayer:RefreshTitle()
	local nCurTitleLv = self.nTitleLv;
	local nNewTitleLv = DungeonGlobalData:ChooseTitleLv(self.nEncounterScore);

	if nCurTitleLv ~= nNewTitleLv then
		self:DelTitle(self.nCamp, nCurTitleLv)
		self:AddTitle(self.nCamp, nNewTitleLv)
		self.nTitleLv = nNewTitleLv
	end

	return 1;
end

function EncounterPlayer:GetTitleString()
	local tbBattleTitle = DungeonGlobalData.tbBattleTitle;
	local tbCampTitle   = tbBattleTitle[self.nCamp];
	return tbCampTitle[self.nTitleLv][1];
end

function EncounterPlayer:IsDoubleScore()
	return 0;
end

function EncounterPlayer:PrintInfo()
	print("\n\n[Function Stack] - EncounterPlayer:PrintInfo - player.lua");
	print(">> Debug : szRoleName = "..self.szRoleName);
	print(">> Debug : nPlayerInMap = "..self.nPlayerInMap);
	print(">> Debug : nEncounterScore = "..self.nEncounterScore);
	print(">> Debug : nComboTimes = "..self.nComboTimes);
	print(">> Debug : nTitleLv = "..self.nTitleLv);
end

--function EncounterPlayer:CheckPlayerState()
--	print("[Function Stack] - EncounterPlayer:CheckPlayerState() - player.lua");
--	return DungeonGlobalData:CheckPlayerState(self.szRoleName);
--end

function EncounterPlayer:ClearAllTaskValue()
	SetTask(DungeonGlobalData.TASK_SCORE_TOTAL , 0);
	SetTask(DungeonGlobalData.TASK_KILL_ENEMY_NUM , 0);
	SetTask(DungeonGlobalData.TASK_KILL_MIDDLE_PILLAR_NUM, 0);
	SetTask(DungeonGlobalData.TASK_KILL_ENEMY_PILLAR_NUM, 0);
	SetTask(DungeonGlobalData.TASK_GET_ENEMY_BUFF_NUM, 0);
	SetTask(DungeonGlobalData.TASK_CUR_KILL_COMBO_NUM, 0);
	SetTask(DungeonGlobalData.TASK_CUR_TITLE_INDEX, 0);
	SetTask(DungeonGlobalData.TASK_DEATH_TOTAL_NUM, 0);
	SetTask(DungeonGlobalData.TASK_MAX_KILL_COMBO_NUM, 0);
	SetTask(DungeonGlobalData.TASK_PERSONAL_SCORE, 0);
	SetTask(DungeonGlobalData.TASK_BATTLE_FINISH_TIME, 0);
	SetTask(DungeonGlobalData.TASK_BATTLE_SONG_NUM, 0);
	SetTask(DungeonGlobalData.TASK_BATTLE_JIN_NUM, 0);
	SetTask(DungeonGlobalData.TASK_BATTLE_SONG_SCORE, 0);
	SetTask(DungeonGlobalData.TASK_BATTLE_JIN_SCORE, 0);
	SetTask(DungeonGlobalData.TASK_BATTLE_PLAYER_CAMP, 0);
end

function EncounterPlayer:RestoreAllTaskValue()
	SetTask(DungeonGlobalData.TASK_SCORE_TOTAL, self.nScoreGetForCamp);
	SetTask(DungeonGlobalData.TASK_KILL_ENEMY_NUM, self.nKillEnemyNum);
	SetTask(DungeonGlobalData.TASK_KILL_MIDDLE_PILLAR_NUM, self.nKillMiddlePillarNum);
	SetTask(DungeonGlobalData.TASK_KILL_ENEMY_PILLAR_NUM , self.nKillEnemyPillarNum);
	SetTask(DungeonGlobalData.TASK_GET_ENEMY_BUFF_NUM, self.nGetBattleBuffNum);
	SetTask(DungeonGlobalData.TASK_CUR_KILL_COMBO_NUM, self.nCurMaxKillComboNum);
	SetTask(DungeonGlobalData.TASK_CUR_TITLE_INDEX, self.nTitleLv);
	SetTask(DungeonGlobalData.TASK_DEATH_TOTAL_NUM, self.nDeathTotalNum);
	SetTask(DungeonGlobalData.TASK_PERSONAL_SCORE, self.nEncounterScore);
	SetTask(DungeonGlobalData.TASK_MAX_KILL_COMBO_NUM, self.nMaxKillComboNum);
	SetTask(DungeonGlobalData.TASK_BATTLE_PLAYER_CAMP, self.nCamp);
end

function EncounterPlayer:SetTaskValue(nTask, nValue)
	local nPlayerIndex = SearchPlayer(self.szRoleName);
	if not nPlayerIndex or nPlayerIndex <= 0 then
		return nil;
	end

	CallPlayerFunction(nPlayerIndex, SetTask, nTask, nValue);
end


function EncounterPlayer:AddTitle(nCamp, nTitleLv)
	if PlayerIndex == nil or PlayerIndex <= 0 then
		return
	end

	if nCamp < 1 or nCamp > 2 then
		print(">> Error : nCamp is invalid!");
		return nil;
	end

	if nTitleLv > 5 or nTitleLv < 1 then
		print(">> Error : nTitleLv is invalid!");
		return nil;
	end

	local nTitleId   = DungeonGlobalData.tbBattleTitle[nCamp][nTitleLv][2];
	local nTimeExist = DungeonGlobalData.MAP_WAIT_TIME + DungeonGlobalData.MAP_FIGHT_TIME;

	Title_RemoveTitle(nTitleId);									-- ɾ��ͬ���͵ĳƺ�
	Title_AddTitle(nTitleId, 1, nTimeExist * 18);				   -- ���ӳƺ�
	Title_ActiveTitle(nTitleId);									-- ����ƺ�
		
end

function EncounterPlayer:DelTitle(nCamp, nTitleLv)
	if PlayerIndex == nil or PlayerIndex <= 0 then
		print(">> Error : nPlayerIdx is invalid!");
		return nil;
	end

	if nCamp < 1 or nCamp > 2 then
		print(">> Error : nCamp is invalid!");
		return nil;
	end

	if nTitleLv > 5 or nTitleLv < 1 then
		print(">> Error : nTitleLv is invalid!");
		return nil;
	end

	local nTitleId   = DungeonGlobalData.tbBattleTitle[nCamp][nTitleLv][2];
	Title_RemoveTitle(nTitleId);
	
end

function EncounterPlayer:ClearAllSkillState()
	--print("[Function Stack] - ClearAllSkillState() - player.lua);"
	if PlayerIndex == nil or PlayerIndex < 0 then
		return
	end

	local nBuffNum = getn(DungeonGlobalData.tbBuff);
	for i = 1, nBuffNum do
		AddSkillState(DungeonGlobalData.tbBuff[i].nBuffID, 1, 0, 0);
	end
end

Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\objbuffer_head.lua");
Include("\\script\\global\\autoexec_head.lua");
Include("\\script\\missions\\basemission\\lib.lua");
Include("\\script\\missions\\basemission\\dungeon.lua");
Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\player.lua");
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")


EncounterMap = Dungeon:new_type("miniencounter");		   -- ���ɷ����ͻս��������
--EncounterMap.nTemplateMapID = 975;						  -- ����PVP��ͼģ��ID��������
EncounterMap.nTemplateMapID = 988;						  -- �����ͻս��ͼģ��ID

-- EncounterMap:_init
-- ����Dungeon:_init����
function EncounterMap:_init(...)

	self.tbCamp = {};					 -- ��Ӫ
	self.tbCamp[1] = {};				  -- ��Ӫ����
	self.tbCamp[2] = {};				  -- ��Ӫ����

	self.tbCampScore = {};				-- ��Ӫ����
	self.tbCampScore[1] = 0;			  -- �η���Ӫ����
	self.tbCampScore[2] = 0;			  -- ����Ӫ����


	self.nGameStartTime = 0;			  -- ������ʼʱ��
	-- 0 - ��ʼ��״̬��1 - ׼�����ȴ���ʼ״̬��2 - ������״̬��3 - ��������״̬
	self.nGameState = 0;

	self.nSongPillarLv = 1;			   -- �η����ӵȼ���ÿɱ��һ�Σ�����һ���ȼ����������������
	self.nJinPillarLv  = 1;			   -- �����ӵȼ���ÿɱ��һ�Σ�����һ���ȼ����������������
	self.nResult	   = 0;			   -- 0 - ƽ�֣�1 - �η�ʤ����2 - ��ʤ��

	self.tbCurPlayerNum = {};
	self.tbCurPlayerNum[1] = 0;		   -- ��ǰ�η��ڳ�����
	self.tbCurPlayerNum[2] = 0;		   -- ��ǰ���ڳ�����

	-- ��������
	self.nCountSecond  = DungeonGlobalData.MAP_WAIT_COUNT_SECOND;		-- ���ڿ���ս��ǰ����
	self.nNoticeCount  = 3;											  -- ��ʾ���Σ�����ô����
	self.nCeaseCountSecond = DungeonGlobalData.MAP_WAIT_COUNT_SECOND;	-- ���ڽ���ս��ǰ����

	-- ����NPC
	local tbNpcList = DungeonGlobalData.tbNonFightNpcPos;
	for i = 1, getn(tbNpcList) do
		basemission_CallNpc(tbNpcList[i], self.nMapId)
	end

	DungeonGlobalData:CreatePillarNpc(self.nMapId);
	return 1;
end

-- ��̬����
function EncounterMap:GetNewWorldPos(nCamp)
	--return 1583, 3231;				-- ����PVPͼ��������
	if nCamp == 1 then				  -- �η�
		return 1633, 3418;
	elseif nCamp == 2 then
		return 1857, 3115;
	end

	return 1633, 3418;				  -- ���ʹ��󣬾��޼����
end

function EncounterMap:AddMapTrap_S(nMapId, nPosX, nPosY, szScriptFile)
	if SubWorldID2Idx(nMapId) ~= -1 then
		AddMapTrap(nMapId, nPosX, nPosY, szScriptFile);
	end
end

function EncounterMap:Msg2Camp(nCamp, strMsg)
	if nCamp == nil then
		return nil;
	end

	if nCamp > 2 or nCamp < 1 then
		return nil;
	end

	if strMsg == nil then
		return nil;
	end

	local tbCampMembers = self.tbCamp[nCamp];
	local nCampNum	  = getn(tbCampMembers);

	for i = 1, nCampNum do
		local nPlayerIndex = SearchPlayer(tbCampMembers[i].szRoleName);
		if nPlayerIndex ~= nil and nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, Msg2Player, strMsg);
		end
	end

	return 1;
end

-- ��̬����
function EncounterMap:CreateBattleNpc()
	DungeonGlobalData:CreateFightNpc(self.nMapId);
	return 1;
end

function EncounterMap:GetCampByName(szRoleName)
	if szRoleName == nil then
		return -1;
	end

	local nCamp1Num = getn(self.tbCamp[1]);
	local nCamp2Num = getn(self.tbCamp[2]);

	for i = 1, nCamp1Num do
		local tbPlayer = self.tbCamp[1][i];
		if tbPlayer.szRoleName == szRoleName then
			return 1;
		end
	end

	for i = 1, nCamp2Num do
		local tbPlayer = self.tbCamp[2][i];
		if tbPlayer.szRoleName == szRoleName then
			return 2;
		end
	end

	return -1;
end

function EncounterMap:GetPlayer(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local tbSongCamp = self.tbCamp[1];
	local nSongNum   = getn(tbSongCamp);
	for i = 1, nSongNum do
		if tbSongCamp[i].szRoleName == szRoleName then
			return tbSongCamp[i];
		end
	end

	local tbJinCamp = self.tbCamp[2];
	local nJinNum   = getn(tbJinCamp);
	for i = 1, nJinNum do
		if tbJinCamp[i].szRoleName == szRoleName then
			return tbJinCamp[i];
		end
	end

	return nil;
end

function EncounterMap:GetPlayerByCamp(nCamp, szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local tbCamp = self.tbCamp[nCamp];
	local nCampNum = getn(tbCamp);

	for i = 1, nCampNum do
		if tbCamp[i].szRoleName == szRoleName then
			return tbCamp[i];
		end
	end
	return nil;
end

function EncounterMap:StartWait()
	-- ��ʼ�ȴ�������
	local nNextTriggerTime = DungeonGlobalData.MAP_WAIT_TIME - DungeonGlobalData.MAP_WAIT_COUNT_SECOND;
	--local nNextTriggerTime = 1;

	if not self then
		print(">> Error : self is nil");
		return
	end

	self:AddTimer(nNextTriggerTime * 18, self.WaitTimer, {self});		   -- �ȴ�������
	self:AddTimer(1 * 18, self.NoticeTimer, {self});						-- ��Ϣ������
	self:AddTimer(60 * 18, self.StopWhenNobodyTimer, {self});			   -- û�˽�������������
	self:AddTimer(50 * 18, self.SyncBattleTimer, {self});				   -- ������ͻ���ͬ��
	return 1;
end

function EncounterMap:StartFight()
	local nNextTriggerTime = 120;										   -- 2���Ӻ󴥷�

	if not self then
		print(">> Error : self is nil");
		return
	end

	self:AddTimer(nNextTriggerTime * 18, self.CeaseTimer, {self});

	return 1;
end

function EncounterMap:SyncBattleTimer()
	self:NotifyCurrentVSScore();
	return 45 * 18;
end

function EncounterMap:CeaseTimer()
	if not self then
		print(">> Error : self is nil")
		return
	end

	-- ÿ������˫����Ӫ��������1��(��Ϊͬһʱ�̰ѶԷ�����ɱ��)
	self.tbCampScore[1] = self.tbCampScore[1] + 1;
	self.tbCampScore[2] = self.tbCampScore[2] + 1;

	self:NotifyCurrentVSScore();

	local strVSMsg = format("T� s� �i�m T�ng Kim hi�n t�i c�a 2 b�n l�: %d:%d", self.tbCampScore[1], self.tbCampScore[2]);
	Msg2Map(self.nMapId, "Phe Kim t��ng s� kh� th� h�o h�ng, phe Kim nh�n ���c 1 �i�m.");
	Msg2Map(self.nMapId, "Phe T�ng t��ng s� kh� th� h�o h�ng, phe T�ng nh�n ���c 1 �i�m.");
	Msg2Map(self.nMapId, strVSMsg);

	local nJudgeResult = self:JudgeWinnerWhenKillerPillar();
	if nJudgeResult > 0 then											-- ��������
		self:ProcessWhenFinish(nJudgeResult);
		return 0;
	end

	-- �������ս��ʱ�䣬��Ȼ����
	local nEndTime = self.nGameStartTime + DungeonGlobalData.MAP_WAIT_TIME + DungeonGlobalData.MAP_FIGHT_TIME;
	if GetCurrentTime() >= nEndTime then
		self:AddTimer(1 * 18, self.CeaseCountTimer, {self});
		return 0;
	end

	return 120 * 18;													-- ÿ2���Ӵ���һ��
end

function EncounterMap:CeaseCountTimer()
	if not self then
		print(">> Error : self is nil");
		return
	end
	
	-- ����
	if DungeonGlobalData.MAP_WAIT_COUNT_SECOND == self.nCeaseCountSecond then
		local strMsg = "Ph� Li Xung ��t Chi�n s�p k�t th�c, c�c chi�n s� chu�n b� ng�ng chi�n!";
		Msg2Map(self.nMapId, strMsg);
		strMsg = format("Th�i gian c�n %d gi�y k�t th�c", self.nCeaseCountSecond);
		Msg2Map(self.nMapId, strMsg);
	elseif self.nCeaseCountSecond > 0 then
		local strMsg = format("Th�i gian c�n %d gi�y k�t th�c", self.nCeaseCountSecond);
		Msg2Map(self.nMapId, strMsg);
	else
		local strMsg = "Tr�i �� d�n t�i �i, 2 b�n �ang thu binh, sau n�y ��u ti�p!";
		Msg2Map(self.nMapId, strMsg);
	end

	self.nCeaseCountSecond = self.nCeaseCountSecond - 1;
	if self.nCeaseCountSecond < 0 then
		local nJudgeResult = self:JudgeWinnerWhenTimeOut();
		self:ProcessWhenFinish(nJudgeResult);
		return 0;
	end

	return 1 * 18;
end

function EncounterMap:NoticeTimer()
	if not self then
		print(">> Error : self is nil");
		return
	end

	local strMsg = format("C�n %d ph�t Ph� Li Xung ��t Chi�n s� kh�i ��ng, m�i ng��i h�y chu�n b�!", self.nNoticeCount);
	Msg2Map(self.nMapId, strMsg);

	self.nNoticeCount = self.nNoticeCount - 1;	
	if self.nNoticeCount <= 0 then
		return 0;
	end

	return 60 * 18;
end

function EncounterMap:WaitTimer()
	if not self then
		print(">> Error : self is nil");
		return
	end

	-- ����
	if DungeonGlobalData.MAP_WAIT_COUNT_SECOND == self.nCountSecond then
		local strMsg = "Ph� Li Xung ��t Chi�n s�p b�t ��u, m�i ng��i h�y chu�n b�!";
		Msg2Map(self.nMapId, strMsg);
		strMsg = format("Th�i gian chu�n b� c�n l�i %d gi�y", self.nCountSecond);
		Msg2Map(self.nMapId, strMsg);
	elseif self.nCountSecond > 0 then
		local strMsg = format("Th�i gian chu�n b� c�n l�i %d gi�y", self.nCountSecond);
		Msg2Map(self.nMapId, strMsg);
	else
		local strMsg = "Ti�ng tr�ng �� vang l�n, h�i c�c d�ng s� x�ng l�n!";
		self.nGameState = 2;
		self:AddTraps();
		self:CreateBattleNpc();
		Msg2Map(self.nMapId, strMsg);
	end

	self.nCountSecond = self.nCountSecond - 1;	
	if self.nCountSecond < 0 then
		self:StartFight();
		return 0;
	end

	return 1 * 18;
end

function EncounterMap:GetPlayerNumInGameByCamp(nCamp)
	if nCamp == nil or nCamp < 1 or nCamp > 2 then
		return nil;
	end

	local nPlayerInGameNum = 0;
	for i = 1, getn(self.tbCamp[nCamp]) do
		local tbPlayer = self.tbCamp[nCamp][i];
		if tbPlayer.nPlayerInMap == 1 then
			nPlayerInGameNum = nPlayerInGameNum + 1;
		end
	end

	return nPlayerInGameNum;
end

function EncounterMap:KickOutAllPlayer()
	local tbSongCamp = self.tbCamp[1];
	local tbJinCamp  = self.tbCamp[2];

	for i = 1, getn(tbSongCamp) do
		local tbPlayer = tbSongCamp[i];
		if tbPlayer ~= nil then
			local szRoleName   = tbPlayer.szRoleName;
			local nPlayerIndex = SearchPlayer(szRoleName);
			if nPlayerIndex ~= nil and nPlayerIndex > 0 then
				local nPlayerMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos);
				-- ��������������
				CallPlayerFunction(nPlayerIndex, tbPlayer.ClearAllTaskValue, tbPlayer);
				if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then
					CallPlayerFunction(nPlayerIndex, NewWorld, 325, 1540, 3177);
				end
			end
		end
	end

	for i = 1, getn(tbJinCamp) do
		local tbPlayer = tbJinCamp[i];
		if tbPlayer ~= nil then
			local szRoleName   = tbPlayer.szRoleName;
			local nPlayerIndex = SearchPlayer(szRoleName);
			if nPlayerIndex ~= nil and nPlayerIndex > 0 then
				local nPlayerMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos);
				-- ��������������
				CallPlayerFunction(nPlayerIndex, tbPlayer.ClearAllTaskValue, tbPlayer);
				if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then	
					CallPlayerFunction(nPlayerIndex, NewWorld, 325, 1570, 3085);
				end
			end
		end
	end
end

function EncounterMap:GiveAwardWhenBattleFinish(nCamp, nExploitBase)
	if nCamp == nil or nCamp < 1 or nCamp > 2 then
		return nil;
	end

	if nExploitBase == nil or nExploitBase < 0 then
		print(">> Error : nExploitBase is invalid!");
		return nil;
	end

	local tbCamp = self.tbCamp[nCamp];
	if tbCamp == nil then
		print(">> Error : tbCamp is invalid!");
		return nil;
	end

	for i = 1, getn(tbCamp) do
		local tbPlayer = tbCamp[i];
		if tbPlayer ~= nil then

			local szRoleName   = tbPlayer.szRoleName;
			local nPlayerIndex = SearchPlayer(szRoleName);

			if nPlayerIndex ~= nil and nPlayerIndex > 0 then

				local nPlayerMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos);
				if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then

					if tbPlayer.nKillPlayerNum > 3 or tbPlayer.nKillSoldierNum > 15 or tbPlayer.nKillPillarNum > 1 then

						-- ��ѫֵ
						local nFn = DungeonGlobalData:GetFnByTitle(tbPlayer.nTitleLv);
						local nGn = tbPlayer:IsDoubleScore();
						local nExploitValue = nExploitBase * (1 + nFn + nGn);

						local nCurrentExploit = CallPlayerFunction(
							nPlayerIndex,
							GetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_TASK_VALUE
						);
						local nCurrentTotalExploit = CallPlayerFunction(
							nPlayerIndex,
							GetTask,
							DungeonGlobalData.PLAYER_HISTORY_EXPLOIT_TASK_VALUE
						);
						local nCurrentWeekExploit = CallPlayerFunction(
							nPlayerIndex,
							GetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_PER_WEEK_TASK_VALUE
						);

						if nCurrentWeekExploit + nExploitValue > DungeonGlobalData.MAX_EXPLOIT_VALUE then
							local nAdd = DungeonGlobalData.MAX_EXPLOIT_VALUE - nCurrentWeekExploit;
							if nAdd < 0 then
								nAdd = 0;
							end
							nCurrentTotalExploit = nCurrentTotalExploit + nAdd;	 -- ��ʷ�ܹ�ѫ
							nCurrentExploit	  = nCurrentExploit	  + nAdd;	 -- ��ҹ�ѫ
							nCurrentWeekExploit  = nCurrentWeekExploit  + nAdd;	 -- ÿ�ܻ�õĹ�ѫ
						else
							nCurrentTotalExploit = nCurrentTotalExploit + nExploitValue;
							nCurrentExploit	  = nCurrentExploit	  + nExploitValue;
							nCurrentWeekExploit  = nCurrentWeekExploit  + nExploitValue;
						end
						
						
						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("Tr�n Ph� Li Xung ��t Chi�n n�y ng��i nh�n ���c %d �i�m c�ng hu�n T�ng Kim ", nExploitValue)
						);

						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("Ph� Li Xung ��t Chi�n tu�n n�y ng��i nh�n ���c %d �i�m t�ch l�y c�ng hu�n T�ng Kim ", nCurrentWeekExploit)
						);

						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("C�ng hu�n T�ng Kim hi�n t�i c� th� d�ng l� %d �i�m", nCurrentExploit)
						);

						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("L�ch s� �i�m t�ch l�y c�ng hu�n T�ng Kim nh�n ���c trong Ph� Li Xung ��t Chi�n l� %d �i�m", nCurrentTotalExploit)
						);

						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_TASK_VALUE,
							nCurrentExploit
						);
						
						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_HISTORY_EXPLOIT_TASK_VALUE,
							nCurrentTotalExploit
						);

						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_PER_WEEK_TASK_VALUE,
							nCurrentWeekExploit
						);

						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_WEEK_EXPLOIT_TIME_TASK,
							tonumber(GetLocalDate("%W"))
						);

						-- ����ֵ
						local nCurrentPoint = CallPlayerFunction(
								nPlayerIndex,
								GetTask,
								DungeonGlobalData.PLAYER_POINTS_TASK_VALUE
						);
						if (self.nResult == 2 and tbPlayer.nCamp == 1) or	   -- �η���ʤ
						   (self.nResult == 3 and tbPlayer.nCamp == 2) then	 -- �𷽻�ʤ

							local nPointValue = tbPlayer.nEncounterScore;
							nCurrentPoint = nCurrentPoint + nPointValue;
							CallPlayerFunction(
								nPlayerIndex,
								Msg2Player,
								format("Tr�n Ph� Li Xung ��t Chi�n n�y ng��i nh�n ���c �i�m t�ch l�y T�ng Kim l� %d �i�m.", nPointValue)
							);

							CallPlayerFunction(
								nPlayerIndex,
								Msg2Player,
								format("Tu�n n�y Ph� Li Xung ��t Chi�n �i�m t�ch l�y T�ng Kim nh�n ���c l� %d �i�m.", nCurrentPoint)
							);

							CallPlayerFunction(
								nPlayerIndex,
								SetTask,
								DungeonGlobalData.PLAYER_POINTS_TASK_VALUE,
								nCurrentPoint
							);
							tbPlayer.nCurrentPoint = nCurrentPoint;
						else
							CallPlayerFunction(
								nPlayerIndex,
								Msg2Player,
								format("Tr�n Ph� Li Xung ��t Chi�n n�y ng��i th� hi�n kh�ng t�t, kh�ng nh�n ���c �i�m t�ch l�y T�ng Kim.", nCurrentPoint)
							);
							tbPlayer.nCurrentPoint = nCurrentPoint;
						end -- if self.nResult == 2 then
					else
						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("Tr�n Ph� Li Xung ��t Chi�n n�y ng��i th� hi�n kh�ng t�t, kh�ng nh�n ���c �i�m t�ch l�y T�ng Kim.", nCurrentPoint)
						);
					end -- if tbPlayer.nKillPlayerNum > 3 or tbPlayer.nKillSoldierNum > 15 or tbPlayer.nKillPillarNum > 1 then
				end -- if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then
			end -- if nPlayerIndex ~= nil and nPlayerIndex > 0 then
		end -- if tbPlayer ~= nil then
	end -- for i = 1, getn(tbCamp) do
end

function EncounterMap:StopWhenNobodyTimer()
	local nSongPlayerInGameNum = self:GetPlayerNumInGameByCamp(1);
	local nJinPlayerInGameNum  = self:GetPlayerNumInGameByCamp(2);

	-- �ȴ�ʱ��û�ˣ�������ң�����ս��
	if (GetCurrentTime() - self.nGameStartTime <= DungeonGlobalData.MAP_WAIT_TIME or self.nGameState == 1) and 
	   (nSongPlayerInGameNum <= 0 or nJinPlayerInGameNum <= 0)then

		-- ��ˢ��Ϣ���ٵ������
		Msg2Map(self.nMapId, "��i ph��ng ��nh chi�n, mau ch�ng ��n chi�n tr��ng m�i.");
		self:KickOutAllPlayer();
		self:free();						-- �ͷ���Դ
		self:NotifyRelayGameFinish();
		return 0;
	end

	if GetCurrentTime() - self.nGameStartTime <= DungeonGlobalData.MAP_WAIT_TIME then
		return 60 * 18;
	end

	-- û�ˣ����������̽�������
	if nSongPlayerInGameNum <= 0 and nJinPlayerInGameNum <= 0 then
		local strMsg = "2 b�n ��nh chi�n, tr�n n�y hu�!";
		Msg2Map(self.nMapId, strMsg);
		self:ProcessWhenFinish(1);
		return 0;
	elseif nSongPlayerInGameNum <= 0 and nJinPlayerInGameNum > 0 then
		local strMsg = "Phe T�ng ��nh chi�n, phe Kim th�ng!";
		Msg2Map(self.nMapId, strMsg);
		self:ProcessWhenFinish(3);
		return 0;
	elseif nSongPlayerInGameNum > 0 and nJinPlayerInGameNum <= 0 then
		local strMsg = "Phe Kim ��nh chi�n, phe T�ng th�ng!";
		Msg2Map(self.nMapId, strMsg);
		self:ProcessWhenFinish(2);
		return 0;
	end

	return 60 * 18;
end

function EncounterMap:AddTraps()
	self:AddTrap_Song();
	self:AddTrap_Jin();
end

function EncounterMap:AddTrap_Song()
	-- ��Ӫ��ǰӪ
	local szTrapFile   = "\\settings\\missions\\miniencounter\\trap_song_back2front.txt";
	local szTrapScript = "\\script\\missions\\miniencounter\\trap_song_back2front.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	local nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		--print (">> Debug : nX = "..nX);
		--print (">> Debug : nY = "..nY);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
	
	-- ǰӪ����Ӫ
	szTrapFile = "\\settings\\missions\\miniencounter\\trap_song_front2back.txt";
	szTrapScript = "\\script\\missions\\miniencounter\\trap_song_front2back.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
end

function EncounterMap:AddTrap_Jin()
	-- ��Ӫ��ǰӪ
	local szTrapFile   = "\\settings\\missions\\miniencounter\\trap_jin_back2front.txt";
	local szTrapScript = "\\script\\missions\\miniencounter\\trap_jin_back2front.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	local nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		--print (">> Debug : nX = "..nX);
		--print (">> Debug : nY = "..nY);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
	
	-- ǰӪ����Ӫ
	szTrapFile = "\\settings\\missions\\miniencounter\\trap_jin_front2back.txt";
	szTrapScript = "\\script\\missions\\miniencounter\\trap_jin_front2back.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
end

function EncounterMap:IsInMap(szRoleName)
	for i = 1, getn(self.tbCamp[1]) do
		if self.tbCamp[1][i].szRoleName == szRoleName then
			return 1;
		end
	end

	for i = 1, getn(self.tbCamp[2]) do
		if self.tbCamp[2][i].szRoleName == szRoleName then
			return 1;
		end
	end

	return nil;
end

function EncounterMap:AddToCamp(nCamp, tbPlayer)
	local tbCamp = self.tbCamp[nCamp];
	local nPlayerNum = getn(tbCamp);
	tbCamp[nPlayerNum + 1] = tbPlayer;
	tbPlayer.nCamp = nCamp;
	return 1;
end

function EncounterMap:OnEnterMap()
	print("[Function Stack] - EncounterMap:OnEnterMap - map.lua");

	SetPunish(0);			   -- �ͷ��رգ�0��ʾ�����κγͷ�
	SetPKFlag(1);			   -- ��PK����
	--SetLogoutRV(1);			 -- ����������
	SetCreateTeam(0);		   -- �ر���ӹ���
	SetFightState(0);		   -- ����ս��״̬
	SetDeathType(-1);		   -- ������������ 

	ForbitTrade(0);				-- ������
	ForbidEnmity(1);			-- ��ֹ��ɱ
	ForbidChangePK(1);		  -- ��ֹ�ı�PK���
	
	DisabledStall(1);			-- ��ֹ��̯
	DisabledUseTownP(1);		-- ��ֹʹ�ûس�
	DisabledUseHeart(1);		-- ��ֹʹ��������ӡ��

	LeaveTeam();				-- �뿪����

	-- ���������ű�
	SetDeathScript("\\script\\missions\\miniencounter\\playerdeath.lua");

	local szRoleName = GetName();
	local tbPlayer = self:GetPlayer(szRoleName);
	local nCamp = GetTask(DungeonGlobalData.TASK_BATTLE_PLAYER_CAMP);
		
	if not tbPlayer then	--���ǵ�һ�ν���
		tbPlayer = EncounterPlayer:new(szRoleName);
		self:AddToCamp(nCamp, tbPlayer)
		tbPlayer.nTitleLv = 1
	end

	SetTmpCamp(nCamp)
	SetCurCamp(nCamp)
	
	self.tbCurPlayerNum[nCamp] = self.tbCurPlayerNum[nCamp] + 1
	tbPlayer:RestoreAllTaskValue()
	tbPlayer.nPlayerInMap = 1

	local nX, nY = self:GetNewWorldPos(tbPlayer.nCamp)
	SetTempRevPos(self.nMapId, nX * 32, nY * 32)
	
	-- ��һ�β����콱
	if GetTask(3999) ~= 2 then
		SetTask(3999, 1);
	end

	tbPlayer:AddTitle(tbPlayer.nCamp, tbPlayer.nTitleLv);

	-- ��һ�ν���Ҳ��ͬ��
	self:NotifyCurrentVSScore();
	self:SendFuLiTopTenData2Client();
end

function EncounterMap:OnLeaveMap()

	SetPunish(1);			   -- �ͷ���
	SetPKFlag(0);			   -- �ر�PK����
	SetCreateTeam(1);		   -- ����ӹ���
	SetFightState(0);		   -- ����ս��״̬
	SetDeathType(0);
	
	ForbitTrade(0);				-- ������
	ForbidEnmity(0);			-- �����ɱ
	ForbitStamina(0);
	ForbidChangePK(0);		  -- ���Ըı�PK���

	DisabledStall(0);			-- ���԰�̯
	DisabledUseTownP(0);		-- ����ʹ�ûس�
	DisabledUseHeart(0);		-- ����ʹ��������ӡ��

	SetTmpCamp(0);
	SetCurCamp(GetCamp())
	LeaveTeam();				-- �뿪����
	SetDeathScript("");

	-- ���Title
	local szRoleName = GetName();
	local tbPlayer   = self:GetPlayer(szRoleName);
	if tbPlayer and tbPlayer.nPlayerInMap ~= -1 then
		tbPlayer:DelTitle(tbPlayer.nCamp, tbPlayer.nTitleLv);		-- ���Title
		tbPlayer:ClearAllSkillState();	-- ���Buff
		tbPlayer:ClearAllTaskValue();		-- �뿪��ͼ������������
		tbPlayer.nPlayerInMap = -1;		-- ���ý�ɫ�뿪״̬
	end

	if tbPlayer then
		self.tbCurPlayerNum[tbPlayer.nCamp] = self.tbCurPlayerNum[tbPlayer.nCamp] - 1;
		if self.tbCurPlayerNum[tbPlayer.nCamp] < 0 then
			self.tbCurPlayerNum[tbPlayer.nCamp] = 0;
		end

		self:NotifyCurrentVSScore();
	end
end

-- ����ֵ��0 �����У�1 ƽ�֣�2 �η�ʤ����3 ��ʤ��
function EncounterMap:JudgeWinnerWhenKillerPillar()
	local nSongScore = self.tbCampScore[1];
	local nJinScore  = self.tbCampScore[2];
	
	local strMsg = "Phe %s ��t ���c %d �i�m tr��c, nh�n ph�n th�ng tr�n n�y!";
	if nSongScore >= DungeonGlobalData.MAP_WIN_SCORE and nJinScore >= DungeonGlobalData.MAP_WIN_SCORE then
		return 1;
	end

	if nSongScore >= DungeonGlobalData.MAP_WIN_SCORE and nJinScore < DungeonGlobalData.MAP_WIN_SCORE then
		strMsg = format(strMsg, DungeonGlobalData.tbCampName[1], DungeonGlobalData.MAP_WIN_SCORE);
		Msg2Map(self.nMapId, strMsg);
		return 2;
	end

	if nSongScore < DungeonGlobalData.MAP_WIN_SCORE and nJinScore >= DungeonGlobalData.MAP_WIN_SCORE then
		strMsg = format(strMsg, DungeonGlobalData.tbCampName[2], DungeonGlobalData.MAP_WIN_SCORE);
		Msg2Map(self.nMapId, strMsg);
		return 3;
	end

	return 0;
end

-- 30���ӱ������������ж�ʤ��
-- ����ֵ��1 ƽ�֣�2 �η�ʤ����3 ��ʤ��
function EncounterMap:JudgeWinnerWhenTimeOut()
	local nSongScore = self.tbCampScore[1];
	local nJinScore  = self.tbCampScore[2];

	local strMsg = "Chi�n ��u ng�y ��m, t� s� 2 b�n T�ng Kim l� %d:%d, phe %s nh�n ph�n th�ng!";
	if nSongScore > nJinScore then
		strMsg = format(strMsg, nSongScore, nJinScore,DungeonGlobalData.tbCampName[1]);
		Msg2Map(self.nMapId, strMsg);
		return 2;
	end

	if nSongScore < nJinScore then
		strMsg = format(strMsg, nSongScore, nJinScore,DungeonGlobalData.tbCampName[2]);
		Msg2Map(self.nMapId, strMsg);
		return 3;
	end

	return 1;
end

function EncounterMap:ProcessWhenFinish(nResult)
	-- ��ֹ����ͷ�
	if self.nGameState == 3 then
		return nil;
	end
	self.nGameState = 3;

	self.nResult = nResult;

	-- �ر�GS�ϵĵ�ͼ
	self:close();
end

-- ������������self:close() �е���
function EncounterMap:OnClose()

	-- �������
	local nSongExploitValueBase = 0;
	local nJinExploitValueBase  = 0;

	if self.nResult == 2 then							   -- �η�ʤ����
		Msg2Map(self.nMapId, "L�n giao tranh n�y phe T�ng d�ng m�nh gi�t ��ch, nh�n ���c ph�n th�ng!");
		nSongExploitValueBase = DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE;
		nJinExploitValueBase  = DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE;
	elseif self.nResult == 3 then						   -- ��ʤ��
		Msg2Map(self.nMapId, "L�n giao tranh n�y phe Kim d�ng m�nh gi�t ��ch, nh�n ���c ph�n th�ng!");
		nJinExploitValueBase  = DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE;
		nSongExploitValueBase = DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE;
	else													-- ƽ��
		Msg2Map(self.nMapId, "L�n giao tranh n�y 2 b�n kh�ng ph�n cao th�p, k�t qu� hu�!");
		local nExploitBase = (DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE + DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE) / 2;
		nSongExploitValueBase = nExploitBase;
		nJinExploitValueBase  = nExploitBase;
	end

	-- ���㽱��
	self:GiveAwardWhenBattleFinish(1, nSongExploitValueBase);
	self:GiveAwardWhenBattleFinish(2, nJinExploitValueBase);

	-- ������������
	self:SendRankData2Relay();
	
	-- �߳��������
	self:KickOutAllPlayer();

	-- ֪ͨrelayɾ����ͼ��Ȼ��֪ͨgsɾ����ͼ��Ϣ
	self:NotifyRelayGameFinish();
end

function EncounterMap:free()
	if self._timer_ then
		for nTimerId, tb in self._timer_ do
			DelTimer(nTimerId);
		end

		self._timer_ = nil;
	end

	DungeonList[self.nMapId] = nil;
	if self.nTemplateMapId then
		ApplyDelDungeonMap(self.nTemplateMapId, self.nMapId);				   -- ɾ��������ͼ����������Դ�ͷ�
	end
end

-- gs����ȥ��һ�����������ݸ�ʽΪ
-- {
--		 [szName] = nScore,
--		 ......
--		 [szName] = nScore,
-- };
function EncounterMap:SendRankData2Relay()
	local tbData = {}

	-- �η�����
	for i = 1, getn(self.tbCamp[1]) do
		local tbPlayer = self.tbCamp[1][i]
		tbData[tbPlayer.szRoleName] = tbPlayer.nCurrentPoint
	end
	
	-- ������
	for i = 1, getn(self.tbCamp[2]) do
		local tbPlayer = self.tbCamp[2][i]
		tbData[tbPlayer.szRoleName] = tbPlayer.nCurrentPoint
	end

	-- ��Ҫ����������������ݷ���RELAY
	local hObject = OB_Create()
	ObjBuffer:PushObject(hObject, tbData)
	RemoteExecute("\\script\\missions\\miniencounter\\weekly_rank.lua", "tbMiniEncounterRank:RecordResult", hObject)
	OB_Release(hObject)
end

function EncounterMap:NotifyRelayGameFinish()

	 --֪ͨrelay����������ɾ����ͼ
	local hObject = OB_Create();							-- ����һ������
	ObjBuffer:PushObject(hObject, self.nMapId);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "game_finish", hObject);
	OB_Release(hObject);
end

function EncounterMap:PrintInfo()
	print("\n\n[Function Stack] - EncounterMap:PrintInfo - map.lua");
	print(">> Debug : nMapId = "..self.nMapId);
	print(">> Debug : nGameStartTime = "..self.nGameStartTime);
	print(">> Debug : nGameState = "..self.nGameState);
	print(">> Debug : tbCampScore[1] = "..self.tbCampScore[1]);
	print(">> Debug : tbCampScore[2] = "..self.tbCampScore[2]);
	print(">> Debug : Players in Camp 1:");
	for i = 1, getn(self.tbCamp[1]) do
		print (self.tbCamp[1][i].szRoleName, " ");
	end

	print(">> Debug : Players in Camp 2:");
	for i = 1, getn(self.tbCamp[2]) do
		print (self.tbCamp[2][i].szRoleName, " ");
	end
end

function EncounterMap:NotifyCurrentVSScore()
	local tbSongCamp = self.tbCamp[1];
	local tbJinCamp  = self.tbCamp[2];
	local nSongNum   = getn(tbSongCamp);
	local nJinNum	= getn(tbJinCamp);
	local nBattleLeftSecond = self.nGameStartTime + DungeonGlobalData.MAP_WAIT_TIME + DungeonGlobalData.MAP_FIGHT_TIME - GetCurrentTime();
	if nBattleLeftSecond < 0 then
		nBattleLeftSecond = 0;
	end
	

	for i = 1, nSongNum do
		local tbPlayer = tbSongCamp[i];
		if tbPlayer and tbPlayer.nPlayerInMap ~= -1 then
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_NUM   , self.tbCurPlayerNum[1]);	-- ������
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_NUM	, self.tbCurPlayerNum[2]);	-- ������
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_SCORE , self.tbCampScore[1]);	   -- �ε÷�
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_SCORE  , self.tbCampScore[2]);	   -- ��÷�
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_FINISH_TIME, nBattleLeftSecond);		 -- ʱ��ͬ��
		end
	end

	for i = 1, nJinNum do
		local tbPlayer = tbJinCamp[i];
		if tbPlayer and tbPlayer.nPlayerInMap ~= -1 then
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_NUM   , self.tbCurPlayerNum[1]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_NUM	, self.tbCurPlayerNum[2]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_SCORE , self.tbCampScore[1]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_SCORE  , self.tbCampScore[2]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_FINISH_TIME, nBattleLeftSecond);		 -- ʱ��ͬ��
		end
	end
end

function EncounterMap:SendData(tbData)
	local hObject = OB_Create()
	ObjBuffer:PushByType(hObject, OBJTYPE_TABLE, tbData)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_FULI_REPORT", hObject)
	OB_Release(hObject)
end

function EncounterMap:SendFuLiTopTenData2Client()
	if self.tbCurPlayerNum[1] == 0 or self.tbCurPlayerNum[2] == 0 then
		return nil;
	end

	local tbTopTen = {};
	local tbTotalPlayer = {};

	for i = 1, getn(self.tbCamp[1]) do
		tinsert(tbTotalPlayer, self.tbCamp[1][i])
	end

	for i = 1, getn(self.tbCamp[2]) do
		tinsert(tbTotalPlayer, self.tbCamp[2][i])
	end

	-- ����
	sort(tbTotalPlayer, function(a, b) return a.nEncounterScore > b.nEncounterScore end)

	-- ��ȡǰʮ�����
	local nMax = getn(tbTotalPlayer);
	if nMax > 10 then
		nMax = 10
	end
	
	for i = 1, nMax do
		local tbPlayer = tbTotalPlayer[i];
		local tbRecord = {};
		tbRecord[1] = tbPlayer.nCamp;
		tbRecord[2] = tbPlayer.szRoleName;
		tbRecord[3] = tbPlayer.nEncounterScore;
		tbRecord[4] = tbPlayer.nKillEnemyNum;
		tbRecord[5] = tbPlayer.nKillMiddlePillarNum;
		tbRecord[6] = tbPlayer.nKillEnemyPillarNum;
		tbRecord[7] = tbPlayer.nMaxKillComboNum;
		print(format("%s = %d", tbRecord[2], tbRecord[3]))
		tinsert(tbTopTen, tbRecord)
	end

	-- ���͸����
	for i = 1, getn(tbTotalPlayer) do
		local szRoleName   = tbTotalPlayer[i].szRoleName;
		local nPlayerIndex = SearchPlayer(szRoleName);
		if nPlayerIndex and nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, self.SendData, self, tbTopTen)
		end
	end
end

-------------------------------------------- [�˲��ֲ���ȱ��] --------------------------------------------
local init_map = function ()
	PreApplyDungeonMap(%EncounterMap.nTemplateMapID, 0, 0);
end

AutoFunctions:Add(init_map);
-------------------------------------------- [�˲��ֲ���ȱ��] --------------------------------------------

-- ��ֹ������ӳ��
DynamicExecute("\\script\\item\\heart_head.lua", "add_forbit_templatemap", EncounterMap.nTemplateMapID);



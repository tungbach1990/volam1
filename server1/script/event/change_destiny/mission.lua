Include("\\script\\event\\change_destiny\\head.lua");

-- ����:��һ���߼��ν��л��3000�ۻ�����
function tbChangeDestiny:completeMission_Battle(tbPlayers)

	if self:isCarryOn() ~= 1 then
		return
	end

	if BT_GetGameData(GAME_LEVEL)~= 3 then
		return
	end

	local old_player = PlayerIndex;
	for i = 1, getn(tbPlayers) do
		PlayerIndex = tbPlayers[i];
		local bCanJoin = self:canJoin();
		local nBattlePoint = BT_GetData(PL_TOTALPOINT);
		local nMissionStep, nMissionDate = self:getMissionInfo(self.nMissionID_Battle);
		
		if (nBattlePoint >= 3000 and bCanJoin == 1 and nMissionStep == self.nStep_accepted) then
			self:setMissionInfo(self.nMissionID_Battle, self.nStep_completed, nMissionDate);
			Msg2Player("��i hi�p �� ho�n th�nh nhi�m v� t�ch l�y 3000 �i�m T�ng Kim c�a Th�n N�ng L�o Gia")
		end
	end
	PlayerIndex = old_player;
end

-- ����:�ڸ߼������д����߱��
function tbChangeDestiny:completeMission_NieShiChen(nNpcSettingIdx)
	
	if self:isCarryOn() ~= 1 then
		return
	end
	
	local index = 0;
	local player = 0;
	local old_player = PlayerIndex;
	
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			PlayerIndex = player;
			
			local bCanJoin = self:canJoin();
			local nMissionStep, nMissionDate = self:getMissionInfo(self.nMissionID_NieShiChen);
			
			if (bCanJoin == 1 and nMissionStep == self.nStep_accepted and nNpcSettingIdx == self.nLimit_NieShiChen) then
				self:setMissionInfo(self.nMissionID_NieShiChen, self.nStep_completed, nMissionDate);
				Msg2Player("��i hi�p �� ho�n th�nh nhi�m v� ��nh b�i Nhi�p Th� Tr�n c�a Th�n N�ng L�o Gia.")
			end
		end
		if (index == 0) then
			break;
		end	
	end
	
	PlayerIndex = old_player;
end

-- ����:�ڷ���ɴ��ˮ��ͷ��
function tbChangeDestiny:completeMission_WaterThief()
	
	if self:isCarryOn() ~= 1 then
		return
	end
	
	if self:canJoin() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(self.nMissionID_WaterThief);
	if (nMissionStep == self.nStep_accepted ) then
		self:setMissionInfo(self.nMissionID_WaterThief, self.nStep_completed, nMissionDate);
		Msg2Player("��i hi�p �� ho�n th�nh nhi�m v� ��nh b�i Th�y T�c ��u L�nh c�a Th�n N�ng L�o Gia")
	end
end

-- ����:ͨ��4��90��ɱ�����񣨸���������߱������ȡ��
function tbChangeDestiny:completeMission_Killer(tbPlayers)
	
	if self:isCarryOn() ~= 1 then
		return
	end
	
	if self:canJoin() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(self.nMissionID_Killer);
	local nNextStep = nil;
	
	if nMissionStep == self.nStep_accepted then
		nNextStep = self.nStep_partiallyCompleted_1;
	elseif nMissionStep == self.nStep_partiallyCompleted_1 then
		nNextStep = self.nStep_partiallyCompleted_2;
	elseif nMissionStep == self.nStep_partiallyCompleted_2 then
		nNextStep = self.nStep_partiallyCompleted_3;
	elseif nMissionStep == self.nStep_partiallyCompleted_3 then
		nNextStep = self.nStep_completed;
	end
	
	if nNextStep ~= nil then
		self:setMissionInfo(self.nMissionID_Killer, nNextStep, nMissionDate);
	end
	
	if nNextStep == self.nStep_completed then
		Msg2Player("��i hi�p �� ho�n th�nh nhi�m v� ��nh b�i t� ��i s�t th� c�a Th�n N�ng L�o Gia.")
	end
	
end
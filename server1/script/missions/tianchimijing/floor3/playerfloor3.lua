PlayerFloor3 = {}
PlayerFloor3.nCurCamp = 1 --���������������ʱ��Ӫ
PlayerFloor3.tbTmpCamp = {}

function PlayerFloor3:OnLeaveMap()
	SetDeathScript("")
	SetFightState(0) --��ս��״̬
	ForbidChangePK(0)
	SetPKFlag(0)
	DisabledUseTownP(0) --����ʹ�ûسǷ�
	SetTmpCamp(0)
	local szName = GetName()
	self.tbTmpCamp[szName] = nil
	local nMapId = GetWorldPos()
	local tbGame = DynamicExecute("\\script\\missions\\tianchimijing\\floor3\\gamefloor3.lua", "getglobal", "GameFloor3")	
	local tbMapCapacity = tbGame.tbMapCapacity
	if (tbMapCapacity[nMapId] ~= nil and tbMapCapacity[nMapId] > 0) then
		tbMapCapacity[nMapId] = tbMapCapacity[nMapId] - 1
	end
end

function PlayerFloor3:OnEnterMap()
	SetDeathScript("\\script\\missions\\tianchimijing\\floor3\\playerdeath.lua")	
	RemoveSkillState(987)	
	SetLogoutRV(1)
	SetFightState(1) --ս��״̬
	ForbidChangePK(1); --���ı�pk	
	SetPKFlag(1) --pk���	
	DisabledUseTownP(1) --����ʹ�ûسǷ�
	SetProtectTime(18*3) --���뱣��ʱ��
	AddSkillState(963, 1, 0, 18*3) 		
	self:SetCamp() --������ʱ��Ӫ
	local nMapId = GetWorldPos()
	local tbGame = DynamicExecute("\\script\\missions\\tianchimijing\\floor3\\gamefloor3.lua", "getglobal", "GameFloor3")	
	local tbMapCapacity = tbGame.tbMapCapacity
	if (tbMapCapacity[nMapId] == nil) then
		tbMapCapacity[nMapId] = 0
	end
	tbMapCapacity[nMapId] = tbMapCapacity[nMapId] + 1
end

function PlayerFloor3:SetCamp()
	local nTmpCamp = GetTmpCamp()
	if(nTmpCamp == 0) then --�����δ����ǰ���������ʱ��Ӫ
		local szName = GetName()
		if(self.tbTmpCamp[szName] == nil) then
			local nTeamSize = GetTeamSize()
			if nTeamSize == 0 then
				DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\tianchimijing\\floor_templet\\game.lua", "Game:WritePlayerLog", 3, "�i v�o b�n ��, t�t c� ��i ng� c� 1 ng��i")
			else
				DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\tianchimijing\\floor_templet\\game.lua", "Game:WritePlayerLog", 3, "�i v�o b�n ��, t�t c� ��i ng� c�"..nTeamSize.." ng��i")
			end
			SetTmpCamp(self.nCurCamp)
			self.tbTmpCamp[szName] = self.nCurCamp
			for i=1, nTeamSize do
				local szMemberName = CallPlayerFunction(GetTeamMember(i), GetName)
				self.tbTmpCamp[szMemberName] = self.nCurCamp
			end
			self.nCurCamp = self.nCurCamp + 1
		else
			SetTmpCamp(self.tbTmpCamp[szName])
		end
	end
end
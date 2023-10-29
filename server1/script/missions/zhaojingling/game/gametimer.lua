Include("\\script\\missions\\zhaojingling\\game\\game.lua")
Include("\\script\\lib\\objbuffer_head.lua")

Game.nInterval = 15 --��λ�� 
Game.nPassTime = 0 --�Ѿ����˶���ʱ��,��λ��
Game.nRemindInterval = 30 --ϵͳÿ30����ʾ����������ҵ�����ľ�˵�����

local szRemoteScript = "\\script\\event\\zhaojingling\\event.lua"

function Game:InitTimer()
	if self.nTimeIndex then
		DelTimer(self.nTimeIndex)
	end
	self.nPassTime = 0
	self.nTimeIndex = AddTimer(self.nInterval * 18, "Game:OnTime", 0)
end

function Game:OnTime(nTimerId, nParam)
	self.nPassTime = self.nPassTime + self.nInterval
	local nTimeDis = self.nPassTime - GAMETIME * 60
	local nValue = mod(self.nPassTime, self.nRemindInterval)
	if nValue == 0 then
		self:SortPaiMing(nTimeDis)
	end
		
	if nTimeDis >= 0 then
		--��������,ֹͣ��ʱ��
		self:Over()
		return 0, 0
	end
	
	local nNotAddMuRen = 0
	if self.nPassTime == self.nInterval then
		--������ʼǰ15���ӵ�ʱ�򲻼��ؿ���ľ��
		nNotAddMuRen = 1
	end
	
	if self.nPassTime >= (GAMETIME * 60 - self.nRemindInterval) then
		--�������30�벻���ؿ���ľ��
		nNotAddMuRen = 1
	end
	
	if nNotAddMuRen ~= 1 then
		self:AddAllMuRen() --ÿ��15�����һ�ο���ľ��
	end
	return self.nInterval * 18, 0
end

function Game:SortPaiMing(nTimeDis)
	if self.tbPlayer == nil then
		return
	end
	for key, value in self.tbPlayer do
		self:SortPaiMingOneMap(key, value, nTimeDis)
	end
end

function Game:SortPaiMingOneMap(nMapId, tbMapPlayer, nTimeDis)
	for key, value in tbMapPlayer do
		self:SortPaiMingOneRoom(nMapId, value, nTimeDis)
	end
end

function Game:SortPaiMingOneRoom(nMapId, tbRoomPlayer, nTimeDis)
	local tbPlayerName = {}
	for key, value in tbRoomPlayer do
		local nPlayerIndex = SearchPlayer(value)
		if nPlayerIndex > 0 then
			local nCount = CallPlayerFunction(nPlayerIndex, GetTask, TSK_COUNT_ONETIME)
			if nCount > 0 then
				tinsert(tbPlayerName, {value, nCount})
			end
		end
	end
	sort(tbPlayerName, self.SortCompare)
	local nIndex = 1
	for key, value in tbPlayerName do
		if key ~= "n" then
			local nPlayerIndex = SearchPlayer(value[1])
			if nPlayerIndex > 0 then
				local nCurMapId = getplayermapid(nPlayerIndex)
				if nCurMapId == nMapId then
					CallPlayerFunction(nPlayerIndex, SetTask, TSK_RANK, nIndex)
					local szMsg = format("Ng��i �� t�m ���c %d M�c Nh�n, hi�n t�i l� h�ng th� %d", value[2], nIndex)
					CallPlayerFunction(nPlayerIndex, Msg2Player, szMsg)
					local nRoomId = CallPlayerFunction(nPlayerIndex, GetTask, TSK_GROUPID)
					local szAccount = CallPlayerFunction(nPlayerIndex, GetAccount)
					WriteLog(format("[ Th�i gian M�c Nh�n:%s S� ph�ng: %d x�p h�ng:%d account: %s nh�n v�t: %s s� l��ng: %s", GetLocalDate("%Y-%m-%d %H:%M"), nRoomId, nIndex, szAccount, value[1], value[2]))
					nIndex = nIndex + 1
					if nTimeDis >= 0 then --һ�ֽ�����ʱ��
						self:AddMuRenCount(value[1], value[2])
					end
				end
			end
		end
	end
end

--���ҵ�����ľ�˵������Ӵ�С����
Game.SortCompare = function(tbA, tbB)
	return tbA[2] > tbB[2]
end

function Game:AddMuRenCount(szName, nCount)
	if nCount == 0 then
		return
	end
	local obj = ObjBuffer:New()
	obj:Push(szName)
	obj:Push(nCount)
	RemoteExecute(%szRemoteScript, "tbJingLing:g2s_AddCount", obj.m_Handle)
	obj:Destroy()
end

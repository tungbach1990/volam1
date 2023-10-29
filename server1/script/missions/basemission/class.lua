Include("\\script\\lib\\baseclass.lua")
Include("\\script\\missions\\basemission\\lib.lua")
IncludeLib("SETTING")
if not tbBaseMission then
	tbBaseMission = tbBaseClass:new()
end


--���ʼ��������tbMissionData���key��value��������Ӧ��key��value
function tbBaseMission:_init(tbMissionData)
	if not tbMissionData then
		return 
	end
	for i,j in tbMissionData do
		self[i] = j
	end
	
	self.TSK_MAP_ID	= 2323
	self.TSK_MAP_X	= 2324
	self.TSK_MAP_Y	= 2325
end




--Mission�ĳ�ʼ����ֻ��Ҳֻ��InitMission��ʹ��
function tbBaseMission:Init()
	if GetMissionV(self.tbMissionV.MISSION_STATE) ~= 0 then
		self:Close()
	end
	
	for i = 1, getn(self.tbTimer) do
		StartMissionTimer(self.nMissionId, self.tbTimer[i][1], self.tbTimer[i][2]); --
	end
	
	if self.OnInit then
		self:OnInit()
	end
end

--���ݲ�ͬ��Mission�������أ�����Ҫ����Mission_state��ֵ
function tbBaseMission:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)
end

--Mission��ִ�У��ɳ���ͨ��RunMission���ã��ű�������
function tbBaseMission:Run()
	
--	local nMapIndex = SubWorldID2Idx(self.nMapId)
--��Ϊ�Ե�ǰsubworld��ִ��
	if SubWorld >= 0 then
		doFunInWorld(SubWorld, self.OnRun, self)
	end
end

--�뿪��Ϸ���ɳ���ͨ��Mission�е�OnLeave���ã�
function tbBaseMission:LeaveGame()
	
--	local nMapIndex = SubWorldID2Idx(self.nMapId)
--��Ϊ�Ե�ǰsubworld��ִ��
	if SubWorld >= 0 then
		return doFunInWorld(SubWorld, self.OnLeave, self)	
	end
	return -1
end

--Mission�ر�ʱ�Ĵ���������Ҫ����
function tbBaseMission:OnClose()
	print("tbBaseMission:OnClose()")
end

--��������
function tbBaseMission:Close()
	if self.OnClose then
		self:OnClose()
	end
	
	for _, nMissionVId in self.tbMissionV do		
		SetMissionV(nMissionVId, 0);
	end
	
	for _, nMissionSId in self.tbMissionS do		
		SetMissionS(nMissionSId, "")
	end
	
	for i = 1, getn(self.tbTimer) do
		StopMissionTimer(self.nMissionId, self.tbTimer[i][1], self.tbTimer[i][2]); --
	end
end

--��Ҽ���
function tbBaseMission:PlayerJoin(nPlayerIndex, nGroupId)
	if doFunByPlayer(nPlayerIndex, self.OnPlayerJoin, self ) == 1 then
		doFunByPlayer(nPlayerIndex, AddMSPlayer, self.nMissionId, nGroupId)
		return 1;
	end
	return 0;
end

--��Ҽ���missionʱ��Ҫ���Ĵ���������Ҫ����
function tbBaseMission:OnPlayerJoin()
	print("tbBaseMission:OnPlayerJoin()")
end


--�õ�������ڵ�GroupId,�������Ҫ����
function tbBaseMission:GetGroupId()
	return 0	
end
--����뿪Mission�Ĵ���������Ҫ����
function tbBaseMission:OnLeave()
	print("tbBaseMission:OnLeave()")
end

--��ʱ����������Ҫ����
function tbBaseMission:OnTimer()
	print("tbBaseMission:OnTimer()")
end

--ִ��ʱ��������Ҫ��������
function tbBaseMission:OnRun()
	print("tbBaseMission:OnRun()")
end

function tbBaseMission:output(szMsg)
	print(szMsg)
end

function tbBaseMission:Debug(...)
	call(print,arg)
end
------------�ⲿ���ã���Ҫ������ǰ��SubWorld

--�������еĵ�ͼ��Mission
function tbBaseMission:StartGame()
	
	if self.tbMapId then
		for i=1, getn(self.tbMapId) do
			self:StartGameInMap(self.tbMapId[i])
		end
	elseif self.nMapId and not self.tbMapId then
		self:StartGameInMap(self.nMapId)
	end
	return 1
end
--����ĳ����ͼ��Mission
function tbBaseMission:StartGameInMap(nMapId)
	
	
	local nMapIndex = SubWorldID2Idx(nMapId)

	if nMapIndex >= 0 then
		
		
		
		if self:GetMissionV(self.tbMissionV.MISSION_STATE, nMapId) ~= 0 then
			self:Debug("B�n ��"..nMapId.."��Mission�ϴ�û�йر�")
			self:CloseGameInMap(nMapId)
		end
		doFunInWorld(nMapIndex, OpenMission, self.nMissionId)
		return 1
	else
		return 0
	end
end


--�ر����е�ͼ�ϵ�Mission
function tbBaseMission:CloseGame()
	if self.tbMapId then
		for i=1, getn(self.tbMapId) do
			self:CloseGameInMap(self.tbMapId[i])
		end
	elseif self.nMapId and not self.tbMapId then
		self:CloseGameInMap(self.nMapId)
	end
end

--�ر�ĳ����ͼ�ϵ�Mission
function tbBaseMission:CloseGameInMap(nMapId)
	local nMapIndex = SubWorldID2Idx(nMapId)
	
	if nMapIndex >= 0 then
		doFunInWorld(nMapIndex, CloseMission, self.nMissionId )
	end
end

--��ĳ����Ҽ���ĳ����ͼ��Mission��
--���nMapId�ǿյģ���ôĬ��Ϊself.nMapId,
--����Ƕ����ͼ�����mission��ôһ��Ҫ�� nMapId�������
function tbBaseMission:JoinGame(nPlayerIndex, nGroupId, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, self.PlayerJoin, self, nPlayerIndex, nGroupId)	
	end
	return -1;
end

--���ĳ����ͼ��Mission Value��
--���nMapId�ǿյģ���ôĬ��Ϊself.nMapId,
--����Ƕ����ͼ�����mission��ôһ��Ҫ�� nMapId�������
function tbBaseMission:GetMissionV(nVId, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, GetMissionV, nVId)
	end
	return 0
end
--���ĳ����ͼ��Mission String��
--���nMapId�ǿյģ���ôĬ��Ϊself.nMapId,
--����Ƕ����ͼ�����mission��ôһ��Ҫ�� nMapId�������
function tbBaseMission:GetMissionS(nSId, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, GetMissionS, nSId)
	end
	return ""
end
--����ĳ����ͼ��Mission Value��
--���nMapId�ǿյģ���ôĬ��Ϊself.nMapId,
--����Ƕ����ͼ�����mission��ôһ��Ҫ�� nMapId�������
function tbBaseMission:SetMissionV(nVId, nValue, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, SetMissionV, nVId, nValue)
	end
	return 0
end
--����ĳ����ͼ��Mission String��
--���nMapId�ǿյģ���ôĬ��Ϊself.nMapId,
--����Ƕ����ͼ�����mission��ôһ��Ҫ�� nMapId�������
function tbBaseMission:SetMissionS(nSId, szValue, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, SetMissionS, nSId, szValue)
	end
	return ""
end
--�õ�ĳ����ͼ��Mission��״̬
--���nMapId�ǿյģ���ôĬ��Ϊself.nMapId,
--����Ƕ����ͼ�����mission��ôһ��Ҫ�� nMapId�������
function tbBaseMission:GetMissionState(nMapId)
	return self:GetMissionV(self.tbMissionV.MISSION_STATE, nMapId)
end
--�õ�ĳ����ͼ��ĳ���������
--���nMapId�ǿյģ���ôĬ��Ϊself.nMapId,
--����Ƕ����ͼ�����mission��ôһ��Ҫ�� nMapId�������
function tbBaseMission:GetMSPlayerCount(nGroupId, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, GetMSPlayerCount, self.nMissionId, nGroupId)	
	end
	return -1;	
end

function tbBaseMission:GetLastPos()
	return GetTask(self.TSK_MAP_ID), GetTask(self.TSK_MAP_X), GetTask(self.TSK_MAP_Y)
end

function tbBaseMission:SetLastPos(nMapId, nX, nY)
	
	SetTask(self.TSK_MAP_ID, nMapId)
	SetTask(self.TSK_MAP_X, nX)
	SetTask(self.TSK_MAP_Y, nY)
end

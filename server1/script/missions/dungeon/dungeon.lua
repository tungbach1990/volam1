Include("\\script\\missions\\dungeon\\dungeoninfo.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\global\\offlinelive.lua")
Include("\\script\\missions\\basemission\\lib.lua")
--Include("\\script\\lib\\baseclass.lua")

if not tbDungeonClass then
	tbDungeonClass = tbBaseClass:new()
end

function tbDungeonClass:_init(tbDungeonData)
	if not tbDungeonData then
		return 
	end
	for i,j in tbDungeonData do
		self[i] = j
	end
end

--�����ױ�����,ÿ����������һ��
tbDungeonClass.tbData = {};

if not tbTimerList then
	tbTimerList = {};
end

if not tbTimerClass then
	tbTimerClass = {};
	tbTimerClass.nDungeonId = 0;
	tbTimerClass.nInterval = 0;	--֡
	tbTimerClass.nTimerId = 0;
	tbTimerClass.pFunction = nil;
	tbTimerClass.tbParam = {}
end

function OnDungeonTimer(nTimerId)
	local timer = tbTimerList[nTimerId];
	local nRetInterval = 0;
	if (timer ~= nil and timer.nDungeonId ~= nil and
		 timer.pFunction ~= nil and type(timer.pFunction) == "function" and
		 timer.nInterval ~= nil and timer.nInterval >= 1) then
		
		local tbD = tbDungeonInfo:GetDungeon(timer.nDungeonId);
		if (tbD ~= nil) then
			local tbParam = {tbD, timer.nInterval}
			if (timer.tbParam ~= nil and type(timer.tbParam) == "table") then
				for varKey, varValue in timer.tbParam do
					tinsert(tbParam, varValue);
				end
			end
			nRetInterval = call(timer.pFunction, tbParam);
			timer.nInterval = nRetInterval;
			--nRetInterval = timer.pFunction(tbD, timer.nInterval);
		end
	end
	
	if (nRetInterval == nil or nRetInterval < 1) then
		tbTimerList[nTimerId] = nil;
		nRetInterval = 0;
	end
	return nRetInterval, timer.nTimerId;
end

function tbTimerList:AddTimer(nDungeonId, tbTimer)
	if (tbTimer ~= nil and tbTimer.nInterval ~= nil and tbTimer.nInterval >= 1) then
		tbTimer.nTimerId = getn(tbTimerList) + 1;
		tbTimerList[tbTimer.nTimerId] = clone(tbTimer);
		AddTimer(tbTimer.nInterval, "OnDungeonTimer", tbTimer.nTimerId);
		return tbTimer.nTimerId;
	end
	return 0;
end

function tbTimerList:DelTimer(nTimerId)
	local timer = tbTimerList[nTimerId];
	if (timer ~= nil) then
		timer.nInterval = 0;
	end
end

-- ���������Ƿ��ܿ�һ���µĸ���,������
function tbDungeonClass:CheckOpenDungeonServerLimit()
	return 1;
end

function tbDungeonClass:OpenDungeon(tbDungeonData)
	--self:StartGame();
			
	--���npc�͵���
	ClearMapObj(self.nDungeonId);
	ClearMapNpc(self.nDungeonId);
	
	if (self.OnDungeonOpen) then
		return self:OnDungeonOpen(tbDungeonData);
	end
	return 1;
end

--Ҫ��������Ҵ�������
function tbDungeonClass:CloseDungeon()
	for i = 1, getn(self.tbMember) do
		if (self.tbMember[i].bInDungeon == 1) then
			doFunByPlayer(self.tbMember[i].nIndex, self.OnLeaveMap, self)	
		end
	end
	
	if (self.OnDungeonClose) then
		self:OnDungeonClose();
	end
	
	--���npc�͵���
	ClearMapObj(self.nDungeonId);
	ClearMapNpc(self.nDungeonId);

	--self:CloseGame();
	return 1;
end

--function  tbDungeonClass:Timer()
--	self.nTimerCount = self.nTimerCount + self.nTimerInterval;
	
--	for i = 1, getn(self.tbMember) do
--		if (self.tbMember[i].bInDungeon == 1) then
--			self.tbMember[i].nTime = self.tbMember[i].nTime + self.nTimerInterval;
--		end
--	end
	
--	if (self.OnTimer) then
--		self:OnTimer();
--	end
	
--	return 1;
--end

-- ����Ҫ����
function tbDungeonClass:OnDungeonOpen()
	return 1;
end

-- ����Ҫ����
function tbDungeonClass:OnDungeonClose()
	return 1;
end

-- ����Ҫ����
function tbDungeonClass:OnTimer()
	return 1;
end

-- ����Ҫ����
function tbDungeonClass:OnAddMember(strMemberName)
	return 1;
end

-- ����Ҫ����
function tbDungeonClass:OnApplyJoin()
	return 1;
end

-- ����Ҫ����
function tbDungeonClass:OnDelMember()
	return 1;
end

-- ����Ҫ����
function tbDungeonClass:OnEnterMap()
	return 1;
end

-- ����Ҫ����
function tbDungeonClass:OnLeaveMap()
	return 1;
end

--����ģ����Ϣ
tbDungeonClass.strDungeon = "BaseDungeon"
tbDungeonClass.nTimerInterval = 1
tbDungeonClass.nTimerCount = 0
tbDungeonClass.bHiden = 0	--�����Ƿ�ɼ�

--���ݲ�ͬ��Mission�������أ�����Ҫ����Mission_state��ֵ
function tbDungeonClass:OnInit()
	--SetMissionV(self.tbMissionV.MISSION_STATE, 1);
end

function tbDungeonClass:OnClose()
	return self:OnDungeonClose();
end

function tbDungeonClass:CheckPlayerCanJoin()
	local strName = GetName();
	if (self.tbMember ~= nil) then
		for i = 1, getn(self.tbMember) do
			if (self.tbMember[i].strName == strName) then
					return 1;
			end
		end
	end
	return 0;
end

--��Ҽ���missionʱ��Ҫ���Ĵ���������Ҫ����
function tbDungeonClass:OnPlayerJoin()
	local strName = GetName();

	if (self.tbMember ~= nil) then
		for i = 1, getn(self.tbMember) do
			if (self.tbMember[i].strName == strName) then
				if (self.tbMember[i].bInDungeon == 1) then
					return 1;
				end
				
				self.tbMember[i].bInDungeon = 1;
				if (self:OnEnterMap() == 1) then
					self.tbMember[i].bInDungeon = 1;
					return 1;
				else
					self.tbMember[i].bInDungeon = 0;
				end
			end
		end
	end
	WriteLog(format("[%s] [%s] enter [%s]'s %s dungeon(id:%0.f) failed.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, 
					self.strOwner, self.strDungeon, self.nDungeonId));
	return 0;
end

--����뿪ʱ�������״̬Ĭ�ϲ���
function tbDungeonClass:OnLeaveSetState()

	SetFightState(0);
	SetTaskTemp(200, 0);	--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	ForbidChangePK(0);
	DisabledUseTownP(0);	--��ֹʹ�ûس̣�
	SetPKFlag(0);
	SetCurCamp(GetCamp());
	DisabledStall(0);
	ForbidEnmity(0);
end

--����뿪ʱ�������״̬Ĭ�ϴ���
function tbDungeonClass:OnLeaveTrans()

	NewWorld(11, 3143, 5065);
end

--����뿪Mission�Ĵ���������Ҫ����
function tbDungeonClass:OnLeave()
	local strName = GetName();

	if (self.tbMember ~= nil) then
		for i = 1, getn(self.tbMember) do
			if (self.tbMember[i].strName == strName) then
				self.tbMember[i].bInDungeon = 0;
				if (self:OnLeaveMap() == 1) then
					self.tbMember[i].bInDungeon = 0;
					return 1;
				else
					self.tbMember[i].bInDungeon = 1;
					WriteLog(format("[%s] [%s] leave [%s]'s %s dungeon(id:%0.f) failed", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, 
							self.strOwner, self.strDungeon, self.nDungeonId));
					return 0;
				end
			end
			
		end
	end
	
	WriteLog(format("[%s] [%s] stuck in dungeon", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName));
	
	self:OnLeaveSetState();
	self:OnLeaveTrans();

	--WriteLog(format("[%s] [%s] leave %s dungeon failed", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, self.strDungeon));
	return 0;
end
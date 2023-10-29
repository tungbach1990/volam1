Include("\\script\\lib\\pay.lua")
Include("\\script\\missions\\basemission\\class.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\missions\\killbossmatch\\class.lua")

local tbMissionData = 
{
	nMissionId	= 68,--
	tbTimer		= {{112,18*5}},--��ʱ��Id98 1��һ��
	tbMapId		= {906},--Ĭ�ϵ�ͼ
	nReadyTime = 60*5,
	nMaxPlayerCount = 200,
	nMinLevel = 120,
	
	nPlayerCountPerGroup = 20,
	TSK_nCountPerDay = 1864,
	TSK_IsUsePerDay = 1914
}

tbMissionData.tbMissionV = 
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	CUR_MAPID		= 3,
}

tbMissionData.tbMissionS = {}


if not tbKillBossMatch_ready then
	tbKillBossMatch_ready = tbBaseMission:new(tbMissionData)
end

function tbKillBossMatch_ready:OnInit()
	
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)
	local nMapId = SubWorldIdx2ID(SubWorld)
	SetMissionV(self.tbMissionV.CUR_MAPID, nMapId)
end


function tbKillBossMatch_ready:GotoReadyScene()
	local nMapId = self.tbMapId[1]
	for i=1, getn(self.tbMapId) do
		if SubWorldID2Idx(self.tbMapId[i]) >= 0 then
			nMapId = self.tbMapId[i]
			break
		end
	end	
	
	self:SetLastPos(GetWorldPos())
	
	nPosX, nPosY = getadatatow("\\settings\\maps\\chrismas\\player.txt", 2, 15);
	NewWorld(nMapId, floor(nPosX/32), floor(nPosY/32))
end

function tbKillBossMatch_ready:_CheckMission()
	local nMissionState = GetMissionV(self.tbMissionV.MISSION_STATE)
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	print(nMissionState)
	if nMissionState ~= 1 then
		Msg2Player("<color=yellow>Hi�n t�i kh�ng ph�i l� th�i gian b�o danh<color>")
		return
	end
	if self.nMaxPlayerCount and nPlayerCount > self.nMaxPlayerCount then
		Msg2Player("S� ng��i tham gia ho�t ��ng n�y �� ��, b�n h�y tham gia ��t sau!")
		return 
	end
	return 1
end

function tbKillBossMatch_ready:OnPlayerJoin()
	
	
	if self:_CheckMission() ~= 1 or self:IsPlayerEligible() ~= 1 then
		self:GotoSignUpPlace()
		return 0
	end
	
	SetTaskTemp(200, 1);		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetLogoutRV(1);	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetPunish(0);		--�������ͷ�
	SetCreateTeam(0);	--�ر���ӹ���
	ForbidEnmity(1)	--���ó�ɱ
	DisabledStall(1);	--��ֹ����;
	ForbitTrade(0);
	ForbidChangePK(1);
	DisabledUseTownP(1);	--��ֹʹ�ûس̣�
	SetFightState(0);
	SetPKFlag(0)
	SetCurCamp(1);
	
	return 1
end


function tbKillBossMatch_ready:OnLeave()

	SetTaskTemp(200,0);
	SetFightState(0);
	SetPunish(1);
	SetCreateTeam(1);
	ForbidEnmity( 0 )
	SetPKFlag(0)
	DisabledStall(0);
	ForbitTrade(0);
	SetCurCamp(GetCamp());
	ForbidChangePK(0);
	DisabledUseTownP(0);	--��ֹʹ�ûس̣�
end




function tbKillBossMatch_ready:OnTimer()
	local nMapId = GetMissionV(self.tbMissionV.CUR_MAPID)
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	local nMissionState = GetMissionV(self.tbMissionV.MISSION_STATE)	
	nTimerCount = nTimerCount + 5
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
	
	
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	
	
	if nTimerCount < self.nReadyTime then
		local szMsg	= format("Th�i gian chu�n b� c�n <color=yellow>%d<color> gi�y", self.nReadyTime - nTimerCount)
		if mod(nTimerCount, 10) == 0 then
			Msg2MSAll(self.nMissionId, szMsg);
		end
		return 
	end
	
	if nTimerCount >= self.nReadyTime then		
		if tbKillBossMatch:StartGame() == 1 then
			self:GroupingPlayer()
		end
		return self:CloseGameInMap(nMapId)
	end
end



function tbKillBossMatch_ready:_GetPlayerTable(nGroupId)
	local pidx			= 0
	local idx			= 0
	local tbPlayer		= {}
	nGroupId = nGroupId or 0
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, nGroupId)
	
	for i = 1, nPlayerCount do
		idx, pidx = GetNextPlayer(self.nMissionId, idx, nGroupId);
		if (pidx > 0) then
			tbPlayer[i] = {}
			tbPlayer[i].nIndex = pidx	
		end;
		
		if (idx == 0) then
			break;
		end;
	end
	return tbPlayer
end


function tbKillBossMatch_ready:GroupingPlayer()
	local tbPlayer = self:_GetPlayerTable(0)
	self:ChaosTable(tbPlayer)
	local j = 1;
	for i=1, getn(tbPlayer) do
		doFunByPlayer(tbPlayer[i].nIndex, self.GotoMarchScene, self, j)
		if mod(i, self.nPlayerCountPerGroup) == 0 then
			j = j + 1
		end
	end
end

function tbKillBossMatch_ready:KickAllPlayer()
	local tbPlayer = self:_GetPlayerTable(0)
	for i=1, getn(tbPlayer) do
		doFunByPlayer(tbPlayer[i].nIndex, self.GotoSignUpPlace, self)
	end
end

function tbKillBossMatch_ready:OnClose()		
	SetMissionV(self.tbMissionV.MISSION_STATE, 3)
	Msg2MSAll(self.nMisssionId, "Kh�ng ���c ph�p di chuy�n ��n b�n �� kh�c.")
	self:KickAllPlayer()
end

function tbKillBossMatch_ready:GotoMarchScene(nGroupId)
	
	tbKillBossMatch:GotoMarchScene(nGroupId)
	
end

function tbKillBossMatch_ready:GotoSignUpPlace()
	local nMapId, nPosX, nPosY = self:GetLastPos()
	if nMapId == 0 or nPosX == 0 or nPosY == 0 then
		nMapId = 11
		nPosX = 3143
		nPosY = 5065
	end
	NewWorld(nMapId, nPosX, nPosY)
end

function tbKillBossMatch_ready:ChaosTable(tb)
	local nCount = getn(tb)
	for i = 1, nCount do 
		local j = random(1,nCount)
		tb[i], tb[j] = tb[j], tb[i];
	end
end

function tbKillBossMatch_ready:IsPlayerEligible()
	
	if PlayerFunLib:CheckIsTransLife("") ~= 1 and PlayerFunLib:CheckLevel(self.nMinLevel, "", ">=") ~= 1 then
		Msg2Player(format("C�p %d tr� l�n ho�c nh�n v�t �� chuy�n sinh m�i c� th� tham gia ho�t ��ng", self.nMinLevel))
		return 
	end
	
	if PlayerFunLib:IsCharged("Ph�i n�p th� m�i c� th� tham gia") ~= 1 then
		return 
	end
	
	--TSK_IsUsePerDay
	
	if PlayerFunLib:GetTaskDailyCount(self.TSK_nCountPerDay) >= 1 + PlayerFunLib:GetTaskDailyCount(self.TSK_IsUsePerDay) then
	
		Msg2Player("M�i ng�y m�i nh�n v�t ch� ���c tham gia 1 l�n ho�t ��ng m�a an l�nh")
		return
	end
	
	
	return 1
end

function tbKillBossMatch_ready:WriteLog(szMsg)
	
	WriteLog(format("[%s]\t%s\t%s.", "wabao mission",GetLocalDate("%Y-%m-%d %H:%M"), szMsg))
end
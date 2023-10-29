if huashanqunzhan_tbReady then
--	return 
end

Include("\\script\\missions\\huashanqunzhan\\huashanqunzhan.lua")

local tbMissionData = 
{
	nLatencyTime		= 15,
}
tbMissionData.tbMissionV =
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	RANK_COUNTER	= 3,	
}
tbMissionData.tbMissionS = 
{
	
}
huashanqunzhan_tbReady = huashanqunzhan:new(tbMissionData, huashanqunzhan) --�ӻ���̳�����




huashanqunzhan_tbReady.tbWaitPos = 
{
	{1589, 3029},
	{1595, 2964},
	{1582, 2972},
	{1562, 2946},
	{1560, 2965},
	{1558, 2989},
	{1569, 3029},
}

function huashanqunzhan_tbReady:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)	
end

function huashanqunzhan_tbReady:OnRun()
	SetMissionV(self.tbMissionV.MISSION_STATE, 2)
end

function huashanqunzhan_tbReady:OnPlayerJoin()
	--���͵�׼����
	local nMissionState = GetMissionV(self.tbMissionV.MISSION_STATE)
	
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	
	if nMissionState ~=1 and nMissionState ~= 2 then
		self:GotoSignUpPlace()
		Msg2Player("Tr�n ��u v�n ch�a b�t ��u.")
		return Say("Tr�n ��u v�n ch�a b�t ��u.", 0)
	end 
	
	

	if nPlayerCount >= self.nPlayerCountLimit then
		self:GotoSignUpPlace()
		Msg2Player("S� ng��i tham gia ho�t ��ng n�y �� ��, b�n h�y tham gia ��t sau!")
		return Say("S� ng��i tham gia ho�t ��ng n�y �� ��, b�n h�y tham gia ��t sau!", 0)
	end
	
	if GetLevel() < self.tbLevelLimit[1] then
		self:GotoSignUpPlace()
		Msg2Player(format("Ch�a �� c�p %s, kh�ng th� tham gia l�i ��i c�p b�c n�y.", self.tbLevelLimit[1]))
		return Say(format("Ch�a �� c�p %s, kh�ng th� tham gia l�i ��i c�p b�c n�y.", self.tbLevelLimit[1]), 0)
	elseif self.tbLevelLimit[2] and GetLevel() > self.tbLevelLimit[2] then
		self:GotoSignUpPlace()
		Msg2Player(format("B�n �� v��t c�p %s, kh�ng th� tham gia l�i ��i c�p b�c n�y.", self.tbLevelLimit[2]))
		return Say(format("B�n �� v��t c�p %s, kh�ng th� tham gia l�i ��i c�p b�c n�y.", self.tbLevelLimit[2]), 0)
	end
	if GetCash() < self.nMoney then
		self:GotoSignUpPlace()
		Msg2Player("Kh�ng �� ng�n l��ng.")
		return Say("Kh�ng �� ng�n l��ng.", 0)
	end
	--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetTaskTemp(200,1);
	--���÷�ս��״̬ 
	SetFightState(0);
	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetLogoutRV(1);
	--�������ͷ�
	SetPunish(0);
	--�ر���ӹ���
	SetCreateTeam(0);
	LeaveTeam()
	--��ֹ��ɱ
	ForbidEnmity( 1 )
	--��PK���� 
	--��ʼӦ�ö�����PK
	SetPKFlag(0)
	--��ֹ����;
	DisabledStall(1);
	ForbitTrade(0);
	ForbidChangePK(1);
	DisabledUseTownP(1);	--��ֹʹ�ûس̣�
	SetCurCamp(4);	--������ʱ��Ӫ
	return 1;
end

function huashanqunzhan_tbReady:OnLeave()
	
	--�ر����������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetTaskTemp(200,0);
	--����ս��״̬
	SetFightState(0);
	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	--SetLogoutRV(0);
	--�����ͷ�
	SetPunish(1);
	--������ӹ���
	SetCreateTeam(0);
	--��PK���� 
	
	--���ó�ɱ
	ForbidEnmity( 0 )
	--��ʼӦ�ö�����PK
	SetPKFlag(0)
	--�رս�ֹ����;
	DisabledStall(0);
	ForbitTrade(0);
	
	local nCamp = GetCamp();
	SetCurCamp(nCamp);
	
	ForbidChangePK(0);
	DisabledUseTownP(0);	--�رս�ֹʹ�ûس̣�
	
end

function huashanqunzhan_tbReady:OnTimer()
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	
	nTimerCount = nTimerCount + 1
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
	local szMsg = format("C�n <color=yellow>%d<color> ph�t n�a tr�n ��u s� b�t ��u.", self.nLatencyTime - nTimerCount)
	
	
	if nTimerCount == self.nLatencyTime then
		return self:CloseGame()
	end
	Msg2MSAll(self.nMissionId, szMsg)
	
end

function huashanqunzhan_tbReady:OnClose()
	SetMissionV(self.tbMissionV.MISSION_STATE, 3)
	local pidx			= 0
	local idx			= 0
	local tbPlayer		= {}
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, 0)
	if (nPlayerCount <= 0) then
		return
	end;
	local bIsOpen = -1
	if nPlayerCount >= self.nMinPlayerCountLimit then
		bIsOpen = self.tbRef:StartGame()
	end
	
	
	for i = 1, nPlayerCount do
		idx, pidx = GetNextPlayer(self.nMissionId, idx, 0);
		if (pidx > 0) then
			tinsert(tbPlayer, pidx)
		end;
		
		if (idx == 0) then
			break;
		end;
	end
	--self.tbRef:SetMissionV(self.tbRef.tbMissionV.PLAYER_COUNT, getn(tbPlayer));�����������ã����ܳ�������
	for i = 1, getn(tbPlayer) do
		if bIsOpen ~= 1 then
			doFunByPlayer(tbPlayer[i], self.GotoSignUpPlace, self)
			if nPlayerCount >= self.nMinPlayerCountLimit then
				doFunByPlayer(tbPlayer[i], Msg2Player, "���ng �i ph�a tr��c kh�ng th�ng, h�y ��i cu�c �ua sau.")
			else
				doFunByPlayer(tbPlayer[i], Msg2Player, format("S� ng��i tham gia �t h�n %d, tr�n ��u kh�ng th� b�t ��u.",self.nMinPlayerCountLimit))
			end
		else
			local nX, nY = getadata("\\settings\\maps\\huashanqunzhan\\huashanjingji.txt")
			doFunByPlayer(tbPlayer[i], NewWorld, self.tbRef.nMapId, nX, nY)	
		end
		
	end
end

function huashanqunzhan_tbReady:GotoReadyPlace()
	local nRandId = random(1, getn(self.tbWaitPos))
	NewWorld(self.nMapId, self.tbWaitPos[nRandId][1], self.tbWaitPos[nRandId][2])
end


function huashanqunzhan_tbReady:CheckMathState()
	local nReadyState = self:GetMissionState()
	local nState = self.tbRef:GetMissionState()
	if (nReadyState ~= 1 and nReadyState ~= 2) then
		return  0 - nState
	else
		return 1
	end
end
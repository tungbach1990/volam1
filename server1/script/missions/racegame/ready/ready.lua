if racegame_tbReadyMission then
	return 
end
Include("\\script\\event\\jiefang_jieri\\200804\\taskctrl.lua")
Include("\\script\\missions\\racegame\\racegame.lua")
Include("\\script\\missions\\racegame\\base\\head.lua")
Include("\\script\\lib\\mem.lua")

racegame_tbReadyMission = new(tbMission)

racegame_tbReadyMission.nMissionId = 52 
racegame_tbReadyMission.tbTimer =  {{90, 18*1}}
racegame_tbReadyMission.nLatencyTime = 60     -- �ȴ�ʱ��60��
racegame_tbReadyMission.nSignUpTime = 50     -- 50����ܱ���
racegame_tbReadyMission.nMapId = 582     -- ��ͼId
racegame_tbReadyMission.nPlayerCountLimit = 120     -- ���120�˲μ�
racegame_tbReadyMission.nLevelLimit	= 50
racegame_tbReadyMission.tbWaitPos = 
{
	{1589, 3029},
	{1595, 2964},
	{1582, 2972},
	{1562, 2946},
	{1560, 2965},
	{1558, 2989},
	{1569, 3029},
}
racegame_tbReadyMission.tbMissionV =
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	
}

racegame_tbReadyMission.tbMissionS =
{
	
}


function racegame_tbReadyMission:OnTimer()
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	
	nTimerCount = nTimerCount + 1
	local szMsg = format("Th�i gian c�n l�i l� <color=yellow>%d<color> gi�y.", self.nLatencyTime - nTimerCount)
	
	if nTimerCount >= self.nSignUpTime and GetMissionV(self.tbMissionV.MISSION_STATE) ~= 3 then
		SetMissionV(self.tbMissionV.MISSION_STATE, 3)
		gb_SetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState, 3)
	end
	
	
	if nTimerCount >= self.nLatencyTime then
		self:CloseGame()
		return
	elseif nTimerCount >= self.nLatencyTime - 10 or mod(nTimerCount, 10) == 0 or nTimerCount == 1 then
		Msg2MSAll(self.nMissionId, szMsg)
	end
	
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
end



function racegame_tbReadyMission:OnClose()
	gb_SetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState, 0)
	local pidx			= 0
	local idx			= 0
	local tbPlayer		= {}
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, 0)
	if (nPlayerCount <= 0) then
		return
	end;
	local bIsOpen = racegame_tbMission:StartGame()
	for i = 1, nPlayerCount do
		idx, pidx = GetNextPlayer(self.nMissionId, idx, 0);
		if (pidx > 0) then
			tinsert(tbPlayer, pidx)
			
		end;
		
		if (idx == 0) then
			break;
		end;
	end
	for i = 1, getn(tbPlayer) do
		if bIsOpen ~= 1 then
			doFunByPlayer(tbPlayer[i], jiefang_0804_ResetTask)
			local nPlayerMapId = doFunByPlayer(tbPlayer[i], GetTask, jiefang_0804_TSK_MapId)
			if nPlayerMapId == 0 then
				nPlayerMapId = 524
			end
			doFunByPlayer(tbPlayer[i], NewWorld, nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
			doFunByPlayer(tbPlayer[i], Msg2Player, "���ng �i ph�a tr��c kh�ng th�ng, h�y ��i cu�c �ua sau.")
		else
			local nX, nY = getadata("\\settings\\battles\\maps\\river\\��Ӫ2.txt")
			doFunByPlayer(tbPlayer[i], NewWorld, racegame_tbMission.nMapId, nX/32, nY/32)	
		end
		
	end
	
end


function racegame_tbReadyMission:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)
	gb_SetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState, 1)
	
end

function racegame_tbReadyMission:OnRun()
	SetMissionV(self.tbMissionV.MISSION_STATE, 2)
	gb_SetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState, 2)
end

function racegame_tbReadyMission:OnPlayerJoin()
	--���͵�����
	local nPlayerCount = GetMSPlayerCount(self.nMissionId, 0)
	if nPlayerCount >= self.nPlayerCountLimit or GetLevel() < self.nLevelLimit then	
		jiefang_0804_ResetTask()
		local nPlayerMapId = GetTask(jiefang_0804_TSK_MapId)
		if nPlayerMapId == 0 then
			nPlayerMapId = 524
		end
		NewWorld(nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
		if nPlayerCount >= self.nPlayerCountLimit then
			Msg2Player("S� ng��i tham gia ho�t ��ng n�y �� ��, b�n h�y tham gia ��t sau!")
			Say("S� ng��i tham gia ho�t ��ng n�y �� ��, b�n h�y tham gia ��t sau!", 0)
		elseif GetLevel() < self.nLevelLimit then
			Msg2Player(format("��ng c�p kh�ng �� %s, kh�ng th� tham gia ho�t ��ng.", self.nLevelLimit))
			Say(format("��ng c�p kh�ng �� %s, kh�ng th� tham gia ho�t ��ng.", self.nLevelLimit), 0)
		end
		return 0
	end
	
	ForbitSkill(1);
	SetMoveSpeed(18);

	--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetTaskTemp(200,1);
	--����ս��״̬
	SetFightState(0);
	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetLogoutRV(1);
	--�������ͷ�
	SetPunish(0);
	--�ر���ӹ���
	SetCreateTeam(0);
	
	--��ֹ�⻷
	ForbitAura(1)
	--���ó�ɱ
	ForbidEnmity( 1 )
	--��PK���� 
	--��ʼӦ�ö�����PK
	SetPKFlag(0)
	--��ֹ����;
	DisabledStall(1);
	ForbitTrade(0);
	ForbidChangePK(1);
	DisabledUseTownP(1);	--��ֹʹ�ûس̣�
	
	return 1;
end

function racegame_tbReadyMission:OnLeave()
	ForbitSkill(0);
	SetMoveSpeed(-1);
	
	--�رս�ֹ�⻷
	ForbitAura(0)
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
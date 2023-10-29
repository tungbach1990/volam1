if racegame_tbMission then
	return 
end

Include("\\script\\missions\\racegame\\base\\head.lua")
Include("\\script\\missions\\racegame\\lib.lua")
Include("\\script\\lib\\mem.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\taskctrl.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
racegame_tbMission = new(tbMission)

racegame_tbMission.nMissionId	= 53
racegame_tbMission.tbTimer		=  { {91, 18*10}}
racegame_tbMission.nLatencyTime	= 60*14     -- �ȴ�ʱ��14����

racegame_tbMission.nMapId		= 863     -- ��ͼId

racegame_tbMission.tbNpcList = 
{
	[1] = {szName = "�ng ch� ���ng �ua", nNpcId = 228, szScriptPath = "\\script\\missions\\racegame\\npcsaichanglaoban.lua"},
	[2] = {szName = "��o c� h� tr�", nNpcId = 1288,szScriptPath = "\\script\\missions\\racegame\\npctoolitem.lua"},
}

racegame_tbMission.tbItemList = 
{
	{szName="Gia T�c ho�n", tbProp={6, 1, 978, 1, 0, 0} },
	{szName="L�i T�c ho�n", tbProp={6, 1, 990, 1, 0, 0} },
	{szName="Huy�n Thi�n H�m T�nh", tbProp={6, 1, 982, 1, 0, 0} },
	{szName="B�ng Phong H�m T�nh", tbProp={6, 1, 984, 1, 0, 0} },
	{szName="Huy�n Hu�n H�m T�nh", tbProp={6, 1, 981, 1, 0, 0} },
	{szName="S��ng Gi�ng H�m T�nh", tbProp={6, 1, 983, 1, 0, 0} },
	{szName="B�ng S��ng Hi�u gi�c ", tbProp={6, 1, 979, 1, 0, 0} },
	{szName="B�o L�i Hi�u gi�c", tbProp={6, 1, 980, 1, 0, 0}},
	{szName="��n ��a ph� ", tbProp={6, 1, 987, 1, 0, 0} },
}



racegame_tbMission.G_TSK_NAME			= "racegame"
racegame_tbMission.ReadyMissionState	= 1
racegame_tbMission.MissionState			= 2




racegame_tbMission.tbSignUpPos = {1592+4,3264+8}
racegame_tbMission.tbMissionV =
{
	MISSION_STATE	= 1,
	SECOND_COUNTER	= 2,
	RANK_COUNTER	= 3,	
}

racegame_tbMission.tbMissionS =
{
	
}





function racegame_tbMission:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)

	gb_SetTask(self.G_TSK_NAME, self.MissionState, 1)
	self:AddGoalNpc()
end



function racegame_tbMission:OnPlayerJoin()
	ForbitSkill(1);
	SetMoveSpeed(5);
	jiefang_0804_ResetTask()
	SetTask(jiefang_0804_TSK_AwardState, 0)
	--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetTaskTemp(200,1);
	--����ս��״̬
--		SetFightState(1);
	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetLogoutRV(1);
	
	--��ֹ�⻷
	ForbitAura(1)
	SetFightState(1);
	--�������ͷ�
	SetPunish(0);
	--�ر���ӹ���
	SetCreateTeam(0);
	--��PK���� 

	--���ó�ɱ
	ForbidEnmity( 1 )
	--��ʼӦ�ö�����PK
	SetPKFlag(1)
	--��ֹ����;
	DisabledStall(1);
	ForbitTrade(0);
	
	ForbidChangePK(1);
	SetCurCamp(4);	--������ʱ��Ӫ
	DisabledUseTownP(1);	--��ֹʹ�ûس̣�
	
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	local szMsg	= format("Cu�c �ua b�t ��u, th�i gian c�n l�i l� <color=yellow>%d<color> gi�y.", self.nLatencyTime - nTimerCount)
	Msg2Player(szMsg)
	return 1
end

function racegame_tbMission:OnLeave()
	self:DelItem()

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

function racegame_tbMission:OnClose()
	gb_SetTask(self.G_TSK_NAME, self.MissionState, 0)
	Msg2MSAll(self.nMissionId, "Th�i gian �ua �� h�t, cu�c �ua k�t th�c.")
	self:ClearGoalNpc()
	self:ClearItemNpc()
	local nPlayerCount	= GetMSPlayerCount(self.nMissionId, 0)
	local tbPlayer = {}
	if (nPlayerCount <= 0) then
		return
	end;
	local idx, pidx = 0, 0;
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
		doFunByPlayer(tbPlayer[i], jiefang_0804_ResetTask)
		local nPlayerMapId = doFunByPlayer(tbPlayer[i], GetTask, jiefang_0804_TSK_MapId)
		if nPlayerMapId == 0 then
			nPlayerMapId = 524
		end
		doFunByPlayer(tbPlayer[i], NewWorld, nPlayerMapId, self.tbSignUpPos[1], self.tbSignUpPos[2])
	end
	
end

function racegame_tbMission:AddGoalNpc()
	local nX, nY = 1568*32, 2507*32
	racegame_CallNpc(self.tbNpcList[1], self.nMapId, nX, nY)
end

function racegame_tbMission:ClearGoalNpc()

	ClearMapNpcWithName(self.nMapId, self.tbNpcList[1].szName);
end

function racegame_tbMission:ClearItemNpc()

	ClearMapNpcWithName(self.nMapId, self.tbNpcList[2].szName);
end

function racegame_tbMission:AddItemNpc()

	local tbPosList = getndata("\\settings\\battles\\maps\\river\\outside.txt", 400)
	for i = 1, getn(tbPosList) do
		racegame_CallNpc(self.tbNpcList[2], self.nMapId, tbPosList[i][1], tbPosList[i][2])
	end
end

function racegame_tbMission:OnTimer()
	local nTimerCount = GetMissionV(self.tbMissionV.SECOND_COUNTER)
	nTimerCount = nTimerCount + 10
	local szMsg	= format("Th�i gian c�n l�i l� <color=yellow>%d<color> gi�y.", self.nLatencyTime - nTimerCount)
	
	if mod(nTimerCount, 100) == 10 then
		self:AddItemNpc()
		
	end
	
	if mod(nTimerCount, 100) == 20 then
		self:ClearItemNpc()
	end
	if mod(nTimerCount, 60) == 0 or nTimerCount == self.nLatencyTime - 10 then
		Msg2MSAll(self.nMissionId, szMsg)
	end
	if nTimerCount >= self.nLatencyTime then
		self:CloseGame()
		return 
	end
	
	SetMissionV(self.tbMissionV.SECOND_COUNTER, nTimerCount)
end

function racegame_tbMission:DelItem()
	for i= 1, getn(self.tbItemList) do
		local tbProp = self.tbItemList[i].tbProp
		local nItemCount = CalcItemCount(-1,tbProp[1],tbProp[2],tbProp[3],-1)
		ConsumeItem(-1,nItemCount,tbProp[1],tbProp[2],tbProp[3],-1)	
	end
	
end
--�������ǽ�ս�������֮һ�Ļ�����������û�дﵽ���޵�ǰ���£����������ͼ
--�����Ҳ��ǽ�ս�������֮һ�Ļ�����������кϷ���Ʊ�Ļ������������ͼ
-------------------------------------------------------------------------
--���Ҫ���뿪��Ϸ
function LeaveGame()
	curcamp=	GetCurCamp();
	camp = GetCamp();--�ָ�ԭʼ��Ӫ
	SetRevPos(GetPlayerRev())
	SetFightState(0)
	SetPunish(1)--����PK�ͷ�
	SetPKFlag(0)--�ر�PK����
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	SetCurCamp(camp);
	SetLogoutRV(0);--����������
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	NewWorld(OuterPos[curcamp][1], OuterPos[curcamp][2], OuterPos[curcamp][3])
end;

function GameOver()
	local OldPlayer = PlayerIndex;
	local PTab = {};
	for i = 1, 1000 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	local PCount = getn(PTab);
	
	-- �������5����һԻ�֮�����
	local tbRandPlayer = {};
	local nRandCount = 0;
	for i =1, PCount do
		if (nRandCount >= 5) then
			break
		end
		local nrand = random(PCount);
		if (not tbRandPlayer[nrand]) then
			nRandCount = nRandCount + 1;
			tbRandPlayer[nrand] = nrand;
		end
	end
	
	
	-- �������а���ǰ10��
	for i = 1, 10 do
		local szName,nZhanGong = BT_GetTopTenInfo(i, PL_TOTALPOINT);
		if szName ~= nil and szName ~= "" then
			local nTopPlayerIdx = SearchPlayer(szName);
			if (nTopPlayerIdx > 0) then
				PlayerIndex = nTopPlayerIdx;
				AddOwnExp(CITYWAR_TOP10_EXP);
				local szLog = format("%d �i�m kinh nghi�m", CITYWAR_TOP10_EXP);
				szLog = format("B�n nh�n ���c ph�n th��ng C�ng th�nh chi�n��%s", szLog);
				Msg2Player(szLog);
				WriteLog(format("[citywar_award]\t%s\tName:%s\tAccount:%s\t%s",
							GetLocalDate("%Y-%m-%d_%H:%M"),
							szName,
							GetAccount(),
							szLog
							));
			end
		end
	end
	OldPlayer = PlayerIndex;
	
	
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]
		
		if (tbRandPlayer[i]) then
			citywar_awardplayer();
		end
		LeaveGame()
		SetFightState(0)
	end;
	PlayerIndex = OldPlayer;
end;

function citywar_awardplayer()
	AddItem(6,1,1075,1,1,0);
	local szLog = format("B�n nh�n ���c ph�n th��ng C�ng th�nh chi�n��%s","L� h�p qu� huy ho�ng")
	Msg2Player(szLog);
	WriteLog(format("[citywar_award]\t%s\tName:%s\tAccount:%s\t%s",
							GetLocalDate("%Y-%m-%d_%H:%M"),
							GetName(),
							GetAccount(),
							szLog
							));
end
-------------------------------------------------------------------------

function JoinCamp(Camp, Type)
--type == 1��ʾ���������2��ʾ�Ƿ�����������Ǳ����ĳ�Ա
	LeaveTeam();
	if (Type == 1) then 
		if (Camp == 1) then 
			if (GetMSPlayerCount(MISSIONID,Camp) >= MAX_CAMP1COUNT) then
				Say("Hi�n gi� s� ng��i tham chi�n bang h�i th� th�nh �� ��y, t�m th�i kh�ng th� gia nh�p!",0)
				return
			end;
		else 
			if (GetMSPlayerCount(MISSIONID, Camp) >= MAX_CAMP2COUNT) then
				Say("Hi�n gi� s� ng��i tham chi�n bang h�i c�ng th�nh �� ��y,t�m th�i kh�ng th� gia nh�p!",0)
				return
			end
		end;
	else
		if (Camp == 1) then 
			if (GetMSPlayerCount(MISSIONID,Camp + 2 ) >= MAX_CAMP3COUNT) then
				Say("Hi�n gi� s� ngh�a s� gi�p �� th� th�nh �� ��y, t�m th�i kh�ng th� gia nh�p!",0)
				return
			end;
		else 
			if (GetMSPlayerCount(MISSIONID, Camp + 2) >= MAX_CAMP4COUNT) then
				Say("Hi�n gi� s� ngh�a s� gi�p �� c�ng th�nh �� ��y, t�m th�i kh�ng th� gia nh�p!",0)
				return
			end
		end;
	end;

	if (Type == 1) then 	
		AddMSPlayer(MISSIONID, Camp);
	else
		AddMSPlayer(MISSIONID, Camp + 2);
	end;
	
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetTaskTemp(200,1);
	
	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetLogoutRV(1);
	
	--�������ͷ�
	SetPunish(0);
	
	--�ر���ӹ���
	SetCreateTeam(0);
	
	--��PK����
	SetPKFlag(1)
	ForbidChangePK(1);
	
	--���������㣬һ����ѡ���������ĳ���
	SetRevPos(GetPlayerRev())
	
	--���õ�ǰ��ҵ������ű�
	SetDeathScript("\\script\\missions\\citywar_city\\playerdeath.lua");
	
	SetFightState(0)
	--�����´�������������
	if (Camp == 1) then
		SetTempRevPos(CS_CampPos1[1], CS_CampPos1[2]*32, CS_CampPos1[3]*32);
		
		NewWorld(CS_CampPos1[1], CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(CS_CampPos2[1], CS_CampPos2[2]*32, CS_CampPos2[3]*32);
		
		NewWorld(CS_CampPos2[1], CS_CampPos2[2], CS_CampPos2[3])
	else 
		return
	end;

	--��ʾ��ʱ��
	local gametime = floor(GetMSRestTime(MISSIONID, 13) / 18);	
	BT_UpdateMemberCount();
	BT_BroadView();
	BT_BroadAllLadder();
	BT_SetRestTime(gametime);
	BT_BroadGameData();
	BT_SortLadder();
	BT_BroadSelf()
	--��ʾ��ʱ��
	
	--����
	bt_JudgePLAddTitle()
end;

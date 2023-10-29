--�˳���Ϸ���������ID,Ҳ���Ǳ������Ǹ��ط���
CS_RevId = 20
CS_RevData = 10;

--����˫����Ӫʱ��λ��
CampPos1 = {1536 , 3223 }; 	--��ɫ
CampPos2 = {1563 , 3195 }; 	--��ɫ
CampPos0 = {1633 , 3292 }; --��������ʱ������

FRAME2TIME = 18;
--��Ϸ���������
MAX_MEMBER_COUNT = 16;
MS_STATE = 1;
MS_TONG1ID = 10;--�������İ��ID
MS_TONG2ID = 11;

WIN_TONGEXP = 1200;
LOSE_TONGEXP = 1400;

MS_TOTALPK = 250;--��¼��Ҵ���������ҵ��ܴ���
MS_TOTALKO = 251;--��¼�����PKս���б��������ܴ���

MS_TONG1VALUE = 13; --��¼���1�ı�����ǰ�Ļ���
MS_TONG2VALUE = 14;
MS_ARENAID = 15;

PKWINBONUS = 3;
LOSEBONUS = 1;

TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TIMER_2 = 25 * 60  * FRAME2TIME; -- ��ս��ʱ��Ϊ1Hour
GO_TIME =  480 * FRAME2TIME  / TIMER_1; -- ����ʱ��Ϊ10

MS_NEWSVALUE = 9; --�����д�����ű����ĵط�
JOINSTATE = 242;
MISSIONID = 5;
WORLDIDXBEGIN = 213;

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;

-------------------------------------------------------------------------
--���Ҫ���뿪��Ϸ
function LeaveGame()
	camp = GetCamp();--�ָ�ԭʼ��Ӫ
	SetRevPos(CS_RevId, CS_RevData)
	SetPunish(1)--����PK�ͷ�
	SetPKFlag(0)--�ر�PK����
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	SetFightState(0);
	
	SetCurCamp(camp);
	SetLogoutRV(0);--����������
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	NewWorld(GetLeavePos())
end;

function GameOver()
	PTab = {};
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]
		LeaveGame()
	end;
	PlayerIndex = OldPlayer;
end;
-------------------------------------------------------------------------

function JoinCamp(Camp)
	SetFightState(0)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, Camp) >= MAX_MEMBER_COUNT) then
		Say("Phe n�y hi�n �� �� ng��i, kh�ng th� gia nh�p!",0)
		return
	end;
	
	AddMSPlayer(MISSIONID, Camp);
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--���������йصı�������������ս���иı�ĳ�������Ӫ�Ĳ���
	SetTaskTemp(200, 1);
	
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
	SetRevPos(CS_RevId, CS_RevData);
	
	--���õ�ǰ��ҵ������ű�
	SetDeathScript("\\script\\missions\\citywar_arena\\death.lua");
	W,X,Y = GetWorldPos();
	--�����´���������ʱ������
	if (Camp == 1) then
		SetTempRevPos(GetLeavePos());
		str = GetName().."<#> �� v�o"..GetMissionS(1).."<#> 1 b�n, s� th�nh vi�n hi�n t�i"..GetMSPlayerCount(MISSIONID,1);
		SetPos(CampPos1[1], CampPos1[2])
	elseif (Camp == 2) then
		SetTempRevPos(GetLeavePos());
		str = GetName().."<#> �� v�o"..GetMissionS(2).."<#> 1 b�n, s� th�nh vi�n hi�n t�i"..GetMSPlayerCount(MISSIONID,2);
		SetPos(CampPos2[1], CampPos2[2])
	else 
		return
	end;
		
	Msg2MSAll(MISSIONID, str);
end;


-------------------------------------------------------------------------
-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------
--ʤ�������1800���Ǯ�����12000��ᾭ�飻ʧ�ܷ�����14000��ᾭ��
function WinBonus(camp)
	if (camp == 1) then
		NotifyArenaResult(GetMissionV(MS_ARENAID), 1); --֪ͨ��һ��ʤ����
		AddTongExp(GetMissionS(1), WIN_TONGEXP )
	--	SubTongExp(GetMissionS(2), LOSE_TONGEXP)
	else
		NotifyArenaResult(GetMissionV(MS_ARENAID), 0); --֪ͨ�ڶ���ʤ����
		AddTongExp(GetMissionS(2), WIN_TONGEXP )
	--	SubTongExp(GetMissionS(1), LOSE_TONGEXP)
	end;
end;
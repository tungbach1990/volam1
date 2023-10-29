--�˳���Ϸ���������ID,Ҳ���Ǳ������Ǹ��ط���
CS_RevId = 2
CS_RevData = 72;

--����˫����Ӫʱ��λ��
CS_CampPos1 = {212,	1819, 2992}; 	--��ɫ
CS_CampPos2 = {212, 1568, 3079}; 	--��ɫ
FRAME2TIME = 18;
--��Ϸ���������
MAX_MEMBER_COUNT = 200;
MS_STATE = 1;
MS_TONG1ID = 10;--�������İ��ID
MS_TONG2ID = 11;

MS_SIGN_MONEY = 5000000; --������
MS_WIN_MONEY =  8000000; -- ÿ��ʤ��ʱ����õ�����
WIN_TONGEXP = 12000;
LOSE_TONGEXP = 14000;

MS_TOTALPK = 250;--��¼��Ҵ���������ҵ��ܴ���
MS_TOTALKO = 251;--��¼�����PKս���б��������ܴ���

MS_TONG1VALUE = 13; --��¼���1�ı�����ǰ�Ļ���
MS_TONG2VALUE = 14;

PKWINBONUS = 3;
LOSEBONUS = 1;

TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TIMER_2 = 60 * 60  * FRAME2TIME; -- ��ս��ʱ��Ϊ1Hour
GO_TIME =  600 * FRAME2TIME  / TIMER_1; -- ����ʱ��Ϊ10Сʱ

MS_NEWSVALUE = 9; --�����д�����ű����ĵط�
JOINSTATE = 242;
MISSIONID = 7;

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;

-------------------------------------------------------------------------
--���Ҫ���뿪��Ϸ
function LeaveGame()
--leavetype = 0��ʾ����λ�����ڵ�ͼ�ĳ������򣨷�ս������
--leavetype = 1��ʾ����λ��������һ����ͼ���������뿪ս��
	camp = GetCamp();--�ָ�ԭʼ��Ӫ
	SetRevPos(CS_RevId, CS_RevData)
	SetFightState(0)
	SetPunish(1)--����PK�ͷ�
	SetPKFlag(0)--�ر�PK����
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	
	SetCurCamp(camp);
	SetLogoutRV(0);--����������
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	NewWorld(GetLeavePos());
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
	--�ڵڶ�Mission�ڼӵ�ǰ���
	
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID,Camp) >= MAX_MEMBER_COUNT) then
		Say("Phe n�y hi�n �� �� ng��i, kh�ng th� gia nh�p!",0)
		return
	end;
	
	AddMSPlayer(MISSIONID, Camp);
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
	SetRevPos(CS_RevId, CS_RevData);
	
	--���õ�ǰ��ҵ������ű�
	SetDeathScript("\\script\\missions\\hsbattle\\hsbattledeath.lua");
	
	--�����´�������������
	if (Camp == 1) then
		SetTempRevPos(GetTask(300), GetTask(301) * 32, GetTask(302)* 32);
		str = GetName().."<#> �� v�o"..GetMissionS(1).."<#> 1 b�n, s� th�nh vi�n hi�n t�i"..GetMSPlayerCount(MISSIONID,1);
		NewWorld(CS_CampPos1[1], CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(GetTask(300), GetTask(301) * 32, GetTask(302)* 32);
		str = GetName().."<#> �� v�o"..GetMissionS(2).."<#> 1 b�n, s� th�nh vi�n hi�n t�i"..GetMSPlayerCount(MISSIONID,2);
		NewWorld(CS_CampPos2[1], CS_CampPos2[2], CS_CampPos2[3])
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
--		AddTongExp(GetMissionS(1), WIN_TONGEXP )
		AddTongMoney(GetMissionS(1), MS_WIN_MONEY);
--		SubTongExp(GetMissionS(2), LOSE_TONGEXP)
		MoveTongExp(WIN_TONGEXP, GetMissionS(1), GetMissionS(2))
	else
--		AddTongExp(GetMissionS(2), WIN_TONGEXP )
		AddTongMoney(GetMissionS(2), MS_WIN_MONEY);
--		SubTongExp(GetMissionS(1), LOSE_TONGEXP)
		MoveTongExp(WIN_TONGEXP, GetMissionS(2), GetMissionS(1))
	end;
end;
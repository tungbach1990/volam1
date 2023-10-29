--��ս��ģʽ

--1����GM���������ĸ�У������.�ʺżӸ��ӵ�
--2����У�������ڱ��������׶ε���������Npc�Ի���õ��ߣ��ֱ�������а���ס�������Ӫ��ͬ�����ơ�
--3���������õ����ߺ󽻸�����˫���Ķӳ���
--4���ӳ��õ����ߺ�������ѵ�5�˶��顣Ȼ����Ʊ������
--5������������ǰ׼����
--6�����������󡣸����˼�¼�����ɼ�����ٷ�ͨ����


--���浱ǰ���������������һ�������MissionV����index ����Ϊ���䳡����Ŀǰ������ͨ���䳡�͸�У��ս���У�
--ͬһʱ��ֻ����һ���ô���������������������֡�
--0��ʾû���������񼤻1��ʾ��ͨ���䳡��2��ʾ��У��ս��

ACTIVEMISSION = 40;

FRAME2TIME = 18;	--18֡��Ϸʱ���൱��1����

TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TIMER_2 = 20 * 60  * FRAME2TIME; -- ��ս��ʱ��Ϊ20����
GO_TIME =  300 * FRAME2TIME  / TIMER_1; -- ����ʱ��Ϊ��Сʱ

MS_STATE = 1; --�����м�¼����״̬�ı���ID
--�ñ���ָ���״ֵ̬0��ʾս��Ϊ�򿪣�1��ʾս�۱����У�2��ʾս��ս�������У�3��ʾս�۸ոս�����

MS_STORETASKID = 240;
MS_S_DEATHCOUNT = 3; --�����м�¼1������������ı���ID
MS_J_DEATHCOUNT = 4; --�����м�¼2������������ı���ID

MS_S_SIGHCOUNT  = 5;--�������η�������������
MS_J_SIGHCOUNT  = 6;--�����н𷽹�����������
MS_S_JOINED = 7;  --�������η��Ѿ�����������ر���ID
MS_J_JOINED = 8;  --�����н��Ѿ�����������ر���ID

MS_NEWSVALUE = 10; --�����д�����ű����ĵط�
PLAYER_KILLCOUNT = 240; --��ʱ����,temptask
PLAYER_DEATHCOUNT = 241;
JOINSTATE = 242;
MISSIONID = 4;


-------------------------------------------------------------------------
--���Ҫ���뿪��Ϸ
function LeaveGame(leavetype)
--leavetype = 0��ʾ����λ�����ڵ�ͼ�ĳ������򣨷�ս������
--leavetype = 1��ʾ����λ��������һ����ͼ���������뿪ս��
	camp = GetCamp();--�ָ�ԭʼ��Ӫ
	SetRevPos(CS_RevId, CS_RevData)
	SetFightState(1)
	SetPunish(1)--����PK�ͷ�
	SetPKFlag(0)--�ر�PK����
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	SetCreateTeam(1);
	if (leavetype == 0) then 
		SetCurCamp(camp)
		SetFightState(0)
		SetPos(CS_OuterPos[2], CS_OuterPos[3]);
	else
		SetCurCamp(camp);
		SetLogoutRV(0);--����������
		SetCreateTeam(1);
		SetDeathScript("");--���������ű�Ϊ��
		NewWorld(GetLeavePos());
	end;
end;

function GameOver()
	idx = 0;
	OldPlayer = PlayerIndex;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	PlayerIndex = pidx;
	 	LeaveGame(0);
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

	--����ս��״̬
	SetFightState(0);
	
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
	--��������������ĵط�������������˳��ĵص㣨�ڱ���ͼ�Ϸ�ս������)
	W,X,Y = GetWorldPos();
	
	--���õ�ǰ��ҵ������ű�
	if (Camp == 1) then 
		SetDeathScript("\\script\\missions\\challenge\\challengedeath.lua");
	elseif (Camp == 2) then 
		SetDeathScript("\\script\\missions\\challenge\\challengedeath1.lua");
	end
	
	
	--�����´�������������
	if (Camp == 1) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> gia nh�p phe V�ng, nh�n s� hi�n t�i l�"..GetMSPlayerCount(MISSIONID,1);
		SetPos(CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> gia nh�p phe T�m, nh�n s� hi�n t�i l�"..GetMSPlayerCount(MISSIONID,2);
		SetPos(CS_CampPos2[2], CS_CampPos2[3])
	elseif (Camp == 6) then
		SetTempRevPos(GetTask(300), GetTask(301) * 32, GetTask(302)* 32);
		str = GetName().."<#> tham gia quan chi�n, nh�n s� hi�n t�i l�"..GetMSPlayerCount(MISSIONID,6);
		SetPos(CS_CampPos0[2], CS_CampPos0[3])
	end;
	
	--�����в����߷���Ϣ
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

--�˳���Ϸ���������ID,Ҳ���Ǳ������Ǹ��ط���
CS_RevId = 80;
CS_RevData = 36;

--�뿪������Ϸ���λ��worldid, x, y,һ����Ǳ�����
--CS_LeavePos = {20, 3546, 6226};

--�᳡���λ��
CS_OuterPos = {209, 1548, 3297};


--����˫����Ӫʱ��λ��
CS_CampPos0 = {209, 1631, 3203};   	--��ɫ
CS_CampPos1 = {209, 1608, 3167}; 	--��ɫ
CS_CampPos2 = {209, 1674, 3246}; 	--��ɫ


--��Ϸ��ÿһ��Ӫ���������
MAX_MEMBER_COUNT = 5;

MS_CAMP1 = 1; --˫������Ӫ��
MS_CAMP2 = 2;

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;

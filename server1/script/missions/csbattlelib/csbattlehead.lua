--cs������ģʽ
--���������ƣ�Ȼ������˫��ѡ�������Ӫ���������δѡΪ�������Թ���
--��¼���֡����������п��Ա任��Ӫ��
--�������
--������ʱ�����ƣ������¼���¼�����������
--��ʱ�䣬�Զ�����Զ����
--��������������������ޣ�������ڱ�������������������Ҽ��롣
--���������������ĳ���ط�������
--����������������������

--���浱ǰ���������������һ�������MissionV����index ����Ϊ���䳡����Ŀǰ������ͨ���䳡�͸�У��ս���У�
--ͬһʱ��ֻ����һ���ô���������������������֡�
--0��ʾû���������񼤻1��ʾ��ͨ���䳡��2��ʾ��У��ս��

ACTIVEMISSION = 40;	

FRAME2TIME = 18;	--18֡��Ϸʱ���൱��1����

TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TIMER_2 = 60 * 60  * FRAME2TIME; -- ��սʱ��Ϊ1Сʱ

MS_STATE = 1; --�����м�¼����״̬�ı���ID
--�ñ���ָ���״ֵ̬0��ʾս��Ϊ�򿪣�1��ʾս�۱����У�2��ʾս��ս�������У�3��ʾս�۸ոս�����

MS_STORETASKID = 240;
MS_S_DEATHCOUNT = 3; --�����м�¼1������������ı���ID
MS_J_DEATHCOUNT = 4; --�����м�¼2������������ı���ID

MS_S_SIGHCOUNT  = 5;--�������η�������������
MS_J_SIGHCOUNT  = 6;--�����н𷽹�����������

MS_NEWSVALUE = 10; --�����д�����ű����ĵط�
PLAYER_KILLCOUNT = 240; --��ʱ����,temptask
PLAYER_DEATHCOUNT = 241;
JOINSTATE = 242;

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
	
	if (leavetype == 0) then 
		SetCurCamp(0)
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
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(2,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	PlayerIndex = pidx;
	 	LeaveGame(1);
	end;
end;
-------------------------------------------------------------------------

function JoinCamp(Camp)
	--�ڵڶ�Mission�ڼӵ�ǰ���
	LeaveTeam()
	if (GetMSPlayerCount(2,Camp) >= MAX_MEMBER_COUNT) then
		Say("Phe n�y hi�n �� �� ng��i, kh�ng th� gia nh�p!",0)
		return
	end;
	AddMSPlayer(2, Camp);
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	SetTaskTemp(200,1);
	
	--����ս��״̬
	SetFightState(1);
	
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
	SetDeathScript("\\script\\missions\\cs������\\csbattledeath.lua");
	
	--�����´�������������
	if (Camp == 1) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> gia nh�p phe V�ng, nh�n s� hi�n t�i l�"..GetMSPlayerCount(2,1);
		SetPos(CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> gia nh�p phe T�m, nh�n s� hi�n t�i l�"..GetMSPlayerCount(2,2);
		SetPos(CS_CampPos2[2], CS_CampPos2[3])
	elseif (Camp == 4) then
		SetTempRevPos(GetTaskTemp(300), GetTaskTemp(301) * 32, GetTaskTemp(302)* 32);
		str = GetName().."<#> gia nh�p chi�n ��u, nh�n s� hi�n t�i l�"..GetMSPlayerCount(2,4);
		SetPos(CS_CampPos4[2], CS_CampPos4[3])
		SetDeathScript("\\script\\missions\\hsbattle\\hsbattledeath.lua");
	end;
	
	--���2��Mission(Ҳ�������䳡)�������˷���Ϣ
	Msg2MSAll(2, str);
	
end;

-------------------------------------------------------------------------
-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------

IncludeLib("SETTING");

--�˳���Ϸ���������ID,Ҳ���Ǳ������Ǹ��ط���
CS_RevId = 176;
CS_RevData = 67;

FACTIONTAB = {"����","����","����","�嶾","����","����","ؤ��","����","�䵱","����"}

MapTab = 335;

FRAME2TIME = 18;
--��Ϸ���������
MAX_MEMBER_COUNT = 200;
FIGHTS = 3;		-- ��������
JOINTONGTIME = 1;	-- ���ʱ������


MS_STATE = 1;
MS_LUN = 2; 		-- �ڶ����ֵı���
TOTALNUMBER = 3 	-- ������Ա����
FACTIONS = 4; 		-- ����ID
FIGHT_MODE = 5;		-- 0 ����ģʽ��1 ��̭ģʽ
TOTALNUMBER1 = 6;

OL_KEY = 7; 		-- 0-100000000�������
MS_NEWSVALUE = 9; 	-- �����д�����ű����ĵط�

TIME_NO1 = 23;		-- ��ʱ������
TIME_NO2 = 24;		-- ��ᶨʱ������

TIMER_1 = 60 * FRAME2TIME; -- 1������ʾһ�α���
TIMER_2 = 20 * FRAME2TIME; -- 20����ʾһ�α���ʱ��
TIMER_3 = 20 * FRAME2TIME; -- 20����ʾһ���볡
TIMER_4 = 60 * FRAME2TIME; -- 1���ӵȴ�ʱ��
TIMER_5 = 60 * FRAME2TIME; -- 1������ʾһ�ΰ�ᱨ��ʱ��


END_TIME = 1 ; 		-- ����ʱ��Ϊ1����
GO_TIME = 6 ; 		-- �볡ʱ��2����
FIGHT_TIME = 6;		-- ����ʱ��2����
END_TONG_TIME = 1;	-- ��ᱨ��ʱ��1����

JOINSTATE = 242;
MISSIONID = 12;

TASKFLAG = 623;		-- �����������ʾ�Ѿ�����
SCORE = 624;   		-- ��ųɼ�
TONGSCORE = 625;	-- ��Ű������Ľ��
AREAID = 626;		-- �������ı��
OLYMPICFLAG = 630;	-- �����ʸ�


function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;


-------------------------------------------------------------------------
--���Ҫ���뿪��Ϸ
function LeaveGame(leavetype)
--leavetype = 0��ʾ����λ�����ڵ�ͼ�ĳ������򣨷�ս������
--leavetype = 1��ʾ����λ��������һ����ͼ���������뿪ս��
	camp = GetCamp();--�ָ�ԭʼ��Ӫ
	SetRevPos(CS_RevId, CS_RevData);

	SetFightState(0);
	SetPunish(1); --����PK�ͷ�
	SetPKFlag(0); --�ر�PK����
--	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	ForbitTrade(0);
	SetCurCamp(camp);
	SetLogoutRV(0);--����������
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	NewWorld(GetLeavePos());
end;

function CalcScore()
	OldPlayer = PlayerIndex;
	maxn = floor((GetMissionV(TOTALNUMBER) + 1) / 2);
	for i = 1,maxn do
		j = i*2
		idx , pidx = GetNextPlayer(MISSIONID, 0, j-1);
		idy , pidy = GetNextPlayer(MISSIONID, 0, j);

		if (pidx > 0) and (pidy > 0) then
			if (GetMissionV(FIGHT_MODE) == 0) then
			   	PlayerIndex = pidx;
				AddScore(1);
			   	PlayerIndex = pidy;
				AddScore(1);
			else
			   	PlayerIndex = pidx;
				lv1 = GetLevel();
			   	PlayerIndex = pidy;
				lv2 = GetLevel();
				if (lv2 > lv1) then 
					AddScore(3);
				else
			   		PlayerIndex = pidx;
					AddScore(3);
				end
			end
		elseif (pidx > 0) then
		   	PlayerIndex = pidx;
			AddScore(3);
		elseif (pidy > 0) then
		   	PlayerIndex = pidy;
			AddScore(3);
		end;	
	end;
	SortScore();
end;

-- ���ɼ�����

function SortScore()
--	maxn = GetMissionV(TOTALNUMBER) - 1;
	maxn = TableSDD_Search("olympictab","") - 1;
	for i = 1,maxn do
		pname,px,py = TableSDD_GetValue("olympictab",i);
		for j = i+1,maxn+1 do
			qname,qx,qy = TableSDD_GetValue("olympictab",j);
			if (px < qx) then 
				TableSDD_SetValue("olympictab",i,qname,qx,qy);
				TableSDD_SetValue("olympictab",j,pname,px,py);
				px = qx;
			end;
		end;
	end;
	PlayerIndex = OldPlayer;
end;

function AddScore(pscore)
	if (GetMissionV(FIGHT_MODE) ~= 0) then
		pscore = FIGHTS * pscore
	end;
	k = GetTask(SCORE);
	SetTask(SCORE,k+pscore);
	pname = GetName();
	Msg2Player("���ڱ��ֱ����е÷�"..pscore.."�֣������ۼ��ܷ�"..GetTask(SCORE).."�֡�")
	pn = TableSDD_Search("olympictab",pname);
	pname,px,py = TableSDD_GetValue("olympictab",pn);
	px = pscore * 256 + px
	TableSDD_SetValue("olympictab",pn,pname,px,py);
	LeaveGame(1);
end;

-------------------------------------------------------------------------

function JoinCamp(Camp)
	
	LeaveTeam()
	
	AddMSPlayer(MISSIONID, Camp);
--	SetTaskTemp(JOINSTATE, 1);

	Camp1 = Camp - 1;
	Camp1 = mod(Camp1,2) + 2;
	SetCurCamp(Camp1);
	
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
	
	--��PK���� ��׼����
	SetPKFlag(1)
	ForbidChangePK(1);
	
	--���������㣬һ����ѡ���������ĳ���
	SetRevPos(CS_RevId, CS_RevData);
	
	--���õ�ǰ��ҵ������ű�
	SetDeathScript("\\script\\missions\\olympic\\death.lua");
	
	--�����´�������������

	x = GetTask(300);
	y = GetTask(301);
	z = GetTask(302);
	SetTempRevPos(x, y * 32, z * 32);

	--�볡
	Camp1 = floor((Camp - 1) / 2);
	nx = floor(Camp1 / 10) + 1;
	ny = mod(Camp1,10) + 1;
	GotoMap(nx,ny);

	str = GetName().."<#>�Ѿ������˱���������";
	Msg2MSAll(MISSIONID, str);
end;


---------------------------------------------------------------------------

function GotoMap(nx,ny)
	nnx = (nx + ny) * 43 + 1187;
	nny = (ny - nx) * 44 + 3465;
	NewWorld(MapTab,nnx,nny);
end;

function RandomCamp()
	Ptab = {};
	maxn = GetMissionV(TOTALNUMBER);
	if (GetMissionV(FIGHT_MODE) == 1) then
		if (maxn > 16) then
			maxn = 16
			k1 = 0
		elseif (maxn > 8) then
			k1 = 16 - maxn
		elseif (maxn > 4) then
			k1 = 8 - maxn
		elseif (maxn > 2) then
			k1 = 4 - maxn
		else
			k1 = 0
		end;

		for i = 1,k1 do
			qname,qx,qy = TableSDD_GetValue("olympictab",i);
			qx = qx + FIGHTS * 256 * 3;
			TableSDD_SetValue("olympictab",i,qname,qx,0);
		end;
		n = maxn - k1;

	elseif (GetMissionV(FIGHT_MODE) > 1) then
		k1 = 0;
		if (GetMissionV(TOTALNUMBER) == GetMissionV(TOTALNUMBER1)) then
			maxn = maxn / 2;
		end;
		n = maxn;
	else
		n = maxn;
		k1 = 0;
	end;

	SetMissionV(TOTALNUMBER1,maxn);
	if (n == maxn) then
		SetMissionV(TOTALNUMBER,n);
	else
		SetMissionV(TOTALNUMBER,maxn - n / 2);
	end;

	for i = 1,n do
		Ptab[i] = i
	end;

	for i = 1,n do
		x = random(n-i+1);
		m = Ptab[x];
		Ptab[x] = Ptab[n-i+1];
		qname,qx,qy = TableSDD_GetValue("olympictab",k1+i);
		TableSDD_SetValue("olympictab",k1+i,qname,qx,m);
	end;
end;

function DisplayMsg()
	for i = 1,16 do
		qname,qx,qy = TableSDD_GetValue("olympictab",i);
		Msg2Player(qname..","..qx..","..qy);
	end;
end;

function SortTong()
	qname,qx,qy = TableSDD_GetValue("olympictab",2);
	if (qname == "") then 
		qname,qx,qy = TableSDD_GetValue("olympictab",1);
		str = "����Ԥѡ������ʸ������������Ѿ�ȫ�����������"..qname.."���ջ���齨������ʸ���"..qname.."�������쵽�ٰ��ʹ��ſڻ�ȡ�ʸ�֤��";
		AddGlobalNews(str);
		SetMissionV(MS_STATE,9);
		StopMissionTimer(MISSIONID, TIME_NO2);
--		CloseMission(MISSIONID);
	else
		maxn = TableSDD_Search("olympictab","") - 1;
		if (maxn > 8) then
			k1 = 16 - maxn
		elseif (maxn > 4) then
			k1 = 8 - maxn
		elseif (maxn > 2) then
			k1 = 4 - maxn
		else
			k1 = 0
		end
		if (k1 > 0) then
			for i = 1,k1 do
				qname,qx,qy = TableSDD_GetValue("olympictab",i);
				TableSDD_SetValue("olympictab",i,qname,1,0);
			end
		end
--		k2 = maxn - 1;
		j = 2;
		for i = k1+1,maxn do
			qname,qx,qy = TableSDD_GetValue("olympictab",i);
			TableSDD_SetValue("olympictab",i,qname,0,j);
			j = j + 1;
		end;
	end;
end;


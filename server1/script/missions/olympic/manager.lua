IncludeLib("SETTING");
Include("\\script\\missions\\olympic\\head.lua");

function main()

	--���÷��ص�
	x,y,z = GetWorldPos();
	SetTask(300, x);
	SetTask(301, y);
	SetTask(302, z);

	idx = SubWorldID2Idx(MapTab);
	if (idx == -1) then
		ErrorMsg(3) 
		return
	end;

	OldSubWorld = SubWorld;
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);
	fs = GetMissionS(FACTIONS);

	if (ms_state == 0) then 
		Say("����ͳ�죺����û���κα���������Ҫ����������", 4, "��������������λ��/StartReady","��������ʸ���/StartTong","�鿴��һ�׶εı������/Result", "����Ҫ��/OnCancel");
	elseif (ms_state == 1) then
		Say("����ͳ�죺������ͬ���ɸ�����λ��������������������"..fs.."��λ�����������Ƿ�����Ȥ�μӣ�", 3, "��ѽ���Ҳμ�/OnRegister", "��λ���Ĺ�����ʲô��/OnHelp", "����׼��һ��/OnCancel");
	elseif (ms_state == 2) then
		OnReady();	-- ׼���볡
	elseif (ms_state == 3) then 
		ErrorMsg(1)
	elseif (ms_state == 4) then
		Result()
	elseif (ms_state == 5) then 
		Say("����ͳ�죺���������а���Ԥѡ��֮����ʸ���������Ƿ�����Ȥ�μӣ�", 4, "��ѽ���Ҳμ�/OnRegister1", "�����Ĺ�����ʲô��/OnHelp1", "��ѯһ������Щ���ɱ�����/LookRegister", "����׼��һ��/OnCancel");
	elseif (ms_state == 6) then
		OnEntry()	-- ����볡
	elseif (ms_state == 7) then
		ErrorMsg(1)	-- ���ս����
	elseif (ms_state == 8) then
		TongWait()	-- �������һ��
	elseif (ms_state == 9) then
		EndTong()	-- ������
	else
		ErrorMsg(3)
	end;
	SubWorld = OldSubWorld;
end;

function LookRegister()
	str = "����ʸ����Ѿ��������������£�<enter><enter>";
	maxn = TableSDD_Search("olympictab","") - 1;
	for i = 1,maxn do
		qname,qx,qy = TableSDD_GetValue("olympictab",i);
		str = str.."  "..qname
	end;
	Say(str,0);
end;

function EndTong()
	qname,qx,qy = TableSDD_GetValue("olympictab",1);
	if (GetTong() == qname) and (GetName() == GetTongMaster()) then
		SetTask(OLYMPICFLAG,30);
		Say("���Ѿ�ȡ����ӵ��ʸ���Ҫ��ȡ������Ա���볡ȯ��",0);
		CloseMission(MISSIONID);
	else
		Say("���"..qname.."�Ѿ�ȡ������ӵ��ʸ�",0)
	end;
end;

function StartTong()
	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab);
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);

	if (ms_state == 0) then
		OpenMission(MISSIONID);

		str = "���ڰ���Ԥѡ������ʸ�����ʼ��������ӭ���а��İ���ǰ���ٰ��ʹ��ſڱ���������������100��";
		AddGlobalNews(str);
		SetMissionV(MS_STATE,5);
		StartMissionTimer(MISSIONID, TIME_NO2, TIMER_5);  --��ʼ������ʱ
	end;

	SubWorld = OldSubWorld;
end;

function TongWait()
	str = "����ʸ���������һ�ֱ����������£�<enter><enter>";
	maxn = TableSDD_Search("olympictab","") - 1;
	for i = 1,maxn do
		qname,qx,qy = TableSDD_GetValue("olympictab",i);
		if (qy == 0) then
			str = str.."    "..qname.."���ֿ�<enter>"
		elseif (mod(qy,2) == 0) then
			str = str.."    "..qname.."   VS"
		else
			str = str.."  "..qname.."<enter>"
		end;
	end;
	Say(str,0);
end;

function Result()
	if (GetMissionV(FIGHT_MODE) == 0) then
		maxn = TableSDD_Search("olympictab","");
		maxn = maxn - 1;
		if (maxn > 16) then
			maxn = 16
		end;
		str = "�ֽ׶���λ��ǰ"..maxn.."���������£�<enter><enter>";
	else
		str = "�ֽ׶���̭���������ֱ����������������£�<enter><enter>";
		maxn = GetMissionV(TOTALNUMBER1);
	end;
	if (maxn < 2) then
		str = "���ڻ�û���κα����Ļ��֡�"
	else
--		Msg2Player("maxn="..maxn);

		for i = 1,maxn do
			qname,qx,qy = TableSDD_GetValue("olympictab",i);
			px = floor(qx / 256);
			px = mod(px,256);
			if (qy == 0) then
				px = px - FIGHTS * 3
				str = str.."��"..i.."����"..qname.."��"..px.."�֣��ֿ�<enter>"
			else
				str = str.."��"..i.."����"..qname.."��"..px.."��<enter>"
			end;
		end;
		m = TableSDD_Search("olympictab","") - 1;
		if (GetMissionV(FIGHT_MODE) ~= 0) and (maxn < m) then
			for i = maxn+1,m do
				qname,qx,qy = TableSDD_GetValue("olympictab",i);
				px = floor(qx / 256);
				px = mod(px,256);
				str = str.."��"..i.."����"..qname.."��"..px.."�֣�����<enter>"
			end;
		end;
	end;
	Say(str,0);
end;

function OnHelp1()
	Talk(7, "","����ͳ�죺����Ԥѡ������ʸ�����Ϊ�˲μ�ȫ��ȫ�������еĴ��ͱ��������е�Ԥѡ����Ԥѡ��ͨ��������ʽͳһ�μӡ�", "����ͳ�죺Ҫ�μ�Ԥѡ��������������߽��б�����������Ϊ100�򡣱����޶�Ϊ���16����ᣬ������ֹʱ�䵽����12�������", "����ͳ�죺ÿ�����������16���˲μӱ������������ʱ�����Ҫ��1�����ϡ�", "����ͳ�죺��������֮�󣬼���ʼ�����볡ʱ�䣬�볡ʱ��Ϊ5���ӣ����볡׼��ʱ������󣬱�������ʽ��ʼ��" , 	"����ͳ�죺����ʱ��Ϊ10���ӣ�������̭�ƣ�����ʱ�����֮��˫��ʣ�����������ж�ʤ����ʤ��������һ�ֱ�����",	"����ͳ�죺���⣬��������׶����κ�ʱ��ĳһ�����߻��߻سǼ���Ϊ������","����ͳ�죺��������ȡʤ�İ���������Ϊ�����������ѡ29�������κζ�Ա����ʮ����ּ������������ǰ4���������μ�ȫ��ȫ���İ��˻ᡣ");
end;

function OnHelp()
	Talk(6, "","����ͳ�죺��λ����Ϊ����81�����ϵ�ͬ���ɵ�������ʿ���д��͵��������ĵط�����λ���ܹ�����10�֣���ÿһ����ϵͳ�����������֡�",	"����ͳ�죺Ҫ������λ��������������߽��б�����������Ϊ100�򡣱�����ֹʱ�䵽����12�������",	"����ͳ�죺��������֮�󣬼���ʼ�����볡ʱ�䣬�볡ʱ��Ϊ5���ӣ����볡׼��ʱ������󣬱�������ʽ��ʼ��" , 	"����ͳ�죺������ʱ��Ϊ10���ӣ������10����֮��˫��δ��ʤ��������Ϊƽ�֡�",	"����ͳ�죺���⣬��������׶����κ�ʱ��ĳһ�����߻��߻سǼ���Ϊʧ�ܣ�","����ͳ�죺�����Ʒֹ���ʤ����3�֣�������0�֣�ƽ�ָ���1�֡���10�ֱ���ȫ������֮�󽫸�����������");
end;


function StartReady()
	OldSubWorld = SubWorld;
	idx = SubWorldID2Idx(MapTab);
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);

	if (GetLevel() > 80) and (GetLastFactionNumber() ~= -1) and (ms_state == 0) then
		OpenMission(MISSIONID);
		n = GetLastFactionNumber();
		str1 = FACTIONTAB[n+1];
		SetMissionV(FACTIONS,n);
		SetMissionS(FACTIONS,str1);

		str = "����"..str1.."��λ����ʼ��������ӭ����81�����ϵ�"..str1.."����ǰ���ٰ��ʹ��ſڱ���������������100��";
		AddGlobalNews(str);
	end;

	SubWorld = OldSubWorld;
end;

function OnRegister()

	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab);
	factionx = GetMissionV(FACTIONS);
	r = GetMissionV(OL_KEY);
	SubWorld = OldSubWorld;

	if (GetLevel() < 81) or (GetLastFactionNumber() ~= factionx) then
		ErrorMsg(5)
		return
	end;

	if GetTask(TASKFLAG) == r then
		ErrorMsg(4)
		return
	end;

	n = TableSDD_Search("olympictab","");
	if (n == 0) or (n > MAX_MEMBER_COUNT) then 
		ErrorMsg(7)
		return
	end;

	if GetCash() < 1000000 then 
		ErrorMsg(2)
		return
	end;

	Pay(1000000);
	SetTask(TASKFLAG,r);
	SetTask(SCORE,0);
	SetTask(OLYMPICFLAG,0);
	x = GetName();
	TableSDD_SetValue("olympictab",n,x,0,0)

	SubWorld = OldSubWorld;
	Msg2Player("���Ѿ������˱����������ĵȺ��볡֪ͨ��");
	Say("����ͳ�죺���Ѿ������˱����������ĵȺ��볡֪ͨ��",0);
end;



function OnRegister1()			-- ��ᱨ��
	if (GetName() ~= GetTongMaster()) then
		ErrorMsg(9)
		return
	end

	OldSubWorld = SubWorld;

--	if GetTask(TASKFLAG) == r then
--		ErrorMsg(4)
--		return
--	end;

	tname,tt = GetTong();
	if (TableSDD_Search("olympictab",tname) ~= 0) then 
		ErrorMsg(4)
		return
	end;

	n = TableSDD_Search("olympictab","");
	if (n == 0) or (n > 16) then 
		ErrorMsg(7)
		return
	end;

	if GetCash() < 1000000 then 
		ErrorMsg(2)
		return
	end;

	Pay(1000000);
	TableSDD_SetValue("olympictab",n,tname,0,0)

	SubWorld = OldSubWorld;
	Msg2Player("��İ���Ѿ������˱����������ĵȺ��볡֪ͨ��");
	Say("����ͳ�죺��İ���Ѿ������˱����������ĵȺ��볡֪ͨ��",0);
end;

function OnReady()

	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(MapTab);
	r = GetMissionV(OL_KEY);
	SubWorld = OldSubWorld

	if GetTask(TASKFLAG) == r then 
		OnJoin()
	else
		ErrorMsg(8)
	end;
end;

function OnEntry()		-- ����볡

	tname,tt = GetTong();
	n = TableSDD_Search("olympictab",tname)
	if (n == 0) then 
		str = "��İ��û�б������������ѱ���̭�����ڰ���ʸ��������������£�<enter><enter>";
		maxn = TableSDD_Search("olympictab","") - 1;
		for i = 1,maxn do
			qname,qx,qy = TableSDD_GetValue("olympictab",i);
			if (qy == 0) then
				str = str.."    "..qname.."���ֿ�<enter>"
			elseif (mod(qy,2) == 0) then
				str = str.."    "..qname.."   VS"
			else
				str = str.."  "..qname.."<enter>"
			end;
		end;
		Say(str,0);
		return
	end

	ny,n1,n2 = TableSDD_GetValue("olympictab",n)
	if (n2 == 0) then 
		str = "��İ�᱾�ֱ����ֿգ����ڰ���ʸ��������������£�<enter><enter>";

		maxn = TableSDD_Search("olympictab","") - 1;
		for i = 1,maxn do
			qname,qx,qy = TableSDD_GetValue("olympictab",i);
			if (qy == 0) then
				str = str.."    "..qname.."���ֿ�<enter>"
			elseif (mod(qy,2) == 0) then
				str = str.."    "..qname.."   VS"
			else
				str = str.."  "..qname.."<enter>"
			end;
		end;
		Say(str,0);
		return
	end;

	if (GetJoinTongTime() < JOINTONGTIME) then 
		ErrorMsg(12)
		return
	end;

	SetTask(300, 334);
	SetTask(301, 1480);
	SetTask(302, 3048);
	SetTask(AREAID,n2);
	n3 = floor(n2/2) + 212;
	NewWorld(n3,1633,3292);
end;


function ErrorMsg(ErrorId)
--	Msg2Player("ErrorId="..ErrorID)
if (ErrorId == 1) then 
	Say("����ͳ�죺���ڱ������ڽ����У������볡��",0)
elseif (ErrorId == 2) then
	Say("����ͳ�죺����������������������",0)
elseif (ErrorId == 3) then 
	Say("����ͳ�죺�����������⣬����ٷ���ϵ��",0);
elseif (ErrorId == 4) then 
	Say("����ͳ�죺���Ѿ������˱����������ĵȺ��볡֪ͨ��", 0);
elseif (ErrorId == 5) then 
	Say("����ͳ�죺������ɲ�����Ҫ����ߵȼ�����81����",0);
elseif (ErrorId == 6) then 
	Say("����ͳ�죺������һ�ֱ������Ͼ�Ҫ��ʼ����Ⱥ�Ƭ�̡�",0);
elseif (ErrorId == 7) then 
	Say("����ͳ�죺�Բ��𣬱�������������",0);
elseif (ErrorId == 8) then
	Say("����ͳ�죺��û�б�����������˲��ܽ���������ء�",0);
elseif (ErrorId == 9) then 
	Say("����ͳ�죺�����������ǰ������ܱ�����",0);
elseif (ErrorId == 10) then
	Say("����ͳ�죺��İ��û�б����μӱ�����",0)
elseif (ErrorId == 11) then
	Say("����ͳ�죺��İ�᱾�ֱ����ֿա�",0)
elseif (ErrorId == 12) then
	Say("����ͳ�죺��������ʱ�䲻��1�죬���ܲμӱ�����",0)
elseif (ErrorId == 13) then
	Say("����ͳ�죺�㱾�ֱ����ֿջ��ѱ�������̭��",0)
else
	
end;
return
end;


function OnJoin()
	idx = SubWorldID2Idx(MapTab);
	
	OldSubWorld = SubWorld;
	SubWorld = idx;

--	DisplayMsg();

	nx = GetName();
	n = TableSDD_Search("olympictab",nx);
	if n ~= 0 then 
		ny,n1,n2 = TableSDD_GetValue("olympictab",n)
		if (n2 == 0) then
			ErrorMsg(13)
		else
			if (n1 > 65536) then
				SetTask(OLYMPICFLAG,1);
				Msg2Player("��ϲ�㣬���Ѿ�ȡ���˲μ�ȫ��ȫ�����˻�������ʸ�",0)
			end
			JoinCamp(n2)
		end
	else
		ErrorMsg(3)
	end;
	SubWorld=OldSubWorld;
end;


function OnCancel()
end;

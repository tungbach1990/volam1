IncludeLib("SETTING");
Include("\\script\\missions\\olympic\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);


	--�����׶�
	if (timestate == 1) then 
		ReportMemberState(V);
	elseif (timestate == 2) then 	-- �볡��
		ReportEntry(V);
	elseif (timestate == 3) then 	-- ս����
		ReportBattle(V);
	elseif (timestate == 4) then
		WaitTime(V);	 	-- ս������,�ȴ���һ��
	else
		StopMissionTimer(MISSIONID, TIME_NO1);
	end;
end;

function WaitTime(V)
		str1 = GetMissionS(FACTIONS);
		n = GetMissionV(MS_LUN) + 1;
		SetMissionV(MS_LUN,n);
		n = n+1;
		str = str1.."��λ�����ڿ�ʼ�����"..n.."�ֵı����볡��������߾����볡��";
		AddGlobalNews(str);
--		RandomCamp()
		SetMissionV(MS_STATE,2);
		StopMissionTimer(MISSIONID, TIME_NO1);
		StartMissionTimer(MISSIONID, TIME_NO1, TIMER_3);  --��ʼ�볡��ʱ
		SetMissionV(MS_NEWSVALUE, 0);
end;

function ReportMemberState(V)
	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������

	str1 = GetMissionS(FACTIONS);
	if (V == END_TIME) then 
		maxn = TableSDD_Search("olympictab","");
		if (maxn < 3) then
			str = str1.."��λ������ʱ�䵽�����ڱ���������������Ҫ����˱���ȡ����";
			AddGlobalCountNews(str);
			CloseMission(MISSIONID);
		else
			SetMissionV(TOTALNUMBER,maxn-1);
			str = str1.."��λ������ʱ�䵽�����ڿ�ʼ�����1�ֵı����볡��������߾����볡��";
			AddGlobalNews(str);
			RandomCamp();
			SetMissionV(MS_STATE,2);
			StopMissionTimer(MISSIONID, TIME_NO1);
			StartMissionTimer(MISSIONID, TIME_NO1, TIMER_3);  --��ʼ�볡��ʱ
			SetMissionV(MS_NEWSVALUE, 0);
		end;
	else 
		RestMin = END_TIME - V;
		str =str1.."��λ������ʱ�仹��"..RestMin.."���ӣ���81�����ϵ�"..str1.."��ʿ���쵽�ٰ��ʹ��ſڱ�����";
		AddGlobalCountNews(str);
	end;
end;

function ReportEntry(V)				-- �볡ʱ��
	str1 = GetMissionS(FACTIONS);
	n = GetMissionV(MS_LUN) + 1;
	if (V == GO_TIME) then
		str = "��"..n.."��"..str1.."��λ���볡ʱ���ѽ�ֹ��������ʽ��ʼ!";
		AddGlobalCountNews(str);
		Msg2MSAll(MISSIONID,str);
		RunMission(MISSIONID);
		StopMissionTimer(MISSIONID, TIME_NO1);
		StartMissionTimer(MISSIONID, TIME_NO1, TIMER_2);  --��ʼ������ʱ
		SetMissionV(MS_NEWSVALUE, 0);
	else
		RestMin = floor((GO_TIME - V) / 3);
		RestSec = mod((GO_TIME - V),3) * 20;

--		str = "��"..n.."��"..str1.."��λ���볡ʱ�仹��"..RestMin.."���ӣ���δ�볡�߾����볡��";
--		AddGlobalCountNews(str);

		if (RestMin > 0) and (RestSec == 0) then
			str = "��"..n.."��"..str1.."��λ���볡ʱ�仹��"..RestMin.."���ӣ���δ�볡�߾����볡��";
			Msg2MSAll(MISSIONID, str);
			if ((GO_TIME - V) == 3) then 
				str = "��"..n.."��"..str1.."��λ���볡ʱ�仹�����1���ӣ���δ�볡�߾����볡��";
				AddGlobalCountNews(str)
			elseif ((GO_TIME - V) == 15) then
				str = "��"..n.."��"..str1.."��λ���볡ʱ�仹ʣ��5���ӣ���δ�볡�߾����볡��";
				AddGlobalCountNews(str)
			end
		elseif (RestMin == 0) then
			str = "��"..n.."��"..str1.."��λ���볡ʱ�仹��"..RestSec.."�롣";
			Msg2MSAll(MISSIONID, str);
		end;
	end;
end;

function ReportBattle(V)		--ս�����й�����

	if (V == FIGHT_TIME) then
		CalcScore();
		EndFight();
	else
		if ScanFight() == 0 then
			SortScore()
			EndFight()
		else
			RestMin = floor((FIGHT_TIME - V) / 3);
			RestSec = mod((FIGHT_TIME - V),3) * 20;

			if (RestMin == 0) then
				Msg2MSAll(MISSIONID, "<#>ս���׶Σ�����ʣ��ʱ��"..RestSec.."<#>�롣");
			elseif (RestSec == 0) then
				Msg2MSAll(MISSIONID, "<#>ս���׶Σ�����ʣ��ʱ��"..RestMin.."<#>���ӡ�");
			else
				Msg2MSAll(MISSIONID, "<#>ս���׶Σ�����ʣ��ʱ��"..RestMin.."<#>��"..RestSec.."<#>�롣");
			end;
		end;
	end;
end;

function ScanFight()
	OldPlayer = PlayerIndex;
	maxn = floor((GetMissionV(TOTALNUMBER) + 1) / 2);
	kflag = 0;
	for i = 1,maxn do
		j = i*2;
		idx , pidx = GetNextPlayer(MISSIONID, 0, j-1);
		idy , pidy = GetNextPlayer(MISSIONID, 0, j);

		if (pidx > 0) and (pidy == 0) then
		   	PlayerIndex = pidx;
			AddScore(3);
		elseif (pidy > 0) and (pidx == 0) then
		   	PlayerIndex = pidy;
			AddScore(3);
		elseif (pidx > 0) and (pidy > 0) then
			kflag = 1;
		end;	
	end;
	PlayerIndex = OldPlayer;
	return kflag;
end;

function EndFight()
	str1 = GetMissionS(FACTIONS);
	n = GetMissionV(MS_LUN) + 1;
	if (n >= FIGHTS) then
		maxn = GetMissionV(TOTALNUMBER1);
		SetMissionV(FIGHT_MODE,GetMissionV(FIGHT_MODE) + 1);		

		if (maxn < 5) then
			for i = 1,maxn do
				pname,px,py = TableSDD_GetValue("olympictab",i);
				px = px + 65536;
				TableSDD_SetValue("olympictab",i,pname,px,py);
			end;
		end;

		if (maxn == 2) then
			pname,px,py = TableSDD_GetValue("olympictab",1);
			str = str1.."��λ����"..n.."�ֱ����������������б����Ѿ�ȫ���������ھ��ǣ�"..pname;
			AddGlobalNews(str);
			CloseMission(MISSIONID);
		else
			maxn = TableSDD_Search("olympictab","") - 1;
			for i = 1,maxn do
				qname,qx,qy = TableSDD_GetValue("olympictab",i);
				TableSDD_SetValue("olympictab",i,qname,qx,0);
			end;
			str = str1.."��λ����"..n.."�ֱ����������������׼����һ����������������5����֮���볡��";
			AddGlobalNews(str);
			SetMissionV(MS_STATE,4);
			StopMissionTimer(MISSIONID, TIME_NO1);
			StartMissionTimer(MISSIONID, TIME_NO1, TIMER_4);  --��ʼ�볡��ʱ
			SetMissionV(MS_NEWSVALUE,0);
			RandomCamp();
		end;
	else
		str = str1.."��λ����"..n.."�ֱ����������������׼����һ����������������5����֮���볡��";
		AddGlobalNews(str);
		SetMissionV(MS_STATE,4);
		StopMissionTimer(MISSIONID, TIME_NO1);
		StartMissionTimer(MISSIONID, TIME_NO1, TIMER_4);  --��ʼ�볡��ʱ
		SetMissionV(MS_NEWSVALUE,0);
		RandomCamp();
	end;
end;


IncludeLib("SETTING");
Include("\\script\\missions\\olympic\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);


	--�����׶�
	if (timestate == 5) then 
		ReportMemberState(V);
	elseif (timestate == 6) then 	-- �볡��
		ReportEntry(V);
	elseif (timestate == 7) then 	-- ս����
		ReportBattle(V);
	elseif (timestate == 8) then
		WaitTime(V);	 	-- ս������,�ȴ���һ��
	else
		StopMissionTimer(MISSIONID, TIME_NO2);
	end;
end;

function WaitTime(V)
		n = GetMissionV(MS_LUN) + 1;
		SetMissionV(MS_LUN,n);
		n = n+1;
		str = "����Ԥѡ������ʸ������ڿ�ʼ�����"..n.."�ֵı����볡��������߾����볡��";
		AddGlobalNews(str);
--		SortTong();
		SetMissionV(MS_STATE,6);
		StopMissionTimer(MISSIONID, TIME_NO2);
		StartMissionTimer(MISSIONID, TIME_NO2, TIMER_3);  --��ʼ�볡��ʱ
		SetMissionV(MS_NEWSVALUE, 0);
end;

function ReportMemberState(V)
	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������

	if (V == END_TIME) then 
		maxn = TableSDD_Search("olympictab","");
		if (maxn < 2) then
			str = "����Ԥѡ������ʸ�������ʱ�䵽�������ް�ᱨ������˱���ȡ����";
			AddGlobalCountNews(str);
			CloseMission(MISSIONID);
		elseif (maxn == 2) then
			qname,qx,qy = TableSDD_GetValue("olympictab",1);
			str = "����Ԥѡ������ʸ�������ʱ�䵽������ֻ��һ�����"..qname.."���������ֱ�ӻ���齨������ʸ���"..qname.."�������쵽�ٰ��ʹ��ſڻ�ȡ�ʸ�֤��";
			AddGlobalCountNews(str);
			SetMissionV(MS_STATE,9);
			StopMissionTimer(MISSIONID, TIME_NO2);
		else
			SetMissionV(TOTALNUMBER,maxn-1);
			str = "����Ԥѡ������ʸ�������ʱ�䵽�����ڿ�ʼ�����1�ֵı����볡��������߾����볡��";
			AddGlobalNews(str);
			SortTong();
			SetMissionV(MS_STATE,6);
			StopMissionTimer(MISSIONID, TIME_NO2);
			StartMissionTimer(MISSIONID, TIME_NO2, TIMER_3);  --��ʼ�볡��ʱ
			SetMissionV(MS_NEWSVALUE, 0);
		end;
	else 
		RestMin = END_TIME - V;
		str ="����Ԥѡ������ʸ�������ʱ�仹��"..RestMin.."���ӣ��뻹û�����İ��ɰ������쵽�ٰ��ʹ��ſڱ�����";
		AddGlobalCountNews(str);
	end;
end;

function ReportEntry(V)				-- �볡ʱ��
	n = GetMissionV(MS_LUN) + 1;
	if (V == GO_TIME) then
		str = "��"..n.."�ְ���Ԥѡ������ʸ����볡ʱ���ѽ�ֹ���������Ͽ�ʼ!";
		AddGlobalCountNews(str);
		SetMissionV(MS_STATE,7);
		StopMissionTimer(MISSIONID, TIME_NO1);
	else
		if ((GO_TIME - V) == 3) then 
			str = "��"..n.."�ְ���Ԥѡ������ʸ����볡ʱ�仹�����1���ӣ���δ�볡�߾����볡��";
			AddGlobalCountNews(str)
		elseif ((GO_TIME - V) == 15) then
			str = "��"..n.."�ְ���Ԥѡ������ʸ����볡ʱ�仹ʣ��5���ӣ���δ�볡�߾����볡��";
			AddGlobalCountNews(str)
		end;
	end;
end;

function ReportBattle(V)

end;

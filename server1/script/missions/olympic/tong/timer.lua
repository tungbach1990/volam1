Include("\\script\\missions\\olympic\\tong\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);


	--�����׶�
	if (timestate == 3) then 	-- �볡��
		ReportEntry(V);
	elseif (timestate == 4) then 	-- ս����
		ReportBattle(V);
	else
		StopMissionTimer(MISSIONID, TIME_NO3);
	end;
end;

function ReportEntry(V)				-- �볡ʱ��
	if (V == GO_TIME) then
		Msg2MSAll(MISSIONID, "����Ԥѡ������ʸ����볡�ѽ�ֹ��ս����ʽ��ʼ!");
		RunMission(MISSIONID);
		StopMissionTimer(MISSIONID, TIME_NO3);
		StartMissionTimer(MISSIONID, TIME_NO3, TIMER_1);  --��ʼ������ʱ
		SetMissionV(MS_NEWSVALUE, 0);
	else
		RestMin = floor((GO_TIME - V) / 3);
		RestSec = mod((GO_TIME - V),3) * 20;

		if (RestMin > 0) and (RestSec == 0) then
			str = "����Ԥѡ������ʸ����볡ʱ�仹��"..RestMin.."���ӡ�����˫������Ϊ���̷�"..GetMSPlayerCount(MISSIONID, 3).."���Ϸ�"..GetMSPlayerCount(MISSIONID, 2);
			Msg2MSAll(MISSIONID, str);
		elseif (RestMin == 0) then
			str = "����Ԥѡ������ʸ����볡ʱ�仹��"..RestSec.."�롣����˫������Ϊ���̷�"..GetMSPlayerCount(MISSIONID, 3).."���Ϸ�"..GetMSPlayerCount(MISSIONID, 2);
			Msg2MSAll(MISSIONID, str);
		end;
	end;
end;

function ReportBattle(V)		--ս�����й�����

	if (GetMSPlayerCount(MISSIONID, 3) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>ս��������"..GetMissionS(2).."<#>Ӯ�������յ�ʤ��!");
		SetMissionV(V_ID,2);
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>ս��������"..GetMissionS(1).."<#>Ӯ�������յ�ʤ��!");
		SetMissionV(V_ID,3);
		CloseMission(MISSIONID);
		return
	end;

	if (V == END_TIME) then
		Rest1 = GetMSPlayerCount(MISSIONID, 3);
		Rest2 = GetMSPlayerCount(MISSIONID, 2);

		if (Rest1 > Rest2) then 
			Msg2MSAll(MISSIONID, "<#>�����ѽ�����"..GetMissionS(1).."<#>Ӯ�����ⳡ������");
			str = "<#>��������ʱ�䵽��"..GetMissionS(1).."<#>Ӯ��"..GetMissionS(2).."<#>��";
			SetMissionV(V_ID,3);
		elseif (Rest2 > Rest1) then 
			Msg2MSAll(MISSIONID, "<#>�����ѽ�����"..GetMissionS(2).."<#>Ӯ�����ⳡ������")
			str = "<#>��������ʱ�䵽��"..GetMissionS(2).."<#>Ӯ��"..GetMissionS(1).."<#>��";
			SetMissionV(V_ID,2);
		else
			if (GetTotalLevel() == 1) then
				Msg2MSAll(MISSIONID, "<#>�����ѽ�����"..GetMissionS(1).."<#>Ӯ�����ⳡ������")
				str = "<#>��������ʱ�䵽��"..GetMissionS(1).."<#>Ӯ��"..GetMissionS(2).."<#>��";
				SetMissionV(V_ID,3);
			else
				Msg2MSAll(MISSIONID, "<#>�����ѽ�����"..GetMissionS(2).."<#>Ӯ�����ⳡ������")
				str = "<#>��������ʱ�䵽��"..GetMissionS(2).."<#>Ӯ��"..GetMissionS(1).."<#>��";
				SetMissionV(V_ID,2);
			end;
		end;
		CloseMission(MISSIONID);
	else
		RestMin = floor((END_TIME - V) / 3);
		RestSec = mod((END_TIME - V),3) * 20;

		if (RestMin == 0) then
			Msg2MSAll(MISSIONID, "<#>ս���׶Σ�˫������Ϊ���̷�"..GetMSPlayerCount(MISSIONID, 3).."<#>���Ϸ�"..GetMSPlayerCount(MISSIONID, 2).."<#>������ʣ��ʱ��"..RestSec.."<#>�롣");
		elseif (RestSec == 0) then
			Msg2MSAll(MISSIONID, "<#>ս���׶Σ�˫������Ϊ���̷�"..GetMSPlayerCount(MISSIONID, 3).."<#>���Ϸ�"..GetMSPlayerCount(MISSIONID, 2).."<#>������ʣ��ʱ��"..RestMin.."<#>���ӡ�");
		else
			Msg2MSAll(MISSIONID, "<#>ս���׶Σ�˫������Ϊ���̷�"..GetMSPlayerCount(MISSIONID, 3).."<#>���Ϸ�"..GetMSPlayerCount(MISSIONID, 2).."<#>������ʣ��ʱ��"..RestMin.."<#>��"..RestSec.."<#>�롣");
		end;
	end;
end;

function GetTotalLevel()
idx = 0;
nTotalLevel1 = 0;
nTotalLevel2 = 0;
	
	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 3);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
   			nTotalLevel1 = nTotalLevel1 + GetLevel();
		end
 	end;
 	
 	idx = 0;
 	for i = 1 , 500 do 
 		idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
 
 		if (idx == 0) then 
 			break
 		end;
 
 		if (pidx > 0) then
   			PlayerIndex = pidx;
   			nTotalLevel2 = nTotalLevel2 + GetLevel();
		end
 	end;

 	if (nTotalLevel1 < nTotalLevel2) then 
 		return 1
 	else 
 		return 0
 	end;
end;


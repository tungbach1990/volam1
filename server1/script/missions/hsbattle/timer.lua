Include("\\script\\missions\\hsbattle\\hshead.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V+1);

	if (V == GO_TIME) then
		RunMission(MISSIONID)
		return
	end

	--�����׶�
	if (timestate == 1) then 
		ReportMemberState(V);
	elseif (timestate == 2) then --��ս��
		ReportBattle(V);
	elseif (timestate == 3) then  --ս��������
		Msg2MSAll(MISSIONID, "Chi�n d�ch k�t th�c ");
		StopMissionTimer(MISSIONID, 14);
		StopMissionTimer(MISSIONID, 15);
	end;
end;

function ReportMemberState(V)
	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	if (V == GO_TIME) then
		Msg2MSAll(MSSIONID, "S� ng��i v�o trong �� ��, cu�c thi ��u ch�nh th�c b�t ��u ");
		RunMission(MISSIONID);
		return
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "Th�i gian v�o ��u tr��ng <#> c�n "..RestMin.."<#> ph�t, ��i khi�u chi�n xin l�p t�c v�o ��u tr��ng."
		str1 = "Tr�n khi�u chi�n th�nh <#> �ang trong giai �o�n v�o ��u tr��ng, hai b�n nhanh ch�ng v�o ��u tr��ng. S� ng��i hai b�n "..GetMSPlayerCount(MISSIONID, 1).."<#>:"..GetMSPlayerCount(MISSIONID, 2).."<#>. Th�i gian v�o ��u tr��ng c�n: "..RestMin.."<#> ph�t "..RestSec.."<#> gi�y ";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--ս�����й����У�ϵͳ����֪ͨ�������������
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>. Thi ��u k�t th�c,"..GetMissionS(2).."<#> gi�nh ���c th�ng l�i chung cu�c!");
		WinBonus(2)
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "<#>. Thi ��u k�t th�c,"..GetMissionS(1).."<#> gi�nh ���c th�ng l�i chung cu�c!");
		WinBonus(1)
		CloseMission(MISSIONID);
		return
	end;
		
	s_value = GetMissionV(MS_TONG1VALUE);
	j_value = GetMissionV(MS_TONG2VALUE);
	
	gametime = (floor(GetMSRestTime(MISSIONID,15)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> giai �o�n chi�n ��u. T�ch l�y hi�n t�i l�: phe V�ng:"..s_value.."<#>, b�n m�u T�m"..j_value.."<#>. Th�i gian c�n d� "..RestMin.."<#> ph�t "..RestSec.."<#> gi�y ";
	Msg2MSAll(MISSIONID, str1);
end;

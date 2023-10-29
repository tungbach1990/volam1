Include("\\script\\missions\\challenge\\challengehead.lua");

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
		StopMissionTimer(MISSIONID, 10);
		StopMissionTimer(MISSIONID, 11);
	end;
end;

function ReportMemberState(V)
	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	if (V == GO_TIME) then
		if (GetMSPlayerCount(MISSIONID,1) == 0 or GetMSPlayerCount(MISSIONID , 2) == 0) then
			Msg2MSAll(MISSIONID, "�� h�t gi� b�o danh nh�ng s� ng��i hai b�n v�n kh�ng ph� h�p y�u c�u, tr�n ��u ��nh h�y b� ");
			CloseMission(MISSIONID)
			return
		else
			Msg2MSAll(MSSIONID, "�� h�t gi� b�o danh, tr�n ��u ch�nh th�c b�t ��u ");
			RunMission(MISSIONID);
			return
		end
	end;
		RestTime = (GO_TIME - V) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		local str1 = "<#> Khi�u chi�n �ang trong giai �o�n b�o danh, ��i khi�u chi�n xin nhanh ch�ng nh�p tr��ng ��u"..RestMin.."<#> ph�t ";
		str1 = "<#> Khi�u chi�n �ang trong giai �o�n b�o danh, c�c ��i khi�u chi�n xin nhanh ch�ng nh�p tr��ng ��u! Nh�n s� 2 b�n hi�n l�:"..GetMSPlayerCount(MISSIONID, 1)..","..GetMSPlayerCount(MISSIONID, 2).."<#>. Th�i gian b�o danh c�n l�i:"..RestMin.."<#> ph�t "..RestSec.."<#> gi�y ";
		Msg2MSAll(MISSIONID, str1);	
end;

function ReportBattle(V)
--ս�����й����У�ϵͳ����֪ͨ�������������
	if (GetMSPlayerCount(MISSIONID, 1) <= 0 ) then 
		Msg2MSAll(MISSIONID, "Tr�n ��u �� k�t th�c, phe T�m �� gi�nh ���c th�ng l�i chung cu�c ");
		CloseMission(MISSIONID);
		return
	end;
	
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "Tr�n ��u �� k�t th�c, phe V�ng �� gi�nh ���c th�ng l�i chung cu�c ");
		CloseMission(MISSIONID);
		return
	end;
		
	s_death = GetMissionV(MS_S_DEATHCOUNT);
	j_death = GetMissionV(MS_J_DEATHCOUNT);
	gametime = (floor(GetMSRestTime(MISSIONID,11)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> Giai �o�n chi�n ��u. T�nh h�nh th��ng vong hi�n t�i: phe V�ng:"..s_death.."<#> ng��i, phe T�m:"..j_death.."<#> ng��i. Th�i gian c�n l�i"..RestMin.."<#> ph�t "..RestSec.."<#> gi�y ";
	Msg2MSAll(MISSIONID, str1);
end;
 
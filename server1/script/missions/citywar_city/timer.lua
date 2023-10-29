Include("\\script\\missions\\citywar_city\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V+1);
	if (timestate == 2) then --��ս��
		ReportBattle(V);
	end;
end;

function ReportBattle(V)
--ս�����й����У�ϵͳ����֪ͨʯ�������
	gametime = (floor(GetMSRestTime(MISSIONID,13) / 18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str = format("Hi�n t�i %s �ang trong giai �o�n tranh �o�t quy�t li�t! Th�i gian c�n d� %d ph�t %d gi�y; hi�n t�i %d Long tr� �� h�i ph�c thu�c t�nh", GetGameCity(), RestMin, RestSec, MS_SYMBOLCOUNT);
	for i = 1, MS_SYMBOLCOUNT do 
		if (GetMissionV(MS_SYMBOLBEGIN + i - 1)  == 1) then
			str = str .. "Phe ph�ng th� "	;
		else 	
			str = str .. "Phe t�n c�ng ";
		end;
	end;

	--2004.11.5�ر���ȫ���͹㲥�Ĺ���
	--if (mod(V, 18) == 0) then 
	--	AddGlobalNews(str)
	--else
		Msg2MSAll(MISSIONID, str)
	--end;
end;
 
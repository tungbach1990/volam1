Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");

function OnDeath()

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

--if ( GetMissionV(5) + GetMissionV(6) >= (MAX_S_COUNT + MAX_J_COUNT) * 7 / 10) then

if (GetMissionV(5) >= (MAX_S_COUNT / 2) and GetMissionV(6) >= (MAX_J_COUNT / 2)) then

	if (random(100) > 70) then
	return
	end;

	AddEventItem(195);
	Msg2Player("B�n l�y ���c Nh�c V��ng Ki�m! ");
end;


str1 = "<#>K�t qu� chi�n d�ch T�ng Kim: Ng��i T�ng "..GetName().."<#>Gi�t ���c ��i t��ng phe Kim, phe T�ng gi�nh ���c th�ng l�i! ";
str = "<#>T�t qu�! [ "..GetName().."<#>]Gi�t ���c t��ng Kim, ng��i T�ng ch�ng ta �� th�ng tr�n n�y! ";
Msg2MSAll(1, str1);
Msg2MSGroup(1, str, 1);
resultstr = WinBonus(1,2);
str1 = str1..resultstr;
SetMissionV(2,2);
SetMissionV(1,3);
AddGlobalCountNews(str1 , 3);
CloseMission(1);
end;
Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");

function OnDeath()

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

if ( GetMissionV(5) + GetMissionV(6) >= (MAX_S_COUNT + MAX_J_COUNT) * 7 / 10) then
	if (random(100) > 60) then
	return
	end;
	AddEventItem(195);
	Msg2Player("B�n l�y ���c Nh�c V��ng Ki�m! ");
end;

--����Ǹ����вμӴ�ս����ҷ�����Ϣ
str1 = "<#>K�t qu� chi�n d�ch T�ng Kim: T��ng s� phe Kim "..GetName().."<#>Gi�t ���c ��i t��ng phe T�ng, phe Kim gi�nh ���c th�ng l�i! ";

--��������Ǹ���ʤ��������Ϣ���������Ļ���!
str = "<#>T�t qu�! [ "..GetName().."<#>]Gi�t ���c t��ng T�ng, ng��i Kim ch�ng ta �� th�ng tr�n n�y! ";

Msg2MSAll(1, str1);
Msg2MSGroup(1, str, 2);
resultstr = WinBonus(2, 1);
str1 = str1..resultstr;
SetMissionV(2,1);
SetMissionV(MS_STATE,3);
AddGlobalCountNews(str1, 3);
CloseMission(1);
end;


--�������
Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");
function OnDeath(Launcher)


State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

npccount = GetTask(SJKILLNPC) + 1;
SetTask(SJKILLNPC, npccount);
str1 = "<#>S� l��ng qu�n ��ch NPC ng��i �� gi�t hi�n gi� t�ng l�n "..npccount;
Msg2Player(str1);

nCount = GetMissionV(MS_J_NPCDEATH) + 1;
SetMissionV(MS_J_NPCDEATH, nCount);

if (nCount == MS_SHOWKINGCOUNT) then
	CheckShowKing(2);
end;

end;
--����������ű�
Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");
function OnDeath(Launcher)
--LauncherΪıɱ��.

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

PlayerIndex1 = NpcIdx2PIdx(Launcher);
OrgPlayer  = PlayerIndex;
DeathName = GetName();

if (PlayerIndex1 > 0) then
	PlayerIndex = PlayerIndex1;
	LaunName = GetName();
	pkcount = GetTask(SJKILLPK) + 1;
	SetTask(SJKILLPK, pkcount);
	SetTask(MS_TOTALPK, GetTask(MS_TOTALPK) + 1);
	str  = "<#>Qu�n T�ng"..LaunName.."<#>Qu�n T�ng "..DeathName.."<#>��nh tr�ng th��ng qu�n Kim "..pkcount;
	Msg2MSAll(1,str);
	PlayerIndex = OrgPlayer;
end;

V = GetMissionV(MS_J_DEATHCOUNT) + 1;
SetMissionV(MS_J_DEATHCOUNT, V);
SetTask(MS_TOTALKO, GetTask(MS_TOTALKO) + 1);

if (V == MS_PKCOUNT) then
	CheckShowKing(2)
end;

dataindex = PIdx2MSDIdx(1,PlayerIndex1);
Pan = GetPMParam(1, dataindex, 1);
SetPMParam(1, dataindex, 1, Pan + 1);
end;


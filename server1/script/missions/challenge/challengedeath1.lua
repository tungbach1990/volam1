--�η���������ű�
Include("\\script\\missions\\challenge\\challengehead.lua");

function OnDeath(Launcher)
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	
	PlayerIndex1 = NpcIdx2PIdx(Launcher);
	OrgPlayer  = PlayerIndex;
	DeathName = GetName();
	
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();
		pkcount = GetTaskTemp(SJKILLPK) + 1;
		SetTaskTemp(SJKILLPK, pkcount);
		str  = "<#> phe V�ng:"..LaunName.."<#> ��nh tr�ng th��ng ng��i c�a phe T�m l�:"..DeathName.."<#>, �i�m s� PK hi�n t�i l�"..pkcount;
		Msg2MSAll(MISSIONID,str);
		SetMissionV(MS_J_DEATHCOUNT, GetMissionV(MS_J_DEATHCOUNT) + 1);
		PlayerIndex = OrgPlayer;
	end;
	if (GetMSPlayerCount(MISSIONID, 2) <= 0 ) then 
		Msg2MSAll(MISSIONID, "Tr�n ��u �� k�t th�c, phe V�ng �� gi�nh ���c th�ng l�i chung cu�c ");
		DelMSPlayer(MISSIONID, 2);	
		SetLogoutRV(1);
		CloseMission(MISSIONID);
		return
	end;
	DelMSPlayer(MISSIONID, 2);	
	SetLogoutRV(1);
end;

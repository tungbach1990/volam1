Include("\\script\\missions\\citywar_city\\head.lua");

function OnDeath(DeathIndex)
	WriteLog(GetLoop().."C�ng c� n�o �� b� ch�t "..DeathIndex)
	for i  = 1, g_nMaxTscPerDoor * g_nDoorCount do 
		if ( DeathIndex == GetMissionV(MS_TSCBEGIN + i  - 1		)) then
			SetMissionV(MS_TSCBEGIN + i - 1, 0)
			Msg2MSAll(MISSIONID, "D�ng c� c�ng th�nh H�n Th�ch Li�t �� b� phe th� th�nh ph� h�y. ");
			WriteLog("D�ng c� c�ng th�nh H�n Th�ch Li�t �� b� phe th� th�nh ph� h�y. ")
			return
		end;
	end;
	
	for i  = 1, g_nMaxGccPerDoor * g_nDoorCount do 
		if ( DeathIndex == GetMissionV(MS_GCCBEGIN + i  - 1		)) then
			SetMissionV(MS_GCCBEGIN + i - 1, 0)
			Msg2MSAll(MISSIONID, "D�ng c� c�ng th�nh Nghi�t Long Xung Xa �� b� phe th� th�nh ph� h�y. ");
			WriteLog("D�ng c� c�ng th�nh Nghi�t Long Xung Xa �� b� phe th� th�nh ph� h�y. ");
			return
		end;
	end;
	
	for i  = 1, g_nMaxToolCount do 
		if (DeathIndex == GetMissionV(MS_TOOLBEGIN + i - 1 )) then
		SetMissionV(MS_TOOLBEGIN + i - 1, 0)
		Msg2MSAll(MISSIONID, "M�t binh s� ph� tr� th� th�nh �� anh d�ng hy sinh. ");
		WriteLog("M�t binh s� ph� tr� th� th�nh �� anh d�ng hy sinh. ")
		return
		end;
	end;
end;
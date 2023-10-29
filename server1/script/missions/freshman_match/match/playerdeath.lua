Include("\\script\\missions\\freshman_match\\match\\head.lua")

function OnDeath(Launcher)
	orgply = PlayerIndex
	orgname = GetName()
	orgcamp = nt_gettask(CP_TASKID_ENEMY)
	match_mapid = SubWorldIdx2ID(SubWorld)
	tryout_mapid = match_mapid - 1
	
	enyply = NpcIdx2PIdx(Launcher);
	PlayerIndex = enyply
	enycamp = nt_gettask(CP_TASKID_ENEMY)
	enyname = GetName()
	
	PlayerIndex = orgply
	WL_clear_pl_state()
	SetLogoutRV(0);
	nt_settask(CP_TASKID_LOSE, nt_gettask(CP_TASKID_LOSE) + 1)
	nt_settask(CP_TASKID_FLAG, 1)
	DelMSPlayer(MISSIONID, orgply, enycamp)
	Msg2Player("B�n �� b�i d��i tay <color=cyan>"..enyname)
	AddAword(GetLevel(), 15)
	Msg2SubWorld("tuy�n th� <color=cyan>"..enyname.."<color> chi�n th�ng <color=green>"..orgname.."<color> gi�nh ���c  th�ng l�i")
	WriteLog("****************************************************************************")
	WriteLog("tuy�n th� <color=cyan>"..enyname.."<color> chi�n th�ng <color=green>"..orgname.."<color> gi�nh ���c  th�ng l�i")
	WriteLog("Ng��i ch�i ["..orgname.."] th�nh t�ch hi�n t�i l�: th�ng"..nt_gettask(CP_TASKID_WIN)..", thua"..nt_gettask(CP_TASKID_LOSE)..", h�a"..nt_gettask(CP_TASKID_TIE)..", chung cu�c"..nt_gettask(CP_TASKID_POINT))
	
	PlayerIndex = enyply
	WL_clear_pl_state()
	nt_settask(CP_TASKID_WIN, nt_gettask(CP_TASKID_WIN) + 1)
	nt_settask(CP_TASKID_POINT, nt_gettask(CP_TASKID_POINT) + 3)
	Ladder_NewLadder(checkmap(2), GetName(), nt_gettask(CP_TASKID_POINT), 1)
	Msg2Player("B�n �� th�ng<color=green>"..orgname.."<color>, ���c 3 �i�m th��ng")
	WriteLog("Ng��i ch�i ["..enyname.."] th�nh t�ch hi�n t�i l�: th�ng"..nt_gettask(CP_TASKID_WIN)..", thua"..nt_gettask(CP_TASKID_LOSE)..", h�a"..nt_gettask(CP_TASKID_TIE)..", chung cu�c"..nt_gettask(CP_TASKID_POINT))
	WriteLog("****************************************************************************")
	AddAword(GetLevel(), 60)
	nt_settask(CP_TASKID_FLAG, 1)
	DelMSPlayer(MISSIONID, enyply, orgcamp)
	
	SetLogoutRV(0);
	NewWorld(tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])	
end
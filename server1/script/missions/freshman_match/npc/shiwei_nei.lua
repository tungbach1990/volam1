Include("\\script\\missions\\freshman_match\\head.lua")
--�᳡����
RUN_A_TIME = 5
UP_A_TIME = 20
function main()
	local mm = RUN_A_TIME - GetMissionV( 5 )
	if ( mm < 0 ) then
		local mm = UP_A_TIME - GetMissionV( 5 )
		Say("<#> Th� v� h�i tr��ng: V�ng thi ��u n�y c�n"..mm.."<#> ph�t, ng��i c�n vi�c g� kh�ng?", 3,"H� tr� thi ��u V� l�m ki�t xu�t/help_freshmanmatch","Ta mu�n r�i kh�i ��y!/out_trap","Kh�ng c�n!/OnCancel")
		return
	end
	Say("<#> Th� v� h�i tr��ng: V�ng thi ��u n�y c�n"..mm.."<#> ph�t s� b�t ��u, ng��i c�n vi�c g� kh�ng?", 3,"H� tr� thi ��u V� l�m ki�t xu�t/help_freshmanmatch","Ta mu�n r�i kh�i ��y!/out_trap","Kh�ng c�n!/OnCancel")
end

function out_trap()
	local mm = RUN_A_TIME - GetMissionV(5)
	if(mm < 0) then
		Say("<#> Th� v� h�i tr��ng: B�y gi� r�i kh�i th� ph�i ch� ��n ��t, b�n x�c nh�n mu�n r�i kh�i ��y �? ", 2, "Ta mu�n r�i kh�i!/sure_trap", "Kh�ng c�n!/OnCancel")
		return
	end
	Say("Th� v� h�i tr��ng: V�ng thi ��u m�i s�p b�t ��u, b�n x�c nh�n mu�n r�i kh�i ��y �?", 2, "Ta mu�n r�i kh�i!/sure_trap", "Kh�ng c�n!/OnCancel")
end;

function sure_trap()
	if ( nt_gettask( CP_TASKID_ENEMY ) > 0 ) then
		return
	end
	WL_clear_pl_state()
	tryout_mapid = SubWorldIdx2ID( SubWorld )
	Msg2Player( "B�n �� r�i kh�i khu v�c thi ��u ki�t xu�t!" )
	DelMSPlayer( MISSIONID_OUTER, PlayerIndex, 1 )
	SetLogoutRV(0);
	NewWorld( tryout_mapid, CP_MAPPOS_IN[1], CP_MAPPOS_IN[2] )
end

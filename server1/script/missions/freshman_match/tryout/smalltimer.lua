Include("\\script\\missions\\freshman_match\\tryout\\head.lua")
function OnTimer()
	local timer_1 = GetMissionV(MS_TIME_1) + 1
	SetMissionV( MS_TIME_1, timer_1 )
	
	if ( mod( timer_1, 3 ) == 0 ) then
		SetMissionV( MS_A_TIME, GetMissionV( MS_A_TIME ) + 1 )
		if ( GetMissionV( MS_A_TIME ) < RUN_A_TIME ) then
			local mm = RUN_A_TIME - GetMissionV( MS_A_TIME )
			Msg2MSAll( MISSIONID, "Th�i gian b�o danh c�n"..mm.."ph�t" )
		elseif (GetMissionV( MS_A_TIME ) > RUN_A_TIME ) then
			local mm = UP_A_TIME - GetMissionV( MS_A_TIME )
			Msg2MSAll( MISSIONID, "Th�i gian k�t th�c thi ��u v�ng n�y c�n"..mm.."ph�t" )
		end
	end
	
	if ( mod( timer_1, 3 ) == 0 ) then
		if ( GetMissionV( MS_A_TIME ) == RUN_A_TIME ) then
			org_mapid = SubWorldIdx2ID( SubWorld )
			new_mapid = org_mapid + 1
			if (SubWorldID2Idx( new_mapid ) < 0) then
				print( "ANNOUNCE: Kh�ng c� ��u tr��ng thi ��u m�n ph�i ki�t xu�t!!!!MAPID = "..new_mapid )
				return
			end
			SetMissionV( MS_STATE, 2 )
			if (GetMSPlayerCount(MISSIONID, 0) < CP_PLNUM_LIMT) then
				Msg2MSAll(MISSIONID, "Th�i gian thi ��u �� ��n, do s� ng��i thi ��u l�n n�y kh�ng ��"..CP_PLNUM_LIMT.."ng��i, t�m d�ng thi ��u 1 l�n.")
				cp_clearplstate()
				WriteLog(date( "%Y-%m-%d,%H:%M," ).."h�ng th� "..GetMissionV( MS_ROUND ).."s� ng��i thi ��u ki�t xu�t l�n n�y kh�ng ��"..CP_PLNUM_LIMT..", t�m d�ng 1 l�n. M�n ph�i= "..checkmap( 1 ) )
				return
			end

			Msg2MSAll( MISSIONID, "�� ��n gi� thi ��u, t�t c� tuy�n th� v�o tr��ng ��u" )
			round = GetMissionV( MS_ROUND )
			SubWorld = SubWorldID2Idx( new_mapid )
			OpenMission( MATCH_MS_ID )
			SetMissionV( 3, round )
			SubWorld = SubWorldID2Idx( org_mapid )
			join_match()
			return
		end
	end
	
	if ( GetMissionV( MS_A_TIME ) == 0 ) then
		return
	end
	if ( mod( timer_1, 3 ) == 0 ) then
		if ( GetMissionV( MS_ROUND ) >= CP_ONEDAY_MAXROUND ) then
			return
		end
		if ( mod( GetMissionV( MS_A_TIME ), UP_A_TIME ) == 0 ) then
			resultstr = "h�ng th� "..GetMissionV( MS_ROUND ).."th� m�y"..checkmap( 1 ).."Thi ��u m�n ph�i ki�t xu�t v�a k�t th�c. V�ng thi ��u �� b�t ��u b�o danh."
			AddGlobalNews( resultstr )
			SetMissionV( MS_ROUND, GetMissionV( MS_ROUND ) + 1 )
			SetMissionV( MS_A_TIME, 0 )
			SetMissionV( MS_STATE, 1 )
			return
		end
	end
end

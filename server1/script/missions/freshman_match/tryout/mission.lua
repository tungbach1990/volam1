Include("\\script\\missions\\freshman_match\\tryout\\head.lua")

function InitMission()
	for i = 1, 100 do 
	SetMissionV( i , 0 );
	end;
	SetMissionS( 1, "" )
	SetMissionS( 2, "" )
	StartMissionTimer( MISSIONID, TIMERID_SMALL_OUTER, TRYOUT_TIMER_1 );
	StartMissionTimer( MISSIONID, TIMERID_TOTAL_OUTER, TRYOUT_TIMER_2 );
	
	SetMissionV( MS_STATE,1 );--��������
	RunMission( MISSIONID )
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer( MISSIONID, TIMERID_SMALL_OUTER) ;
	StopMissionTimer( MISSIONID, TIMERID_TOTAL_OUTER );
	GameOver();
	for i = 1, 100 do 
		SetMissionV( i , 0 );
	end;
	if(tonumber(date("%y%m%d%H")) >= CP_END_TRYOUT) then
		resultstr = "Thi ��u V� l�m ki�t xu�t �� k�t th�c, xin c�c tuy�n th� ��n L�m An g�p S� gi� ki�t xu�t (203, 202) xem danh s�ch ki�t xu�t. 5 ng��i ��u c� th� ��n g�p S� gi� ki�t xu�t (203, 202) �� l�nh th��ng."
	else
		resultstr = "Ng�y thi ��u V� l�m ki�t xu�t h�m nay �� k�t th�c, tuy�n th� tham gia ng�y mai t�i chi�n."
	end
	AddGlobalNews(resultstr) 
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	WL_clear_pl_state()
end;
Include("\\script\\missions\\autohang\\head.lua")

function InitMission()
	do return end
	WriteLog(GetLoop()..date("%m%d-%H:%M")..": B�t ��u treo m�y!")
	StartMissionTimer(AEXP_MISSIONID, AEXP_TIMERID, AEXP_UPDATETIME);
	
	-- �����Ƿ���ѣ��Լ����鱶��(>=1)
	SetAutoHangFreeFlag(AEXP_IsFreeTimeDoubleExp(), AEXP_FREEDATE_EXPFACTOR);
end;

function RunMission()
end;

function EndMission()
	WriteLog(GetLoop()..date("%m%d-%H:%M")..": K�t th�c treo m�y!");
	StopMissionTimer(AEXP_MISSIONID, AEXP_TIMERID);
end;

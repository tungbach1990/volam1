FRAME2TIME = 18;
INTERVAL = 5 * 60 * FRAME2TIME;  --5����һ��

function InitMission()
	SetGlbMissionV(1, 1);
	StartGlbMSTimer(8, 18, INTERVAL);
end;

function RunMission()

end;

function EndMission()
	StopGlbMSTimer(8, 18);
end;

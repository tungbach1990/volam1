
MSID_LOCALNEWS = 17
TMID_LOCALNEWS = 32
INTERVAL = 15 * 60 * 18;  --15����һ��

function InitMission()
	StartGlbMSTimer(MSID_LOCALNEWS, TMID_LOCALNEWS, INTERVAL);
end

function RunMission()
end

function EndMission()
end

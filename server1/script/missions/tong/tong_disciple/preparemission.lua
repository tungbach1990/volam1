Include([[\script\missions\tong\tong_disciple\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "C�c bang h�i �ang t� ch�c c�c nh�n s� �i chi�u m� �� t�, l�m l�c l��ng h�u b� l�u d�i, T�ng qu�n Ho�t ��ng ph��ng �ang ch� ��i m�i ng��i ��n gi�p m�t tay."
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_DIS_PHASE, 1);	--���Կ�ʼ������
	gb_SetTask(CHRISMAS_SHREWMOUSE, 1, 1);
	StartMissionTimer(DIS_PREPAREMISSIONID, DIS_PREPARETIME, DIS_RUNINTERVER); --
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer(DIS_PREPAREMISSIONID, DIS_PREPARETIME);
	gameover(DIS_MAPID[1], DIS_PREPAREMISSIONID);
end;

function OnLeave()
end

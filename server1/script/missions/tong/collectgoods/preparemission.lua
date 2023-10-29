Include([[\script\missions\tong\collectgoods\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "V� l�m minh ch� �ang t�p trung c�c nh�n s� t� ch�c �i t�m t�i h�ng h�a c�a T�y H� th��ng nh�n v�, m�i ng��i c� th� ��n T�ng qu�n Ho�t ��ng ph��ng �� b�o danh tham gia."
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_COLLG_PHASE, 1);	--���Կ�ʼ������
	gb_SetTask(COLLG_NAME, 1, 1);
	StartMissionTimer(COLLG_PREPAREMISSIONID, COLLG_PREPARETIME, COLLG_RUNINTERVER);
end;

function RunMission()
end;

function EndMission()
	StopMissionTimer(COLLG_PREPAREMISSIONID, COLLG_PREPARETIME);
	SetGlbValue(GLB_COLLG_PHASE, 2); --��ֹ�ٽ�������
	gb_SetTask(COLLG_NAME, 1, 2);
	collg_gameover(COLLG_MAPID[1], COLLG_PREPAREMISSIONID);
end;

function OnLeave()
end

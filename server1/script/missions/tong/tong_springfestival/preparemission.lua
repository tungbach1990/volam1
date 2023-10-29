Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = format("T�n quan ph� b� nh�n �ang say ng�, ��nh ph�i nh� c�c v� nh�n s� bang h�i �i ��nh �u�i %s, nh�n s� n�o mu�n gi�p s�c c� th� ��n T�ng qu�n Ho�t ��ng ph��ng � khu v�c bang h�i m�nh �� b�o danh tham gia.",SF_ANIMALNAME);
	AddGlobalNews(strGlbNews);
	SetGlbValue(GLB_SF_PHASE, 1);	--���Կ�ʼ������
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 1);
	StartMissionTimer(SF_PREPAREMISSIONID, SF_PREPARETIME, SF_RUNINTERVER); --
end;

function EndMission()
	StopMissionTimer(SF_PREPAREMISSIONID, SF_PREPARETIME);
	festival_gameover(SF_MAPID[1], SF_PREPAREMISSIONID);
end;

function OnLeave()
end

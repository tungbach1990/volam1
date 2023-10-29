Include([[\script\missions\springfestival\festival_head.lua]]);
Include("\\script\\lib\\gb_taskfuncs.lua")

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "Quan ph� b�t ��u cho ng��i �i �u�i Qu�i Th� "..FE_ANIMALNAME..", m�i ng��i h�y ��n Nha m�n sai d�ch � c�c th�nh �� b�o danh tham gia.";
	AddGlobalNews(strGlbNews);
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 1);
	SetGlbValue(GLB_FE_PHASE, 1);	--���Կ�ʼ������
	StartMissionTimer(FE_PREPAREMISSIONID, FE_PREPARETIME, FE_RUNINTERVER); --
end;

function EndMission()
	StopMissionTimer(FE_PREPAREMISSIONID, FE_PREPARETIME);
	SetGlbValue(GLB_FE_PHASE, 2); --��ֹ�ٽ�������
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 2);
	
	festival_gameover(FE_MAPID[1], FE_PREPAREMISSIONID);
end;

function OnLeave()
end

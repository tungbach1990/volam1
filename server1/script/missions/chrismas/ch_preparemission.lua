Include([[\script\missions\chrismas\ch_head.lua]]);
Include("\\script\\lib\\gb_taskfuncs.lua")

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	strGlbNews = "L�i th�m m�t nh�m ng��i m�i �i t�m qu� th�t l�c."
	AddGlobalNews(strGlbNews);
	gb_SetTask("Ho�t ��ng Gi�ng Sinh", 1, 1);
	SetGlbValue(GLB_CH_PHASE, 1);	--���Կ�ʼ������
	StartMissionTimer(CH_PREPAREMISSIONID, CH_PREPARETIME, CH_RUNINTERVER); --
end;

function RunMission()
	SetGlbValue(GLB_CH_PHASE, 2); --��ֹ�ٽ�������
end;

function EndMission()
	StopMissionTimer(CH_PREPAREMISSIONID, CH_PREPARETIME);
	SetGlbValue(GLB_CH_PHASE, 3); --��ֹ�ٽ�������
	gb_SetTask("Ho�t ��ng Gi�ng Sinh", 1, 2);
end;

function OnLeave()
end

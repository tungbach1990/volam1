Include("\\script\\missions\\citywar_city\\head.lua");
function OnDeath(DoorIndex)
	WriteLog(GetLoop()..": C�ng n�o �� b� ch�t r�i! "..DoorIndex);
	DoorI = DoorIndex
	for i = 1, g_nDoorCount do 
		D = GetMissionV(MS_DOORBEGIN + i - 1)
		if (D - DoorI == 0) then
			SetMissionV(MS_DOORBEGIN + i - 1, 0)
			AddGlobalNews("Theo tin t� chi�n tr��ng ��a v�, m�t c�ng th�nh c�a phe th� �� b� t�n c�ng, t�nh th� r�t nguy c�p ");
			ClearObstacle(ObstaclePos[i][1], ObstaclePos[i][2]);
			
			--ɾ����Ӧ�Ĺ��ǳ�
			DelGcc = GetMissionV(MS_GCCBEGIN + i - 1) 
			if (DelGcc > 0) then 
				WriteLog(GetLoop()..": c�ng b� ph� r�i, x�a b� xe c�ng th�nh ");
				DelNpcSafe(DelGcc)
				SetMissionV(MS_GCCBEGIN + i - 1, 0);
			end;
			
			return 
		end
	end;
end;
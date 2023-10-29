Include ("\\script\\event\\eventhead.lua")

ARENACOUNT = 8;
ARENAWLDIDXBEGIN = 213;
CITYWARIDX = 221;
CITYCOUNT = 7

function OnTimer()
	--�����̨�������,����������ʱ�Զ�������̨��
	for i = 1, ARENACOUNT do 
		if (IsArenaBegin(i - 1) == 1) then 
			WorldIdx = SubWorldID2Idx(ARENAWLDIDXBEGIN + i - 1)
			if (WorldIdx >= 0) then
				SubWorld = WorldIdx
				if (GetMissionV(1) == 0) then
					OpenMission(5)
				end;
			end
		end;
	end;
	
	--����ս�����,����������ʱ�Զ�������ս
	for i = 1, CITYCOUNT do 
		if (HaveBeginWar(i) == 1) then
			WorldIdx = SubWorldID2Idx(CITYWARIDX);
			if (WorldIdx >= 0) then 
				SubWorld = WorldIdx
				if (GetMissionV(1) == 0) then 
					OpenMission(6)
--					SetMissionV(MS_GAMERULE, 0); --����Ϊ�ɰ���Ϸ����
					RunMission(6)
				end
			end
		end;
	end;
end;

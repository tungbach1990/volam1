Include("\\script\\missions\\tongwar\\match\\head.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--计数器，统计当前定时器触发了多少次了
	SetMissionV(MS_TIMER1, t)
	

	if (t == RUNGAME_TIME) then --如果到了正式开战时刻，则停止报名，正式进入战斗阶段
		RunMission(MISSIONID)
		AddGlobalNews("'V� L﹎ е Nh蕋 Bang'"..GetMissionS(MS_S_CITYNAME_S).." v�"..GetMissionS(MS_S_CITYNAME_J).." - tr薾 chi課 b総 u.");
		WriteLog("tongwar is entering fight state.")
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str2 = "C竎h th阨 gian khai chi課 ch� c遪:"..RestMin.."ph髏"
		else
			str2 = "C竎h th阨 gian khai chi課 ch� c遪:"..RestMin.."ph髏"..RestSec.." gi﹜"
		end
		Msg2MSAll(MISSIONID,str2);		--通知场内玩家开战剩余时间
	end
	
	if (t > RUNGAME_TIME) then
		if (t >= RUNGAME_TIME + 15) then
			--如果场上某一阵营人数低于最小数量，则比赛结束，人多的阵营直接获胜
			local group1count = GetMSPlayerCount(MISSIONID, 1)
			local group2count = GetMSPlayerCount(MISSIONID, 2)
			if (group1count < MIN_MEMBERCOUNT or group2count < MIN_MEMBERCOUNT) then
				if ( group1count < MIN_MEMBERCOUNT and group2count < MIN_MEMBERCOUNT) then
					SetMissionV(MS_MOSTDEATH, 0)
				elseif(group1count < MIN_MEMBERCOUNT) then
					SetMissionV(MS_MOSTDEATH, 2)
				elseif(group2count < MIN_MEMBERCOUNT) then
					SetMissionV(MS_MOSTDEATH, 1)
				end
				CloseMission(MISSIONID)
				return
			end
		end

		--每一分钟通告当前双方积分，和npc
		if (mod(t, 3) == 0 ) then
			msstr = "C玭g b�: Hi謓 t筰, t鎛g 甶觤 li猲 minh"..GetMissionS(MS_S_CITYNAME_S).." v� li猲 minh"..GetMissionS(MS_S_CITYNAME_J).." l� <color=yellow>"..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)
		end
		if (mod(t, 30) == 0) then
			RestTime = floor(GetMSRestTime(MISSIONID, 62) / 18)
			RestMin, RestSec = GetMinAndSec(RestTime);
			if (RestSec == 0) then
				str2 = "Th阨 gian thi u c遪 l筰:"..RestMin.."ph髏"
			else
				str2 = "Th阨 gian thi u c遪 l筰:"..RestMin.."ph髏"..RestSec.." gi﹜"
			end
			Msg2MSAll(MISSIONID,"<color=blue>"..str2.."<color>");		--通知场内玩家开战剩余时间
		end
		but_pop2home( 1 )
		but_pop2home( 2 )
	end

end




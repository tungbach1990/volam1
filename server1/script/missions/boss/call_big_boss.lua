Include("\\script\\missions\\boss\\bigboss.lua")
IncludeLib("TASKSYS");


function BigBoss:Make_Big_Boss(bossid, bosslvl, series, mapid, posx, posy, bossname, str)
	local mapidx = SubWorldID2Idx(mapid)
	local strMapName = SubWorldName(mapid)
	if (mapidx < 0) then
		return
	end
	local npcindex = AddNpcEx(bossid, bosslvl, series, mapidx, posx*32, posy*32, 1, bossname, 1)
	if (npcindex > 0) then
		SetNpcScript(npcindex, "\\script\\missions\\boss\\bigboss_npc.lua");
		SetNpcTimer(npcindex, 15*60*18);
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "MakeAllPlayerCanGetReward", 0);
		WriteLog(date("%H:%M")..","..bossid..","..bosslvl..","..series..","..SubWorldIdx2ID(mapidx)..","..posx..","..posy..","..bossname);
		AddGlobalNews(str);
		str1 = format("Giang h� truy�n r�ng <color=yellow>%s<color> �� xu�t hi�n � <color=yellow>%s<color>! Giang h� �t s� c� m�t tr�n ��m m�u!",bossname, strMapName)
		Msg2Player(str1);
	end

end
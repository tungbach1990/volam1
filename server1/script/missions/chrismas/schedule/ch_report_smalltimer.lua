Include([[\script\missions\chrismas\ch_head.lua]]);

function OnTimer()
	local nNewsValue = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, nNewsValue);
	
	gb_SetTask("Ho箃 ng Gi竛g Sinh", 1, 2);
	if (20 == nNewsValue) then
		CloseMission(CH_MISSIONID);
		return
	end;
	
	local i;
	for i = 1, CH_SMALLMAPCOUNT do
		if (nNewsValue >= 18) then
			groupsort(i, 1);
		else
			groupsort(i, 0);
		end;
	end;
	
	if (0 == mod(nNewsValue, 2)) then
		local nTime = floor(nNewsValue / 2);
		nTime = 10 - nTime;
		if (nTime > 0) then
			local OldSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(CH_MAPID[2]);
			Msg2MSAll(CH_MISSIONID, "Ho箃 ng v蒼 c遪<color=yellow>"..nTime.."<color>ph髏 k誸 th骳!");
			SubWorld = OldSubWorld;
		end;
	end;
end;

--排序函数(根据点击个数由多到少确定将一组成员的名次)；
function groupsort(nGroupId, bSave)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CH_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, CH_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(CH_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(TK_COUNT_ONETIME);
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	
	local j;
	local temptab = {};
	local nCount = getn(tabPlayer);
	for i = 2, nCount do	--采用一个冒泡排序
		for j = nCount, i, -1 do
			if (tabPlayer[j][2] > tabPlayer[j - 1][2]) then	--采用降序排序
				temptab = tabPlayer[j];
				tabPlayer[j] = tabPlayer[j - 1];
				tabPlayer[j - 1] = temptab;
			end;
		end;
	end;

	local szMsg = ""
	local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1]
			szMsg = szMsg.."<enter> <color=green>"..i.." "..GetName()..", t譵 頲"..tabPlayer[i][2].."m鉵 qu�"
		end
	end
	--排序后从前到后就是名次的先后
	nCount = nCount;
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		if (bSave == 1) then
			SetTask(TK_RANK, i);
		end;
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		Msg2Player("Hi謓 b筺 t譵 頲 <color=yellow>"..GetTask(TK_COUNT_ONETIME).."<color>m鉵 qu�, hi謓 t筰 x誴 h筺g <color=yellow>"..i.."<color>, ti誴 t鬰 c� g緉g!");
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;

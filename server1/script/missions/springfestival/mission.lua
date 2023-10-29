Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\libfestival\mission.lua]]);
STRGLOBALNEWS = "C�c v� anh h�ng �u�i �ng ba m��i �� quay v� r�i.";

function initmission_add()

end;

function EndMission_add()
	local i;
	for i = 1, CO_SMALLMAPCOUNT do
		if (GetMSPlayerCount(CO_MISSIONID, i + CO_SMALLMAPCOUNT) > 0 or
		    GetMSPlayerCount(CO_MISSIONID, i) > 0) then
			groupsort(i);
			groupsort(i + CO_SMALLMAPCOUNT);
		end;
	end;
	festival_gameover(CO_MAPID[2], CO_MISSIONID);	--����������������ͼ
	AddGlobalNews(STRGLOBALNEWS);
	
	ClearMapObj(CO_MAPID[2]);
end;

function OnLeave()
end

function festival_getsz(tabMsg, nMsgCount, tabPlayer, nGroupId)
    local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	local i;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1];
		    tabMsg[i + nMsgCount] = "<color=orange>th� "..i.." "..GetName()..", t�m ���c"..CO_MOUSENAME..tabPlayer[i][2].."l�n";
		end
	end
	nMsgCount = getn(tabMsg);
	if (nMsgCount > 0) then
	    tabMsg[nMsgCount] = tabMsg[nMsgCount];
	end;
	return tabMsg, nMsgCount;
end;

function festival_broadcast(tabMsg, nMsgCount, tabPlayer)
    nCount = getn(tabPlayer);
    local i, j;
    --������ǰ����������ε��Ⱥ�
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(TK_CO_RANK, i);
		for j = 1, nMsgCount do
		    Msg2Player(tabMsg[j]);
		end;
		if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT) then
   	    	Msg2Player("Ng��i t�m th�y"..CO_MOUSENAME.."l�n th� <color=yellow>"..i.."<color> l�n, c� th� ��n <color=yellow>Sai d�ch Nha m�n<color> nh�n ph�n th��ng!");
   	    else
   	    	Msg2Player("�u�i �ng ba m��i l�n th� <color=yellow>"..i.."<color> l�n, c� th� ��n <color=yellow>Sai d�ch Nha m�n<color> nh�n ph�n th��ng!");
   	    end;
	end;
end;
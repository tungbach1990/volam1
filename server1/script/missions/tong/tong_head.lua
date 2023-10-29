if (1) then -- not __TONG_H__) then
	__TONG_H__ = 1;
IL("TONG");
IncludeLib("FILESYS");
Include("\\script\\missions\\tong\\tong_springfestival\\file_npc_head.lua")
-- Include([[\script\tong\workshop\ws_huodong.lua]]);


SFHD_DATAFILE = [[\settings\tong\workshop\huodong_level_data.txt]];
HUODONG_TASKID = {{1015, 1016}, {1017, 1018}, {1019, 1020}};
TONGGXD = {{800, 4}, {500, 6}, {300, 8}};

--=========�������===============
TK_LEAVERMAPID = 2392;	--�洢�뿪��Ϸ��mapid
TK_LEAVERPOSX = 2393;	--�洢�뿪��Ϸ��x�����
TK_LEAVERPOSY = 2394;	--�洢�뿪��Ϸ��y�����

TK_GROUPID = 2399;	--��¼��ҵ�Group��
TK_EXP_BEISHU = 2400; --
TK_EXP_TIME = 2401;
--================================
	
function FALSE(nParam)
	if (nParam == nil or nParam == "" or nParam == 0) then
		return 0;
	end;
	return 1;
end

function festival_tongjudge(nType, nTongID, nWorkshopID)--�ж��Ƿ�����ʸ�nType:1-��ļ����2-����
	local nLevel = TWS_GetLevel(nTongID, nWorkshopID)
	local nPCount = TONG_GetMemberCount(nTongID, -1);
	if (nLevel < 1 or nLevel > 10) then
		Say("Qu� bang v�n ch�a x�y d�ng T�c Ph��ng n�y.", 1, "Ta bi�t r�i!/OnCancel")
		return 0;
	end;
	--local njoinrate = tonumber(GetTabFileData(SFHD_DATAFILE, nLevel + 2, TONGGXD[nType][2]));
	local nMax = 20 --ceil(nPCount * njoinrate);
	local nTimes = TWS_GetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][1]);
	local nDay = tonumber(GetLocalDate("%d"));
	TDay = TWS_GetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][2]);
	if (nDay ~= TDay) then
		TWS_ApplySetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][2], nDay);
		TWS_ApplySetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][1], 0);
	end;
	if (nTimes >= nMax) then
		Say("Bang h�i h�m nay kh�ng c� ho�t ��ng n�o, ng�y kh�c h�y ��n t�m ta.", 1, "Ta bi�t r�i!/OnCancel")
		return 0;
	end;
	
	TWS_ApplySetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][1], nTimes + 1);	
	
	local nGXD = GetContribution();
	if (nGXD < TONGGXD[nType][1]) then
		Say("T�ng qu�n Ho�t ��ng ph��ng: �i�m c�ng hi�n c�a ng��i kh�ng ��"..TONGGXD[nType][1]..", kh�ng th� tham gia ho�t ��ng.", 1, "Ta bi�t r�i!/OnCancel")
		TWS_ApplySetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][1], nTimes); --���ɹ���������
		return 0;
	end;
	
	return 1;
end;



--������볡ʱ�ķ���
function chaos(tabPlayerIdx, nMax) --������ҵ�˳��,�ֳ�10���˵�һ��С�ֶ�
	if ("table" ~= type(tabPlayerIdx)) then
		error("tabPlayerIdx is not a table value!");
	end;
	chr_rand_tab(tabPlayerIdx)
	local nPCount = getn(tabPlayerIdx);
	local subTabCount = floor(nPCount / nMax);
	local tabSubTeam = {};
	local i, j;
	local nIndex;
	local nBeginPlayer = random(1, nPCount);
	
	--���ܳ���10���˵��볡
	for i = 1, subTabCount do
		tabSubTeam[i] = {}
		for j = 1, nMax do
			local nIndex = subTabCount * (j - 1) + i + nBeginPlayer - 1;
			nIndex = mod(nIndex - 1, nPCount) + 1
			tabSubTeam[i][j] = tabPlayerIdx[nIndex];
		end;
	end;
	--����10���˵ķŵ�����һ��С����
	tabSubTeam[subTabCount + 1] = {};
	j = 1;
	local nBegin = nMax * subTabCount + 1;
	for i = nBegin, nPCount do
		nIndex = i  + nBeginPlayer - 1; 
		nIndex = mod(nIndex - 1, nPCount) + 1;
		tabSubTeam[subTabCount + 1][j] = tabPlayerIdx[nIndex];
		j = j + 1;
	end;
	return tabSubTeam;
end;

function cancelgame(nMapID, nMissionID)
	local OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(nMapID);
	local pidx;
	local idx = 0;
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local i;
	for i = 1, 400 do
		idx, pidx = GetNextPlayer(nMissionID, idx, 0);
		if (pidx > 0) then
			tinsert(tabPlayer, pidx);
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	local nLoop = getn(tabPlayer);
	for i = 1, nLoop do
		PlayerIndex = tabPlayer[i];
		Say("Do s� ng��i b�o danh tham gia �t h�n <color=yellow>5<color> ng��i, ho�t ��ng l�n n�y b� h�y b�.", 1, "Ta bi�t r�i!/OnCancel")
		Msg2Player("Do s� ng��i b�o danh tham gia �t h�n <color=yellow>5<color> ng��i, ho�t ��ng l�n n�y b� h�y b�.");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
	end;
	PlayerIndex = OldPlayer;
	SubWorld = OldWorld;
end;

--tabParam = {׼����ID, {��Ҫ�Ĺ��׶�, �����ļ�}, {����Ϊ����������...}, {groupֵ, ��ʼ��ͼmap, MissionID, �����map}}
--tabParam = {nPrepareMapID, {nContri, szFile}, {}, 
--				{nGroupId, nBeginMap, nMissionID, nMissionMap}}
function gogamemap(tabPlayerIdx, tabParam) --
	if ("table" ~= type(tabPlayerIdx)) then
		return
	end;
	local OldSubWorld = SubWorld;
	local nPCount = getn(tabPlayerIdx);
	local OldPlayer = PlayerIndex;
	local nContri, i, PosX, PosY;
	SubWorld = SubWorldID2Idx(tabParam[1]);
	for i = 1, nPCount do
		PlayerIndex = tabPlayerIdx[i];
		if (PlayerIndex > 0) then
				--������۳���ṱ�׶�
			nContri = GetContribution();
			if (nContri < tabParam[2][1]) then
				Say("�i�m c�ng hi�n kh�ng ��"..tabParam[2][1]..", kh�ng th� tham gia ho�t ��ng.", 1, "Ta bi�t r�i!/OnCancel");
				DelMSPlayer(tabParam[4][3], PlayerIndex, 0);
				Msg2Player("�i�m c�ng hi�n kh�ng ��"..tabParam[2][1]..", kh�ng th� tham gia ho�t ��ng.");
				NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
			else
				Msg2Player("Tham gia ho�t ��ng ph��ng c�a bang, ti�u hao <color=red>�i�m c�ng hi�n bang h�i<color><color=yellow> "..tabParam[2][1].."<color>.")
				AddContribution(-1 * tabParam[2][1]);--����ʱ�۳����׶�

				for j = 1, getn(tabParam[3]) do
					SetTask(tabParam[3][j], 0);
				end;
				SetTask(TK_GROUPID, tabParam[4][1]);	--��¼��ҵ�groupid

				PosX, PosY = getadatabetween(tabParam[2][2], 8 + 8 * tabParam[4][2], 15 + 8 * tabParam[4][2]);
				NewWorld(tabParam[4][4], floor(PosX / 32), floor(PosY / 32));
				SubWorld = SubWorldID2Idx(tabParam[4][4]);
				AddMSPlayer(tabParam[4][3], tabParam[4][1]);
			end;
		end;
	end;
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;

function chr_rand_tab(tab)
	local tab_size = getn(tab);
	for i = 1, tab_size do
		m1 = random(1,tab_size);
		m2 = random(1,tab_size);
		m = tab[m1];
		tab[m1] = tab[m2];
		tab[m2] = m;
	end;
end;

function OnCancel()
end;


end; --//end of __TONG_H__
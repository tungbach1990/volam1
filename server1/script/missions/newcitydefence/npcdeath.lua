----------------------------------------------------------------
--FileName:	npcdeath.lua
--Creater:	firefox
--Date:		2005-09-01
--Comment:	��ĩ�������ս��֮�������
--			���ܣ�NPC�����ű�
-----------------------------------------------------------------
--rank = 1, 2, 3, 4, 5
Include("\\script\\missions\\newcitydefence\\head.lua")

ITEM_DROPRATE_TABLE = { 	-- �Ž�
						{ { 6,1,1686,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ��֮ս��
						{ { 6,1,1687,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ľ֮ս��
						{ { 6,1,1688,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ˮ֮ս��
						{ { 6,1,1689,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ��֮ս��
						{ { 6,1,1690,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ��֮ս��
						{ { 6,1,1691,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ��֮����
						{ { 6,1,1692,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ľ֮����
						{ { 6,1,1693,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ˮ֮����
						{ { 6,1,1694,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ��֮����
						{ { 6,1,1695,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ��֮����
						{ { 6,1,1696,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ��֮����
						{ { 6,1,1697,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ľ֮����
						{ { 6,1,1698,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ˮ֮����
						{ { 6,1,1699,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ��֮����
						{ { 6,1,1700,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- ��֮����
						{ { 6,1,1701,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- �о���
						{ { 6,1,1702,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- С����
						{ { 6,1,1703,1,0,0 }, { 0.0005,0.0010,0.0020,0.0100,0.0200 } },	-- �廨¶
					  }
					  
NPC_RANK_DROPRATE_TABLE = { 1, 2, 3, 4, 5 } --�������

function OnDeath( nNpcIndex )
	local state = GetMissionV(MS_STATE) ;
	if (state ~= 2) then
		return
	end;
	local citycamp = GetMissionV( MS_CITYCAMP )
	local npccamp = 1
	local npcname = "Qu�n T�ng"
	if ( citycamp == 1 ) then
		npccamp = 2
		npcname = "Qu�n Kim"
	end
	local nAddZhanGong = tbKILLNPC_AWARD[rank]
	local nAddShareZhanGong = tbKILLNPC_SHAREAWARD[rank]
--	local nZhanGong = 0
--	if GetTeamSize() <= 0 then
--		nZhanGong = GetTask(TSKID_PLAYER_ZHANGONG)
--		SetTask(TSKID_PLAYER_ZHANGONG,nZhanGong + nAddZhanGong)
--		Msg2Player(format("��ɱ��һ���о�<color=yellow>%s<color>�������<color=yellow>%s<color>ս��ֵ",tbSOLDIER_NAME[rank],nAddZhanGong))		
----		cd_AddSkillTitle()
--	else
--		local pPlayerIndex = PlayerIndex;
--		for i = 1, GetTeamSize() do 
--			PlayerIndex = GetTeamMember(i);
--			nZhanGong = GetTask(TSKID_PLAYER_ZHANGONG)
--			if PlayerIndex == pPlayerIndex then
--				SetTask(TSKID_PLAYER_ZHANGONG,nZhanGong + nAddZhanGong)
--				Msg2Player(format("��ɱ��һ���о�<color=yellow>%s<color>�������<color=yellow>%s<color>ս��ֵ",tbSOLDIER_NAME[rank],nAddZhanGong))
--			else
--				SetTask(TSKID_PLAYER_ZHANGONG,nZhanGong + nAddShareZhanGong)
--				Msg2Player(format("���Ķ���ɱ����һ���о�<color=yellow>%s<color>������������<color=yellow>%s<color>ս��ֵ",tbSOLDIER_NAME[rank],nAddShareZhanGong))			
--			end
----			cd_AddSkillTitle()
--		end
--		PlayerIndex = pPlayerIndex
--	end
--	BT_SortLadder()
--	BT_BroadSelf()
	if rank == 6 then --ը����
		local state = GetMissionV(MS_STATE) ;
		if (state ~= 2) then
			return
		end;
		Msg2MSAll(MISSIONID, format("<color=yellow>%s c�a ��i ph��ng �� b� ph� h�y!!!<color>",tbSOLDIER_NAME[6]))
		return
	end
	dropItem( nNpcIndex, rank, PlayerIndex );
	if ( GetMissionV( MS_MAXCOUNTNPC_1 + rank - 1 ) ~= 0 ) then
		SetMissionV( MS_RESTCOUNTNPC_1 + rank - 1, GetMissionV( MS_RESTCOUNTNPC_1 + rank - 1 ) - 1 )
		SetMissionV( MS_MAXCOUNTNPC_1 + rank - 1, GetMissionV( MS_MAXCOUNTNPC_1 + rank - 1 ) - 1 )
	end
	local count = 0
	for i = 1, 5 do
		count = count + GetMissionV(MS_MAXCOUNTNPC_1 + i - 1)
	end
	if ( (count <= 0 and GetMissionV(MS_BOSS5_DOWN) == 1) or GetMissionV(MS_MAXCOUNTNPC_5) <= 0) then
		Msg2MSAll(MISSIONID, "<color=yellow>Ch� so�i qu�n ��ch �� b� ti�u di�t!!!")
		SetMissionV(MS_CITYDEFENCE, 1)
		CloseMission(MISSIONID)
	end
end

function dropItem( nNpcIndex, nNpcRank, nBelongPlayerIdx )
	local nItemCount = getn( ITEM_DROPRATE_TABLE );
	local nMpsX, nMpsY, nSubWorldIdx = GetNpcPos( nNpcIndex );
	
	for nDropTimes = 1, NPC_RANK_DROPRATE_TABLE[nNpcRank] do
		local nRandNum = random();
		local nSum = 0;
		for i = 1, nItemCount do
			nSum = nSum + ITEM_DROPRATE_TABLE[i][2][nNpcRank];
			if( nSum > nRandNum ) then
				DropItem( nSubWorldIdx, nMpsX, nMpsY, nBelongPlayerIdx, ITEM_DROPRATE_TABLE[i][1][1], ITEM_DROPRATE_TABLE[i][1][2], ITEM_DROPRATE_TABLE[i][1][3], ITEM_DROPRATE_TABLE[i][1][4], ITEM_DROPRATE_TABLE[i][1][5], ITEM_DROPRATE_TABLE[i][1][6], ITEM_DROPRATE_TABLE[i][1][7] );
				break
			end
		end
	end
end
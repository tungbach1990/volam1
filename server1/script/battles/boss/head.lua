Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\battles\\battles_award_head.lua")		--By С�˶��
Include("\\script\\event\\change_destiny\\mission.lua");	-- �������
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");
MISSIONID = 66;
FRAME2TIME = 18;	--18֡��Ϸʱ���൱��1����
sf_aryItems = {
	{ "Gia B�o ho�n", {6,0,2,1,0,0}, 5 },
	{ "Cao Trung ho�n", {6,0,5,1,0,0}, 5 },
	{ "Cao Thi�m ho�n", {6,0,4,1,0,0}, 5 },
	{ "Tr��ng M�nh ho�n", {6,0,1,1,0,0}, 5 },
	{ "Phi T�c ho�n", {6,0,6,1,0,0}, 5 },
	{ "��c Ph�ng ho�n", {6,0,10,1,0,0}, 5 },
	{ "B�ng Ph�ng ho�n", {6,0,7,1,0,0}, 5 },
	{ "H�a Ph�ng ho�n", {6,0,9,1,0,0}, 5 },
	{ "L�i Ph�ng ho�n", {6,0,8,1,0,0}, 5 },
	{ "��i L�c ho�n", {6,0,3,1,0,0}, 30 },
	{ "Ph�o Hoa", {6,0,11,1,0,0}, 1 },
	{ "Mai Kh�i Hoa V� ", {6,0,20,1,0,0}, 2 },
	{ "T�m T�m T��ng �nh ph� ", {6,1,18,1,0,0}, 5 },
	}

TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
TIMER_2 = 90 * 60  * FRAME2TIME; -- ��սʱ��Ϊ1Сʱ
RUNGAME_TIME = 30 * 60 * FRAME2TIME / TIMER_1; --����30����֮���Զ�����ս���׶�
BOSS_TIME = 60 * 60 * FRAME2TIME / TIMER_1;--ս����ʼ��30���ӳ���Ԫ˧
VANISHGAME_TIME = 70 * 60 * FRAME2TIME/ TIMER_1; --ս�����20����ʱ����������Npcȫ������
GO_TIME =  30 * 60 * FRAME2TIME  / TIMER_1; -- ����ʱ��Ϊ��Сʱ
tbCOMMONBOSSTIME_ALL = -- ����ȫ����ͨBOSS��ʱ���
{
	31 * 60 * FRAME2TIME / TIMER_1,
	40 * 60 * FRAME2TIME / TIMER_1,
	50 * 60 * FRAME2TIME / TIMER_1,
};
tbCOMMONBOSSTIME_SOME = -- ������·��ͨBOSS��ʱ���
{
	60 * 60 * FRAME2TIME / TIMER_1,
	70 * 60 * FRAME2TIME / TIMER_1,
	80 * 60 * FRAME2TIME / TIMER_1,
};


MAX_MEMBERCOUNT = 150 
TIME_PLAYER_REV = 8 ; -- ����������˳���Ϸ�ٽ���ʱ������3����֮������뿪��Ӫ����Ӫ

--������ĳЩֵ��¼��MissionValue�е�����λ�ã�ͨ��GetMissionV(MS_XXX)�����ʵ�ʵ�ֵ
MS_MARSHAL = 2;--��¼��ǰ���������ξ�Ԫ˧��1�����ǽ��Ԫ˧��2�����Ƕ������ˣ�3��

MS_CENTER_X1 = 4;   --����1���������׶�ʱ����ֹ����뿪��Ӫʱ��������ӻش�Ӫ������
MS_CENTER_Y1 = 5;
MS_CENTER_X2 = 6;		--����2
MS_CENTER_Y2 = 7;

MS_HOMEIN_X1 = 8;    --����1����Ӫ������
MS_HOMEIN_Y1 = 9;
MS_HOMEOUT_X1 = 10;  --��Ӫ������
MS_HOMEOUT_Y1 = 11;
MS_HOMEIN_X2 = 12;		--����2
MS_HOMEIN_Y2 = 13;
MS_HOMEOUT_X2 = 14;
MS_HOMEOUT_Y2 = 15;
MS_TIMER1 = 17; --��¼Timer1ִ�еĴ���

MS_MARSHALDEATH = 18	--���һ������������Ϊ��1���Σ���2���𣩣�����Ϊ��0

MS_TOTALPOINT_S = 19		--����ս�۽���ʱ���㣬��¼����ս���η��ܻ���
MS_TOTALPOINT_J = 20		--����ս�۽���ʱ���㣬��¼����ս�۽��ܻ���
MS_KILLBOSSCOUNT_S = 26		--BOSSģʽ,����ս�����η�ɱ��BOSS�ĸ���
MS_KILLBOSSCOUNT_J = 27		--BOSSģʽ,����ս���н�ɱ��BOSS�ĸ���

FILE_HOMETRAP1 = "\\script\\battles\\boss\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\boss\\hometrap2.lua";
FILE_CENTERTRAP = "\\script\\battles\\boss\\centertrap.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\boss\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\boss\\homeouttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\boss\\npcdeath_1.lua",
	"\\script\\battles\\boss\\npcdeath_2.lua",
	"\\script\\battles\\boss\\npcdeath_3.lua",
	"\\script\\battles\\boss\\npcdeath_4.lua",
	"\\script\\battles\\boss\\npcdeath_5.lua",
	"\\script\\battles\\boss\\npcdeath_6.lua"
	}

FILE_DOCTOR1 = 	"\\script\\battles\\boss\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\boss\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_DEATH = "\\script\\battles\\boss\\npcdeath.lua"
FILE_TRANSPORT1 = 	"\\script\\battles\\boss\\transport.lua";
FILE_TRANSPORT2 = 	"\\script\\battles\\boss\\transport.lua";

--Npc��ģ���ID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;

MS_STATE = 1; --�����м�¼����״̬�ı���ID
--�ñ���ָ���״ֵ̬0��ʾս��Ϊ�򿪣�1��ʾս�۱����У�2��ʾս��ս�������У�3��ʾս�۸ոս�����

MS_KEY = 7;		--��¼��ǰ��ͼ�������һ��key����һ��������ɵ�����

MS_NEWSVALUE = 10; --�����д�����ű����ĵط�

function sf_onplayerleave()
	RestoreOwnFeature()
	BT_SetData(PL_PARAM1 ,0)
	BT_SetData(PL_PARAM2, 0)
	ST_SyncMiniMapObj(-1, -1);
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

---------------------------------------------------------------------

function sf_winbouns(n_camp)
	local wincamp = n_camp;
	local failcamp = 0
	
	if (wincamp == 0) then
		wincamp = 1;
	end
	
	--��������Է���Ӫû����ң���ʤ����������
	if (wincamp == 1) then
		failcamp = 2;
	else
		failcamp = 1;
	end
	
	if (GetMSPlayerCount(MISSIONID, failcamp) == 0) then
		WriteLog("Do phe b�i kh�ng c� ng��i ch�i, phe th�ng kh�ng ���c t�ng th��ng!")
		return
	end
	
	--by zero 2007-8-1 �������Ӯ��
	local All_Players_Table = {};
	local Win_Players_Table = {};
	idx = 0;
	
	for i = 1 , GetMSPlayerCount(MISSIONID, wincamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
			All_Players_Table[getn(All_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	
	local Los_Players_Table = {};
	idx = 0;
	for i = 1 , GetMSPlayerCount(MISSIONID, failcamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, failcamp)
		if (pidx > 0) then
			Los_Players_Table[getn(Los_Players_Table)+1]=pidx
			All_Players_Table[getn(All_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	battle_finish_activity(BT_GetGameData(GAME_LEVEL), All_Players_Table, Win_Players_Table, Los_Players_Table, n_camp)
	tbChangeDestiny:completeMission_Battle(All_Players_Table)	
	TB_QIANQIU_YINGLIE0904:add_lucky_award(All_Players_Table)
	
	if (n_camp ~= 0) then
		TB_QIANQIU_YINGLIE0904:add_end_award(Win_Players_Table, 2);
		TB_QIANQIU_YINGLIE0904:add_end_award(Los_Players_Table, 0);
	else
		TB_QIANQIU_YINGLIE0904:add_end_award(All_Players_Table, 1);
	end
	
	
	--end 
	--by zero 2007-7-30 ����ν������ һ����2��
	local OldPlayerIndex = PlayerIndex
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
		local player_total_point=BT_GetData(PL_TOTALPOINT) --��û���
		
		
		
		--��ȡ������
		local jg_ndate=tonumber(GetLocalDate("%y%m%d"))
		jg_ndate=jg_ndate*10+2;
		local JG_T_Value=GetTask(JUNGONGPAI_Task_ID) --�����ƻ�ȡ�������
		
		--print(format("%d %d",player_total_point,JG_T_Value))
		if(player_total_point >= 1000 and JG_T_Value < jg_ndate) then
			local ItemIdx = AddItem(6,1,JUNGONGPAI,1,0,0);
			
			local Tdate=FormatTime2Number(GetCurServerTime()+24*60*60)--��ȡ�ĵڶ���
			Tdate=floor(Tdate/10000) --ȡ��,��,��
			nEndYear=floor(Tdate/10000)+2000
			nEndMonthDay=floor(mod(Tdate,10000))
			SetSpecItemParam(ItemIdx, 1,nEndYear);--������Ʒ��
			SetSpecItemParam(ItemIdx, 2,nEndMonthDay);--������Ʒ����
			SyncItem(ItemIdx)
			SetItemBindState(ItemIdx, -2);-- ��
			Msg2Player("B�n nh�n ���c 1 Hu�n c�ng b�i T�ng Kim")
			WriteLog(format("[Chi�n tr��ng T�ng Kim]\t%s\tName:%s\tAccount:%s\t 1000 �i�m t�ch l�y tr� l�n s� nh�n ���c 1 Hu�n c�ng b�i T�ng Kim",
					GetLocalDate("%y%m%d %X"), GetName(), GetAccount()));
			if(JG_T_Value == (jg_ndate-1)) then --��ȡ��2��	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate);
			elseif(JG_T_Value ~= jg_ndate) then --��ȡ��1��	
				SetTask(JUNGONGPAI_Task_ID,jg_ndate-1);
			end
		end
	end
	PlayerIndex = OldPlayerIndex
	--end
	
	local award_over = floor(BATTLES_LOSEGAME_POINT * bt_getgn_awardtimes())
	bt_camp_getbonus(failcamp, award_over, "L�n n�y phe ta b�i! Th�ng b�i l� chuy�n th��ng t�nh c�a binh gia, t��ng s� ��ng n�n l�ng! L�n sau s� quy�t 1 tr�n th� h�ng. (Nh�n ���c <color=yellow>", 50)
	
	bonuscff1 = BATTLES_WINGAME_POINT * bt_getgn_awardtimes()
   	repute = 3 * bt_getgn_awardtimes()
	WriteLog("�i�m t�ch l�y cho phe th�ng l�i l�:"..bonuscff1)

	sf_itemcount = getn(sf_aryItems)
	
	-- by zero �޸Ļ�ȡӮ����Ա�ķ�ʽ
	OldPlayerIndex = PlayerIndex	
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
        local game_level = BT_GetGameData(GAME_LEVEL);
        local n_bonuscff1 = 0;
	   		AddRepute(repute);			
	   		Msg2Player("Danh v�ng c�a b�n t�ng th�m "..repute.."�i�m!")
			mar_addmissionpoint(bonuscff1)
			n_bonuscff1 = bt_addtotalpoint(bonuscff1)
	   		Msg2Player("B�n nh�n ���c "..n_bonuscff1.." �i�m t�ch l�y")
			--Storm ʤ��������ս������¼��ʤ��
			Say("Ch�c m�ng phe b�n gi�nh th�ng l�i! Danh v�ng c�a b�n t�ng th�m <color=yellow>"..repute.."<color>! V� nh�n th�m <color=yellow>"..n_bonuscff1.."<color> �i�m t�ch l�y", 1, "K�t th�c ��i tho�i/#storm_end(1)")
			tb_storm_winner[PlayerIndex] = 1
			randitem = random(1, sf_itemcount);
			if (randitem > 0) then
				local szItemName = sf_aryItems[randitem][1];
				local arySelItemID =  sf_aryItems[randitem][2];
				AddItem( arySelItemID[1], arySelItemID[2], arySelItemID[3], arySelItemID[4], arySelItemID[5], arySelItemID[6], 0);
				Msg2Player("<#>Ch�c m�ng B�n! L�y ���c gi�i th��ng "..szItemName);
		end;
	end
	PlayerIndex = OldPlayerIndex
end;

function mar_addmissionpoint(totalpoint)
	if (totalpoint == 0) then
		return
	end
	if (GetCurCamp() == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
	end
end

function GameOver()
	WriteLog("[Battle Log] battle is ending. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	local bonus_s = GetMissionV(MS_TOTALPOINT_S)
	local bonus_j = GetMissionV(MS_TOTALPOINT_J)
	local resultstr = "";
	local OldPlayerIndex = PlayerIndex
	
	--�����ν���ص�����������
	WriteLog("[Battle Log] Sorting World Ladder");

--	--ģʽ�����а�
		
		BT_SortWorldLadder(PL_TOTALPOINT, 10112)
		BT_SortWorldLadder(PL_KILLPLAYER, 10113)
		BT_SortWorldLadder(PL_KILLNPC, 10114)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10115)
		BT_SortWorldLadder(PL_GETITEM, 10116)

	
	local game_level = BT_GetGameData(GAME_LEVEL);
	
	--ģʽ�ӵȼ����а�
		if (game_level == 3) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10097)
			BT_SortWorldLadder(PL_KILLNPC, 10098)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10099)
			BT_SortWorldLadder(PL_GETITEM, 10100)
			BT_SortWorldLadder(PL_TOTALPOINT, 10101)
			bt_sortbthonour();			--�ν�������������
		elseif (game_level == 2) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10102)
			BT_SortWorldLadder(PL_KILLNPC, 10103)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10104)
			BT_SortWorldLadder(PL_GETITEM, 10105)
			BT_SortWorldLadder(PL_TOTALPOINT, 10106)
		elseif (game_level == 1) then
			BT_SortWorldLadder(PL_KILLPLAYER, 10107)
			BT_SortWorldLadder(PL_KILLNPC, 10108)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10109)
			BT_SortWorldLadder(PL_GETITEM, 10110)
			BT_SortWorldLadder(PL_TOTALPOINT, 10111)
		end

	
	BT_SortWorldLadder(PL_TOTALPOINT, 10085)
	BT_SortWorldLadder(PL_BATTLEPOINT, 10086)
	BT_SortWorldLadder(PL_KILLPLAYER, 10087)
	BT_SortWorldLadder(PL_KILLNPC, 10088)
	BT_SortWorldLadder(PL_MAXSERIESKILL, 10089)
	BT_SortWorldLadder(PL_GETITEM, 10090)
	
	WriteLog("[Battle Log] Awarding Activity");
	
	if (game_level == 1) then
		resultstr = "Khu v�c S� c�p "
	elseif (game_level == 2) then
		resultstr = "Khu v�c Trung c�p "
	elseif (game_level == 3) then
		resultstr = "Khu v�c Cao c�p "
	end
		--edit by zero ��������������
	
	battle_rank_award0808(game_level)
	battle_rank_activity(game_level)
	
	WriteLog("[Battle Log] Awarding Single Player");
	
	--end
	--edit by С�˶��
	--��3��ģʽ����ָ��һ���ļ���д
	--���ж�Ա����,ʤ��ƽ����
	--sign start
	local Win_Players_Table={}
	local idx = 0;
	local pidx = 0;
	for i=1,500 do
		idx, pidx = GetNextPlayer(MISSIONID, idx, 0)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
	end
	for i = 1,getn(Win_Players_Table) do
		local noldplayerindex = PlayerIndex
		PlayerIndex = Win_Players_Table[i]
		local player_total_point=BT_GetData(PL_TOTALPOINT) --��û���
		battles_award_all_singleplayer(PlayerIndex,player_total_point,game_level)
		PlayerIndex = noldplayerindex
	end 
	--sign end	
	
	tb_storm_winner = {}	--Storm	��ջ�ʤ��
	
	TB_QIANQIU_YINGLIE0904:sorter_award(game_level)
	
	
	-- �ν���� ���սƽ�����ɱboss���ټ���ʤ��
	local nFinalWiner = GetMissionV(MS_MARSHALDEATH);
	local nKillBossCount_S = GetMissionV(MS_KILLBOSSCOUNT_S);
	local nKillBossCount_J = GetMissionV(MS_KILLBOSSCOUNT_J);
	
	if (nFinalWiner == 0) then
		if nKillBossCount_S > nKillBossCount_J then
			nFinalWiner = 1
		elseif nKillBossCount_S < nKillBossCount_J then
			nFinalWiner = 2
		else
			-- ɱBOSS��ȣ�������
			if bonus_s >= bonus_j then
				nFinalWiner = 1
			else
				nFinalWiner = 2
			end
		end
	end

	WriteLog("[Battle Log] Awarding by Result");

--	if (GetMissionV(MS_MARSHALDEATH) == 0) then
--		resultstr = resultstr.."�ν�ս���ѽ����������ν�˫����õ��ܻ���Ϊ"..bonus_s.."��"..bonus_j
--		Msg2MSAll(MISSIONID, resultstr)
--		local award_over = BATTLES_TIEGAME_POINT * bt_getgn_awardtimes()
--		sf_winbouns(0)
--		bt_camp_getbonus(1, award_over, "�����ν�ս��սƽ�ˣ���ʿ�����ձ���Ӫ,��������,����������پ����ۣ�(�õ�����<color=yellow>", 75);
--		bt_camp_getbonus(2, award_over, "�����ν�ս��սƽ�ˣ���ʿ�����ձ���Ӫ,��������,����������پ����ۣ�(�õ�����<color=yellow>", 75);
--		WriteLog(resultstr)
--		AddGlobalCountNews(resultstr, 1)
	if (nFinalWiner == 1) then
		resultstr = resultstr.."Chi�n s� �� k�t th�c, phe T�ng gi�nh ���c th�ng l�i!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr)
		BT_ReportResult(1)
		sf_winbouns(1)
		RecordBTCount_Win(1)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
		AddGlobalCountNews(resultstr, 1) 
	elseif (nFinalWiner == 2) then
		resultstr = resultstr.."Chi�n s� �� k�t th�c, phe Kim gi�nh ���c th�ng l�i!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr)
		BT_ReportResult(2)
		sf_winbouns(2)
		RecordBTCount_Win(2)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
		AddGlobalCountNews(resultstr, 1) 
	end
	
	WriteLog("[Battle Log] Ready for kick Out");
	
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[ getn(tbPlayer) + 1 ] = pidx
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	branchTask_JoinSJend1();
	 	l_curcamp = GetCurCamp();

		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬��by Dan_Deng��
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0)
		
		-- Big Boss Remove bonus state
		BigBoss:RemoveSongJinBonus();
		
		--Storm ����ʤ������Ľ�����ս
		if (not tb_storm_winner[PlayerIndex]) then
			storm_end(1)
		end
		
		if (l_curcamp == 1) then
			SetRevPos(tbGAME_SIGNMAP[game_level], 1)
			NewWorld(bt_getsignpos(1))
		else	
			SetRevPos(tbGAME_SIGNMAP[game_level], 2)
			NewWorld(bt_getsignpos(2))
		end;
		
		camp = GetCamp();
		SetCurCamp(camp);
		
	end;
	PlayerIndex = OldPlayerIndex;
end;
-------------------------------------------------------------------------
function sf_join(camp)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, camp) >= MAX_MEMBERCOUNT ) then
		if (camp==1) then
			Msg2Player("Qu�n l�c c�a ta hi�n gi� �� d� s�c ti�u di�t Kim qu�n. Tr�ng s� xin ��i tr�n sau nh�!")
			return
		elseif (camp==2) then
			Msg2Player("Qu�n l�c c�a ta hi�n gi� �� d� s�c ti�u di�t T�ng qu�n. Tr�ng s� xin ��i tr�n sau nh�!")
			return
		end
	end
	result = bt_checklastbattle(camp)
	
	if (result == 2) then
		if (camp==1) then
			Talk(1,"","Ng��i Kim b�n ng��i, x�m l��c giang s�n, gi�t h�i ��ng b�o ta! Ta th� quy�t c�ng b�n ng��i m�t m�t m�t c�n!")
		else
			Talk(1,"","Kim qu�c ai c�ng ��u d�ng s� thi�n chi�n. T�ng tri�u m�c n�t c�c ng��i sao x�ng l� ��i th�!")
			return
		end
	end

if (result == 0) then
	if (GetCash() >= 100000) then
		Pay(100000)
		BT_LeaveBattle() -- �����ҿͻ��˵�ǰ����������
		BT_ClearPlayerData()
		SetTask(2435, 0);--�����ν��Ѿ���ȡ�İ�ṱ�׶�����--by ��־ɽ
		Msg2Player("Nh�c nh�: c� th� �n ph�m ~ � g�c tr�i ph�a tr�n b�n ph�m �� xem tin t�c chi�n s�!");
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
		local nlevel = BT_GetGameData(GAME_LEVEL)
		G_ACTIVITY:OnMessage("SignUpSongJin", PlayerIndex, nlevel)
	else
		Say("Xin l�i, tham gia ��t T�ng Kim ��i chi�n n�y, c�n ph�i n�p ph� b�o danh l� 100000 l��ng", 0)
		return 
	end
end

gametime = floor(GetMSRestTime(MISSIONID, 110) / 18);
AddMSPlayer(MISSIONID,camp);
BT_UpdateMemberCount();
SetCurCamp(camp);

SetTaskTemp(200,1)
SetFightState(0);
SetLogoutRV(1);

SetPunish(0);

level = BT_GetGameData(GAME_LEVEL)

if (camp == 1) then
	posx = GetMissionV(MS_HOMEIN_X1)
	posy = GetMissionV(MS_HOMEIN_Y1)
	str = GetName().."Gia nh�p phe T�ng"
	EnterChannel(PlayerIndex, "Phe T�ng"..szGAME_GAMELEVEL[level].."Tranh �o�t BOSS")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
	str = GetName().."Gia nh�p phe Kim"
	EnterChannel(PlayerIndex, "Phe Kim"..szGAME_GAMELEVEL[level].."Tranh �o�t BOSS")
end

BT_SetData(PL_PARAM1,0)
BT_SetData(PL_PARAM2,0)
sf_mapid = SubWorldIdx2ID(SubWorld)

if (camp == 1) then
	SetRevPos(tbGAME_SIGNMAP[level], 1)
else
	SetRevPos(tbGAME_SIGNMAP[level], 2)
end

NewWorld(sf_mapid, posx, posy);
SetTempRevPos(sf_mapid, posx * 32, posy * 32);
BT_SetData(PL_LASTDEATHTIME, GetGameTime())

SetCreateTeam(0);
BT_SetData(PL_KEYNUMBER, BT_GetGameData(GAME_KEY))
BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
BT_SetData(PL_RULEID, BT_GetGameData(GAME_RULEID))

BT_BroadView();
BT_BroadAllLadder();
BT_SetRestTime(gametime);
BT_BroadGameData();
BT_SortLadder();
BT_BroadSelf()
BT_BroadBattleDesc();
BT_ViewBattleStart()
SetFightState(0)
--Msg2MSAll(MISSIONID,str);
SetPKFlag(1)
ForbidChangePK(1);
SetDeathScript("\\script\\battles\\boss\\playerdeath.lua");
bt_JudgePLAddTitle()
end;
------------------------------------------------------------------

-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

------------------------------------------------------

function RecordBTCount_Win(camp)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
	if (camp ~= 1 and camp ~= 2) then
		print("ERROR: T�ng Kim k�t th�c! L�u tr� th�ng tin c� sai s�t!!!")
		return
	end
	local OldPlayerIndex = PlayerIndex
	idx = 0
	if (camp == 1) then
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1072, nt_getTask(1072) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1073, nt_getTask(1073) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
	else
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 2)
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1072, nt_getTask(1072) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
		
		idx = 0
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 1)
			if( pidx > 0 ) then
				PlayerIndex = pidx
				nt_setTask(1073, nt_getTask(1073) + 1)
			end
			if (idx <= 0) then 
		 		break
		 	end			 	
		end
	end
	 PlayerIndex = OldPlayerIndex
end

-- ��������״̬
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- ͬ�����ͻ���
end

-- ��ȡ����״̬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end
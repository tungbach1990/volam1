Include("\\script\\battles\\battlehead.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan
Include("\\script\\battles\\battles_award_head.lua")		--By С�˶��
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");
MISSIONID = 58;
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
VANISHGAME_TIME = 70 * 60 * FRAME2TIME/ TIMER_1; --ս�����20����ʱ����������Npcȫ������
GO_TIME =  1800 * FRAME2TIME  / TIMER_1; -- ����ʱ��Ϊ��Сʱ

MAX_MEMBERCOUNT = 150 
TIME_PLAYER_REV = 8 ; -- ����������˳���Ϸ�ٽ���ʱ������3����֮������뿪��Ӫ����Ӫ



--������ĳЩֵ��¼��MissionValue�е�����λ�ã�ͨ��GetMissionV(MS_XXX)�����ʵ�ʵ�ֵ
MS_STATE = 1; --�����м�¼����״̬�ı���ID
--�ñ���ָ���״ֵ̬0��ʾս��Ϊ�򿪣�1��ʾս�۱����У�2��ʾս��ս�������У�3��ʾս�۸ոս�����

MS_FLAGMODE = 2;--��¼��ǰ����ģʽ�ǹ̶�ģʽ�����������ģʽ���ֱ�Ϊ0��1
MS_FLAGCOUNT = 3; --��¼���������

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
MS_TIMER1_TIME = 17; --��¼Timer1ִ�еĴ���

MS_FLAGPLY_S = 18;  --�̶�ģʽʱ����¼Ŀǰ�η���������PlayerIndex
MS_FLAGPLY_J = 19;  --�̶�ģʽʱ����¼Ŀǰ�𷽶�������PlayerIndex
MS_FLAGPOSX_S = 20; --�̶�ģʽʱ����¼�η���ǰ��֯��С��ͼ����λ��X
MS_FLAGPOSY_S = 21; --�̶�ģʽʱ����¼�η���ǰ��֯��С��ͼ����λ��Y
MS_FLAGPOSX_J = 22  --�̶�ģʽʱ����¼�𷽵�ǰ��֯��С��ͼ����λ��X
MS_FLAGPOSY_J = 23  --�̶�ģʽʱ����¼�𷽵�ǰ��֯��С��ͼ����λ��Y
MS_TOTALGRAIN_S = 24	--��¼��������������
MS_TOTALGRAIN_J = 25	--��¼��������������

MAX_GRAINOBJ_COUNT	 = 5;	-- ����������ʳ��������

TNPC_GHARRY1	= 1348		-- �ν�����
TNPC_GRAIN1		= 1350		-- �ν���ʳ��

FILE_HOMETRAP1 = "\\script\\battles\\seizegrain\\hometrap1.lua";
FILE_HOMETRAP2 = "\\script\\battles\\seizegrain\\hometrap2.lua";
FILE_CENTERTRAP1 = "\\script\\battles\\seizegrain\\centertrap1.lua";
FILE_CENTERTRAP2 = "\\script\\battles\\seizegrain\\centertrap2.lua";
FILE_CENTERTOHOMETRAP1 = "\\script\\battles\\seizegrain\\homeouttrap1.lua"
FILE_CENTERTOHOMETRAP2 = "\\script\\battles\\seizegrain\\homeouttrap2.lua"

tabFILE_NPCDEATH = 
	{
	"\\script\\battles\\seizegrain\\npcdeath_1.lua",
	"\\script\\battles\\seizegrain\\npcdeath_2.lua",
	"\\script\\battles\\seizegrain\\npcdeath_3.lua",
	"\\script\\battles\\seizegrain\\npcdeath_4.lua",
	"\\script\\battles\\seizegrain\\npcdeath_5.lua",
	"\\script\\battles\\seizegrain\\npcdeath_6.lua"
	};

FILE_DOCTOR1 = 	"\\script\\battles\\seizegrain\\doctor.lua";
FILE_DOCTOR2 = 	"\\script\\battles\\seizegrain\\doctor.lua";
FILE_SYMBOLNPC = ""
FILE_DEPOSIT = 	"\\script\\battles\\openbox.lua"
FILE_GRAIN = 		"\\script\\battles\\seizegrain\\grainobj.lua"
FILE_GHARRY = 		"\\script\\battles\\seizegrain\\graingharry.lua"
FILE_DEATH = 		"\\script\\battles\\seizegrain\\npcdeath.lua"

--Npc��ģ���ID

MAX_S_COUNT = 100;
MAX_J_COUNT = 100;


--����һ��ָ��ĳ�������ĳ��Ӫ��
function sf_addgrain(camp, x, y)
	
	local tnpcid = TNPC_GRAIN1;
	
	local npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, "Bao l��ng");
	
	if (npcidx > 0) then
		SetNpcCurCamp(npcidx, camp);
		SetNpcScript(npcidx, FILE_GRAIN);
	else
		print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
	end
	
	--SetNpcParam(npcidx, 1, desx)
	--SetNpcParam(npcidx, 2, desy)
	SetNpcParam(npcidx, 3, camp);
	SetNpcParam(npcidx, 4, 1);
	
	return npcidx;
end;

function sf_addgharry(camp, x, y, nfight)
	local n_npc_level = 1;
	local sz_file = FILE_GHARRY;
	local tnpcid = TNPC_GHARRY1;
	local sz_npc_name = {"Xe l��ng phe T�ng", "Xe l��ng phe Kim"}
	
	if (nfight == 1) then
		n_npc_level = 90;
		tnpcid = tnpcid + 1;	-- ս����ID
	end
	
	local npcidx = AddNpc(tnpcid, n_npc_level, SubWorld, x, y, 1, sz_npc_name[camp]);
	
	if (npcidx > 0) then
		SetNpcCurCamp(npcidx, camp);
		if (nfight == 0) then
			SetNpcScript(npcidx, sz_file);
		else
			SetNpcDeathScript(npcidx, sz_file);
		end
	else
		print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		return 0;
	end
	
	SetNpcParam(npcidx, 1, x);
	SetNpcParam(npcidx, 2, y);
	SetNpcParam(npcidx, 3, camp);	-- ������Ӫ
	SetNpcParam(npcidx, 4, MAX_GRAINOBJ_COUNT);		-- ���� 5����ʳ��
	
	return npcidx;
end


function sf_onplayerleave()
	RestoreOwnFeature();
	if (GetMissionV(MS_STATE) == 2 and BT_GetData(PL_PARAM3) ~= 0) then
		--��������������ڱ���״̬����������Ҫ����ʳ��������
			local w,x,y = GetWorldPos()
			sf_addgrain(GetCurCamp(), x*32, y*32)
			
			if (GetCurCamp() == 1 ) then
				Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe T�ng<color=yellow>%s<color> m�t �i Bao L��ng Th�c t�i<color=yellow>%d,%d",GetName(),floor(x/8),floor(y/16)))
			else
				Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim<color=yellow>%s<color> m�t �i Bao L��ng Th�c t�i<color=yellow>%d,%d",GetName(),floor(x/8),floor(y/16)))
			end
	end
	BT_SetData(PL_PARAM3 ,0)
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end

function sf_winbouns(wincamp)
	local failcamp = 0;
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
	local Win_Players_Table={}
	idx = 0;
	
	for i = 1 , GetMSPlayerCount(MISSIONID, wincamp) do
		idx, pidx = GetNextPlayer(MISSIONID, idx, wincamp)
		if (pidx > 0) then
			Win_Players_Table[getn(Win_Players_Table)+1]=pidx
		end
		if (idx <= 0) then 
			break
		end;
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
	bt_camp_getbonus(failcamp, award_over, "L�n n�y phe ta b�i! Th�ng b�i l� chuy�n th��ng t�nh c�a binh gia, t��ng s� ��ng n�n l�ng! L�n sau s� quy�t 1 tr�n th� h�ng. (Nh�n ���c <color=yellow>"..award_over.."<color> �i�m t�ch l�y) ", 50);
	
	bonuscff1 = BATTLES_WINGAME_POINT * bt_getgn_awardtimes()
   	repute = 3 * bt_getgn_awardtimes()
	WriteLog("�i�m t�ch l�y cho phe th�ng l�i l�:"..bonuscff1)
	
	sf_itemcount = getn(sf_aryItems)
	-- by zero �޸Ļ�ȡӮ����Ա�ķ�ʽ
	OldPlayerIndex = PlayerIndex	
	for i=1,getn(Win_Players_Table) do
		PlayerIndex=Win_Players_Table[i];
            local game_level = BT_GetGameData(GAME_LEVEL);
            
	   		AddRepute(repute);			
	   		Msg2Player("Danh v�ng c�a b�n t�ng th�m "..repute.."�i�m!")
	   		Msg2Player("B�n nh�n ���c "..bonuscff1.." �i�m t�ch l�y")
	   		
			--Storm ʤ��������ս������¼��ʤ��
			Say("Ch�c m�ng phe b�n gi�nh th�ng l�i! Danh v�ng c�a b�n t�ng th�m <color=yellow>"..repute.."<color>! V� nh�n th�m <color=yellow>"..bonuscff1.."<color> �i�m t�ch l�y", 1, "K�t th�c ��i tho�i/#storm_end(1)")
			tb_storm_winner[PlayerIndex] = 1
			
			bt_addtotalpoint(bonuscff1)
			
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

function GameOver()
	WriteLog("battle is ending. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	local bonus_s = BT_GetGameData(GAME_CAMP1);
	local bonus_j = BT_GetGameData(GAME_CAMP2);
	local resultstr = "";
	local OldPlayerIndex = PlayerIndex;

	
	--�����ν���ص�����������
	--
	game_mode = GetMissionV(MS_FLAGMODE);
	--ģʽ�����а�
	if (game_mode == 1) then
		BT_SortWorldLadder(PL_TOTALPOINT, 10009)
		BT_SortWorldLadder(PL_KILLPLAYER, 10011)
		BT_SortWorldLadder(PL_KILLNPC, 10012)
		BT_SortWorldLadder(PL_SNAPFLAG, 10008)
		--BT_SortWorldLadder(PL_KILLRANK5, 10006)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10013)
		BT_SortWorldLadder(PL_GETITEM, 10014)
	else
		BT_SortWorldLadder(PL_TOTALPOINT, 10018)
		BT_SortWorldLadder(PL_KILLPLAYER, 10020)
		BT_SortWorldLadder(PL_KILLNPC, 10021)
		BT_SortWorldLadder(PL_SNAPFLAG, 10017)
		--BT_SortWorldLadder(PL_KILLRANK5, 10006)
		BT_SortWorldLadder(PL_MAXSERIESKILL, 10022)
		BT_SortWorldLadder(PL_GETITEM, 10023)
	end
	
	local game_level = BT_GetGameData(GAME_LEVEL);
	
	--ģʽ�ӵȼ����а�
	if (game_mode == 1) then
		if (game_level == 3) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10044)
			BT_SortWorldLadder(PL_KILLPLAYER, 10045)
			BT_SortWorldLadder(PL_KILLNPC, 10046)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10047)
			BT_SortWorldLadder(PL_GETITEM, 10048)
			BT_SortWorldLadder(PL_TOTALPOINT, 10049)
		elseif (game_level == 2) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10060)
			BT_SortWorldLadder(PL_KILLPLAYER, 10061)
			BT_SortWorldLadder(PL_KILLNPC, 10062)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10063)
			BT_SortWorldLadder(PL_GETITEM, 10064)
			BT_SortWorldLadder(PL_TOTALPOINT, 10065)
		elseif (game_level == 1) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10076)
			BT_SortWorldLadder(PL_KILLPLAYER, 10077)
			BT_SortWorldLadder(PL_KILLNPC, 10078)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10079)
			BT_SortWorldLadder(PL_GETITEM, 10080)
			BT_SortWorldLadder(PL_TOTALPOINT, 10081)
		end
	else
		if (game_level == 3) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10036)
			BT_SortWorldLadder(PL_KILLPLAYER, 10037)
			BT_SortWorldLadder(PL_KILLNPC, 10038)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10039)
			BT_SortWorldLadder(PL_GETITEM, 10040)
			BT_SortWorldLadder(PL_TOTALPOINT, 10041)
		elseif (game_level == 2) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10052)
			BT_SortWorldLadder(PL_KILLPLAYER, 10053)
			BT_SortWorldLadder(PL_KILLNPC, 10054)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10055)
			BT_SortWorldLadder(PL_GETITEM, 10056)
			BT_SortWorldLadder(PL_TOTALPOINT, 10057)
		elseif (game_level == 1) then
			BT_SortWorldLadder(PL_SNAPFLAG, 10068)
			BT_SortWorldLadder(PL_KILLPLAYER, 10069)
			BT_SortWorldLadder(PL_KILLNPC, 10070)
			BT_SortWorldLadder(PL_MAXSERIESKILL, 10071)
			BT_SortWorldLadder(PL_GETITEM, 10072)
			BT_SortWorldLadder(PL_TOTALPOINT, 10073)
		end
	end
	
	BT_SortWorldLadder(PL_SNAPFLAG, 10084)
	BT_SortWorldLadder(PL_TOTALPOINT, 10085)
	BT_SortWorldLadder(PL_BATTLEPOINT, 10086)
	BT_SortWorldLadder(PL_KILLPLAYER, 10087)
	BT_SortWorldLadder(PL_KILLNPC, 10088)
	BT_SortWorldLadder(PL_MAXSERIESKILL, 10089)
	BT_SortWorldLadder(PL_GETITEM, 10090)
	
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
	
	if (bonus_s > bonus_j ) then
		resultstr = resultstr.."T�ng Kim ph��ng th�c v�n l��ng �� k�t th�c, s� l��ng Bao l��ng c�a phe T�ng v� phe Kim l� "..BT_GetGameData(GAME_CAMP1)..":"..BT_GetGameData(GAME_CAMP2)..", phe T�ng gi�nh ���c th�ng l�i!";
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr.."T� l� qu�n s� l�: T�ng "..GetMSPlayerCount(MISSIONID, 1)..": Kim "..GetMSPlayerCount(MISSIONID, 2)..". Th�i gian k�t th�c"..date("%H:%M"))
		BT_ReportResult(1)
		sf_winbouns(1)
		RecordBTCount_Win(1)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
	elseif (bonus_s < bonus_j) then
		resultstr = resultstr.."T�ng Kim ph��ng th�c v�n l��ng �� k�t th�c, s� l��ng Bao l��ng c�a phe T�ng v� phe Kim l� "..BT_GetGameData(GAME_CAMP1)..":"..BT_GetGameData(GAME_CAMP2)..", phe Kim gi�nh ���c th�ng l�i!"
		Msg2MSAll(MISSIONID, resultstr)
		WriteLog(resultstr.."T� l� qu�n s� l�: T�ng "..GetMSPlayerCount(MISSIONID, 1)..": Kim "..GetMSPlayerCount(MISSIONID, 2)..". Th�i gian k�t th�c"..date("%H:%M"))
		BT_ReportResult(2)
		sf_winbouns(2)
		RecordBTCount_Win(2)		--��ÿ��������������¼���˴��ν�ս��ʤ��״��
	else
			resultstr = resultstr.."T�ng Kim ph��ng th�c v�n l��ng �� k�t th�c v�i k�t qu� h�a, s� Bao l��ng phe T�ng v� phe Kim l� "..bonus_s.."";
			Msg2MSAll(MISSIONID, resultstr);
			WriteLog(resultstr.."T� l� qu�n s� l�: T�ng "..GetMSPlayerCount(MISSIONID, 1)..": Kim "..GetMSPlayerCount(MISSIONID, 2)..". Th�i gian k�t th�c"..date("%H:%M"))
			local award_over = BATTLES_TIEGAME_POINT * bt_getgn_awardtimes()
			bt_camp_getbonus(1, award_over, "L�n n�y t�m h�a! T��ng s� h�y t�m ngh� ng�i! L�n sau s� quy�t 1 tr�n th� h�ng! (���c th��ng <color=yellow>"..award_over.."<color> �i�m t�ch l�y) ", 75);
			bt_camp_getbonus(2, award_over, "L�n n�y t�m h�a! T��ng s� h�y t�m ngh� ng�i! L�n sau s� quy�t 1 tr�n th� h�ng! (���c th��ng <color=yellow>"..award_over.."<color> �i�m t�ch l�y) ", 75);
	end;
		AddGlobalCountNews(resultstr, 1) 
	
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
		camp = GetCamp();
		SetCurCamp(camp);
		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetCreateTeam(1);
		SetDeathScript("");
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬��by Dan_Deng��
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0)
		
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
	end;
	PlayerIndex = OldPlayerIndex
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
	if (GetCash() >= 3000) then
		Pay(3000)
		BT_LeaveBattle() -- �����ҿͻ��˵�ǰ����������
		BT_ClearPlayerData()
		SetTask(2435, 0);--�����ν��Ѿ���ȡ�İ�ṱ�׶�����--by ��־ɽ
		Msg2Player("Nh�c nh�: c� th� �n ph�m ~ � g�c tr�i ph�a tr�n b�n ph�m �� xem tin t�c chi�n s�!");
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
		local nlevel = BT_GetGameData(GAME_LEVEL)
		G_ACTIVITY:OnMessage("SignUpSongJin", PlayerIndex, nleve)
	else
		Say("Mu�n tham gia chi�n tr��ng T�ng Kim h�y �ng h� 3000 l��ng", 0)
		return 
	end
end

gametime = floor(GetMSRestTime(MISSIONID, 97) / 18);
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
	EnterChannel(PlayerIndex, "Phe T�ng"..szGAME_GAMELEVEL[level].."V�n l��ng")
else
	posx = GetMissionV(MS_HOMEIN_X2)
	posy = GetMissionV(MS_HOMEIN_Y2)
	str = GetName().."Gia nh�p phe Kim"
	EnterChannel(PlayerIndex, "Phe Kim"..szGAME_GAMELEVEL[level].."V�n l��ng")
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
SetDeathScript("\\script\\battles\\seizegrain\\playerdeath.lua");
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
		idx = 0
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

-- �ͻ���ʳ���Ĵ���
function sf_addgrain_point(ncamp)
	local nPGrain = BT_GetData(PL_PARAM3);
	
	if (nPGrain == 0) then
		return 0;
	end
	
	local n_player_camp = GetCurCamp();
	
	bt_addtotalpoint(BT_GetTypeBonus(PL_KILLRANK4, ncamp))-- �ӻ���
	
	BT_SortLadder();
	BT_BroadSelf();
	
	if (ncamp == 1) then
		BT_SetGameData(GAME_CAMP1, BT_GetGameData(GAME_CAMP1) + 1);
		SetMissionV(MS_TOTALGRAIN_S, GetMissionV(MS_TOTALGRAIN_S) + 1);
		Msg2MSAll(MISSIONID, "phe T�ng <color=yellow>"..GetName().."<color>H� t�ng th�nh c�ng 1 Bao L��ng Th�c");--���½ǵļ�ʱս����"GetCamp�����GetName()�ɹ�����˧�쵽��Ŀ�ĵأ�"
	elseif(ncamp == 2) then
		BT_SetGameData(GAME_CAMP2, BT_GetGameData(GAME_CAMP2) + 1);
		SetMissionV(MS_TOTALGRAIN_J, GetMissionV(MS_TOTALGRAIN_J) + 1);
		Msg2MSAll(MISSIONID, "phe Kim<color=yellow>"..GetName().."<color>H� t�ng th�nh c�ng 1 Bao L��ng Th�c");--���½ǵļ�ʱս����"GetCamp�����GetName()�ɹ�����˧�쵽��Ŀ�ĵأ�"
	end;
	
	BT_BroadGameDataToAll()
	
	BT_SetData(PL_PARAM3, 0)
	RestoreOwnFeature();
	AddSkillState(460, 1, 0, 0 ) --��ɫ�⻷���ֱ����
	AddSkillState(656, 30, 0, 0) --����ҵ��ٶ�
	AddSkillState(461, 1, 0, 0) --��ɫ�⻷���ֱ����
	
end

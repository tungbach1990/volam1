-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..
Include("\\script\\lib\\gb_modulefuncs.lua")
Include("\\script\\missions\\yandibaozang\\readymap\\include.lua")
Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc\\golditem.lua")
Include("\\script\\missions\\yandibaozang\\npc\\yandituteng.lua")
Include("\\script\\missions\\yandibaozang\\yandiduihuan.lua")

--YDBZ_DATE_START = 13	--	��ʼʱ��
--YDBZ_DATE_END = 23		--	����ʱ��
ID_PRISONMAN = 96; 		-- �ж��Ƿ������ε� ID
function main()
--	Say("Ch�c n�ng �ang ���c t�m ��ng",0)
--	do return end
--	if gb_GetModule("YANDIBAOZANG_TALK") ~= 1 then
--		Say("�Բ��𣬴˹�����ʱ�رգ�����ʱ�侴���ע�ٷ����档",0)
--		return
--	end
	local tbarytalk = {
	"<dec><npc>C�ch ch�i v��t �i m�i, n�i dung m�i, boss m�i, b�n �� m�i, v� v�n k� tr�n d� b�o, r�t th�ch h�p c�c trang b� ho�ng kim c�a m�n ph�i ch� c� t�i b�o t�ng vi�m ��. C�c h� �� chu�n b� ch�a?",
	"Xem t�nh h�nh t� ��i/YDBZ_view_player",
--	"�׵ۻƽ�ͼ�׶һ�/YDBZ_golditem",
--	"�׵�ͼ�ڶһ�/YDBZ_tradeYandiTuTeng",
--	"Ta mu�n ��i vi�m �� l�nh k�/YDBZ_tradeYandiLingQi",
--	"Ta mu�n ��i huy�n vi�n l�nh/YDBZ_tradeXuanYuanLing",
--	"��Ҫ�����׵ۻƽ�װ��/yandiduihuan_main",
--	"�����׵ۻƽ�װ��˵��/yandiduihuan_shuoming",
	"Ngu�n g�c b�o t�ng vi�m ��/YDBZ_about",
	"Ta ch� mu�n d�o ch�i/NoChoice",
	}
	if YDBZ_check_ready_state() == 1 then
		tinsert(tbarytalk,2,"B�o danh tham gia/YDBZ_want_play")
		tinsert(tbarytalk,3,"Th�nh vi�n tham chi�n/YDBZ_member_play")
	end
	CreateTaskSay(tbarytalk)
end

function YDBZ_check_ready_state()
	OldSubWorld = SubWorld
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			if state == 1 then
				SubWorld = OldSubWorld
				return 1
			end
		end
	end
	SubWorld = OldSubWorld
	return 0
end
function YDBZ_member_play()
	if YDBZ_checkLimit2() == 1 then
		return
	end
	YDBZ_dragon_mem_join()
end
function YDBZ_view_player()
	if YDBZ_checkLimit() == 1 then
		return
	end
	Say("T� ��i c�a c�c h� ph� h�p v�i �i�u ki�n ti�n v�o b�o t�ng vi�m ��",0)
end

function YDBZ_checkLimit2()
	if GetCamp() == 0 then
			Say("Th�nh vi�n trong t� ��i c� ng��i ch�a gia nh�p m�n ph�i, kh�ng th� tham gia ho�t ��ng.",0)
			return 1
	end 
	if GetTeamSize() ~= 0 then
		Say("C�n ph�i tr� v� � c�a v�o b�o t�ng vi�m �� c�a t� ��i, hi�n gi� kh�ng th� t� ��i ���c",0)
		return 1
	end
	if (GetLevel() < YDBZ_LIMIT_PLAYER_LEVEL) then
		Say("C�p b�c kh�ng �� �� tham gia ho�t ��ng",0)
		return 1
	end
		
	--�������
	local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--��Ʒ
	local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
	local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]

	local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
	local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)	
	
	local g = YDBZ_LIMIT_ITEM[1][1]									--��Ʒ
	local d = YDBZ_LIMIT_ITEM[1][2]
	local p = YDBZ_LIMIT_ITEM[1][3]

	local numzimu = CalcItemCount(3,g,d,p,-1)
	local numbeibao = CalcItemCount(23,g,d,p,-1)
	if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2] ) then
		Say("C�c h� kh�ng �em theo anh h�ng thi�p, kh�ng th� tham gia tranh �o�t vi�m ��.",0)
		return 1
	end
	
	--���μ�����
	local nweek = tonumber(GetLocalDate("%W"))			--����
	local nday = tonumber(GetLocalDate("%d"))
	local noldweek = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,1)
	local ncount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,2)
	local noldday = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,3)
	local ndaycount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4)

	if nweek == noldweek and ncount >= YDBZ_LIMIT_WEEK_COUNT and (ndnumzimu + ndnumbeibao) == 0 then
			Say("Tu�n n�y c�c h� �� tham gia �� s� ��t c�n thi�t.",0)
			return 1
	elseif (nday == noldday and ndaycount >= YDBZ_LIMIT_DAY_COUNT and (ndnumzimu + ndnumbeibao) == 0 )then
			Say("S� l�n tham gia trong ng�y �� ��t ��n m�c cao nh�t.",0)
			return 1
	end
	if nweek ~= noldweek then
		 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,1,nweek)
		 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,2,0)
	end
	if nday ~= noldday then
		YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,3,nday)
		YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,4,0)
	end

	YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,0)
	YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,2,0)
	
end

-- Ki�m tra Anh H�ng Thi�p ho�c Vi�m �� L�nh tham gia t�nh n�ng Vi�m �� - Modified - by AnhHH 20110725
function YDBZ_checkLimit()
	local oldplayer = PlayerIndex
	if (IsCaptain() ~= 1) then
		local tbarytalk ={
			"<dec><npc>Tham gia ho�t ��ng v��t �i vi�m �� b�o t�ng c�n ph�i do ��i tr��ng b�o danh m�i v�o ���c.",
			"Bi�t r�i/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return 1
	end
	if (GetTeamSize() < YDBZ_TEAM_COUNT_LIMIT or GetTeamSize() > YDBZ_TEAM_COUNT_MAXLIMIT) then
		local tbarytalk ={
			"<dec><npc>T� ��i tham gia b�o tang vi�m �� c�n �t nh�t <color=red>"..YDBZ_TEAM_COUNT_LIMIT.."<color> ng��i v� kh�ng th� v��t qu� <color=red>"..YDBZ_TEAM_COUNT_MAXLIMIT.."<color>. Tr��c m�t s� ng��i trong t� ��i kh�ng ph� h�p y�u c�u.",
			"Bi�t r�i/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return 1
	end
	local tbplay = {}
	local noplaylv = 0
	local noitem = 0
	local nocount = 0
	local nsignweekday = 0
	local tbstr = {{},{},{},{}}
	local szstr = ""
	local	nAcc = 0
	for i = 1, GetTeamSize() do 
		PlayerIndex = GetTeamMember(i)
		local nFlag1 = DynamicExecuteByPlayer(PlayerIndex,"\\script\\vng_lib\\bittask_lib.lua", "tbVNG_BitTask_Lib:getBitTask", {nTaskID = 3071,nStartBit = 25,nBitCount = 1,nMaxValue = 1})
		if nFlag1 ~= 0 then
			local szNamePlayer = GetName()
			PlayerIndex = oldplayer
			Say("Xin l�i! Trong ��i b�n c� th�nh vi�n <color=yellow>".. szNamePlayer.."<color> kh�ng th�a �i�u ki�n �� tham gia t�nh n�ng n�y")
			return 1
		end
		if GetCamp() == 0 then
			PlayerIndex = oldplayer
			Say("Th�nh vi�n trong t� ��i c� ng��i ch�a gia nh�p m�n ph�i, kh�ng th� tham gia ho�t ��ng.",0)
			return 1
		end 
		--���ȼ�
		if(GetLevel() < YDBZ_LIMIT_PLAYER_LEVEL) then		--�ȼ�
			noplaylv = noplaylv + 1
			tbstr[1][noplaylv] = "<color=yellow>"..GetName().."<color>"
		end
		
		--�������
		local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--��Ʒ
		local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
		local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]

		local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
		local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)		
		
		local g = YDBZ_LIMIT_ITEM[1][1]									--��Ʒ
		local d = YDBZ_LIMIT_ITEM[1][2]
		local p = YDBZ_LIMIT_ITEM[1][3]

		local numzimu = CalcItemCount(3,g,d,p,-1)
		local numbeibao = CalcItemCount(23,g,d,p,-1)
		--print(ndnumzimu + ndnumbeibao)
--		if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2] ) then
--			noitem = noitem + 1
--			tbstr[2][noitem] = "<color=yellow>"..GetName().."<color>"
--		end
		
		--���μ�����
		local nweek = tonumber(GetLocalDate("%W"))			--����
		local nday = tonumber(GetLocalDate("%d"))
		local noldweek = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,1)
		local ncount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,2)
		local noldday = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,3)
		local ndaycount = YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4)

		if nweek == noldweek and ncount >= YDBZ_LIMIT_WEEK_COUNT and (ndnumzimu + ndnumbeibao) == 0 then
				nocount = nocount + 1
				tbstr[3][nocount] = "<color=yellow>"..GetName().."<color>"
				nsignweekday = 1
		elseif (nday == noldday and ndaycount >= YDBZ_LIMIT_DAY_COUNT and (ndnumzimu + ndnumbeibao) == 0 )then
				nocount = nocount + 1
				tbstr[3][nocount] = "<color=yellow>"..GetName().."<color>"
				nsignweekday = 2
		end
		if nweek ~= noldweek then
			 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,1,nweek)
			 YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,2,0)
		end
		if nday ~= noldday then
			YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,3,nday)
			YDBZ_sdl_setTaskByte(YDBZ_PLAY_LIMIT_COUNT,4,0)
		end

		YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,0)
		YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,2,0)
		
		if (YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) == 0) then
		--Thay ��i c�ch b�o danh vi�m ��, l�n ��u ti�n c� th� d�ng anh h�ng thi�p ho�c vi�m �� l�nh - Modified By DinhHQ - 20120206
			if ((numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2] and (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2]) then
				noitem = noitem + 1
				tbstr[2][noitem] = "<color=yellow>"..GetName().."<color>"
			end
		elseif (YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) >= 1 and YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) <= 3) then
			if ((ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2])then
				nAcc = nAcc + 1
				tbstr[4][nAcc] = "<color=yellow>"..GetName().."<color>"
			end
		end
	end
	
	PlayerIndex = oldplayer
	if noplaylv > 0 then
		local szstr1 = tbstr[1][1]
		for i=2,noplaylv do 
			szstr1 = szstr1 .. ", " .. tbstr[1][i]
		end
		szstr = szstr .. format("Ng��i ch�i %s trong ��i v�n ch�a ��t c�p %s.",szstr1,YDBZ_LIMIT_PLAYER_LEVEL)
	end
	if noitem > 0 then
		local szstr1 = tbstr[2][1]
		for i=2,noitem do 
			szstr1 = szstr1 .. ", " .. tbstr[2][i]
		end
		szstr = szstr .. format("Ng��i ch�i %s kh�ng mang theo %s.",szstr1,YDBZ_LIMIT_ITEM[3])
	end
	if nocount > 0 then
		local szstr1 = tbstr[3][1]
		for i=2,nocount do 
			szstr1 = szstr1 .. ", " .. tbstr[3][i]
		end
		if nsignweekday == 1 then
			szstr = szstr .. format("Ng��i ch�i %s trong tu�n n�y c� s� l�n tham gia �� ��t ��n <color=yellow>%s l�n<color>, kh�ng th� tham gia ho�t ��ng v��t �i",szstr1,YDBZ_LIMIT_WEEK_COUNT)	
		elseif nsignweekday == 2 then
			szstr = szstr .. format("Ng��i ch�i %s trong ng�y c� s� l�n tham gia �� ��t ��n <color=yellow>%s l�n<color>, kh�ng th� tham gia ho�t ��ng l�n n�y.",szstr1,YDBZ_LIMIT_DAY_COUNT)	
		end
	end
	if (nAcc > 0) then
		local szstr1 = tbstr[4][1]
		for i = 2, nAcc do 
			szstr1 = szstr1 .. ", " .. tbstr[4][i]
		end
		szstr = szstr .. format("Ng��i ch�i %s kh�ng mang theo %s.",szstr1,YDBZ_LIMIT_DOUBEL_ITEM[3])
	end
	
	if noplaylv + noitem + nAcc +nocount > 0 then
		Msg2Team(szstr);
		Say(szstr,0)
		return 1 	
	end
	return 0
end
function YDBZ_want_play()
	OldSubWorld = SubWorld
	OldPlayer = PlayerIndex
	local totalboat = 0
	local freeboat = 0
	local startboat = 0
	--if YDBZ_checkLimit2() == 1 then
		--return		
	--end
	--Mod 20130108 -> Fobit
	if YDBZ_checkLimit() == 1  then
		return
	end
	PlayerIndex = OldPlayer
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			--print("have "..map_map[i])
			totalboat = totalboat + 1
			SubWorld = sub
			--print(sub)
			local state = GetMissionV(YDBZ_READY_STATE)
			--print(state)
			if (state > 0) then
				startboat = 1
			end
			if ( state == 1) then
				if GetMissionV(YDBZ_READY_TEAM) < YDBZ_LIMIT_TEAMS_COUNT and GetMissionV(YDBZ_READY_TEAM_MAX) < 100 then
					freeboat = freeboat + 1
				end
			end
			--if (state > 1) then
				--Say("����������׵۱����Ѿ���ʼ��Ҫ��μ��������´ο�ʼʱ�䡣",0)
				--return
			--end
		end
	end
	--print("total"..totalboat.."free"..freeboat)
	local	strlevel = "V��t �i b�o t�ng vi�m ��"
	if (startboat == 1) then
		if (freeboat == 0) then
			local tbarytalk ={
			"<dec><npc>Khu v�c th�nh n�y"..strlevel.." ��  b�t ��u, kh�ng c�n v� tr� tr�ng n�o.",
			"Bi�t r�i/NoChoice",
		}
		CreateTaskSay(tbarytalk)
			return
		else
			local tbarytalk ={
			-- Thay ��i hi�n th� d�ng th�ng b�o - Modified - by AnhHH 20110725
			"<dec><npc>Khu v�c th�nh n�y"..strlevel.." ti�n v�o giai �oan b�o danh, L�n ��u m�i th�nh vi�n c�n ph�i n�p <color=red>"..YDBZ_LIMIT_ITEM[2].." c�i "..YDBZ_LIMIT_ITEM[3].."<color>. T� l�n th� 2 m�i th�nh vi�n c�n ph�i n�p  <color=red>"..YDBZ_LIMIT_DOUBEL_ITEM[2].." c�i "..YDBZ_LIMIT_DOUBEL_ITEM[3].."<color>, ��i hi�p c� mu�n tham gia?",
			"Ph�i! Ta mu�n d�n d�t ��i c�a ta tham gia./YDBZ_dragon_join",
			"Kh�ng c�n/NoChoice",
		}
		CreateTaskSay(tbarytalk)
			return
		end
	else
		local tbarytalk ={
			"<dec><npc>Xin l�i, khu v�c th�nh n�y"..strlevel.."Hi�n t�i kh�ng c� nhi�m v� b�o t�ng vi�m �� n�o c� th� tham gia. B�t ��u t� <color=red>14:00 ��n 24:00<color>, xin h�y ch� � th�ng b�o v� ��n tr��c 5 ph�t �� b�o danh.",
			"Bi�t r�i/NoChoice",
		}
		CreateTaskSay(tbarytalk)
		return
	end

end

function YDBZ_dragon_join()
	if YDBZ_checkLimit() == 1  then
		return
	end	
		
	OldSubWorld = SubWorld
	
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			 
			if ( state == 1 and GetMissionV(YDBZ_READY_TEAM) < YDBZ_LIMIT_TEAMS_COUNT ) then
					
				local tabplayer = {}
				for i = 1, GetTeamSize() do 
					tabplayer[i] = GetTeamMember(i)
					--print("plal"..tabplayer[i])
				end

				PlayerIndex = tabplayer[1]
				w,x,y = GetWorldPos()
				SetMissionV(YDBZ_READY_SIGNUP_WORLD, w)
				SetMissionV(YDBZ_READY_SIGNUP_POSX, x)
				SetMissionV(YDBZ_READY_SIGNUP_POSY, y)
				local nteammax = GetMissionV(YDBZ_READY_TEAM_MAX)
				--print(nteammax)
				SetMissionV(YDBZ_READY_TEAM,GetMissionV(YDBZ_READY_TEAM) + 1)
				SetMissionV(YDBZ_READY_TEAM_MAX,(nteammax + 1))
				local szteamname = GetName()
				SetMissionS((nteammax + 1),szteamname)
				
							
				for i = 1 , getn(tabplayer) do 
					PlayerIndex = tabplayer[i]
					--print("player"..PlayerIndex)
					
					-- �������ж��Ƿ���Խ����ͼ
					w,x,y = GetWorldPos();
					if GetTask(ID_PRISONMAN)>100 or w==208 then
						SetPK(10);
						Msg2Player("<color=red>Ng��i v� c� � �� v��t ng�c v� b� t�ng khung h�nh ph�t n�ng th�m, <color><color=yellow>PK bi�n th�nh 10!<color>");
						for i=1, 3 do
							Msg2SubWorld("<color=yellow>Ng��i ch�i: <color><color=green>"..GetName().."<color><color=yellow> c� � �� v��t ng�c, b� nha d�ch b�t ngay t�i hi�n tr��ng, ��ng th�i t�ng m�c h�nh ph�t! Th�ng b�o cho to�n thi�n h� bi�t tin<color>!");
						end;
					else
						SetTask(YDBZ_TEAMS_TASKID,(nteammax+1))
						YDBZ_ready_joinmap(PlayerIndex)				
					end;
				end
				BuildATeam(1,0,tabplayer)
				SubWorld = sub
				Msg2MSAll(YDBZ_READY_MISSION,format("<color=blue>��i %s <color> ti�n v�o c�ng b�o t�ng vi�m ��",szteamname))
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local	strlevel = "V��t �i b�o t�ng vi�m ��"
	Say(format("Hi�n t�i <color=red>%s<color> kh�ng c�n v� tr� tr�ng n�o. H�y ��i ��t sau", strlevel),0);
end


function YDBZ_dragon_mem_join()
	if YDBZ_checkLimit2() == 1  then
		return
	end	
		
	OldSubWorld = SubWorld
	
	for i = 1, getn(YDBZ_READY_MAP) do 
		sub = SubWorldID2Idx(YDBZ_READY_MAP[i])
		if (sub >= 0) then
			SubWorld = sub
			local state = GetMissionV(YDBZ_READY_STATE)
			if ( state == 1 ) then
				if GetTask(YDBZ_MISSIOM_PLAYER_KEY) ~=  GetMissionV(YDBZ_MISSION_KEY) then
					Say("T� ��i c�a ��i hi�p kh�ng � t�i ��t v��t �i l�n n�y.",0)
					return
				end
				local ngroup = GetTask(YDBZ_TEAMS_TASKID)
				--SetTask(YDBZ_TEAMS_TASKID,(nteammax+1))
				if GetMSPlayerCount(YDBZ_READY_MISSION,ngroup) == 0 then
					Say("C�ng v�o b�o t�ng vi�m �� kh�ng c� t� ��i c�a ��i hi�p, h�y t� ��i l�i b�o danh tham gia",0)
					return
				end
				YDBZ_ready_joinmap(PlayerIndex)
				SubWorld = sub
				local idx = 0;
				local ncapter = 0;
				local pidx;
				local tbplayer = {}
				for nj = 1, 10 do
					idx , pidx = GetNextPlayer(YDBZ_READY_MISSION, idx, ngroup);
					if (pidx > 0) then
							tbplayer[nj] = pidx
							PlayerIndex = pidx
							if GetName() == GetMissionS(ngroup) then
									ncapter = nj
							end
					end;
					if (idx <= 0) then
						break;
					end;
				end
				if ncapter > 0 then
					tbplayer[1],tbplayer[ncapter] = tbplayer[ncapter],tbplayer[1]
				end
				BuildATeam(1,0,tbplayer)
				return
			end
		end
	end
	SubWorld = OldSubWorld
	PlayerIndex = OldPlayer
	local	strlevel = "V��t �i b�o t�ng vi�m ��"
	Say(format("Hi�n t�i <color=red>%s<color> kh�ng c�n v� tr� tr�ng n�o. H�y ��i ��t sau", strlevel),0);
	
end

function YDBZ_about()
	-- Thay ��i th�ng b�o b�o danh tham gia  t�nh n�ng Vi�m �� -Modifiled by AnhHH - 20110802
	Say(format("C�ch ch�i v��t �i m�i, n�i dung m�i, boss m�i, b�n �� m�i, v� v�n k� tr�n d� b�o, r�t th�ch h�p c�c trang b� ho�ng kim c�a m�n ph�i ch� c� t�i b�o t�ng vi�m ��! <enter>M�i ng�y %s, h�y ��n tr��c 5 ph�t �� b�o danh � B�nh B�nh c� n��ng.", "8:25, 9:25, 10:25, 12:25, 14:25, 16:25, 18:25, 20:25, 22:25"),0)
	
end
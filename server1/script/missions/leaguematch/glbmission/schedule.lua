Include( "\\script\\missions\\leaguematch\\head.lua" )
WLLS_FACTION_NAME	= {"Thi�u L�m", "Thi�n V��ng", "���ng M�n", "Ng� ��c", "Nga Mi", "Th�y Y�n", "C�i Bang", "Thi�n Nh�n", "V� �ang", "C�n L�n"}
WLLS_FACTION_NAME[0] = "Kh�ng m�n ph�i"
WLLS_FILE_ENTERPOS = "\\settings\\maps\\championship\\champion_gmpos.txt"
if (TabFile_Load(WLLS_FILE_ENTERPOS, "ENTERPOS") == 0) then
	wlls_error_log("Load TabFile Error!"..WLLS_FILE_ENTERPOS)
end

function wlls_GetPosFileData(row, col)
	return tonumber(TabFile_GetCell("ENTERPOS", row + 1, col))
end

function wlls_SaveMeetEmy(tbLG, nEmyNameID)
	LG_ApplySetLeagueTask(WLLS_LGTYPE, tbLG.szName, WLLS_LGTASK_EMY2, LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY1))
	LG_ApplySetLeagueTask(WLLS_LGTYPE, tbLG.szName, WLLS_LGTASK_EMY3, LG_GetLeagueTask(tbLG.nLGID, WLLS_LGTASK_EMY2))
	LG_ApplySetLeagueTask(WLLS_LGTYPE, tbLG.szName, WLLS_LGTASK_EMY1, nEmyNameID)
end

--��һ����Ӫ���������������ǵ�����ѡ��һ���ֿ���Ӫ
function wlls_buildup_vs( tb_camp , tbLGs )
	local n_allcamp = getn(tb_camp)
	--print("wlls_buildup_vs", n_allcamp)
	WriteLog(date("%y-%m-%d,%H:%M:%S").."\twlls_buildup_vs("..n_allcamp..")")
	local tb_winrate = {}	--�÷�������
	for i = 1, 10 do	--�ֳ�10��
		tb_winrate[i] = {}
	end
	for i = 1, n_allcamp do	--��Ӫ����÷�������
		local n_camp = tb_camp[i]
		local n_winrate = 0.1
		local nWinPoint	= tbLGs[n_camp].nWin*3 + tbLGs[n_camp].nTie
		if (nWinPoint > 0) then
			n_winrate = nWinPoint/tbLGs[n_camp].nTotal
		end
		if (n_winrate > 3 or n_winrate <= 0) then
			wlls_error_log("wlls_buildup_vs Abnormal winrate "..nWinPoint.."/"..tbLGs[n_camp].nTotal)
			n_winrate = 0.1
		end
		local tb_twr = tb_winrate[ceil(n_winrate/0.3)]
		tb_twr[getn(tb_twr)+1] = n_camp
	end
	local tb_vscamp = {}
	for i = 10, 1, -1 do	--��ÿһ�η��� tb_vscamp
		local tb_twr = tb_winrate[i]
		_M("TB_WinRate["..i.."] = "..join(tb_twr))
		local n_count = getn(tb_vscamp)
		for j = 1, getn(tb_twr) do
			tb_vscamp[n_count + j] = tb_twr[j]
		end
	end
	_M("TB_VSCamp1 = "..join(tb_vscamp))
	local n_blockpl = ceil(n_allcamp/5)
	if (n_blockpl < 5) then
		n_blockpl = 5
	end
	for i = 0, 4 do	--��5������
		local n_start = i * n_blockpl	--����������ʼλ�ã�-1��
		local n_len = n_allcamp - n_start	--�������򳤶�
		if (n_len > n_blockpl) then
			n_len = n_blockpl
		end
		for j = n_start + 1, n_start + n_len, 2 do
			local n_swap = random(n_len) + n_start	--���ĸ�����
			local n_camp = tb_vscamp[n_swap]
			tb_vscamp[n_swap] = tb_vscamp[j]
			tb_vscamp[j] = n_camp
		end
	end
	_M("TB_VSCamp2 = "..join(tb_vscamp))
	--�������������
	for i = 1, n_allcamp - 1, 2 do
		local tbMyEmys	= tbLGs[tb_vscamp[i]].tbEmys
		local nSelectMeet	= 0
		for j = i + 1, n_allcamp do
			nMeet	= tbMyEmys[tbLGs[tb_vscamp[j]].nNameID]
			if (not nMeet or nMeet > nSelectMeet) then	--δ�������������磬ѡ��
				if (j ~= i + 1) then
					local nCamp	= tb_vscamp[j]
					tb_vscamp[j]	= tb_vscamp[i+1]
					tb_vscamp[i+1]	= nCamp
				end
				nSelectMeet	= nMeet
			end
			if (not nSelectMeet) then
				break
			end
		end
		--��¼�������
		wlls_SaveMeetEmy(tbLGs[tb_vscamp[i]], tbLGs[tb_vscamp[i+1]].nNameID)
		wlls_SaveMeetEmy(tbLGs[tb_vscamp[i+1]], tbLGs[tb_vscamp[i]].nNameID)
		local szOut	= format("%s(%d)\tVS\t%s(%d)",
			tbLGs[tb_vscamp[i]].szName, tb_vscamp[i],
			tbLGs[tb_vscamp[i+1]].szName, tb_vscamp[i+1])
		--print(szOut)
		WriteLog("WLLS_VS\t"..szOut)
	end
	local n_wincamp = nil
	if (mod(n_allcamp, 2) == 1) then	--����ǵ��������һ���ֿ�
		local n_wincamp = tb_vscamp[n_allcamp]
		tb_vscamp[n_allcamp] = nil
		local szOut	= format("single\t%s(%d)", tbLGs[n_wincamp].szName, n_wincamp)
		--print(szOut)
		WriteLog("WLLS_VS\t"..szOut)
		return tb_vscamp, n_wincamp
	else
		return tb_vscamp
	end
end

--curmscamp��Ӫ����ҽ��������
function wlls_addplayer_combat(tbLGs, nOrgCamp, nEmyCamp, nNewCamp, tbNewPos)
	_M("wlls_addplayer_combat", nOrgCamp, nEmyCamp, nNewCamp, "{"..join(tbNewPos).."}")

	--ս����Ϣ����¼�Լ�����Ӫ
	LG_ApplySetLeagueTask(WLLS_LGTYPE, tbLGs[nOrgCamp].szName, WLLS_LGTASK_MSCAMP, nNewCamp)

	local nCombatMap = wlls_get_mapid(3)
	local nOldPlIdx = PlayerIndex

	for _, nIdx in tbLGs[nOrgCamp].tbPlayer do
		PlayerIndex = nIdx
		NewWorld(tbNewPos[1], tbNewPos[2], tbNewPos[3])  --��������
		AddMSPlayer(WLLS_MSID_COMBAT, nNewCamp);  --������Ӫ
		SetCurCamp(mod(nNewCamp, 2) + 2)
		wlls_set_pl_state()		--�����볡״̬
		SetTask(WLLS_TASKID_ORGCAMP, nNewCamp)
		SetDeathScript(WLLS_FILE_DEATHSCRIPT);	--���������ű�
		ST_StartDamageCounter()	--��ʼ�����˺�
	end

	local szMsg	= "<color=pink>Tin t�c chi�n s�: ��i th� [<color=yellow>"..tbLGs[nEmyCamp].szName.."<color>] chi�n ��i c� <color=yellow>"..getn(tbLGs[nEmyCamp].tbPlayer).."<color> ng��i v�o thi ��u"
	Msg2MSGroup(WLLS_MSID_COMBAT, szMsg, nNewCamp)
	szMsg	= "Tin t�c ��i th� nh� sau: "
	for _, nIdx in tbLGs[nEmyCamp].tbPlayer do
		PlayerIndex = nIdx
		szMsg	= szMsg..format("\n<color=white>%16s <color=green>%3d c�p <color=yellow>%s", GetName(), GetLevel(), GetLastAddFaction())
	end
	Msg2MSGroup(WLLS_MSID_COMBAT, szMsg, nNewCamp)

	PlayerIndex = nOldPlIdx
end

--��һ��MS��Ӫ���������
function wlls_addtroop_combat( tb_vscamp , tbLGs )
	local nCombatMap	= wlls_get_mapid(3)
	local nOldWorld		= SubWorld
	SubWorld	= SubWorldID2Idx(nCombatMap)

	for i = 1, getn(tb_vscamp) - 1, 2 do
		local posx = wlls_GetPosFileData(ceil(i/2), 1)
		local posy = wlls_GetPosFileData(ceil(i/2), 2)
		
		--��Ӫ���������
		wlls_addplayer_combat(tbLGs, tb_vscamp[i], tb_vscamp[i+1], i, {nCombatMap, posx, posy})
		wlls_addplayer_combat(tbLGs, tb_vscamp[i+1], tb_vscamp[i], i + 1, {nCombatMap, posx, posy})
		
	end
	
	Msg2MSAll(WLLS_MSID_COMBAT, "B�n �� v�o khu v�c thi ��u, thi ��u sau <color=yellow>"..(WLLS_TIMER_FIGHT_FREQ * WLLS_TIMER_FIGHT_PREP).."<color> gi�y ch�nh th�c b�t ��u")
	
	SubWorld	= nOldWorld
end

function OnTimer()
	--ʱ���������
	local n_timer = GetGlbValue(GLB_WLLS_TIME) + 1
	SetGlbValue(GLB_WLLS_TIME, n_timer)
	n_timer = WLLS_TIMER_PREP_TOTAL - n_timer	--׼�����ʣ��ʱ��
	
	local tb_sub = wlls_get_subworld(2)
	local n_oldsub = SubWorld
	if (n_timer <= 0) then	--׼����������ʼ����
		StopGlbMSTimer(WLLS_MSID_GLB, WLLS_TIMERID_SCHEDULE)
		SetGlbValue(GLB_WLLS_PHASE, 5)
		SetGlbValue(GLB_WLLS_TIME, 0)
		StartGlbMSTimer(WLLS_MSID_GLB, WLLS_TIMERID_COMBAT, WLLS_TIMER_FIGHT_FREQ*WLLS_FRAME2TIME)
		Msg2SubWorld("B�o danh V� l�m ki�t xu�t li�n ��u �� k�t th�c, thi ��u ch�nh th�c b�t ��u!")
		
		--����ÿ��׼����
		for n_idx, nGroupIdx in tb_sub do
			SubWorld = n_idx
			
			local tb_mstroop = wlls_get_ms_troop()
			_M("getn(tb_mstroop)="..getn(tb_mstroop))
			if (getn(tb_mstroop) < WLLS_MIN_TEAM) then
				Msg2SubWorld("��i tham gia thi ��u qu� �t, "..wlls_get_desc(3).."H�y b� thi ��u tr�n n�y")
				tb_mstroop = {}
			end
			
			--��ȡÿ����Ӫս����Ϣ
			local nOldPLIdx = PlayerIndex
			local tbLGs	= {}
			local tbPlayer	= {}
			for _, nCamp in tb_mstroop do
				tbPlayer = wlls_get_ms_plidx(nCamp)
				PlayerIndex = tbPlayer[1]
				if (not PlayerIndex or PlayerIndex <= 0) then
					wlls_error_log("schedule.lua:OnTimer", "bad PlayerIndex", PlayerIndex, nCamp)
					wlls_remove_camp(0)
					return
				end
				tbLGs[nCamp]	= wlls_GetLGInfo()
				if (not tbLGs[nCamp]) then
					wlls_error_log("schedule.lua:OnTimer", "bad LG", PlayerIndex, nCamp)
					wlls_remove_camp(0)
					return
				end
				tbLGs[nCamp].tbPlayer = tbPlayer
			end
			
			PlayerIndex = nOldPLIdx
			
			local tb_vstroop, n_wincamp = wlls_buildup_vs(tb_mstroop, tbLGs)
			_M("n_wincamp="..tostring(n_wincamp))
			
			--����������Mission
			local n_oldworld = SubWorld
			local n_combatmap = wlls_get_mapid(3)
			SubWorld = SubWorldID2Idx(n_combatmap)
			CloseMission(WLLS_MSID_COMBAT)	--�Է���һ����Ҫ���ڵ��Խ׶�
			OpenMission(WLLS_MSID_COMBAT)
			SubWorld = n_oldworld			
	
			--��ֱ�ӻ�ʤ��ս�ӽ��н���
			if n_wincamp then
				local n_usedtime = 5 * 60 * WLLS_FRAME2TIME	-- 5����
				wlls_matchresult(tbLGs[n_wincamp].szName, nil, nil, n_usedtime)
			end
	
			wlls_addtroop_combat(tb_vstroop, tbLGs)	--��һ��MS��Ӫ���������
			
			CloseMission(WLLS_MSID_SCHEDULE)
		end
	else
		-- ��Relay�㱨��ǰ����
		local tbGroup	= {}
		local bReport	= (mod(n_timer, 60 / WLLS_TIMER_PREP_FREQ) == 0)
		for n_idx, nGroupIdx in tb_sub do
			tbGroup[getn(tbGroup)+1]	= nGroupIdx
			-- 1����һ�Σ�֪ͨ��ǰʣ��ʱ��
			if (bReport) then
				SubWorld = n_idx
				Msg2MSAll(WLLS_MSID_SCHEDULE, "Th�i gian b�o danh c�n <color=yellow>"..(n_timer*WLLS_TIMER_PREP_FREQ/60).."<color> ph�t")
			end
		end
		if (getn(tbGroup) > 0) then
			local szParam = GetPlayerCount().." "..join(tbGroup)
			LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_GsState", szParam , "", "")
		end
	end
	SubWorld = n_oldsub
end

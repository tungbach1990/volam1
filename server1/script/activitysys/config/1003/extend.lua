Include("\\script\\activitysys\\config\\1003\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1003\\variables.lua")
Include("\\script\\activitysys\\config\\1003\\awardlist.lua")
IncludeLib("SETTING");
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\activitysys\\config\\1003\\give_item_toplist.lua")
pActivity.nPak = curpack()

function pActivity:CheckGiveItemLimit(nCount)
	local nCurCount = PlayerFunLib:GetTaskDailyCount(%TSK_DAILY_2)
	if nCount + nCurCount > %MAX_ITEM_1_DAILY then
		Talk(format("S� l��ng v��t qu� gi�i h�n, ch� c� th� n�p <color=yellow>%d<color> H�nh Qu�n L�nh n�a.", %MAX_ITEM_1_DAILY - (nCount + nCurCount )))
		return nil
	end
	return 1
end

function pActivity:GiveItemGetExp(nCount)
	for i = 1, nCount do
		if PlayerFunLib:CheckTaskDaily(%TSK_DAILY_2, %MAX_ITEM_1_DAILY, "H�m nay ng��i kh�ng th� n�p v�t ph�m n�a, ng�y mai h�y quay l�i", "<") ~= 1 then			
			return
		end
		PlayerFunLib:AddTaskDaily(%TSK_DAILY_2, 1)
		tbAwardTemplet:Give({szName = "�i�m kinh nghi�m", nExp=%EXP_AWARD_1}, 1, {%EVENT_LOG_TITLE, "NopHanhQuanLenh"})
	end
end

function pActivity:UseItemGetExp(strItemName, nExp, tbTask, strLog)
	local nNextExp = nExp
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbTask)
	if floor(nNextExp/1e6) + nCurTskVal > tbTask.nMaxValue then
		nNextExp = (tbTask.nMaxValue - nCurTskVal)*1e6
	end
	tbAwardTemplet:Give({szName = "�i�m kinh nghi�m", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, strLog})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(tbTask)
	Msg2Player(format("B�n �� nh�n ���c <color=yellow>%s<color> exp t� v�t ph�m %s, b�n c�n c� th� nh�n ���c th�m <color=yellow>%s<color> exp t� v�t ph�m n�y.", nCurTskVal*1e6, strItemName, (tbTask.nMaxValue - nCurTskVal)*1e6))
end
--s� d�ng huy hi�u ��i so�i
function pActivity:UseItem1()
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(%TSK_USE_AWARD4,%TSK_USE_AWARD4.nMaxValue,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<") then
		return
	end
	--exp
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = %tbAward_1_Exp
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD4)
	local nNextExp = nRandResult
	if floor(nNextExp/1e6) + nCurTskVal > %TSK_USE_AWARD4.nMaxValue then
		nNextExp = (%TSK_USE_AWARD4.nMaxValue - nCurTskVal)*1e6
	end
	tbVNG_BitTask_Lib:addTask(%TSK_USE_AWARD4, floor(nNextExp/1e6))
	tbAwardTemplet:Give({szName = "�i�m kinh nghi�m", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, "SuDungHuyHieuDaiSoaiNhanExp"})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD4)
	Msg2Player(format("B�n �� nh�n ���c <color=yellow>%s<color> exp t� v�t ph�m %s, b�n c�n c� th� nh�n ���c th�m <color=yellow>%s<color> exp t� v�t ph�m n�y.", nCurTskVal*1e6, "Huy Hi�u ��i So�i", (%TSK_USE_AWARD4.nMaxValue - nCurTskVal)*1e6))
	--item	
	tbVNG_BitTask_Lib:addTask(%TSK_USE_AWARD5, 1)
	local nIsNormal = mod(tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD5), 29)
	if nIsNormal == 0 then
		--ph�n th��ng ��c bi�t
		if %tbAward_1_Special then
			tbAwardTemplet:Give(%tbAward_1_Special, 1, {%EVENT_LOG_TITLE, "SuDungHuyHieuDaiSoaiNhanItemDB"})
		end
	else
		--ph�n th��ng th��ng
		if %tbAward_1_Normal then
			tbAwardTemplet:Give(%tbAward_1_Normal, 1, {%EVENT_LOG_TITLE, "SuDungHuyHieuDaiSoaiNhanItem"})
		end
	end
	local nCurItemUsedCount = tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD5)
	if %tbAward_2[tostring(nCurItemUsedCount)] then
		tbAwardTemplet:Give(%tbAward_2[tostring(nCurItemUsedCount)], 1, {%EVENT_LOG_TITLE, "SuDungHuyHieuDaiSoaiDatMoc"..nCurItemUsedCount})	
	end
	tbAwardTemplet:Give(%tbAward_1, 1, {%EVENT_LOG_TITLE, "SuDungHuyHieuDaiSoaiNhanTuiChienThang"})
	--Msg2Player(format("S� l��ng Huy Hi�u ��i So�i �� s� d�ng: <color=yellow>%d<color> c�i", nCurItemUsedCount))
	tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "SuDungHuyHieuDaiSoai", "S� l��ng: "..tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD5))
end

function pActivity:HappyBoxCondition()
	local nTransLife = ST_GetTransLifeCount()
	local nRes = 1
	if nTransLife < 4 or nTransLife > 5 then
		nRes = nil
	end
	if nTransLife == 4 and GetLevel() < 150 then
		nRes = nil
	end
	if not nRes then
		Talk(1, "", "�i�u ki�n s� d�ng v�t ph�m n�y: tr�ng sinh 4 ��ng c�p 150 ��n 199 ho�c tr�ng sinh 5 kh�ng gi�i h�n ��ng c�p")
		return nil
	else
		return 1
	end	
end

function pActivity:UseHappyBox()
	local tb = {
			[1] = {szName = "�i�m Kinh Nghi�m", nExp_tl =10e9},
			[2] = {szName = "�i�m Kinh Nghi�m", nExp_tl =5e9},
			[3] = {szName = "�i�m Kinh Nghi�m", nExp_tl =3e9},
	}
	local nTransLife = ST_GetTransLifeCount()
	local nLevel = GetLevel()
	local tbFinalAward
	if nTransLife == 4 then
		if nLevel >= 150 and nLevel <= 159 then
			tbFinalAward = tb[1]
		end
		if nLevel >= 160 and nLevel <= 199 then
			tbFinalAward = tb[2]
		end
	elseif nTransLife == 5 then
		tbFinalAward = tb[3]
	end
	tbAwardTemplet:Give(tbFinalAward, 1, {%EVENT_LOG_TITLE, "SuDungHopQuaVuiVe"})
end

function pActivity:GetTittleAward()
	local nServerTime = GetCurServerTime()+ 7776000--90*24*60*60; --90 ngay
	local nDate	= FormatTime2Number(nServerTime);	
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000
	local nTittleID = 3005
	 SetTask(TASK_ACTIVE_TITLE, nTittleID);
	Title_AddTitle(nTittleID, 2, nTime);
	Title_ActiveTitle(nTittleID);
 	local sz_title = Title_GetTitleName(nTittleID);		
	Msg2Player(format("Ch�c m�ng b�n �� nh�n ���c danh hi�u <color=yellow>%s<color>", sz_title));
	tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "NhanHaoQuangDaiPhuHao")
end

function pActivity:Top10_CheckTime()
	if %tbTop10:CheckTime() == 1 then
		Talk(1, "", "H� th�ng �ang ti�n h�nh x�p h�ng, xin h�y quay l�i sau.")		
		return nil
	end
	
	return 1
end

function pActivity:Top10_GiveItem(nCount)	
	local nLastCount = GetTask(%TSK_GIVE_ITEM_COUNT)
	local nCurCount = nLastCount + nCount
	SetTask(%TSK_GIVE_ITEM_COUNT, nCurCount)		
	%tbTop10:GiveItem(GetName(), GetAccount(), nCurCount)	
	%tbLog:PlayerActionLog("NopTuiChienThangThanhCong", "N�p "..nCount, "T�ng "..nCurCount)
end

function pActivity:ShowTopList()
	%tbTop10:ShowTopList()
end

function pActivity:GetTopListAward()
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 2 then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng, xin ��i hi�p ��ng n�n n�ng.")
		return nil
	end
	local ncurrank = %tbTop10:GetCurRank(GetName(), GetAccount())
	if ncurrank == -1 then
		Talk(1, "", "C�c h� kh�ng c� ph�n th��ng n�y, xin h�y ki�m tra l�i.")
		return nil
	end
	if tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD8) ~= 0 then
		Talk(1, "", "C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return nil
	end
	
	if %tbTop10:CheckCanGetAward() == 0 then
		return nil
	end
		
	tbVNG_BitTask_Lib:setBitTask(%TSK_USE_AWARD8, 1)
	if tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD8) ~= 1 then
		Talk(1, "", "Kh�ng th� c�p nh�t d� li�u, xin li�n h� ban qu�n tr� �� ���c gi�i quy�t.")
		return nil
	end
	%tbTop10:IncreaseAwardCounter()
	local nServerTime = GetCurServerTime()+ 2592000--90*24*60*60; --90 ngay
	local nDate	= FormatTime2Number(nServerTime);	
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000
	local nTittleID = 3006
	 SetTask(TASK_ACTIVE_TITLE, nTittleID);
	Title_AddTitle(nTittleID, 2, nTime);
	Title_ActiveTitle(nTittleID);
	AddSkillState(1500, 2, 2, nTime, 1)
 	local sz_title = Title_GetTitleName(nTittleID);		
	Msg2Player(format("Ch�c m�ng b�n �� nh�n ���c danh hi�u <color=yellow>%s<color>", sz_title));
	tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "NhanHaoQuangThapDaiKyNhan")
end

function pActivity:GetFirstWinnerAward()
	local nTime = tonumber(date("%Y%m%d%H%M"))
	if nTime < 201304090100 or nTime >= 201304102400 then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng")
		return nil
	end
	local nResult = %tbTop10:IsFirstWinner(GetName(), GetAccount())
	if nResult == -1 then
		Talk(1, "", "C�c h� kh�ng ��t ���c ph�n th��ng n�y, xin h�y ki�m tra l�i.")
		return nil
	end
	if tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD9) ~= 0 then
		Talk(1, "", "C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return nil
	end
	
	if %tbTop10:CheckCanGet1stAward() == 0 then
		return nil
	end
		
	tbVNG_BitTask_Lib:setBitTask(%TSK_USE_AWARD9, 1)
	if tbVNG_BitTask_Lib:getBitTask(%TSK_USE_AWARD9) ~= 1 then
		Talk(1, "", "Kh�ng th� c�p nh�t d� li�u, xin li�n h� ban qu�n tr� �� ���c gi�i quy�t.")
		return nil
	end
	%tbTop10:Increase1stAwardCounter()
	local tbTmpAward = {szName="L� Bao Phi Phong (c�p 7)",tbProp={6,1,30360,1,0,0},nCount=1,tbParam={7,0,86400,0,0,0},  nExpiredTime = 10080}
	tbAwardTemplet:Give(tbTmpAward, 1, {%EVENT_LOG_TITLE, "NhanPhanThuongTopMuoiNgayDau"})
end
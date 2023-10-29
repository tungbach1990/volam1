Include("\\vng_script\\activitysys\\config\\1022\\head.lua")
Include("\\vng_script\\activitysys\\config\\1022\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1022\\give_item_toplist.lua")
Include("\\vng_script\\activitysys\\config\\1022\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

function pActivity:GiveItem(nCount)	
	local nLastCount = GetTask(%TSK_GIVE_ITEM_COUNT)
	local nCurCount = nLastCount + nCount	
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 1 then
		Talk(1, "", "Hi�n t�i �� h�t th�i gian n�p M�nh Thi�n Th�ch .")
		return
	else
		SetTask(%TSK_GIVE_ITEM_COUNT, nCurCount)	
		%tbTop10:GiveItem(GetName(), GetAccount(), nLastCount, nCount)
	end
--	--N�p qu� 2000 c�i ch� t�nh 1 �i�m t�ch l�y
--	if nCurCount > %LIMIT_POINT then
--		nCount = %LIMIT_POINT - nLastCount
--		if nCount > 0 then
--			Talk(1,"","Qu� gi�i h�n 2000 l�n n�p, B�n ch� c� th� nh�n ���c th�m exp t� : "..nCount.."l�n n�p")					
--		else			
--			Talk(1,"","Qu� gi�i h�n 2000 l�n n�p, B�n kh�ng th� nh�n th�m exp t� l�n n�p n�y")
--			return
--		end
--	end	
--	tbAwardTemplet:Give(%tbAwardExp, nCount , {%EVENT_LOG_TITLE, "NopTDLBThuongExp"})	
end

function pActivity:GiveItemCheckTime()
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 1 then
		Msg2Player("Hi�n t�i kh�ng ph�i th�i gian n�p v�t ph�m �ua top.")
		return nil
	end
	
	return 1
end

function pActivity:ShowTopList()	
	local nTime = tonumber(date("%Y%m%d%H%M"))
	--15 phut cuoi khong the cho xem bxh
	if nTime >= %FORBIT_TIME_START  and nTime <= %FORBIT_TIME_END then
		return Talk(1,"","B�ng x�p h�ng �ang c�p nh�p l�n cu�i. T�m th�i kh�ng th� coi. 12h00 s� ho�n t�t b�ng x�p h�ng cu�i c�ng.")
	end	
	%tbTop10:ShowTopList()
end

function pActivity:TopListAwardCheckTime()
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 2 then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng, xin ��i hi�p ��ng n�n n�ng.")
		return nil
	end
	return 1
end
function pActivity:GetTopListAward4_10(tbRank)
	%tbTop10:UpdateTopList()
	local ncurrank = %tbTop10:GetCurRank(GetName(), GetAccount())
	for i=1, getn(tbRank) do
		nRank = tbRank[i]
		if ncurrank == nRank then			
			self:GetTopListAward(nRank)
			return
		end
	end
	 Talk(1, "", "C�c h� kh�ng n�m trong danh s�ch nh�n th��ng top 4 -10.")
	return
end
function pActivity:GetTopListAward(nRank)
	%tbTop10:UpdateTopList()
	local nPhase = %tbTop10:GetPhase()
	if nPhase ~= 2 then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng, xin ��i hi�p ��ng n�n n�ng.")
		return nil
	end
	local ncurrank = %tbTop10:GetCurRank(GetName(), GetAccount())
	if ncurrank ~= nRank then
		Talk(1, "", "C�c h� kh�ng c� ph�n th��ng n�y, xin h�y ki�m tra l�i.")
		return nil
	end
	if tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_ITEM_ACTIVITY_AWARD) ~= 0 then
		Talk(1, "", "C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return nil
	end
	if %tbTop10:CheckCanGetAward(nRank) == 1 then
		Talk(1, "", "Ph�n th��ng �� c� ch�.")
		return nil
	end
	
	tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_ITEM_ACTIVITY_AWARD, 1)
	if tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_ITEM_ACTIVITY_AWARD) ~= 1 then
		Talk(1, "", "Kh�ng th� c�p nh�t d� li�u, xin li�n h� ban qu�n tr� �� ���c gi�i quy�t.")
		return nil
	end
	%tbTop10:GiveAward(nRank)
--	--Gi�i th��ng top 4 - 10 gi�ng nhau
--	if ncurrank > 3 and ncurrank < 11 then
--		nRank = 4
--	end
	print("=====Gia tri Rank hien tai"..nRank)
	tbAwardTemplet:Give(%tbAward_Rank[nRank], 1, {%EVENT_LOG_TITLE, "PhanThuongXepHang: "..nRank})	
end


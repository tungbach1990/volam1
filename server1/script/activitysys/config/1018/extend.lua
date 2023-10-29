Include("\\script\\activitysys\\config\\1018\\head.lua")
Include("\\script\\activitysys\\config\\1018\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\1018\\give_lbtc.lua")

pActivity.nPak = curpack()

function pActivity:CheckTong()
	local strTongName, nTongID = GetTongName();		
	if strTongName == nil or strTongName == "" then
		Talk(1, "", "C�c h� ch�a gia nh�p bang h�i kh�ng th� tham gia ho�t ��ng n�y!")
		return nil
	end
	return 1
end

function pActivity:GiveItem(nCount)
	local strTongName, nTongID = GetTongName();	
	if strTongName == nil or strTongName == "" then
		Talk(1, "", "C�c h� ch�a gia nh�p bang h�i kh�ng th� tham gia ho�t ��ng n�y!")
		return 0
	end
	local nLastCount = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\tong_task.lua", "tbTongTSK:GetTongTask", nTongID, %tbTONG_TSK_GIVE_ITEM)
	local nCurCount = nLastCount + nCount
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\tong_task.lua", "tbTongTSK:SetTongTask", nTongID, %tbTONG_TSK_GIVE_ITEM, nCurCount)	
	if %tbTop3:GiveItem(nTongID, strTongName, nCurCount) == 1 then
		%tbLog:PlayerActionLog("NopLenhBaiTienCuThanhCong", "N�p "..nCount, "T�ng "..nCurCount)
	end
end

function pActivity:GiveItemCheckTime()
	if %tbTop3:IsActive() ~= 1 then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian di�n ra ch��ng tr�nh.")
		return nil
	end
	if %tbTop3:CheckTime() == 1 then
		Talk(1, "", "H� th�ng �ang ti�n h�nh x�p h�ng, xin h�y quay l�i sau.")
		return nil
	end	
	return 1
end

function pActivity:ShowTopList()
	%tbTop3:ShowTopList()
end
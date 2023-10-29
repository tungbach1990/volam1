Include("\\script\\event\\other\\caipiao\\head_gs.lua")
Include("\\script\\event\\poster\\head.lua")

function main()
	

	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if (nDate >= 201006190000 and nDate <= 201007310000) then
		local tbOpt = {}
		local szTitle = "<#>".."Xin h�i ��i hi�p c�n g�?";
		tinsert(tbOpt, "Ta mu�n nh�n ph�n th��ng Poster/GetDialogPoster")
		tinsert(tbOpt, "Tho�t/OnCancel")
		Say(szTitle, getn(tbOpt), tbOpt)
	end

	
	if 201002040000 > nDate or nDate > 201003220000 then
		--return Talk(1, "", "Ho�t ��ng �� k�t th�c.")	
	else
	
		local szTitle = "<npc>".."Ph�t t�i r�i! Th�t l� may m�n, xem ra c�c h� r�t c� duy�n v�i tr� n�y!";
		
		
		
		local nWeekDay = tbCaiPiao:GetCurAwardWeekDay()
		
		local szKey = ""
		local szKey2 = ""
		if not nWeekDay or nWeekDay <=0 then
			
			szKey = nil
		elseif mod(nWeekDay, 10) == 0 then
			szKey = "Ph�n th��ng m�i tu�n"
			szKey2 = szKey
		else
			szKey = "��t n�y"
			szKey2 = "Ph�n th��ng ��t n�y"
		end
		
		
		
		local tbOpt = {}
		if szKey then
			local szOpt1 = format("Xem s� tr�ng th��ng %s", szKey)
			local szOpt2 = format("Nh�n %s", szKey2)	
			tinsert(tbOpt, {szOpt1, tbCaiPiao.QueryResult,{tbCaiPiao, nWeekDay}})
			tinsert(tbOpt, {szOpt2, tbCaiPiao.ApplyGetAward,{tbCaiPiao, nWeekDay}})
			tinsert(tbOpt, {"Ta ch� ti�n ���ng gh� ch�i"})
		else
			tinsert(tbOpt, {"Hi�n t�i v�n ch�a c� k�t qu�, ��i c� k�t qu� r�i l�i ��n nh�!"})
		end
			
		
		CreateNewSayEx(szTitle, tbOpt)
	end
end


Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbVngDenBuTKH = {
	nStartDate = 201112050800,
	nEndDate = 201112062400,
	tbBitTask = {
		nTaskID = 2912,
		nStartBit = 19,
		nBitCount = 1,
		nMaxValue = 1
	}	
}

function tbVngDenBuTKH:AddDialog(tbDialog)
	if self:IsActive() ~= 1 or tbVNG_BitTask_Lib:getBitTask(self.tbBitTask) == 1 then		
		return
	end
	tinsert(tbDialog,  "Nh�n ph�n th��ng ��n b� Tr�ng Kh�i Ho�n/#tbVngDenBuTKH:MainDialog()")  	
end

function tbVngDenBuTKH:MainDialog()
	local strTittle = "Ph�n th��ng ��n b� Tr�ng Kh�i Ho�n y�u c�u:\n\t<color=red>- Nh�n v�t ��ng c�p tr�n 150 ho�c nh�n v�t �� tr�ng sinh kh�ng gi�i h�n ��ng c�p\n\t- �� gia nh�p bang h�i.<color>"
	Describe(strTittle, 2, "Ta mu�n nh�n/#tbVngDenBuTKH:GetAward()", "��ng/OnCancel")	
end

function tbVngDenBuTKH:IsActive()
	local now = tonumber(date("%Y%m%d%H%M"));
	if now < self.nStartDate or now >= self.nEndDate then
		return 0
	end
	return 1
end

function tbVngDenBuTKH:GetAward()
	if self:IsActive() ~= 1 then
		Talk(1,"","�� qua th�i gian nh�n th��ng.")
		return
	end
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "C�c h� ch�a gia nh�p bang h�i kh�ng th� nh�n ph�n th��ng n�y!")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTask) == 1 then
		Talk(1, "", "C�c h� �� nh�n ph�n th��ng n�y r�i")
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTask, 1)
	local tbAward = {szName = "�i�m kinh nghi�m", nExp = 240e6}
	tbAwardTemplet:Give(tbAward, 1, {"Noel_2011","NhanDenbuTrongKhaiHoan"});
end
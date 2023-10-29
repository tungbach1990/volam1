Include("\\script\\vng_event\\trongcaythang082012\\awardlist.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\vng_event\\trongcaythang082012\\plant.lua")
tbTreeExtAward = {}
tbTreeExtAward.nStartDate = 201304290000
tbTreeExtAward.nEndDate = 201305092400
tbTreeExtAward.tbTSK_Bits = {
	["500"] = {
		nTaskID = 2948,
		nStartBit = 24,
		nBitCount = 1,
		nMaxValue = 1,
	},
	["1000"] = {
		nTaskID = 2948,
		nStartBit = 25,
		nBitCount = 1,
		nMaxValue = 1,
	},
	["1500"] = {
		nTaskID = 2948,
		nStartBit = 26,
		nBitCount = 1,
		nMaxValue = 1,
	},
	["2000"] = {
		nTaskID = 2948,
		nStartBit = 27,
		nBitCount = 1,
		nMaxValue = 1,
	},
}
function tbTreeExtAward:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end
function tbTreeExtAward:Main()
	if not self:IsActive() then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian di�n ra ch��ng tr�nh.")
		return
	end
	local tb = {
		"Nh�n ph�n th��ng ��t m�c 500 l�n s� d�ng H�t Gi�ng C�y �a/#tbTreeExtAward:ProcessAward('500')",
		"Nh�n ph�n th��ng ��t m�c 1000 l�n s� d�ng H�t Gi�ng C�y �a/#tbTreeExtAward:ProcessAward('1000')",
		"Nh�n ph�n th��ng ��t m�c 1500 l�n s� d�ng H�t Gi�ng C�y �a/#tbTreeExtAward:ProcessAward('1500')",
		"Nh�n ph�n th��ng ��t m�c 2000 l�n s� d�ng H�t Gi�ng C�y �a/#tbTreeExtAward:ProcessAward('2000')",
		"��ng/OnCancel",
	}
	local nCurCount = tbSeed:GetPlantCount(2)
	Describe(format("Ta ph�c tr�ch trao ph�n th��ng cho c�c v� ��i hi�p c� s� l�n s� d�ng H�t Gi�ng C�y �a ��t m�c 500, 1000, 1500, 2000\nS� l�n s� d�ng hi�n t�i c�a ��i hi�p l� <color=yellow>%s<color>", nCurCount), getn(tb), tb)
end

function tbTreeExtAward:ProcessAward(nCount)
	if CountFreeRoomByWH(4, 5) < 1 then
		Talk(1, "", "�� b�o ��m t�i s�n c�n ch�a tr�ng 4x5 � tr�ng trong h�nh trang r�i m�i nh�n th��ng.")
		return
	end
	local strCount = tostring(nCount)
	local nCurCount = tbSeed:GetPlantCount(2)
	if nCurCount < tonumber(nCount) then
		Talk(1, "", format("V� ��i hi�p ��y s� l�n s� d�ng h�t gi�ng C�y �a v�n ch�a ��t ��n %s, kh�ng th� nh�n ph�n th��ng n�y.", nCount))
		return
	end
	if tbVNG_BitTask_Lib:IsMaxValue(self.tbTSK_Bits[strCount]) == 1 then
		Talk(1, "", "��i hi�p �� nh�n ph�n th��ng n�y r�i!")
		return
	end
	if not %tbAward_F[strCount] then
		return
	end
	local tbTmpAward = %tbAward_F[strCount]
	if not tbTmpAward.nSelective then
		tbVNG_BitTask_Lib:setBitTask(self.tbTSK_Bits[strCount], 1)
		tbAwardTemplet:Give(tbTmpAward, 1, {LOG_HEAD, "NhanPhanThuongDatMoc"..strCount})
	else
		local tbDialog = {}
		for i = 1, getn(tbTmpAward) do		
			tinsert(tbDialog, format("%s/#tbTreeExtAward:ProcessSelectiveAward(%s, %d)", tbTmpAward[i].szName, strCount, i))
		end
		Describe("Xin h�y ch�n ph�n th��ng:", getn(tbDialog), tbDialog)
	end
end

function tbTreeExtAward:ProcessSelectiveAward(strUsedCount, nSelectIdx)
	strUsedCount = tostring(strUsedCount)
	if tbVNG_BitTask_Lib:IsMaxValue(self.tbTSK_Bits[strUsedCount]) == 1 then
		Talk(1, "", "��i hi�p �� nh�n ph�n th��ng n�y r�i!")
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(self.tbTSK_Bits[strUsedCount], 0, "��i hi�p �� nh�n ph�n th��ng n�y r�i!", "==") ~= 1 then
		return
	end
	if CountFreeRoomByWH(4, 5) < 1 then
		Talk(1, "", "�� b�o ��m t�i s�n c�n ch�a tr�ng 4x5 � tr�ng trong h�nh trang r�i m�i nh�n th��ng.")
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbTSK_Bits[strUsedCount], 1)
	tbAwardTemplet:Give(%tbAward_F[strUsedCount][nSelectIdx], 1, {LOG_HEAD, "NhanPhanThuongDatMoc"..strUsedCount})
end

-- pEventType:Reg("Ch��ng ��ng Cung N�", "Nh�n ph�n th��ng ��t m�c s� d�ng h�t gi�ng C�y �a", tbTreeExtAward.Main, {tbTreeExtAward})
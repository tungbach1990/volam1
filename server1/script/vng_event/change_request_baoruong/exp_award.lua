Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
tbvng_ChestExpAward = {}
tbvng_ChestExpAward.MAX_EXP_PER_DAY = 50
tbvng_ChestExpAward.TSK_DAY = 2744
--tbvng_ChestExpAward.TSK_EXP = 2742
tbvng_ChestExpAward.tbBitTask = {
	["T�ng Kim B� B�o"] = {
		nTaskID = 2705,
		nStartBit = 1,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["B�o r��ng v��t �i"] = {
		nTaskID = 2705,
		nStartBit = 8,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["B�o R��ng Th�y T�c"] = {
		nTaskID = 2705,
		nStartBit = 15,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["T�n S� B�o R��ng"] = {
		nTaskID = 2705,
		nStartBit = 22,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["Vi�m �� B� B�o"] = {
		nTaskID = 2706,
		nStartBit = 1,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["V� Tr� L� Bao"] = {
		nTaskID = 2706,
		nStartBit = 8,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["C�ng Th�nh L� Bao (m�i)"] = {
		nTaskID = 2706,
		nStartBit = 15,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["Thi�n Tr� B� B�o"] = {
		nTaskID = 3080,
		nStartBit = 1,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["B�o R��ng Ki�m Gia"] = {
		nTaskID = 3080,
		nStartBit = 9,
		nBitCount = 7,
		nMaxValue = 50,
	},
}
function tbvng_ChestExpAward:ExpAward(nValue, strItemName)
	local nTskDayValue = GetTask(self.TSK_DAY)
	local now = tonumber(GetLocalDate("%Y%m%d"))
	local tbBitTSK_Exp = self.tbBitTask[strItemName]
	if not tbBitTSK_Exp then
		return
	end
	if (now ~= nTskDayValue) then
		SetTask(self.TSK_DAY, now)
		for key, val in self.tbBitTask do
			%tbVNG_BitTask_Lib:setBitTask(val, 0)
		end
	else
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(tbBitTSK_Exp) == 1 then
			Msg2Player(format("H�m nay �� nh�n �� <color=yellow>%d <color>tri�u kinh nghi�m, kh�ng th� nh�n th�m.", self.MAX_EXP_PER_DAY))
			return
		end
	end
	
	local nTskExpValue = %tbVNG_BitTask_Lib:getBitTask(tbBitTSK_Exp)
	if (nTskExpValue + nValue/1e6) > self.MAX_EXP_PER_DAY then
		nValue = (self.MAX_EXP_PER_DAY - nTskExpValue)*1e6
	end
	--SetTask(self.TSK_EXP, GetTask(self.TSK_EXP) + nValue/1e6)
	local nNextValue = nTskExpValue + nValue/1e6
	%tbVNG_BitTask_Lib:setBitTask(tbBitTSK_Exp, nNextValue)
	AddOwnExp(nValue)
	Msg2Player(format("B�n �� nh�n ���c %d �i�m kinh nghi�m kh�ng th� c�ng d�n", nValue))
	local strTongName, nResult = GetTong()
	if nResult == 0 then
		strTongName = "Kh�ng"
	end
	local nMapID, _, _ = GetWorldPos()
	local strItemProp = nValue.." exp"
	local nDaylyExp = %tbVNG_BitTask_Lib:getBitTask(tbBitTSK_Exp) * 1e6
	local strExtraInfo = "Kinh nghi�m �� nh�n trong ng�y: "..nDaylyExp
	local strLog = GetLocalDate("%Y-%m-%d %H:%M:%S").."\t".."S� d�ng "..strItemName.."\t"..GetAccount().."\t"..GetName().."\t"..GetLevel().."\t"..ST_GetTransLifeCount().."\t".."Nh�n kinh nghi�m".."\t".."Kinh nghi�m".."\t"..strItemProp.."\t".."1".."\t"..strTongName.."\t"..nMapID.."\t"..strExtraInfo
	WriteLog(strLog);	
end
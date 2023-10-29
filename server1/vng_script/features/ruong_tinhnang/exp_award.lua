Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

tbVNG_GiveExpAward_Box = {}
tbVNG_GiveExpAward_Box.KEYLOG = "LOG_FEATURE_CTC"
tbVNG_GiveExpAward_Box.tbBitTaskAllBox = {
	["B�o R��ng T�ng Kim"] = {
		nTaskID = 2772,
		nStartBit = 1,
		nBitCount = 14,
		nMaxValue = 5000,
	},	
}
function tbVNG_GiveExpAward_Box:ExpAward(nValue, strItemName)		
	local tbBitTSK_Exp = self.tbBitTaskAllBox[strItemName]
	if not tbBitTSK_Exp then
		return
	end
	--Ki�m tra reset exp daily
	tbCheckTaskDaily2ReSet:OnLogin()
	local nFactor = 10000
	local nTskExpValue = %tbVNG_BitTask_Lib:getBitTask(tbBitTSK_Exp)
	if nTskExpValue >= tbBitTSK_Exp.nMaxValue then
		Msg2Player(format("H�m nay �� nh�n �� <color=yellow>%d <color> kinh nghi�m, kh�ng th� nh�n th�m.", tbBitTSK_Exp.nMaxValue*nFactor))
		return
	end
		
	if (nTskExpValue + nValue/nFactor) > tbBitTSK_Exp.nMaxValue then
		nValue = (tbBitTSK_Exp.nMaxValue - nTskExpValue)*nFactor
	end
	local nNextValue = nTskExpValue + nValue/nFactor
	%tbVNG_BitTask_Lib:setBitTask(tbBitTSK_Exp, nNextValue)
	AddOwnExp(nValue)
	Msg2Player(format("B�n �� nh�n ���c %d �i�m kinh nghi�m kh�ng th� c�ng d�n", nValue))
	tbLog:PlayerActionLog(self.KEYLOG.."Use: "..strItemName.."GetExp: "..nValue)
end

--reset daily t�t c� bit c�a c�c lo�i r��ng
function tbVNG_GiveExpAward_Box:ResetExpDailyBoxFeature()
	for key, val in self.tbBitTaskAllBox do
		%tbVNG_BitTask_Lib:setBitTask(val, 0)
	end
end
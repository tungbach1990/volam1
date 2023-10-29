Include("\\script\\vng_lib\\bittask_lib.lua")	
Include("\\script\\vng_lib\\vngtranslog.lua")
Include("\\script\\lib\\log.lua")
tbBitTaskInfo = {
	nTaskID = 2914,
	nStartBit = 25,
	nBitCount = 6,
	nMaxValue = 20,
}
function main(nItemIdx)
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBitTaskInfo, tbBitTaskInfo.nMaxValue, "S� d�ng v�t ph�m �� ��t ��n gi�i h�n, kh�ng th� s� d�ng th�m", "<") ~= 1 then
		return 1
	end
	tbVNG_BitTask_Lib:addTask(tbBitTaskInfo, 1)
	local nUsedCount	= tbVNG_BitTask_Lib:getBitTask(tbBitTaskInfo)
	if nUsedCount == tbBitTaskInfo.nMaxValue then
		tbLog:PlayerActionLog("Event_TrongCay","SuDungKimLangXuan20Lan")
		tbVngTransLog:Write("201111_EventTrongCay/", 19, "SuDungKimLangXuan20Lan", "N/A", 1)
	end
	return 0
end
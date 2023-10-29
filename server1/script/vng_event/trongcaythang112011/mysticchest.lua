Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\objbuffer_head.lua")	
local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Ch�c m�ng cao th� <color=yellow>%s<color=green> �� nh�n ���c <color=yellow><%s><color=green> t� <color=yellow><R��ng Th�n B�><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
function main(nIdx)
	local tbAward = {
		{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1, nRate = 20, CallBack = %_Message},
		{szName = "�i�m Kinh Nghi�m", nExp_tl=1, nCount = 500000000, nRate = 55},
		{szName="M�t n� V��ng Gi�",tbProp={0,11, 561,1,0,0},nCount=1, nExpiredTime = 20160, nRate = 25, CallBack = %_Message},
	}
	local tbBitTask = {
		nTaskID = 2912,
		nStartBit = 15,
		nBitCount = 4,
		nMaxValue = 2,
	}
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBitTask, tbBitTask.nMaxValue, "S� d�ng v�t ph�m �� ��t ��n gi�i h�n, kh�ng th� s� <enter>d�ng th�m", "<") ~= 1 then
		return 1
	end
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "Xin h�y ch�a �t nh�t 1 � tr�ng trong h�nh trang r�i m�i nh�n th��ng")
		return 1
	end
	tbVNG_BitTask_Lib:addTask(tbBitTask, 1)
	local tbTranslog = {strFolder ="201111_EventTrongCay/", nPromID = 19, nResult = 1}
	tbAwardTemplet:Give(tbAward, 1, {"Event_TrongCay", "SuDungRuongThanBiNhanVatPham", tbTranslog})
end
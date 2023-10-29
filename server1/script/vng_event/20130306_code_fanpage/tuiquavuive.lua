Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")

local tbItemList = {
	[1] = 
	{
		{szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=200,nBindState=-2},
		{szName = "1200000000 �i�m kinh nghi�m kh�ng c�ng d�n", nExp=1200000000},
		{szName="Long ��m",tbProp={0,3499},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080,},
		{szName="Cu�ng Lan",tbProp={0,3501},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080,},
		{szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1, nBindState=-2, nExpiredTime=20160},
	},	
}

tbBIT_USE_COUNT_LIMIT = {nTaskID = 2982,nStartBit = 26,nBitCount = 1,nMaxValue = 1}

function main(nIdx)
	local nItemLevel = tonumber(GetItemParam(nIdx, 1))	
	if not %tbItemList[nItemLevel] then
		return 1
	end
	
	local tbTmp = %tbItemList[nItemLevel]
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then	szNpcName = NpcName2Replace(szNpcName)end
	local tbMainDialog = DailogClass:new(szNpcName)
	for i = 1, getn(tbTmp) do
		tbMainDialog:AddOptEntry(format("%s", tbTmp[i].szName), PickItem, {nIdx, tbTmp[i]})
	end
	tbMainDialog.szTitleMsg = "Xin h�y ch�n ph�n th��ng:"
	tbMainDialog:Show()
	return 1
end

function PickItem(nBoxIdx, tbSelectedItem)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity", "default")
	if nCheckMap ~= 1 then
		return
	end
	
	if DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\bittask_lib.lua", "tbVNG_BitTask_Lib:getBitTask", tbBIT_USE_COUNT_LIMIT) == 1 then
		Talk(1, "", "M�i t�i kho�n ch� c� th� s� d�ng v�t ph�m n�y 1 l�n.")
		return
	end
	
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "�� b�o ��m t�i s�n, xin vui l�ng ch�a �t nh�t 1 � tr�ng trong h�nh trang r�i m�i nh�n th��ng.")
		return
	end
	if IsMyItem(nBoxIdx) ~= 1 then
		return
	end
	if RemoveItemByIndex(nBoxIdx) ~= 1 then
		return
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\bittask_lib.lua", "tbVNG_BitTask_Lib:setBitTask", tbBIT_USE_COUNT_LIMIT, 1)
	tbAwardTemplet:Give(tbSelectedItem, 1, {"CodeFaceBook", "SuDungTuiQuaVuiVe"})
end
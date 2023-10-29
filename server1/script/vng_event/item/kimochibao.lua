Include("\\script\\vng_feature\\getgoldequip.lua")
tbParam2EquipType = {
	[1] = 0,
	[2] = 1,	
	[3] = 2,
	[4] = 3,
	[5] = 4,
	[6] = 5,
	[7] = 6,
	[8] = 7,
	[9] = 8,
	[10] = 9,
	[11] = 10,
	[12] = 0,
	[13] = 1,
	[14] = 2,
	[15] = 3,
	[16] = 4,
	[17] = 5,
	[18] = 6,
	[19] = 7,
	[20] = 8,
	[21] = 9,
	[22] = 10,
}
function main(nItemIdx)
	local n_param = tonumber(GetItemParam(nItemIdx, 1 ))
	local tb = {nSpecificItem = tbParam2EquipType[n_param], nItem2Consume = nItemIdx}
	tb.tbLog={"KimOChiBao","SuDungKimOChiBao"}
	local n_bindstate = tonumber(GetItemParam(nItemIdx, 2))
	if n_bindstate == 1 then
		tb.nBindState = -2
	end
	local n_expiredtime = tonumber(GetItemParam(nItemIdx, 3))
	if n_expiredtime > 0 then
		tb.nExpiredTime = n_expiredtime
	end
	if n_param <= 0 then
		return
	elseif n_param >= 1 and n_param <= 11 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(6,tb)
	elseif n_param >= 12 and n_param <= 22 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(8,tb)
	end	
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[0]= "",
		[1] = "Kim � H�ng Li�n - T� ch�n h� ph�i",
		[2] = "Kim � Ph�t Qu�n - T� ch�n h� ph�i",		
		[3] = "Kim � Th��ng Gi�i Ch� - T� ch�n h� ph�i",
		[4] = "Kim � H� Uy�n - T� ch�n h� ph�i",
		[5] = "Kim � Y�u ��i - T� ch�n h� ph�i",
		[6] = "Kim � Kim Kh�i - T� ch�n h� ph�i",
		[7] = "Kim � Kh� Gi�i - T� ch�n h� ph�i",
		[8] = "Kim � H�i - T� ch�n h� ph�i",
		[9] = "Kim � Ng�c B�i - T� ch�n h� ph�i",
		[10] = "Kim � H� Gi�i Ch� - T� ch�n h� ph�i",
		[11] = "B� trang b� Kim � - T� ch�n h� ph�i",
		[12] = "Kim � H�ng Li�n (Max Option) - T� ch�n h� ph�i",
		[13] = "Kim � Ph�t Qu�n (Max Option) - T� ch�n h� ph�i",		
		[14] = "Kim � Th��ng Gi�i Ch� (Max Option) - T� ch�n h� ph�i",
		[15] = "Kim � H� Uy�n (Max Option) - T� ch�n h� ph�i",
		[16] = "Kim � Y�u ��i (Max Option) - T� ch�n h� ph�i",
		[17] = "Kim � Kim Kh�i (Max Option - T� ch�n h� ph�i)",
		[18] = "Kim � Kh� Gi�i (Max Option) - T� ch�n h� ph�i",
		[19] = "Kim � H�i (Max Option) - T� ch�n h� ph�i",
		[20] = "Kim � Ng�c B�i (Max Option) - T� ch�n h� ph�i",
		[21] = "Kim � H� Gi�i Ch� (Max Option) - T� ch�n h� ph�i",
		[22] = "B� trang b� Kim � (Max Option) - T� ch�n h� ph�i",
	}
	local n_bindstate = tonumber(GetItemParam(nItem, 2))	
	strBind = ""
	if n_bindstate == 1 then
		strBind = "(kh�a v�nh vi�n)"	
	end
	szDesc = szDesc..format("<color=yellow>%s %s<color>", tbItemName[n_param], strBind);
	return szDesc;
end
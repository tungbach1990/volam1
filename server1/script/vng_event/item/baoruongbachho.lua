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
	
	[23] = 0,
	[24] = 1,
	[25] = 2,
	[26] = 3,
	[27] = 4,
	[28] = 5,
	[29] = 6,
	[30] = 7,
	[31] = 8,
	[32] = 9,
	[33] = 10,
	
	[34] = 0,
	[35] = 1,
	[36] = 2,
	[37] = 3,
	[38] = 4,
	[39] = 5,
	[40] = 6,
	[41] = 7,
	[42] = 8,
	[43] = 9,
	[44] = 10,
}
function main(nItemIdx)
	local n_param = tonumber(GetItemParam(nItemIdx, 1 ))
	local tb = {nSpecificItem = tbParam2EquipType[n_param], nItem2Consume = nItemIdx}	
	tb.tbLog={"BaoRuongBachHo","SuDungBaoRuongBachHo"}
	local n_bindstate = tonumber(GetItemParam(nItemIdx, 2))
	if n_bindstate == 1 then
		tb.nBindState = -2
	end
	if n_param <= 0 then
		return
	elseif n_param >= 1 and n_param <= 11 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(7,tb)
	elseif n_param >= 12 and n_param <= 22 then
		tbVNGetGoldEquip:GetGoldEquip(7, random(1,23), tb)
	elseif n_param >= 23 and n_param <= 33 then
		tbVNGetGoldEquip:ShowEquipBranchDialog(9,tb)
	elseif n_param >= 34 and n_param <= 44 then
		tbVNGetGoldEquip:GetGoldEquip(9, random(1,23), tb)
	end	
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[0]= "",
		[1] = "B�ch H� H�ng Li�n - T� ch�n h� ph�i",
		[2] = "B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",		
		[3] = "B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",
		[4] = "B�ch H� H� Uy�n - T� ch�n h� ph�i",
		[5] = "B�ch H� Y�u ��i - T� ch�n h� ph�i",
		[6] = "B�ch H� Kim Kh�i - T� ch�n h� ph�i",
		[7] = "B�ch H� Kh� Gi�i - T� ch�n h� ph�i",
		[8] = "B�ch H� H�i - T� ch�n h� ph�i",
		[9] = "B�ch H� Ng�c B�i - T� ch�n h� ph�i",
		[10] = "B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",
		[11] = "B� trang b� B�ch H� - T� ch�n h� ph�i",
		
		[12] = "B�ch H� H�ng Li�n - Ng�u nhi�n h� ph�i",
		[13] = "B�ch H� Ph�t Qu�n - Ng�u nhi�n h� ph�i",		
		[14] = "B�ch H� Th��ng Gi�i Ch� - Ng�u nhi�n h� ph�i",
		[15] = "B�ch H� H� Uy�n - Ng�u nhi�n h� ph�i",
		[16] = "B�ch H� Y�u ��i - Ng�u nhi�n h� ph�i",
		[17] = "B�ch H� Kim Kh�i - Ng�u nhi�n h� ph�i",
		[18] = "B�ch H� Kh� Gi�i - Ng�u nhi�n h� ph�i",
		[19] = "B�ch H� H�i - Ng�u nhi�n h� ph�i",
		[20] = "B�ch H� Ng�c B�i - Ng�u nhi�n h� ph�i",
		[21] = "B�ch H� H� Gi�i Ch� - Ng�u nhi�n h� ph�i",
		[22] = "B� trang b� B�ch H� - Ng�u nhi�n h� ph�i",
		
		[23] = "B�ch H� H�ng Li�n (Max Option) - T� ch�n h� ph�i",
		[24] = "B�ch H� Ph�t Qu�n (Max Option) - T� ch�n h� ph�i",
		[25] = "B�ch H� Th��ng Gi�i Ch� (Max Option) - T� ch�n h� ph�i",
		[26] = "B�ch H� H� Uy�n (Max Option) - T� ch�n h� ph�i",
		[27] = "B�ch H� Y�u ��i (Max Option) - T� ch�n h� ph�i",
		[28] = "B�ch H� Kim Kh�i (Max Option) - T� ch�n h� ph�i",
		[29] = "B�ch H� Kh� Gi�i (Max Option) - T� ch�n h� ph�i",
		[30] = "B�ch H� H�i (Max Option) - T� ch�n h� ph�i",
		[31] = "B�ch H� Ng�c B�i (Max Option) - T� ch�n h� ph�i",
		[32] = "B�ch H� H� Gi�i Ch� (Max Option) - T� ch�n h� ph�i",
		
		[33] = "B� trang b� B�ch H� (Max Option) - T� ch�n h� ph�i",
		[34] = "B�ch H� H�ng Li�n (Max Option) - Ng�u nhi�n h� ph�i",
		[35] = "B�ch H� Ph�t Qu�n (Max Option) - Ng�u nhi�n h� ph�i",
		[36] = "B�ch H� Th��ng Gi�i Ch� (Max Option) - Ng�u nhi�n h� ph�i",
		[37] = "B�ch H� H� Uy�n (Max Option) - Ng�u nhi�n h� ph�i",
		[38] = "B�ch H� Y�u ��i (Max Option) - Ng�u nhi�n h� ph�i",
		[39] = "B�ch H� Kim Kh�i (Max Option) - Ng�u nhi�n h� ph�i",
		[40] = "B�ch H� Kh� Gi�i (Max Option) - Ng�u nhi�n h� ph�i",
		[41] = "B�ch H� H�i (Max Option) - Ng�u nhi�n h� ph�i",
		[42] = "B�ch H� Ng�c B�i (Max Option) - Ng�u nhi�n h� ph�i",
		[43] = "B�ch H� H� Gi�i Ch� (Max Option) - Ng�u nhi�n h� ph�i",
		[44] = "B� trang b� B�ch H� (Max Option) - Ng�u nhi�n h� ph�i",
	}
	local n_bindstate = tonumber(GetItemParam(nItem, 2))	
	strBind = ""
	if n_bindstate == 1 then
		strBind = "(kh�a v�nh vi�n)"	
	end
	szDesc = szDesc..format("<color=yellow>%s %s<color>", tbItemName[n_param], strBind);
	return szDesc;
end
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
}
function main(nItemIdx)
	local tb = {nItem2Consume = nItemIdx, nBindState = -2, nExpiredTime = 259200}
	tb.tbLog = {"BatNienHoiNgoLenhBai", "SuDungRuongXichLan"}		
	local nParam1 = tonumber(GetItemParam(nItemIdx, 1))
	if nParam1 == 0 then		
		local nParam2 = tonumber(GetItemParam(nItemIdx, 2))
		local nParam3 = tonumber(GetItemParam(nItemIdx, 3))
		local nParam4 = tonumber(GetItemParam(nItemIdx, 4))
		local nParam5 = tonumber(GetItemParam(nItemIdx, 5))
		if nParam2 ~= 0 or nParam3 ~= 0 or nParam4 ~= 0 or nParam5 ~= 0 then
			tb.tbExclude = {nParam2, nParam3, nParam4, nParam5}
		end		
		tbVNGetGoldEquip:ShowSpecItemDialog(10, tb)
	else		
		tb.nSpecificItem = tbParam2EquipType[nParam1]
		tbVNGetGoldEquip:ShowEquipBranchDialog(10,tb)
	end
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[0]= "1 trang b� X�ch L�n t� ch�n",
		[1] = "X�ch L�n H�ng Li�n - T� ch�n h� ph�i",
		[2] = "X�ch L�n Ph�t Qu�n - T� ch�n h� ph�i",		
		[3] = "X�ch L�n Th��ng Gi�i Ch� - T� ch�n h� ph�i",
		[4] = "X�ch L�n H� Uy�n - T� ch�n h� ph�i",
		[5] = "X�ch L�n Y�u ��i - T� ch�n h� ph�i",
		[6] = "X�ch L�n Kim Kh�i - T� ch�n h� ph�i",
		[7] = "X�ch L�n Kh� Gi�i - T� ch�n h� ph�i",
		[8] = "X�ch L�n H�i - T� ch�n h� ph�i",
		[9] = "X�ch L�n Ng�c B�i - T� ch�n h� ph�i",
		[10] = "X�ch L�n H� Gi�i Ch� - T� ch�n h� ph�i",
		[11] = "B� trang b� X�ch L�n - T� ch�n h� ph�i",		
	}
	local tbEquipName = {
	[1] = "H�ng Li�n",
	[2] = "��nh M�o",
	[3] = "Th��ng Gi�i Ch�",
	[4] = "H� Uy�n",
	[5] = "Y�u ��i",
	[6] = "Y Ph�c",
	[7] = "V� Kh�",
	[8] = "H�i T�",
	[9] = "Ng�c B�i",
	[10] = "H� Gi�i Ch�",	
}
	
	local nParam2 = tonumber(GetItemParam(nItem, 2))
	local nParam3 = tonumber(GetItemParam(nItem, 3))
	local nParam4 = tonumber(GetItemParam(nItem, 4))
	local nParam5 = tonumber(GetItemParam(nItem, 5))
	if n_param ~= 0 then
		szDesc = szDesc..format("<color=yellow>%s", tbItemName[n_param]);
	else
		if nParam2 ~= 0 or nParam3 ~= 0 or nParam4 ~= 0 or nParam5 ~= 0 then
			szDesc = szDesc..format("<color=yellow>%s tr� ", tbItemName[n_param]);		
			if nParam2 ~= 0 then
				szDesc = szDesc..format("%s ", tbEquipName[nParam2]);
			end
			if nParam3 ~= 0 then
				szDesc = szDesc..format("%s ", tbEquipName[nParam3]);
			end
			if nParam4 ~= 0 then
				szDesc = szDesc..format("%s ", tbEquipName[nParam4]);
			end
			if nParam5 ~= 0 then
				szDesc = szDesc..format("%s ", tbEquipName[nParam5]);
			end		
		end
	end
	szDesc = szDesc.."<color>"
	return szDesc;
end
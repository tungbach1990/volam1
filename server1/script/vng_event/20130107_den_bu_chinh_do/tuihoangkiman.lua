Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
local tbHKAList = {
	[1] = 
	{
		{szName="Ho�ng Kim �n (C��ng h�a) c�p 1",tbProp={0,3205},},
		{szName="Ho�ng Kim �n (Nh��c h�a) c�p 1",tbProp={0,3215}},		
	},
	[2] = 
	{
		{szName="Ho�ng Kim �n (C��ng h�a)  c�p 2",tbProp={0,3206},},
		{szName="Ho�ng Kim �n (Nh��c h�a)  c�p 2",tbProp={0,3216}},		
	},
	[3] = 
	{
		{szName="Ho�ng Kim �n (C��ng h�a)  c�p 3",tbProp={0,3207},},
		{szName="Ho�ng Kim �n (Nh��c h�a)  c�p 3",tbProp={0,3217}},		
	},
	[4] = 
	{
		{szName="Ho�ng Kim �n (C��ng h�a)  c�p 4",tbProp={0,3208},},
		{szName="Ho�ng Kim �n (Nh��c h�a)  c�p 4",tbProp={0,3218}},		
	},
	[5] = 
	{
		{szName="Ho�ng Kim �n (C��ng h�a)  c�p 5",tbProp={0,3209},},
		{szName="Ho�ng Kim �n (Nh��c h�a)  c�p 5",tbProp={0,3219}},		
	},
	[6] = 
	{
		{szName="Ho�ng Kim �n (C��ng h�a)  c�p 6",tbProp={0,3210},},
		{szName="Ho�ng Kim �n (Nh��c h�a)  c�p 6",tbProp={0,3220}},		
	},
	[7] = 
	{
		{szName="Ho�ng Kim �n (C��ng h�a)  c�p 7",tbProp={0,3211},},
		{szName="Ho�ng Kim �n (Nh��c h�a)  c�p 7",tbProp={0,3221}},		
	},
	[8] = 
	{
		{szName="Ho�ng Kim �n (C��ng h�a)  c�p 8",tbProp={0,3212},},
		{szName="Ho�ng Kim �n (Nh��c h�a)  c�p 8",tbProp={0,3222}},		
	},
	[9] = 
	{
		{szName="Ho�ng Kim �n (C��ng h�a)  c�p 9",tbProp={0,3213},},
		{szName="Ho�ng Kim �n (Nh��c h�a)  c�p 9",tbProp={0,3223}},		
	},
	[10] = 
	{
		{szName="Ho�ng Kim �n (C��ng h�a)  c�p 10",tbProp={0,3214},},
		{szName="Ho�ng Kim �n (Nh��c h�a)  c�p 10",tbProp={0,3224}},		
	},
}

function main(nIdx)
	local nItemLevel = tonumber(GetItemParam(nIdx, 1))	
	if not %tbHKAList[nItemLevel] then
		return 1
	end
	
	local tbTmp = %tbHKAList[nItemLevel]
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then	szNpcName = NpcName2Replace(szNpcName)end
	local tbMainDialog = DailogClass:new(szNpcName)
	for i = 1, getn(tbTmp) do
		tbMainDialog:AddOptEntry(format("%s", tbTmp[i].szName), PickItem, {nIdx, tbTmp[i]})
	end
	tbMainDialog.szTitleMsg = "Xin h�y ch�n lo�i Ho�ng Kim �n:"
	tbMainDialog:Show()
	return 1
end

function PickItem(nBoxIdx, tbSelectedItem)	
	local nItemBindState = tonumber(GetItemParam(nBoxIdx, 2))
	local nItemExpiredTime = tonumber(GetItemParam(nBoxIdx, 3))
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
	local tb = {}
	tb.szName = tbSelectedItem.szName
	tb.tbProp = tbSelectedItem.tbProp
	if nItemBindState == 1 then
		tb.nBindState = -2
	end
	if nItemExpiredTime >= 0 then
		tb.nExpiredTime = nItemExpiredTime
	end
	tb.nCount=1
	tb.nQuality = 1
	tbAwardTemplet:Give(tb, 1, {"DenBuChinhDo", "SuDungHoangKimAnLeBao"})
end
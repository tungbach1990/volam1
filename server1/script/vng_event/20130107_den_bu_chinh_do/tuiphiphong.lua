Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
local tbPhiPhongList = {
	[5] = 
	{
		{szName="Phi phong Kinh L�i (D�ch chuy�n t�c th�i)",tbProp={0,3470},},
		{szName="Phi phong Kinh L�i (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3471}},
		{szName="Phi phong Kinh L�i ( Tr�ng k�ch )",tbProp={0,3472},},
	},
	[6] = 
	{
		{szName="Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",tbProp={0,3473},},
		{szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},},
		{szName="Phi phong Ng� Phong (Tr�ng k�ch)",tbProp={0,3475}},
	},	
	[7] = 
	{
		{szName="Phi Phong Ph� Quang ( d�ch chuy�n t�c th�i)",tbProp={0,3476},},
		{szName="Phi Phong C�p Ph� Quang (h�a gi�i s�t th��ng)",tbProp={0,3477},},
		{szName="Phi Phong Ph� Quang ( tr�ng k�ch)",tbProp={0,3478},},
	},
}

function main(nIdx)
	local nItemLevel = tonumber(GetItemParam(nIdx, 1))	
	if not %tbPhiPhongList[nItemLevel] then
		return 1
	end
	
	local tbTmp = %tbPhiPhongList[nItemLevel]
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then	szNpcName = NpcName2Replace(szNpcName)end
	local tbMainDialog = DailogClass:new(szNpcName)
	for i = 1, getn(tbTmp) do
		tbMainDialog:AddOptEntry(format("%s", tbTmp[i].szName), PickItem, {nIdx, tbTmp[i]})
	end
	tbMainDialog.szTitleMsg = "Xin h�y ch�n lo�i Phi Phong:"
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
	tbAwardTemplet:Give(tb, 1, {"DenBuChinhDo", "SuDungPhiPhongLeBao"})
end
-- �����׻�װ��

Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")

IncludeLib("ITEM")
tbBaiHuRefineEquip = {}

tbBaiHuRefineList = 
{
	[1]= {szName="B�ch H� H�ng Li�n", nStone = 1, nWidth = 2, nHeight = 1, },
	[2]= {szName="B�ch H� Kh�i",   nStone = 2, nWidth = 2, nHeight = 2, },
	[3]= {szName="B�ch H� Th��ng Gi�i", nStone = 2, nWidth = 1, nHeight = 1, },
	[4]= {szName="B�ch H� H� Uy�n", nStone = 1, nWidth = 1, nHeight = 2, },
	[5]= {szName="B�ch H� Y�u ��i", nStone = 2, nWidth = 2, nHeight = 1, },
	[6]= {szName="B�ch H� Y",   nStone = 3, nWidth = 2, nHeight = 3, },
	[7]= {szName="B�ch H� V� Kh�", nStone = 4, nWidth = 2, nHeight = 4, },
	[8]= {szName="B�ch H� H�i",   nStone = 3, nWidth = 2, nHeight = 2, },
	[9]= {szName="B�ch H� B�i",   nStone = 3, nWidth = 1, nHeight = 2, },
	[10]={szName="B�ch H� H� Gi�i", nStone = 2, nWidth = 1, nHeight = 1, },
}

BAIHU_IDX_START = 2285
BAIHU_IDX_END = 2514


tbRefineMaterial = {szName = "B�ch H� Tr�ng Luy�n Ng�c", tbProp = {6,1,3187, -1},}

function tbBaiHuRefineEquip:ComposeGiveUI()
	
	local szTitle = format("  %-15s\t%s", "Trang B� B�ch H�", " B�ch H� Tr�ng Luy�n Ng�c")
	
	local strDesc = ""
	for i=1, getn(%tbBaiHuRefineList) do
		local pTmp = %tbBaiHuRefineList[i]
		strDesc = format("%s%-21s\t%d\n", strDesc, pTmp.szName, pTmp.nStone)	
	end
	
	g_GiveItemUI(szTitle, strDesc, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbBaiHuRefineEquip:GiveUIOk(nPutCount)	
	
	if nPutCount ~= 1 then
		Talk(1, "", "Ch� c�n ��t v�o 1 m�n trang b� B�ch H�")
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1)
	local nItemQuality = GetItemQuality(nItemIndex)
	if nItemQuality ~= 1 then
		Talk(1, "", "Trang b� ng��i ��t v�o kh�ng ph�i l� trang b� ho�ng kim")
		return
	end
	local nGoldEquipIdx = GetGlodEqIndex(nItemIndex)
	if %BAIHU_IDX_START > nGoldEquipIdx or nGoldEquipIdx > %BAIHU_IDX_END  then
		Talk(1, "", "Trang b� ng��i ��t v�o kh�ng ph�i l� trang b� B�ch H�")
		return
	end
	--����״̬
	local nBindState = GetItemBindState(nItemIndex)
	if nBindState ~= 0 then
		Talk(1, "", "Trang b� c�a ng��i �ang trong tr�ng th�i kh�a, kh�ng th� tr�ng luy�n.")
		return
	end
	
	--����Ƿ�������װ��
	local nG, _, _ = GetItemProp(nItemIndex)
	if nG == 7 then
		Talk(1, "", "Trang b� c�a ng��i �� b� h� h�i kh�ng th� tr�ng luy�n.")
		return
	end
	if ITEM_GetExpiredTime(nItemIndex) ~= 0 then
		Talk(1, "", "Kh�ng ph�i trang b� v�nh vi�n kh�ng th� t�ng luy�n")
		return
	end
	
	
	local nEquType = mod(nGoldEquipIdx - %BAIHU_IDX_START, 10) + 1
	
	local nWidth = %tbBaiHuRefineList[nEquType].nWidth
	local nHeight = %tbBaiHuRefineList[nEquType].nHeight
	
	if nWidth ~= 0 and nHeight ~= 0 and CountFreeRoomByWH(nWidth, nHeight, 1) < 1 then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", 1, nWidth, nHeight))
		return
	end	

	local tbItem = 
	{
		szName = %tbRefineMaterial.szName, 
		tbProp = %tbRefineMaterial.tbProp, 
		nCount = %tbBaiHuRefineList[nEquType].nStone
	}
	local tbProp = tbItem.tbProp
	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < tbItem.nCount then
		Talk(1, "", format("<color=red>T� l� %sng��i ��t v�o kh�ng ��. <color>", tbItem.szName))
		return
	end
	
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	RemoveItemByIndex(nItemIndex)
	if ConsumeEquiproomItem(tbItem.nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
		return
	end	

	tbAwardTemplet:Give({tbProp = {0, nGoldEquipIdx}, nQuality = 1}, 1, {self.szLogTitle})
end

function tbBaiHuRefineEquip:Dialog()
		
	local strDesc = "<npc>L�y <color=yellow> c�n tr�ng luy�n trang b� B�ch H�<color> v� s� l��ng<color=yellow> B�ch H� Tr�ng Luy�n Ng�c t��ng �ng<color> ��t v�o"
	
	strDesc = format("%s\n\t\t\t\t\t%-29s%s", strDesc, "Trang B� B�ch H�", " B�ch H� Tr�ng Luy�n Ng�c")
	for i=1, getn(%tbBaiHuRefineList) do
		local pTmp = %tbBaiHuRefineList[i]
		strDesc = format("%s\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", strDesc, pTmp.szName, pTmp.nStone)
	end
	local tbOpt = {}
	tinsert(tbOpt, {"Tr�ng luy�n trang b� B�ch H�", self.ComposeGiveUI, {self}})
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(strDesc, tbOpt);
end


Include("\\script\\event\\equip_publish\\dialog.lua")
REFINE_EQUIP_LIST["baihu"] = {}
REFINE_EQUIP_LIST["baihu"].nPak = curpack()
REFINE_EQUIP_LIST["baihu"].szOpt = "Tr�ng luy�n trang b� B�ch H�"
REFINE_EQUIP_LIST["baihu"].pFun = tbBaiHuRefineEquip.ComposeGiveUI
REFINE_EQUIP_LIST["baihu"].pSelf = tbBaiHuRefineEquip

-- �ļ�������yandiduihuan.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-05-14 16:38:43
--�׵�װ������
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("ITEM")
yandiduihuan_tbItemList = 
{
	{szName="To�i Nh�n X�ch Huy�t Nguy�n V� Gi�p", nQuality=1, tbProp={0, 442}},
	{szName="To�i Nh�n B�ch Luy�n Kh�i", nQuality=1, tbProp={0, 443}},
	{szName="To�i Nh�n Tr�c Thi�n Ngoa", nQuality=1, tbProp={0, 445}},
	{szName="To�i Nh�n Kim L� Nhuy�n Vi H� Uy�n", nQuality=1, tbProp={0, 446}},
	{szName="Ph�c Hi Hoan �nh K�ch", nQuality=1, tbProp={0, 455}},
	{szName="Ph�c Hi V� L��ng T�ch T� Th�", nQuality=1, tbProp={0, 456}},
	{szName="Ph�c Hi To�i T�m", nQuality=1, tbProp={0, 457}},
	{szName="N� Oa H�ng Nhan Ph�t ��i", nQuality=1, tbProp={0, 463}},
	{szName="N� Oa L�c Ngh� Ngh� Th��ng Th�c ��i", nQuality=1, tbProp={0, 464}},
	{szName="N� Oa H�n T��ng", nQuality=1, tbProp={0, 467}},
	{szName="Ch�c Dung Li�t Di�m N� Phong Trang", nQuality=1, tbProp={0, 472}},
	{szName="Ch�c Dung Kinh Ch�ch B�t Di�t Tr�o", nQuality=1, tbProp={0, 476}},
	{szName="Ch�c Dung Ph� Nh�t", nQuality=1, tbProp={0, 477}},
	{szName="Th�n N�ng Ti�u D��ng ��a Ho�ng Y", nQuality=1, tbProp={0, 482}},
	{szName="Th�n N�ng N� L�i ��u Ho�n", nQuality=1, tbProp={0, 483}},
	{szName="Th�n N�ng Ng� Phong L�", nQuality=1, tbProp={0, 485}},
	{szName="Th�n N�ng Tr�m Nh�c", nQuality=1, tbProp={0, 487}},
}

yandiduihuan_Material = 
{
	{szName="Ph��ng Minh Ch�y", tbProp={6, 1, 1746}},
	{szName="Huy�n tinh kho�ng th�ch c�p 8", tbProp={6, 1, 147, 8}},
	{szName="M�nh B� Thi�n Th�ch (trung)", tbProp={6, 1, 1309}},
	{szName="Th�n b� kho�ng th�ch", tbProp={6, 1, 398}},
}
yandiduihuan_CostMoney = 10000000 --1QW


function yandiduihuan_CalcItemCount(tbMaterial)
	if type(tbMaterial[1]) == "table" then
		local nNeedCount = 0
		local tbNeedCount = {}
		for i = 1, getn(tbMaterial) do
			local nCount = 0
			nCount, tbNeedCount[i] = yandiduihuan_CalcItemCount(tbMaterial[i])
			nNeedCount = nNeedCount + nCount
		end
		return nNeedCount, tbNeedCount
	else
		local nCount = tbMaterial.nCount or 1
		return nCount, nCount
	end
	
end

function yandiduihuan_checkGoldItem(nCount)
	for i=1, nCount do
		local tbItem = yandiduihuan_MakeItemTable(GetGiveItemUnit(i))
		if tbItem.nQuality == 1 then
			if yandiduihuan_tbItemList ~= nil then
				for j=1,getn(yandiduihuan_tbItemList) do
					if (yandiduihuan_checkOne(yandiduihuan_tbItemList[j], tbItem) == 1) then
						return tbItem,i
					end
				end
			end
		end
	end
end


function yandiduihuan_GiveStep(nCount)

	local tbMaterial = yandiduihuan_Material
	local nNeedCount, tbNeedCount = yandiduihuan_CalcItemCount(tbMaterial)
	
	
	if nCount ~=  nNeedCount + 1 then
		Msg2Player("B� v�o s� l��ng kh�ng ��ng.")
		return Say("��i hi�p b� nguy�n li�u v�o kh�ng ��ng, kh�ng th� ti�n h�nh tr�ng luy�n ���c. Nguy�n li�u �� tr�ng luy�n trang b� ho�ng kim Vi�m �� l� 1 trang b� ho�ng kim Vi�m ��, 1 Ph�ng Minh ch�y, 1 huy�n tinh c�p 8, 1 m�nh b� thi�n th�ch (trung), 1000 v�n ng�n l��ng", 0)
	end
	
	local tbAwardItem, nCheckedId = yandiduihuan_checkGoldItem(nCount)
	
	if tbAwardItem == nil then
		Msg2Player("B� trang b� vi�m �� v�o kh�ng ph� h�p v�i y�u c�u.")
		return Say("B� trang b� vi�m �� v�o kh�ng ph� h�p v�i y�u c�u.", 0)
	end
	
	for i=1,nCount do
		if i ~= nCheckedId then
			local tbItem = yandiduihuan_MakeItemTable(GetGiveItemUnit(i))
			local nId,nItemCount = yandiduihuan_checkItem(tbMaterial, tbItem)
			if nId > 0 and tbNeedCount[nId] >= nItemCount then
				nNeedCount = nNeedCount - nItemCount
				tbNeedCount[nId] = tbNeedCount[nId] - nItemCount
			else
				Msg2Player("B� v�o nguy�n li�u kh�ng ��ng");
				return Say(format("Cung c�p cho ta nguy�n li�u kh�ng ��ng n�n kh�ng th� tr�ng luy�n ���c.  Nguy�n li�u tr�ng luy�n<color=yellow>%s<color>l� 1 <color=yellow>%s<color>, 1 Ph��ng Minh ch�y, 1 huy�n tinh c�p 8, 1 b� thi�n th�ch (trung), 1000 v�n ng�n l��ng", tbAwardItem.szName, tbAwardItem.szName), 0)
			end
		end
			
	end	
	if (nNeedCount == 0) then
		if  Pay(yandiduihuan_CostMoney) == 1 then 
			local nItemIndex = GetGiveItemUnit(nCheckedId)
			yandiduihuan_LogEquip(nItemIndex, "Tr��c khi tr�ng luy�n Vi�m ��")
			for i = 1, nCount do
				RemoveItemByIndex(GetGiveItemUnit(i))
			end
			tbAwardItem.CallBack = yandiduihuan_LogEquip
			tbAwardTemplet:GiveAwardByList(tbAwardItem, "Sau khi tr�ng luy�n Vi�m ��")
			return Say(format("V�t ph�m <color=yellow>%s<color> �� tr�ng luy�n th�nh c�ng", tbAwardItem.szName), 0)
		else
			return Say("Kh�ng �� ti�n �� ti�n h�nh tr�ng luy�n n�y.", 0)
		end
				
	else
		Msg2Player("B� v�t ph�m v�o kh�ng ��ng y�u c�u");
	end
end


function yandiduihuan_MakeItemTable(nItemIndex)
	local tbItem = {}
	tbItem.szName		= GetItemName(nItemIndex)
	tbItem.nQuality		= GetItemQuality(nItemIndex);
	tbItem.nBindState	= GetItemBindState(nItemIndex);
	tbItem.nCount		= GetItemStackCount(nItemIndex) or 1
	tbItem.tbProp = {}
	if tbItem.nQuality == 0 then -- ��ͨ��Ʒ
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	elseif tbItem.nQuality == 1 or tbItem.nQuality == 4 then --�ƽ� or �׽�
		local nGenre = GetItemProp(nItemIndex)
		if nGenre == 7 then
			tbItem.tbProp[1] = nGenre
		else
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetGlodEqIndex(nItemIndex)	
		end
	elseif tbItem.nQuality == 2 then -- ��ɫװ��
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	end
	return tbItem
end



function yandiduihuan_checkItem(tbMaterial,tbItem)	
	for i = 1, getn(tbMaterial) do
		if yandiduihuan_checkOne(tbMaterial[i], tbItem) == 1 then
			return i, tbItem.nCount
		end
	end
	return 0;
end

function yandiduihuan_checkOne(tbSrcItem, tbDecItem)
	if tbSrcItem == nil or tbDecItem == nil then
		return 0;
	end
	if tbSrcItem.tbProp == nil or tbDecItem.tbProp == nil then
		return 0;
	end
	if tbSrcItem.nQuality ~= nil and tbSrcItem.nQuality ~= tbDecItem.nQuality then
		return 0;
	end
	if tbSrcItem.nBindState ~= nil and tbSrcItem.nBindState ~= tbDecItem.nBindState then
		return 0;
	end
	local i;
	for i=1,getn(tbSrcItem.tbProp) do
		if (tbSrcItem.tbProp ~= nil) then
			if (tbSrcItem.tbProp[i] ~= tbDecItem.tbProp[i]) then
				return 0;
			end
		end
	end
	return 1;
end

function yandiduihuan_LogEquip(nItemIndex, szLogTitle)
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	
	local arynMagLvl	= GetItemAllParams(nItemIndex);
	local nQuality		= GetItemQuality(nItemIndex);
	local uRandSeed		= ITEM_GetItemRandSeed(nItemIndex)
	local szItemName	= GetItemName(nItemIndex)
	
	local szLogMsg = format("%s, {%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d,%d}", szItemName, 4,uRandSeed,nQuality,nGenre,nDetailType,nParticular,nLevel,nSeries,nLuck,unpack(arynMagLvl))
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t%s",szLogTitle or "Sau khi tr�ng luy�n Vi�m ��",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szLogMsg))	
	
end


function yandiduihuan_main()
	GiveItemUI("Giao di�n tr�ng luy�n trang b� ho�ng kim Vi�m ��", "1 Ph�ng Minh ch�y, 1 huy�n tinh c�p 8, 1 b� thi�n th�c (trung), 1 th�n b� kho�ng th�ch, 1000 v�n ng�n l��ng, 1 trang b� ho�ng kim Vi�m ��", "yandiduihuan_GiveStep", "yandiduihuan_OnCancel", 1)
end


function yandiduihuan_shuoming()
	local tbSay = 
	{
		"<dec><npc>Tr�ng luy�n trang b� Vi�m ��, c�n 1 Ph�ng Minh Ch�y, 1 b� thi�n th�ch (trung), 1 th�n b� kho�ng th�ch, 1000 v�n ng�n l��ng v� 1 trang b� ho�ng kim Vi�m ��.<enter>Trang b� Vi�m �� d�ng �� tr�ng luy�n v� trang b� sau khi tr�ng luy�n l� 1 lo�i trang b� ho�ng kim, n�u nh� s� d�ng to�i nh�n x�ch huy�t nguy�n v� gi�p tr�ng luy�n th� nh�t ��nh s� ra trang b� to�i nh�n x�ch huy�t nguy�n v� v� c� thu�c t�nh ng�u nhi�n.<enter>Ngo�i tr� trang s�c Vi�m �� ra th� t�t c� nh�ng Vi�m �� ��u c� th� tr�ng luy�n.",
		"Ta �� hi�u r� r�i/yandiduihuan_OnCancel",
	}
	CreateTaskSay(tbSay)
end

function yandiduihuan_OnCancel()
	
end
Include("\\script\\misc\\timeline\\timelinemanager.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

IncludeLib("ITEM")
Include("\\script\\lib\\log.lua")
if (tbItemExchangValue == nil) then
	tbItemExchangValue = {}
	tbItemExchangValue.ExchangeDiscount = 0;
end


function CalcItemExchangValue(nItemIndex, nExchangeValue)
--	if (tbItemExchangValue.ExchangeDiscount == nil or tbItemExchangValue.ExchangeDiscount == 0) then
--		local tbExchange1 = tbTimeLineManager:GetTimeLine("ItemExchange1");
--		local tbExchange2 = tbTimeLineManager:GetTimeLine("ItemExchange2");
--		local tbExchange3 = tbTimeLineManager:GetTimeLine("ItemExchange3");
--		local tbExchange4 = tbTimeLineManager:GetTimeLine("ItemExchange4");
--		local tbExchange5 = tbTimeLineManager:GetTimeLine("ItemExchange5");
		
--		if (tbExchange5 ~= nil and tbExchange5:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.5;
--		elseif (tbExchange4 ~= nil and tbExchange4:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.6;
--		elseif (tbExchange3 ~= nil and tbExchange3:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.7;
--		elseif (tbExchange2 ~= nil and tbExchange2:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.8;
--		elseif (tbExchange1 ~= nil and tbExchange1:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.9;
--		else
			tbItemExchangValue.ExchangeDiscount = 1;
--		end
		
--	end
	
	local nQuality = GetItemQuality(nItemIndex);
	
	if (nExchangeValue <= 0) then
		return 0
	end
	
	--��8���ϰ׽��ܶһ�
	local nPlatinaLevel = GetPlatinaLevel(nItemIndex);
	if (nQuality == 4 and nPlatinaLevel > 8) then
		return 0
	end
	
	if (nQuality == 4 and (nPlatinaLevel >= 6 and nPlatinaLevel <= 7)) then
		local nPtMagicAttrExValue = GetPtMagicAttrExValue(nItemIndex);
		if (nPtMagicAttrExValue and nPtMagicAttrExValue > 0) then
			nExchangeValue = nExchangeValue + nPtMagicAttrExValue;
		end
	end
	
	-- ��������b
	if (nQuality == 2) then
		nExchangeValue = nExchangeValue/150;
	end
	
	nExchangeValue = nExchangeValue * tbItemExchangValue.ExchangeDiscount;
	
	return nExchangeValue
end

function exchange_olditem()
	GiveItemUI("��i h�n th�ch", "M�t l�n ch� c� th� ��i 1 trang b� kh�ng h�n s� d�ng v� kh�ng kh�a th�nh h�n th�ch", "exchange_olditem_compose")
end

function exchange_olditem_compose(nCount)
	if (nCount <= 0) then
		Talk(1, "", "Xin m�i b� v�o trang b� c� th� ��i ���c.");
		return
	end
	
	if (nCount > 1) then
		Talk(1, "", "M�t l�n ch� c� th� d�ng m�t trang b� �� ��i th�nh h�n th�ch");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1);
	
	if (nItemIndex == nil or nItemIndex <= 0) then
		Talk(1, "", "Xin m�i b� v�o trang b� c� th� ��i ���c.");
		return
	end
	
	local nBindState = GetItemBindState(nItemIndex);
	
	if (nBindState ~= 0) then
		Talk(1, "", "Ch� c� th� d�ng trang b� kh�ng kh�a v� kh�ng c� th�i h�n s� d�ng ��i th�nh h�n th�ch");
		return
	end
	
	local nUseTime = ITEM_GetLeftUsageTime(nItemIndex);
	local nExpireTime = ITEM_GetExpiredTime(nItemIndex);
	
	if ((nUseTime > 0 and nUseTime ~= 4294967295)or (nExpireTime > 0)) then
		Talk(1, "", "Ch� c� th� d�ng trang b� kh�ng kh�a v� kh�ng c� th�i h�n s� d�ng ��i th�nh h�n th�ch");
		return
	end
	
	local nExchangeValue = GetItemExchangeValue(nItemIndex);
	
	if (nExchangeValue <= 0) then
		Talk(1, "", "Xin m�i b� v�o trang b� c� th� ��i ���c.");
		return
	end
	
	exchange_olditem_compse_confirm_dlg(nItemIndex, nExchangeValue);
end

function exchange_olditem_compse_confirm_dlg(nItemIndex, nExchangeValue)
	local tbSay = {};
	tbSay[1] = format("<dec><npc>X�c nh�n mu�n ��i <color=red>%s<color> th�nh h�n th�ch c� ch�a <color=red>%d<color> tinh l�c?", GetItemName(nItemIndex), nExchangeValue);
	
	tinsert(tbSay, format("X�c nh�n/#exchange_olditem_compse_confirm(%d, %d)",nItemIndex,nExchangeValue));
	
	tinsert(tbSay, "�� ta suy ngh� k� l�i xem/OnExit");
	CreateTaskSay(tbSay);
end

function exchange_olditem_compse_confirm(nItemIndex, nExchangeValue)
	if (IsMyItem(nItemIndex) ~= 1) then
		return 
	end
	local nBind = GetItemBindState(nItemIndex);
	--local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	--local arynMagLvl = GetItemAllParams(nItemIndex);
	--local nQuality = GetItemQuality(nItemIndex);
	local uRandSeed = ITEM_GetItemRandSeed(nItemIndex)
	--local szLogMsg = format("{%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d,%d}", 4,uRandSeed,nQuality,nGenre,nDetailType,nParticular,nLevel,nSeries,nLuck,unpack(arynMagLvl))
	local szLogMsg = getItemInfo(nItemIndex);
	WriteLog(format("%s\t%s\t%s\t%d\t%s\t%s\t%d\t%s\t%s",GetAccount(), GetName(), "��i h�n th�ch", GetItemQuality(nItemIndex), szLogMsg, GetItemName(nItemIndex), 0, format("{6,1,2356,1,0,0,%d,0,0,0,0,0}", nExchangeValue), "H�n Th�ch"))
	
	local szLog = format("%d\t%s\t%u", nExchangeValue, GetItemName(nItemIndex), uRandSeed)
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		return
	end
	
	tbAwardTemplet:GiveAwardByList({szName="H�n Th�ch", tbProp={6,1,2356,1,0,0}, tbParam={nExchangeValue,0,0,0,0,0},nBindState=nBind}, format("��i h�n th�ch (%d)",nExchangeValue));
	_WritePlayerLog("Equip Exchange ", szLog)
end

tbExchangeLingPai = 
{
	["Thanh C�u L�nh"] = 
	{
		tbItem = {szName="Thanh C�u L�nh", tbProp={6,1,2369,1,0,0}},
		szComposFunc = "exchange_lingpai_qingju",
		nRequireJingLianShi = 1500,
	},
	["V�n L�c L�nh"] = 
	{
		tbItem = {szName="V�n L�c L�nh", tbProp={6,1,2353,1,0,0}},
		szComposFunc = "exchange_lingpai_yunlu",
		nRequireJingLianShi = 4000,
	},
	["Th��ng Lang L�nh"] = 
	{
		tbItem = {szName="Th��ng Lang L�nh", tbProp={6,1,2352,1,0,0}},
		szComposFunc = "exchange_lingpai_canglang",
		nRequireJingLianShi = 13000,
	},
	["Huy�n Vi�n L�nh"] = 
	{
		tbItem = {szName="Huy�n Vi�n L�nh", tbProp={6,1,2351,1,0,0}},
		szComposFunc = "exchange_lingpai_xuanyuan",
		nRequireJingLianShi = 46000,
	},
	["T� M�ng L�nh"] = 
	{
		tbItem = {szName="T� M�ng L�nh", tbProp={6,1,2350,1,0,0}},
		szComposFunc = "exchange_lingpai_zimang",
		nRequireJingLianShi = 70000,
	},
--	["������"] = 
--	{
--		tbItem = {szName="������", tbProp={6,1,2349,1,0,0}},
--		szComposFunc = "exchange_lingpai_wujin",
--		nRequireJingLianShi = 250000,
--	},
--	["�׻���"] = 
--	{
--		tbItem = {szName="�׻���", tbProp={6,1,2357,1,0,0}},
--		szComposFunc = "exchange_lingpai_baihu",
--		nRequireJingLianShi = 500000,
--	},
	["�� Ph� T� M�ng Th��ng Gi�i Ch�"] = 
	{
		tbItem = {szName="�� Ph� T� M�ng Th��ng Gi�i Ch�", tbProp={6,1,2721,1,0,0}},
		szComposFunc = "exchange_Dopho_Tumang_Thuonggioi",
		nRequireJingLianShi = 100000,
	},
	["�� Ph� T� M�ng H� Gi�i Ch�"] = 
	{
		tbItem = {szName="�� Ph� T� M�ng H� Gi�i Ch�", tbProp={6,1,2722,1,0,0}},
		szComposFunc = "exchange_Dopho_Tumang_Hagioi",
		nRequireJingLianShi = 100000,
	},
	["�� Ph� T� M�ng Kh� Gi�i"] = 
	{
		tbItem = {szName="�� Ph� T� M�ng Kh� Gi�i", tbProp={6,1,2723,1,0,0}},
		szComposFunc = "exchange_Dopho_Tumang_Khigioi",
		nRequireJingLianShi = 100000,
	},
}

function exchange_lingpai()
	local tbSay = {};
	tbSay[1] = "<dec><npc>M�t l�n ch� c� th� d�ng 1 h�n th�ch ��i th�nh 1 l�nh b�i.";
	-- format("<enter>��¹��:��Ҫһ�����ٹ�ע��<color=green>%d<color>�����Ļ�ʯ<enter>������:��Ҫһ�����ٹ�ע��<color=green>%d<color>�����Ļ�ʯ<enter>��Գ��:��Ҫһ�����ٹ�ע��<color=green>%d<color>�����Ļ�ʯ<enter>������:��Ҫһ�����ٹ�ע��<color=green>%d<color>�����Ļ�ʯ<enter>������:��Ҫһ�����ٹ�ע��<color=green>%d<color>�����Ļ�ʯ", 800,2600,9300,22000,24000)
	
--	for sz_key, tb in tbExchangeLingPai do
--		tbSay[1] = tbSay[1].."<enter>"..format("%s:��Ҫһ�����ٹ�ע��<color=green>%d<color>�����Ļ�ʯ", sz_key, tb.nRequireJingLianShi);
--		tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')",sz_key,sz_key));
--	end
	
	
	tbSay[1] = tbSay[1].."<enter>"..format("%s: c�n �t nh�t h�n th�ch c� ch�a<color=green>%d<color> tinh l�c", "Thanh C�u L�nh", tbExchangeLingPai["Thanh C�u L�nh"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: c�n �t nh�t h�n th�ch c� ch�a<color=green>%d<color> tinh l�c", "V�n L�c L�nh", tbExchangeLingPai["V�n L�c L�nh"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: c�n �t nh�t h�n th�ch c� ch�a<color=green>%d<color> tinh l�c", "Th��ng Lang L�nh", tbExchangeLingPai["Th��ng Lang L�nh"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: c�n �t nh�t h�n th�ch c� ch�a<color=green>%d<color> tinh l�c", "Huy�n Vi�n L�nh", tbExchangeLingPai["Huy�n Vi�n L�nh"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: c�n �t nh�t h�n th�ch c� ch�a<color=green>%d<color> tinh l�c", "T� M�ng L�nh", tbExchangeLingPai["T� M�ng L�nh"].nRequireJingLianShi);
	--DinhHQ
	--20110413: b�n �� ph??th?r�n th�n b?LA
	tbSay[1] = tbSay[1].."<enter>"..format("%s: c�n �t nh�t h�n th�ch c� ch�a<color=green>%d<color> tinh l�c", "�� Ph� T� M�ng Th��ng Gi�i Ch�", tbExchangeLingPai["�� Ph� T� M�ng Th��ng Gi�i Ch�"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: c�n �t nh�t h�n th�ch c� ch�a<color=green>%d<color> tinh l�c", "�� Ph� T� M�ng H� Gi�i Ch�", tbExchangeLingPai["�� Ph� T� M�ng H� Gi�i Ch�"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: c�n �t nh�t h�n th�ch c� ch�a<color=green>%d<color> tinh l�c", "�� Ph� T� M�ng Kh� Gi�i", tbExchangeLingPai["�� Ph� T� M�ng Kh� Gi�i"].nRequireJingLianShi);
	
	tinsert(tbSay, format("��i %s/#exchange_lingpai_main_dlg('%s')","Thanh C�u L�nh","Thanh C�u L�nh"));
	tinsert(tbSay, format("��i %s/#exchange_lingpai_main_dlg('%s')","V�n L�c L�nh","V�n L�c L�nh"));
	tinsert(tbSay, format("��i %s/#exchange_lingpai_main_dlg('%s')","Th��ng Lang L�nh","Th��ng Lang L�nh"));
	tinsert(tbSay, format("��i %s/#exchange_lingpai_main_dlg('%s')","Huy�n Vi�n L�nh","Huy�n Vi�n L�nh"));
	tinsert(tbSay, format("��i %s/#exchange_lingpai_main_dlg('%s')","T� M�ng L�nh","T� M�ng L�nh"));
	--tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","������","������"));
	--tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","�׻���","�׻���"));
	--DinhHQ
	--20110413: b�n �� ph??th?r�n th�n b?LA
	tinsert(tbSay, format("��i %s/#exchange_lingpai_main_dlg('%s')","�� Ph� T� M�ng Th��ng Gi�i Ch�","�� Ph� T� M�ng Th��ng Gi�i Ch�"));
	tinsert(tbSay, format("��i %s/#exchange_lingpai_main_dlg('%s')","�� Ph� T� M�ng H� Gi�i Ch�","�� Ph� T� M�ng H� Gi�i Ch�"));
	tinsert(tbSay, format("��i %s/#exchange_lingpai_main_dlg('%s')","�� Ph� T� M�ng Kh� Gi�i","�� Ph� T� M�ng Kh� Gi�i"));
	
	tinsert(tbSay, "�� ta suy ngh� k� l�i xem/OnExit");
	CreateTaskSay(tbSay);
end

function exchange_lingpai_main_dlg(szLingpai)
	local tbLingpai = tbExchangeLingPai[szLingpai];
	
	if (tbLingpai == nil) then
		return
	end
	
	local szComposeFun = tbExchangeLingPai[szLingpai].szComposFunc;
	
	GiveItemUI(format("��i %s",szLingpai), format("M�t l�n ch� c� th� d�ng �t nh�t h�n th�ch c� ch�a %d tinh l�c �� ��i %s.", tbLingpai.nRequireJingLianShi, szLingpai), szComposeFun)
end

function exchange_lingpai_compose(nCount, szLingpai)
	if (nCount <= 0) then
		Talk(1, "", format("Xin h�y b� h�n th�ch c� ch�a �t nh�t <color=green>%d<color> tinh l�c.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	if (nCount > 1) then
		Talk(1, "", "M�t l�n ch� c� th� b� 1 h�n th�ch.");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1);
	
	if (nItemIndex == nil or nItemIndex <= 0) then
		Talk(1, "", format("Xin h�y b� h�n th�ch c� ch�a �t nh�t <color=green>%d<color> tinh l�c.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	
	if (nGenre ~= 6 or nDetailType ~= 1 or nParticular ~= 2356) then
		Talk(1, "", format("Xin h�y b� h�n th�ch c� ch�a �t nh�t <color=green>%d<color> tinh l�c.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	
	if (nJinglianshiCount < tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		Talk(1, "", format("Xin h�y b� h�n th�ch c� ch�a �t nh�t <color=green>%d<color> tinh l�c.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	exchange_lingpai_confirm_dlg(nItemIndex, szLingpai);
end

function exchange_lingpai_qingju(nCount)
	exchange_lingpai_compose(nCount, "Thanh C�u L�nh");
end

function exchange_lingpai_yunlu(nCount)
	exchange_lingpai_compose(nCount, "V�n L�c L�nh");
end

function exchange_lingpai_canglang(nCount)
	exchange_lingpai_compose(nCount, "Th��ng Lang L�nh");
end

function exchange_lingpai_xuanyuan(nCount)
	exchange_lingpai_compose(nCount, "Huy�n Vi�n L�nh");
end

function exchange_lingpai_zimang(nCount)
	exchange_lingpai_compose(nCount, "T� M�ng L�nh");
end

function exchange_lingpai_wujin(nCount)
	exchange_lingpai_compose(nCount, "Kim � L�nh");
end

function exchange_lingpai_baihu(nCount)
	exchange_lingpai_compose(nCount, "B�ch H� L�nh");
end

function exchange_Dopho_Tumang_Thuonggioi(nCount)
	exchange_lingpai_compose(nCount, "�� Ph� T� M�ng Th��ng Gi�i Ch�");
end

function exchange_Dopho_Tumang_Hagioi(nCount)
	exchange_lingpai_compose(nCount, "�� Ph� T� M�ng H� Gi�i Ch�");
end

function exchange_Dopho_Tumang_Khigioi(nCount)
	exchange_lingpai_compose(nCount, "�� Ph� T� M�ng Kh� Gi�i");
end

function exchange_lingpai_confirm_dlg(nItemIndex, szLingpai)
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	local tbSay = {};
	tbSay[1] = format("<dec><npc>X�c nh�n mu�n d�ng h�n th�ch c� ch�a <color=red>%d<color> tinh l�c ��i th�nh <color=red>%s<color>?", nJinglianshiCount, szLingpai);
	if (nJinglianshiCount > tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		tbSay[1] = format("%s<enter><color=red>H�n th�ch c� s� l��ng tinh l�c v��t qu� s� l��ng �� ��i <color=yellow>%s<color>, s� c�n thi�t l�<color=green>%d<color>, s� l��ng th�a s� tr� l�i, ��i hi�p c� mu�n ��i kh�ng?<color>", tbSay[1], szLingpai, tbExchangeLingPai[szLingpai].nRequireJingLianShi);
	end
	tinsert(tbSay, format("X�c nh�n/#exchange_lingpai_confirm(%d, '%s')",nItemIndex,szLingpai));
	
	tinsert(tbSay, "�� ta suy ngh� k� l�i xem/OnExit");
	CreateTaskSay(tbSay);
end

function exchange_lingpai_confirm(nItemIndex, szLingpai)
	if (IsMyItem(nItemIndex) ~= 1) then
		return 
	end
	if (PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1) then
			return 0;
	end
	
	local nBind = GetItemBindState(nItemIndex);
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	--20110419: modified by DinhHQ
	--Fix bug using 1 Soul Stone to buy 2 Lingpai
	if (nJinglianshiCount < tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		Talk(1, "", format("Xin h�y b� h�n th�ch c� ch�a �t nh�t <color=green>%d<color> tinh l�c.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t%s",format("��i %s",szLingpai),GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),format("D�ng h�n th�ch (%d) ��i th�nh %s",nJinglianshiCount,szLingpai)))
	
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		return
	end
	
	if (nJinglianshiCount > tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		tbAwardTemplet:GiveAwardByList({szName="H�n Th�ch", tbProp={6,1,2356,1,0,0}, tbParam={nJinglianshiCount-tbExchangeLingPai[szLingpai].nRequireJingLianShi,0,0,0,0,0}, nBindState=nBind}, format("D�ng h�n th�ch (%d) ��i %s v� tr� l�i h�n th�ch c�  %d tinh l�c",nJinglianshiCount,szLingpai,nJinglianshiCount-tbExchangeLingPai[szLingpai].nRequireJingLianShi));
	end
		
	local tbLinPaiItem = clone(tbExchangeLingPai[szLingpai].tbItem);
	tbLinPaiItem.nBindState = nBind;
	tbAwardTemplet:GiveAwardByList(tbLinPaiItem, format("D�ng h�n th�ch (%d) ��i th�nh %s",nJinglianshiCount,szLingpai));

	local szLog = format("%s\t%d",tbLinPaiItem.szName, tbExchangeLingPai[szLingpai].nRequireJingLianShi)
	
	_WritePlayerLog("Exchange Token", szLog)
end

function OnExit()
end

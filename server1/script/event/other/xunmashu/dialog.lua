Include("\\script\\event\\other\\xunmashu\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\composelistclass.lua")
IL("LEAGUE")
	
local _ComposeMsg = function ()
	local szMsg = "��y l� th�nh ph�m, ch�c c�c h� may m�n."
	Talk(1, "", szMsg)
end

local _MakeItemTable = function (nItemIndex)
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
		elseif tbItem.nQuality == 1 then
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetGlodEqIndex(nItemIndex)
		elseif tbItem.nQuality == 4 then
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetPlatinaEquipIndex(nItemIndex)
		end
	elseif tbItem.nQuality == 2 then -- ��ɫװ��
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	end
	return tbItem
end

local _MatchItem = function (tbSrcItem, tbDecItem)
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

local _CalcItemCountInGiveUI = function (tbItem, nUICount)
	nUICount = nUICount or 24
	local nItemCount = 0
	for i=1, nUICount do
		local nItemIndex = (GetGiveItemUnit(i))
		if nItemIndex and nItemIndex > 0 then
			local tbItem_UI = %_MakeItemTable(nItemIndex)
			if %_MatchItem(tbItem, tbItem_UI) == 1 then
				nItemCount = nItemCount + tbItem_UI.nCount
			end
		end
	end
	return nItemCount
end

local _ConsumeItemInGiveUI = function (tbItem, nConsumeCount, nUICount)
	nUICount = nUICount or 24
	local nLeftCount = nConsumeCount or 1
	local nItemCount = 0
	for i=1, nUICount do
		local nItemIndex = (GetGiveItemUnit(i))
		if nItemIndex and nItemIndex > 0 then
			
			local tbItem_UI = %_MakeItemTable(nItemIndex)
			if %_MatchItem(tbItem, tbItem_UI) == 1 then
				
				if tbItem_UI.nCount <= nLeftCount then
					if RemoveItemByIndex(nItemIndex) == 1 then
						nLeftCount = nLeftCount - tbItem_UI.nCount
					end
				else
					if SetItemStackCount(nItemIndex, tbItem_UI.nCount - nLeftCount) == 1 then
						nLeftCount = 0
					end
				end
				if nLeftCount == 0 then
					return 1
				end
			end
		end
		
	end
	return nil
end


local tbItemInGiveUi = tbBaseClass:new()

function tbItemInGiveUi:_init(tbItem)
	self.szName = tbItem.szName
	self.tbItem = tbItem
	self.nCount = tbItem.nCount
end

function tbItemInGiveUi:pGetCount()
	return %_CalcItemCountInGiveUI(self.tbItem)
end

function tbItemInGiveUi:pConsume(nCount)
	return %_ConsumeItemInGiveUI(self.tbItem, nCount)
end


local tbFormulaList_Box = 
{
	[1] = 
	{
		szComposeTitle =  "��i",
		szFailMsg = "T�i h� ngh� r�ng c�c h� �ang c�n thi�u g� ��?",
		nFreeItemCellLimit = 10,
		tbMaterial = 
		{
			
			{szName="M�t �� th�n b� ", tbProp={6, 1, 196}, nCount = 10},
			{nJxb = 3e4},
		},
		tbProduct = {szName="Ho�ng Kim B�o r��ng", tbProp={6, 1, 1985, 1, 0, 0}, nExpiredTime = tbXunMaShu0903.nItemExpiredTime, CallBack = _ComposeMsg}, 
	},
	[2] = 
	{
		szComposeTitle =  "��i",
		szFailMsg = "T�i h� ngh� r�ng c�c h� �ang c�n thi�u g� ��?",
		nFreeItemCellLimit = 10,
		tbMaterial = 
		{
			
			{szName="M�t �� th�n b� ", tbProp={6, 1, 196}, nCount = 10},
			{szName="Thi�n Tinh Th�ch", tbProp={6, 1, 1988}},
		},
		tbProduct = {szName="B�o r��ng B�ch Kim", tbProp={6, 1, 1986, 1, 0, 0}, nExpiredTime = tbXunMaShu0903.nItemExpiredTime, CallBack = _ComposeMsg}, 
	},

}

local tbFormulaList_Horse =
{
	[1] = 
	{
		szComposeTitle =  "��i",
		szFailMsg = "Lo�i v�t ph�m c�c h� b� v�o kh�ng ��ng ho�c sai s� l��ng.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			
			tbItemInGiveUi:new({szName="Phi V�n", tbProp={0, 10, 8}}),
			tbItemInGiveUi:new({szName="B�c ��u Thu�n M� Thu�t", tbProp={6, 1, 1987}}),
		},
		tbProduct = 
		{
			szName = "Thu�n M�",
			[1] = {szName="Chi�u D� Ng�c S� T� ", tbProp={0, 10, 5, 5, 5, 0}, nRate = 13},
			[2] = {szName="X�ch Th� ", tbProp={0, 10, 5, 2, 5, 0}, nRate = 7},
			[3] = {szName="��ch L� ", tbProp={0, 10, 5, 4, 5, 0}, nRate = 1.97},
			[4] = {szName="� V�n ��p Tuy�t", tbProp={0, 10, 5, 1, 5, 0}, nRate = 4},
			[5] = {szName="Tuy�t �nh", tbProp={0, 10, 5, 3, 5, 0}, nRate = 4},
			[6] = 
			{
				nRate = 20,
				[1] = {szName="B�n Ti�u", tbProp={0, 10, 6, 1, 5, 0}},
				[2] = {
					pFun = function()
						local szMsg = format("Cao th� <color=green>%s<color> �� thu�n h�a ���c ng�a qu�, h�y ch�c m�ng v� chi�m ng��ng!", GetName())
						AddGlobalNews(szMsg)
						
						LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "")
					end
				}
			},
			[7] =
			{
				nRate = 0.03,
				[1] = {szName="Phi�n V� ", tbProp={0, 10, 7, 1, 5, 0}},
				[2] = {
					pFun = function()
						local szMsg = format("Cao th� <color=green>%s<color> �� thu�n h�a ���c ng�a qu�, h�y ch�c m�ng v� chi�m ng��ng!", GetName())
						AddGlobalNews(szMsg)
						
						LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "")
					end
				}
			},
			[8] = {szName="Phi V�n", tbProp={0, 10, 8, 1, 5, 0}, nRate = 50,},
		}, 
	},
} 














function tbXunMaShu0903:DialogMain_Box()
	
	if self:IsActDate() ~= 1 then
		Talk(1, "", "Ho�t ��ng �� k�t th�c.")
		return
	end
	
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg, "C�c h� ch�a �� �i�u ki�n �� tham gia ho�t ��ng n�y")
		return
	end
	
	
	if not self.Compose_Box then
		self.Compose_Box = tbComposeListClass:new("tbXunMaShu0903_ComposeBox", %tbFormulaList_Box)
	end
	local szTitle = "<dec><npc>".." C�c h� mu�n tinh luy�n b�o r��ng n�o?"
	
	
	local tbSay = self.Compose_Box:MakeOptByProductName("T�i h� mu�n tinh luy�n th�nh ")
	tinsert(tbSay, 1, szTitle)
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel")
	CreateTaskSay(tbSay)
end

function tbXunMaShu0903:DialogMain_Horse()
	if self:IsActDate() ~= 1 then
		Talk(1, "", "Ho�t ��ng �� k�t th�c.")
		return
	end
	
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg, "C�c h� ch�a �� �i�u ki�n �� tham gia ho�t ��ng n�y")
		return
	end
	
	self:ExchangeHorse()
	
--	if not self.Compose_Horse then
--		self.Compose_Horse = tbComposeListClass:new("tbXunMaShu0903_ComposeHorse", %tbFormulaList_Horse)
--	end
--	local szTitle = "<dec><npc>".."����ѱ����"
--	
--	
--	local tbSay = self.Compose_Horse:MakeOptByProductName("ѵ��")
--	tinsert(tbSay, 1, szTitle)
--	tinsert(tbSay, "�����Ի�/OnCancel")
--	CreateTaskSay(tbSay)
end




function tbXunMaShu0903__ProcessGiveUI(nCount)
	if nCount ~= 2 then
		return Talk(1, "", "B� v�o s� l��ng kh�ng ��ng")
	end
	
	tbComposeClass:Compose(%tbFormulaList_Horse[1], "tbXunMaShu0903 exchange horse", 1)
	
end



function tbXunMaShu0903:ExchangeHorse()
	
	
	local szTitle = "Thu�n M�"
	local szMaterial = "1 Phi V�n v� 1 B�c ��u Thu�n M� Thu�t"
	GiveItemUI(szTitle, szMaterial, "tbXunMaShu0903__ProcessGiveUI", "OnCancel")
end



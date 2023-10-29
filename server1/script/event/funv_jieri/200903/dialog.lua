Include("\\script\\event\\funv_jieri\\200903\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\compose_jinnang.lua")

local tbScoreClass = tbBaseClass:new()

function tbScoreClass:_init(nCount)
	self.nCount = nCount
	self.szName = "�i�m t�ch l�y"
	
end

function tbScoreClass:pGetCount()
	
	return tbFunv0903.tbTask:GetScore()
end


function tbScoreClass:pConsume(nCount)
	if self:pGetCount() < nCount then
		return 0
	else
		tbFunv0903.tbTask:AddScore(-nCount)
		return 1
	end
end

local _ReceiveNpcGife = function (nPoint, szLogTitle)
	
	if nPoint <= 0 then
		Talk(1, "", "��i hi�p b� v�o v�t ph�m kh�ng ��i ���c �i�m t�ch l�y")
		return
	end
	tbFunv0903.tbTask:AddScore(nPoint)
	local szMsg = format("Thu ���c %d �i�m t�ch l�y", nPoint)
	Msg2Player(szMsg)
	WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t%s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), format("get score %d", nPoint) ))
end

local tbMaterial = 
{
	{szName="Th�i Son", tbProp={6, 1, 1960}, nScore = 8},
	{szName="K�p T�c", tbProp={6, 1, 1961}, nScore = 1},
	{szName="G��ng", tbProp={6, 1, 1962}, nScore = 4},
	{szName="L��c", tbProp={6, 1, 1963}, nScore = 2},
}


local tbScoreShop = 
{
	[1] = 
	{
		szComposeTitle =  "��i",
		szFailMsg = "��i hi�p v�n ch�a �� �i�m t�ch l�y ho�c ng�n l��ng �� ��i v�t ph�m n�y.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="D�y chuy�n", tbProp={6, 1, 1964, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
	[2] = 
	{
		szComposeTitle =  "��i",
		szFailMsg = "��i hi�p v�n ch�a �� �i�m t�ch l�y ho�c ng�n l��ng �� ��i v�t ph�m n�y.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="Th� Tr�c", tbProp={6, 1, 1965, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
	[3] = 
	{
		szComposeTitle =  "��i",
		szFailMsg = "��i hi�p v�n ch�a �� �i�m t�ch l�y ho�c ng�n l��ng �� ��i v�t ph�m n�y.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="Hoa tai ", tbProp={6, 1, 1966, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
	[4] = 
	{
		szComposeTitle =  "��i",
		szFailMsg = "��i hi�p v�n ch�a �� �i�m t�ch l�y ho�c ng�n l��ng �� ��i v�t ph�m n�y.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(10),
			{nJxb = 2e4}
		},
		tbProduct = {szName="Nh�n", tbProp={6, 1, 1967, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime},
	},
	[5] = 
	{
		szComposeTitle =  "��i",
		szFailMsg = "��i hi�p v�n ch�a �� �i�m t�ch l�y ho�c ng�n l��ng �� ��i v�t ph�m n�y.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(35),
			{nJxb = 6e4}
		},
		tbProduct = {szName="Kh�n Qu�ng C�", tbProp={6, 1, 1968, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime},
	},
	[6] = 
	{
		szComposeTitle =  "��i",
		szFailMsg = "��i hi�p v�n ch�a �� �i�m t�ch l�y ho�c ng�n l��ng �� ��i v�t ph�m n�y.",
		nFreeItemCellLimit = 0,
		tbMaterial = 
		{
			tbScoreClass:new(35),
			{nJxb = 6e4}
		},
		tbProduct = {szName="N��c Hoa", tbProp={6, 1, 1969, 1, 0, 0}, nExpiredTime = tbFunv0903.nItemExpiredTime}, 
	},
}



function tbFunv0903:DialogMain(nItemIndex, szDescLink)
	
	if self:IsActDate() ~= 1 then
		Talk(1, "", "Ho�t ��ng �� k�t th�c.")
		return
	end
	
	
	
	local nItemIndex  = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = 
	{
		"<dec>"..szDescLink.."Ho�t ��ng ch�o m�ng ng�y Qu�c T� Ph� N� 8 th�ng 3 n�m nay di�n ra trong kho�ng th�i gian t� 06-03-2009 ��n 24:00 ng�y 15-03-2009. Ng��i c�n ta gi�p vi�c g�?",
		format("Ta ��n nh�n c�m nang s� ki�n/#%s:GetJinnang(%d, [[%s]])", self.szClassName, nItemIndex, szDescLink),
		
		format("T�i h� �� t�ch l�y ���c bao nhi�u �i�m r�i?/#%s:CheckMyScore()", self.szClassName),
		format("T�i h� c�n ��i m�t v�i th�/#%s:BuyItemByScore(%d, [[%s]])", self.szClassName, nItemIndex, szDescLink),
		"K�t th�c ��i tho�i/OnCancel"
	}
	if nItemIndex == nil or nItemIndex == -1 then
		tinsert(tbSay, 3, format("T�i h� mu�n ��i c�c nguy�n li�u th�nh [�i�m T�ch l�y]/#%s:GiveNpcGift(%d)", self.szClassName, nItemIndex))
	end
	
	CreateTaskSay(tbSay)
end

function tbFunv0903:GetJinnang()
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ng��i ch�a �� �i�u ki�n �� nh�n v�t ph�m n�y")
		return
	end
	
	if self.tbTask:GetIsGetJinNang() ~= 0 then
		Say("L� Thu Th�y: Ng��i �� nh�n v�t ph�m n�y r�i m�?",1, "Th�t ng�i qu�! T�i h� qu�n m�t./OnCancel")
		return 
	end
	local tbItem = {szName="C�m nang s� ki�n", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.nComposeEndDate, tbParam = {self.nComposeEndDate, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by Funv0903")
	self.tbTask:SetIsGetJinNang(1)
end

function tbFunv0903:CheckMyScore()
	local nScore = self.tbTask:GetScore()
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ng��i ch�a �� �i�u ki�n �� t�ch l�y �i�m")
	else
		Talk(1, "", format("�i�m t�ch l�y c�a ��i hi�p: %d", nScore))	
	end
	
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
	
	local nItemCount = 0
	for i=1, nUICount do
		local nItemIndex = (GetGiveItemUnit(i))
		local tbItem_UI = %_MakeItemTable(nItemIndex)
		if %_MatchItem(tbItem, tbItem_UI) == 1 then
			nItemCount = nItemCount + tbItem_UI.nCount
		end
	end
	return nItemCount
end

local _ConsumeItemInGiveUI = function (tbItem, nConsumeCount, nUICount)
	local nLeftCount = nConsumeCount or 1
	local nItemCount = 0
	for i=1, nUICount do
		local nItemIndex = (GetGiveItemUnit(i))
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
	return nil
end



function tbFunv0903__ProcessGiveUI(nUICount)
	
	local self = tbFunv0903
	local tbMaterial = %tbMaterial
	local nScore = 0
	local szLogTitle = "give npc gift"
	local tbCount = {}
	
	
	
	for i=1, getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local nItemCount = %_CalcItemCountInGiveUI(tbItem, nUICount)
		
		
		
		if nItemCount > 0 and %_ConsumeItemInGiveUI(tbItem, nItemCount, nUICount) == 1 then
			
			nScore = nScore + tbItem.nScore * nItemCount
			local szItemName = nItemCount.." "..tbItem.szName
			WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t consume %s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), szItemName))
		end

	end
	%_ReceiveNpcGife(nScore, szLogTitle)
end

function tbFunv0903:GiveNpcGift(nItemIndex)
	
	if self:IsActDate() ~= 1 then
		Talk(1, "", "Ho�t ��ng �� k�t th�c.")
		return
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg)
		return
	end
	
	local szTitle = "��i �i�m t�ch l�y"
	local szMaterial = "H�y b� nguy�n li�u v�o � b�n d��i"
	
	nItemIndex = nItemIndex or -1
	if tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return
		end
	end
	if tbItemJingnianshijian then
		 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
	end
	
	GiveItemUI(szTitle, szMaterial, "tbFunv0903__ProcessGiveUI", "OnCancel")
	
	
end



function tbFunv0903:BuyItemByScore(nItemIndex, szDescLink)
	if self:IsActDate() ~= 1 then
		Talk(1, "", "Ho�t ��ng �� k�t th�c.")
		return
	end
	
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg)
		return
	end
	
	
	if not self.tbScoreShop then
		self.tbScoreShop = tbComposeListForJinNang:new("tbFunv0903_Shop", %tbScoreShop)
	end
	local szTitle = "Ta �ang c� r�t nhi�u v�t ph�m m� c�c ch� em ph� n� th��ng hay s� d�ng. Ng��i mu�n ch�n v�t ph�m n�o?"
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = self.tbScoreShop:MakeOptByProductName("T�i h� mu�n ��i", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel")
	CreateTaskSay(tbSay)
end


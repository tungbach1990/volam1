Include("\\script\\event\\guoqing_jieri\\200908\\head.lua")
Include("\\script\\lib\\compose_jinnang.lua")

local tbCrystal = tbBaseClass:new()

tbCrystal.szName = "Th�y Tinh"
function tbCrystal:_init(nCount)
	
	self.nCount = nCount
end
function tbCrystal:pGetCount()
	return CalcEquiproomItemCount(4, 239, 1, -1) + CalcEquiproomItemCount(4, 240, 1, -1) + CalcEquiproomItemCount(4, 238, 1, -1)
end
function tbCrystal:pConsume(nConsumeCount)
	for i=1, nConsumeCount do
		if ConsumeEquiproomItem(1, 4, 238, 1, -1) == -1 then
			if ConsumeEquiproomItem(1, 4, 239, 1, -1) == -1 then
				if ConsumeEquiproomItem(1, 4, 240, 1, -1) == -1 then
					return
				end
			end
		end
	end
	return 1
end

tbGuoqing0908.tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="Chi�c m� tai b�o", tbProp={6, 1, 2097}, nCount = 5},
			{szName="Huy�n tinh kho�ng th�ch (c�p 2)", tbProp={6, 1, 147, 2}},
			{nJxb = 6e4},
		},
		tbProduct = {szName="Chi�c m� h�a b�nh", tbProp={6, 1, 2098, 1, 0, 0}, nExpiredTime = 20090914}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="Chi�c m� h�a b�nh", tbProp={6, 1, 2098}},
			tbCrystal:new(1),
		},
		tbProduct = 
		{
			szName = "Chi�c m� t� do", 
			[1] = {szName="Chi�c m� t� do", tbProp={6, 1, 2099, 1, 0, 0}, nExpiredTime = 20090914, nRate = 95},
			[2] = {szName="Chi�c m� h�nh ph�c", tbProp={6, 1, 2100, 1, 0, 0}, nExpiredTime = 20090914, nRate = 5},
		}
		
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="Chi�c m� h�a b�nh", tbProp={6, 1, 2098}},
			tbCrystal:new(2),
		},
		tbProduct = {szName="Chi�c m� h�nh ph�c", tbProp={6, 1, 2100, 1, 0, 0}, nExpiredTime = 20090914},

		
	},
}

tbGuoqing0908.ComposeList = tbComposeListForJinNang:new("tbGuoqing0908_compose", tbGuoqing0908.tbFormulaList)

function tbGuoqing0908:ComposeDailogMain(nItemIndex, szDescLink)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > self.nComposeEndDate then
		return Talk(1, "" ,"Ho�t ��ng �� k�t th�c.")
	end
	
		
	local szTitle = "C�c h� mu�n ch�n ph��ng th�c n�o?"
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = self.ComposeList:MakeOptBytbMaterialList("", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel")
	CreateTaskSay(tbSay)	
end

function tbGuoqing0908:GetJinnang()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > self.nEndDate then
		return Talk(1, "" ,"Ho�t ��ng �� k�t th�c.")
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ng��i ch�a �� �i�u ki�n �� nh�n v�t ph�m n�y")
		return
	end
	
	if self.tbTask:GetJinNangState() == 1 then
		Say("L� Quan"..":".."Ta nh� kh�ng nh�m th� ng��i �� nh�n r�i?",1, "Th�t ng�i qu�! T�i h� qu�n m�t./OnCancel")
		return 
	end
	local tbItem = {szName="C�m nang s� ki�n", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.nComposeEndDate, tbParam = {self.nComposeEndDate, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by guoqin0908")
	self.tbTask:SetJinNangState(1)
end
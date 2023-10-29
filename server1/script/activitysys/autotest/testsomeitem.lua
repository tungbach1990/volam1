Include("\\script\\lib\\unittest.lua")






tbItemList = 
{
	["M�c Ch� B�o H�p"] = {tbProp={6,1,2318,1,0,0},},
	["��ng Ch� B�o H�p"] = {tbProp={6,1,2319,1,0,0},},
	["Ng�n Ch� B�o H�p"] = {tbProp={6,1,2320,1,0,0},},
	["Ho�ng Kim B�o r��ng"] = {tbProp={6,1,2321,1,0,0},},
	["B�o r��ng B�ch Kim"] = {tbProp={6,1,2322,1,0,0},},
	["B�o r��ng th�n b� c�a D� T�u"] = {tbProp={6,1,2374,1,0,0},},
	["C�ng Th�nh Chi�n L� Bao"] = {tbProp={6,1,2377,1,0,0},},
	["Ch� T�n B� B�o"] = {tbProp={6,1,2375,1,0,0},},
	["T�i B�o Th�y T�c"] = {tbProp={6,1,2376,1,0,0},},
	["Phong H�a C�m Nang"] = {tbProp={6,1,2373,1,0,0},},
	
}

tbRequireList = 
{
	["M�c Ch� B�o H�p"] = {nMinCell = 1, },
	["��ng Ch� B�o H�p"] = {nMinCell = 1, },
	["Ng�n Ch� B�o H�p"] = {nMinCell = 1, },
	["Ho�ng Kim B�o r��ng"] = {nMinCell = 1, },
	["B�o r��ng B�ch Kim"] = {nMinCell = 1, },
	["B�o r��ng th�n b� c�a D� T�u"] = 
	{
		nMinCell = 1, 
		tbItem = {tbProp={6,1,2348,1,-1,0}, nCount = 6},
	},
	["C�ng Th�nh Chi�n L� Bao"] = {nMinCell = 1, },
	["Ch� T�n B� B�o"] = 
	{
		nMinCell = 1, 
		tbItem = {tbProp={6,1,2348,1,-1,0}, nCount = 12},
	},
	["T�i B�o Th�y T�c"] = {nMinCell = 1},
	["Phong H�a C�m Nang"] = {nMinCell = 1,},

	
}

local tbTestAward = {}

function tbTestAward:GiveAwardByList(tbItem, szLogTitle, nAwardCount)
	self.tbItem = tbItem
	self.szLogTitle = szLogTitle
	self.nAwardCount = nAwardCount
	
	
end


suite = TestSuite:new("��o c� h� th�ng ho�t ��ng t� ��ng test")



ItemCase = {}

function ItemCase:new(szName)
	local tb = TestCase:new("S� d�ng "..szName, self)
	tb.szName = szName
	tb.szExePath = "\\script\\item\\activityitem.lua"
	tb.tbRequire = tbRequireList[szName]
	
	
	return tb
end


function ItemCase:setUp()
	ThrowAllItem()

	if not self.tbAwardClass then
		self.tbAwardClass = DynamicExecute(self.szExePath, "getglobal", "tbAwardTemplet")	
	end
	
	
	DynamicExecute(self.szExePath, "setglobal", "tbAwardTemplet", %tbTestAward)
	
	
	local tbItem = tbItemList[self.szName]
	local tbItemProp = tbItem.tbProp
	local nItemIndex = AddItemNoStack(unpack(tbItemProp))
	self.nItemIndex = nItemIndex
	
	
	if self.tbRequire.tbItem then
		DynamicExecuteByPlayer(PlayerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", self.tbRequire.tbItem, "testitem")
	end
end

function ItemCase:tearDown()
	
	DynamicExecute(self.szExePath, "setglobal", "tbAwardTemplet", self.tbAwardClass)
	
	
	
	RemoveItemByIndex(self.nItemIndex)
	
	if self.tbRequire.tbItem then
		local tbProp = self.tbRequire.tbItem.tbProp
		local nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
		ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3],tbProp[4])
		
		
	end
	
end


--�����ռ䲻�㲻��ʹ�õ���
function ItemCase:test_Use2_1()
	local tbItem = {}
	
	for nCell=0, 1 do
		for i=1, CalcFreeItemCellCount() + nCell - self.tbRequire.nMinCell  do
			local nItemIndex = AddItemNoStack(6,0,1,1,0,0,0)
			tinsert(tbItem, nItemIndex)
		end
		local nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
		
		if nCell == 0 then
			self:assertTrue(nRet ~= 1, "H�nh trang �� � nh�ng kh�ng th� s� d�ng")
		else
			self:assertTrue(nRet == 1, "Ch�a th�m gi�i h�n � tr�ng h�nh trang")
		
			for i=1, getn(tbItem) do
				RemoveItemByIndex(tbItem[i])
			end
		end
	end
end

--û��������߲���ʹ��
function ItemCase:test_Use3()
	local tbRequireItem = self.tbRequire.tbItem
	
	
	if not tbRequireItem then
		return 
	end
	local tbProp = tbRequireItem.tbProp
	ConsumeEquiproomItem(tbRequireItem.nCount - 1, tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	
	local nOldCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	
	
	local nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
	
	self:assertTrue(nRet == 1, "Nguy�n li�u kh�ng �� c�ng c� th� s� d�ng"..nRet)
	local nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	self:assertEquals(nCount, nOldCount, "S� d�ng th�t b�i ho�n kh�u nguy�n li�u")
	
	ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", tbRequireItem, "testitem", 2)	
	
	nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)

	
	self:assertTrue(nRet ~= 1, "Nguy�n li�u �� c�ng kh�ng th� s� d�ng")
	
	nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	self:assertEquals(nCount, tbRequireItem.nCount, "Kh�u tr� nhi�u h�n nguy�n li�u c�n thi�t")	
	
	
end


function ItemCase:test_Use1()
	
	
	
	
	
	DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
	self:assertTrue(%tbTestAward.szLogTitle ~= nil, format("S� d�ng %s nh�n ���c ph�n th��ng, kh�ng c� nh�t k�", GetItemName(self.nItemIndex)))	
	local tbItem = %tbTestAward.tbItem
	local nTotalRate = 0
	self:assertTrue(tbItem ~= nil, format("S� d�ng %s nh�n kh�ng ���c ph�n th��ng", GetItemName(self.nItemIndex)))
	
	if not tbItem then
		return
	end
	
	for i=1, getn(tbItem) do
		nTotalRate = nTotalRate + tbItem[i].nRate	
	end
	self:assertEquals(nTotalRate, 100, format("Ph�n th��ng %s c� x�c su�t kh�ng �� 100%%", GetItemName(self.nItemIndex)) )
end


for key, value in tbItemList do
	suite:add(ItemCase:new(key))
end
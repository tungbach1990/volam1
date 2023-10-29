IncludeLib("ITEM")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\vng_script\\features\\upgrade_equip\\head.lua")

tbVngUpgradeABDQ.AdditiveMaterial =
{
	{szName="Thi�n Tinh Kho�ng", tbProp={6, 1, 30561}, nCount = 1,nSuccessRate = 10, nMaxSuccessRate = 10},	
}

tbVngUpgradeABDQ.tbFormulaList = 
{
	[167] = 
	{
		szName = "[Ho�n M�] An Bang K� Huy�t Th�ch Gi�i Ch�",
		tbNeedMaterial = 
		{
			{szName=" �� ph� Ho�ng Kim - An Bang K� Huy�t Th�ch Gi�i Ch� ",tbProp={0,167},nCount =1, },
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nCount =1,nSuccessRate = 1, nMaxSuccessRate = 70},
		},
		tbSpecialMaterial = {
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},
		},				
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[165] = 
	{				
		szName = "[Ho�n M�] An Bang C�c Hoa Th�ch Ch� Ho�n",
		tbNeedMaterial = 
		{
			{szName=" �� ph� Ho�ng Kim - An Bang C�c Hoa Th�ch Ch� ho�n",tbProp={0,165},},
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},			
		},
		tbSpecialMaterial = {
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},
		},	
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,		
	},
	[164] = 
	{
		szName = "[Ho�n M�] An Bang B�ng Tinh Th�ch H�ng Li�n",
		tbNeedMaterial = 
		{
			{szName=" �� ph� Ho�ng Kim - An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,164},},
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},		
			{szName = "Tr�n H�n Th�ch", tbProp = {6,1,30560}, nCount = 5, },		
		},
		tbSpecialMaterial = {
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},
		},			
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[166] = 
	{
		szName = "[Ho�n M�] An Bang �i�n Ho�ng Th�ch Ng�c B�i",
		tbNeedMaterial = 
		{
			{szName=" �� ph� Ho�ng Kim - An Bang �i�n Ho�ng Th�ch Ng�c B�i",tbProp={0,166},},
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},	
			{szName = "Tr�n H�n Th�ch", tbProp = {6,1,30560}, nCount = 4, },		
		},		
		tbSpecialMaterial = {
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},
		},	
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	--Dinh Quoc
	[160] = 
	{
		szName = "[C�c ph�m] ��nh Qu�c Thanh Sa Ph�t Qu�n",
		tbNeedMaterial = 
		{
			{szName=" �� ph� Ho�ng Kim - ��nh Qu�c � Sa Ph�t Qu�n",tbProp={0,160},},	
			{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
			{szName = "Tr�n H�n Th�ch", tbProp = {6,1,30560}, nCount = 3, },			
		},
		tbSpecialMaterial = {
			{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
		},	
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[159] = 
	{
		szName = "[C�c ph�m] ��nh Qu�c Thanh Sa Tr��ng Sam",
		tbNeedMaterial = 
		{
			{szName=" �� ph� Ho�ng Kim - ��nh Qu�c Thanh Sa Tr��ng Sam",tbProp={0,159},},
			{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},		
			{szName = "Tr�n H�n Th�ch", tbProp = {6,1,30560}, nCount = 1, },		
		},
		tbSpecialMaterial = {
			{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
		},			
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[162] = 
	{
		szName = "[C�c ph�m] ��nh Qu�c T� ��ng H� Uy�n",
		tbNeedMaterial = 
		{
			{szName=" �� ph� Ho�ng Kim - ��nh Qu�c T� ��ng H� uy�n",tbProp={0,162},},			
			{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},		
		},		
		tbSpecialMaterial = {
			{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
		},	
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,		
	},
	[163] = 
	{
		szName = "[C�c ph�m] ��nh Qu�c Ng�n T�m Y�u ��i",
		tbNeedMaterial = 
		{
			{szName=" �� ph� Ho�ng Kim - ��nh Qu�c Ng�n T�m Y�u ��i",tbProp={0,163},},	
			{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},				
		},			
		tbSpecialMaterial = {
			{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
		},	
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[161] = 
	{
		szName = "[C�c ph�m] ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",
		tbNeedMaterial = 
		{
			{szName=" �� ph� Ho�ng Kim - ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",tbProp={0,161},},			
			{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},		
		},				
		tbSpecialMaterial = {
			{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
		},	
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
}

function tbVngUpgradeABDQ:UpgradeEquip()
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nCheck , nGoldIndex, nItemIndex =  self:CheckGoldEqInRoomUI(tbRoomItems)
	if nCheck == 0 then
		return 0
	end
	
	local tbFormula= self.tbFormulaList[nGoldIndex]
	local tbFormulaListCheck = tbFormula.tbNeedMaterial
	if self:CheckMaterial(tbFormulaListCheck,1) ~= 1 then
		return Talk(1,"","Nguy�n li�u ch� t�o kh�ng ��, h�y ki�m tra l�i.")	
	end
	
	--check cho trong hanh trang 
	local nWidth = tbFormula.nWidth
	local nHeight = tbFormula.nHeight 
	if PlayerFunLib:CheckFreeBagCellWH(nWidth,nHeight,1,"default") ~= 1 then
		return
	end
	local nSuccessRate = self:GetComposeRate(tbFormula)
	local szMsg = format("<npc>��t nguy�n li�u v�o nh�n ���c t� l� th�nh c�ng l�:<color=yellow>%d%%<color>, ��i hi�p c� mu�n ti�p t�c ch� t�o kh�ng?", nSuccessRate)
	if nSuccessRate > 100 then
		szMsg = "T� l� th�nh c�ng v��t qu� 100% s� l�ng ph� nguy�n li�u c�a ��i hi�p, ng��i c� mu�n ti�p t�c ch� kh�ng?"
	end	
	local tbOpt = 
	{
		{"��ng � n�ng c�p", self.UpgradeEquip_ProcessBar, {self,nGoldIndex,tbFormula,nSuccessRate}},
		{"�� ta ��t l�i nguy�n li�u", self.UpgradeEquip_UI, {self}},
		{"H�y b� "},
	}
	CreateNewSayEx(szMsg, tbOpt)		
end

local _OnBreak = function()
	Msg2Player("N�ng c�p b� gi�n �o�n, h�y l�m l�i.")
end

--Dong y che tao
local _UpgradeEquipOK = function(nGoldIndex,tbFormula,nSuccessRate)		
	local szKeyLog = tbVngUpgradeABDQ.EVENT_LOG_TITLE
	--tru nguyen lieu truoc, roi moi tinh thanh cong hay that bai =))
	local nCheck1 =tbVngUpgradeABDQ:ConsumeAdditive(tbFormula.tbSpecialMaterial,2, szKeyLog.."- [Tru]: TrangbiHonthach")
	local nCheck2 =tbVngUpgradeABDQ:ConsumeMaterial(tbFormula.tbNeedMaterial, 1, szKeyLog.."- [Tru]: NguyenlieuChetao") 
	local nCheck3 =tbVngUpgradeABDQ:ConsumeAdditive(tbVngUpgradeABDQ.AdditiveMaterial,1, szKeyLog.."- [Tru]: ThienTinhKhoang")		
	if nCheck1 ~= 1 or nCheck2 ~= 1 or nCheck3 ~= 1 then
		tbLog:PlayerActionLog(szKeyLog, format("C� g� �� kh�ng �n, nghi v�n cheat - State: nCheck1=%d, nCheck2= %d, nCheck3 =%d",nCheck1,nCheck2,nCheck3))
		return 
	end	
	if random(1, 100) > nSuccessRate then
		Msg2Player(format("<color=yellow>�i th�n linh �i!!! th�t b�i r�i sao...<color>"))
		Talk(1,"",format("<color=yellow>�i th�n linh �i!!! th�t b�i r�i sao...<color>\n<color=red>Th�t kh�ng th� tin n�i!<color>"))		
		return
	end	
	tbAwardTemplet:Give(tbVngUpgradeABDQ.tbEquip_Upgrade[nGoldIndex], 1, {szKeyLog.."- [CheTao]: ThanhCong"})	
end

function tbVngUpgradeABDQ:UpgradeEquip_ProcessBar(nGoldIndex,tbFormula,nSuccessRate)
	tbProgressBar:OpenByConfig(18, %_UpgradeEquipOK, {nGoldIndex,tbFormula,nSuccessRate}, %_OnBreak)
end

function tbVngUpgradeABDQ:CheckGoldEqInRoomUI(tbRoomItems)
	local nCountGoldEq = 0
	local nItemIndex = 0
	local nGoldIndex = 0 
	for i=1, getn(tbRoomItems) do
		if GetGlodEqIndex(tbRoomItems[i]) > 0 then
			nCountGoldEq = nCountGoldEq + 1
			nItemIndex = tbRoomItems[i] 
			nGoldIndex = GetGlodEqIndex(tbRoomItems[i] )
		end
	end
	if nCountGoldEq > 1 then
		Talk(1,"","Ch� ���c ��t m�t trang b� c�n n�ng c�p")	
		return 0
	end
	if not self.tbFormulaList[nGoldIndex] or nGoldIndex == 0 then
		Talk(1,"","Trang b� n�y kh�ng th� n�ng c�p.")	
		return 0
	end
	if self:CheckAll_DK_ReleaseEquip(nItemIndex) ~= 1 then
		return 0
	end	
	return nCountGoldEq, nGoldIndex, nItemIndex
end

function tbVngUpgradeABDQ:CheckMaterial(tbMaterial,nComposeCount)
	local i
	local flag = 1
	local tbCount  = {}
	local tbMaxSetCount = {}
	nComposeCount = nComposeCount or 1
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.tbProp then
			tbItem.nCount = tbItem.nCount or 1
			local nItemNeedCount = tbItem.nCount * nComposeCount
			if nItemNeedCount > 0 then
				local tbProp = tbItem.tbProp
				tbProp[4] = tbProp[4] or -1		
				local nCurCount = self:CalcItemCount(tbRoomItems, tbItem)
				tbCount[i] = nCurCount
				--print("CheckMaterial - nCurCount"..nCurCount)
				tbMaxSetCount[i] = floor(nCurCount / nItemNeedCount)
				--print("CheckMaterial - tbMaxSetCount[i]"..tbMaxSetCount[i])
				if nCurCount < nItemNeedCount then
					flag =  0					
				end	
			end		
		end
	end	
	return flag, tbCount, tbMaxSetCount
end

function tbVngUpgradeABDQ:GetComposeRate(tbFormula)
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nRate = self:CalcRate(self.AdditiveMaterial ,tbRoomItems)
	local tbSpecialMaterial = tbFormula.tbSpecialMaterial
	nRate = nRate + self:CalcRate(tbSpecialMaterial ,tbRoomItems)
	return nRate
end

function tbVngUpgradeABDQ:CalcRate(tbAdditive, tbRoomItems)		
	local nSuccessRate = 0
	for i=1, getn(tbAdditive) do
		local nCount = self:CalcItemCount(tbRoomItems, tbAdditive[i])	
		if tbAdditive[i].nSuccessRate then
			local nSR = nCount * tbAdditive[i].nSuccessRate
			if nSR > tbAdditive[i].nMaxSuccessRate then
				nSR = tbAdditive[i].nMaxSuccessRate
			end
			nSuccessRate = nSuccessRate + nSR			
		end				
	end
	return nSuccessRate
end
-- nType = 1 tr� nguy�n li�u/Thien tinh khoang; 2: tr� H�n th�ch
function tbVngUpgradeABDQ:ConsumeAdditive(tbAdditive, nType, szLogTitle)
	local nFlag = 1
	for i=1,getn(tbAdditive) do
		local tbItem = tbAdditive[i]
		local tbRoomItems =  self:GetRoomItems(self.nRoomType)	
		local nCount = self:CalcItemCount(tbRoomItems, tbItem)
		local nMaxCount = floor(tbItem.nMaxSuccessRate / tbItem.nSuccessRate)
		if nCount > nMaxCount then
			nCount = nMaxCount
		end
		if nType == 2 and nCount > 0 then
			--tru di 1 hon thach vi da tru o trong tbmaterial roi
			nCount = nCount -1			
		end
		if nCount > 0 then
			self:ConsumeItem(tbRoomItems, nCount, tbItem)
		elseif nType ~= 1 then
			nFlag = 0
		end		
		self:ConsumeLog(nCount.." "..tbItem.szName, szLogTitle)
	end
	return nFlag
end
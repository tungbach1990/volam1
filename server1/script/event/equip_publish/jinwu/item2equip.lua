Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\jinwu\\equiptable.lua")
tbItem2Jinwu = tbActivityCompose:new()

function tbItem2Jinwu:GetSuccessRate()
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	
	-- ��ȡ�ɹ���
	local nSuccessRate = 0	
	for k, v in tbAdditive do
		local nCount = self:CalcItemCount(tbRoomItems, v)	
		local nSR = nCount * v.nSuccessRate
		if nSR > v.nMaxSuccessRate then
			nSR = v.nMaxSuccessRate
		end
		nSuccessRate = nSuccessRate + nSR;				
	end
	return nSuccessRate
end

function tbItem2Jinwu:Compose(nComposeCount, nProductId)
	
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local tbAdditive = self.tbFormula.tbAdditive
	if not tbProduct then
		return 
	end
		
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	-- ��鱳���ռ�
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	-- ����ɹ���
	local nSuccessRate = self:GetSuccessRate()	
	
	-- �������Ƿ����
	local tbMaterialEx = {{szName = tbAdditive[1].szName, tbProp = tbAdditive[1].tbProp, nCount = 1},}
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 or 
			self:CheckMaterial(tbMaterialEx, nComposeCount) ~= 1	then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
		return 0;
	end	
	
	--thay T� M�ng Th�ch = trang b� T� M�ng
	local nMatId = tbProduct.tbProp[2] - 230
	local strZimangName = %tbZimang_Name[nMatId]
	if not strZimangName then
		return 0
	end
	local tbVnMaterial = {{szName = strZimangName, tbProp={0, nMatId}, nCount = 1},}
	
	if self:CheckMaterial(tbVnMaterial, nComposeCount) ~=1 then
		local szMsg = format("<color=red>Ch� t�o <color=yellow>%s<color=red> c�n c� <color=yellow>%s<color=red> �� l�m nguy�n li�u!<color>", tbProduct.szName, strZimangName)
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- ��Ϻϳɱ������ĵ���Ʒ
	local tbBMaterial = self.tbFormula.tbBMaterial
	local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  ÿ�ζ����»�ȡ���Է�ֹ�б仯
	local nMapCount = 0;
	tbMaterialEx = {}
	for i = 1, getn(tbAdditive) do
		local nn = self:CalcItemCount(tbRoomItems, tbAdditive[i])
		if nn * tbAdditive[i].nSuccessRate > tbAdditive[i].nMaxSuccessRate then
			nn = tbAdditive[i].nMaxSuccessRate / tbAdditive[i].nSuccessRate
		end 
		if i == 1 then
			nMapCount = nn
			if nn == 0 then
				local szMsg = self.tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
				Talk(1, "", szMsg)
				return 0;			
			end
			nn = floor((nn+1)/2)
			nMapCount = nMapCount - nn 
		end
		
		if nn > 0 then
			local tbM = {szName = tbAdditive[i].szName, tbProp = tbAdditive[i].tbProp, nCount = nn}
			tinsert(tbMaterialEx, tbM)	
		end		
	end	
	
	-- �۳��ϳɱ������ĵ���Ʒ
	if self:ConsumeMaterial(tbBMaterial, nComposeCount, self.szLogTitle) ~= 1 or 
			self:ConsumeMaterial(tbMaterialEx, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end	
	
		-- �۳��ϳɳɹ���۳�����Ʒ
	local tbMEx = self.tbFormula.tbAdditiveEx
	if tbMEx[1] then 
		tbMEx[1].nCount = nMapCount
	end
	
	self:ConsumeMaterial(tbMEx, nComposeCount, self.szLogTitle)

	if random(1, 100) > nSuccessRate then
		Msg2Player("Th�t ��ng ti�c ch� t�o �� th�t b�i")
		%tbVngTransLog:Write("201110_CheTaoKimO/", 15, "CheTaoKimO", "N/A", 0)
		return 0
	end

	if self:ConsumeMaterial(tbVnMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end

	if type(tbProduct) == "table" then
	--	tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		local tbTranslog = {strFolder = "201110_CheTaoKimO/", nPromID = 15, nResult = 1}
		tbAwardTemplet:Give(tbProduct, 1, {self.szLogTitle, "CheTaoKimO", tbTranslog})
	--	AddStatData("zimang_jx1hechengzongshu", 1)	--��������һ��
	end

	return 1;
end

function tbItem2Jinwu:GiveUIOk(nComposeCount, nProductId, nCount)
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbAdditive = self.tbFormula.tbAdditive
	
	--thay T� M�ng Th�ch = trang b� T� M�ng
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local nMatId = tbProduct.tbProp[2] - 230	
	local strZimangName = %tbZimang_Name[nMatId]
	if not strZimangName then
		return 0
	end
	local tbVnMaterial = {{tbProp={0, nMatId}, nCount = 1},}
	
	if self:CheckMaterial(tbVnMaterial, nComposeCount) ~=1 then
		local szMsg = format("<color=red>Ch� t�o <color=yellow>%s<color=red> c�n c� <color=yellow>%s<color=red> �� l�m nguy�n li�u!<color>", tbProduct.szName, strZimangName)
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- �������Ƿ����
	local tbMaterialEx = {{szName = tbAdditive[1].szName, tbProp = tbAdditive[1].tbProp, nCount = 1},}
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 or 
			self:CheckMaterial(tbMaterialEx, nComposeCount) ~= 1	then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
		return 0;
	end	
	
	local nSuccessRate = self:GetSuccessRate()
	local msg = "H�p th�nh trang b� Kim � c�n ph�i c� 1 Kim � Kim B�i, 5 vi�n Thanh C�u Th�ch, 4 vi�n V�n L�c Th�ch, 3 vi�n Th��ng Lang Th�ch, 2 vi�n Huy�n Vi�n Th�ch, 1 Kim � L�nh v� 1 trang b� T� M�ng t��ng �ng v�i m�n ph�i v� h� t�n c�ng ch� ��o c�a trang b� ch� t�o, y�u c�u �t nh�t c�n ph�i c� 1 Kim � �� Ph� t��ng �ng, 5000 v�n ng�n l��ng, v� nguy�n li�u l�m t�ng th�m t� l� th�nh c�ng n�u c�n."
	local szMsg = format("%s, c�n c� theo nguy�n li�u m� ng��i b� v�o th� nh�n ���c t� l� th�nh c�ng l� %d%%, ng��i c� mu�n ti�p t�c ch� t�o kh�ng?", msg, nSuccessRate)
	local tbOpt = 
	{
		{"Ti�p t�c ch� t�o", self.Compose, {self, nComposeCount, nProductId}},
		{"��t v�o l�n n�a", self.ComposeGiveUI, {self, nComposeCount, nProductId}},
		{"H�y b� "},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2Jinwu:ComposeGiveUI(nComposeCount, nProductId)
	local tbMaterial = self.tbFormula.tbMaterial
	local tbProduct = self.tbFormula.tbProduct 
	
	local szTitle = self.tbFormula.szComposeTitle or format("��i %s", tbProduct.szName)
	local szContent = self:GetMaterialList(tbMaterial)
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self, nComposeCount, nProductId}}, nil, self.bAccessBindItem)
end

function tbItem2Jinwu:SelectEquip(nId, nCount)
	
	local tbProduct = self.tbFormula.tbProduct
	local msg = "H�p th�nh trang b� Kim � c�n ph�i c� 1 Kim � Kim B�i, 5 vi�n Thanh C�u Th�ch, 4 vi�n V�n L�c Th�ch, 3 vi�n Th��ng Lang Th�ch, 2 vi�n Huy�n Vi�n Th�ch, 1 Kim � L�nh, v� 1 trang b� T� M�ng t��ng �ng v�i m�n ph�i v� h� t�n c�ng ch� ��o c�a trang b� ch� t�o, y�u c�u �t nh�t c�n ph�i c� 1 Kim � �� Ph� t��ng �ng, 5000 v�n ng�n l��ng, v� nguy�n li�u l�m t�ng th�m t� l� th�nh c�ng n�u c�n."
	local szMsg = format("%s,l�a ch�n m�t %s", msg, tbProduct.szName)
	local nProductCount = getn(tbProduct)
	local nEndId = nCount + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {%tbRepresentName[i], self.ComposeGiveUI, {self, 1, i}})
	end
	if nId >= nCount + 1  then
		tinsert(tbOpt, {"Trang tr��c", self.SelectEquip, {self, nId-nCount, nCount}})
	end
	if nEndId < nProductCount then
		tinsert(tbOpt, {"Trang k� ", self.SelectEquip, {self, nId+nCount, nCount}})
	end
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end


tbCommonMaterial = 
{
	{szName="Kim � Kim B�i", tbProp={6, 1, 3001}, nCount = 1},
	{szName="Thanh C�u Th�ch", tbProp={6, 1, 2710}, nCount = 5},
	{szName="V�n L�c Th�ch", tbProp={6, 1, 2711}, nCount = 4},
	{szName="Th��ng Lang Th�ch", tbProp={6, 1, 2712}, nCount = 3},
	{szName="Huy�n Vi�n Th�ch", tbProp={6, 1, 2713}, nCount = 2},
	--{szName="T� M�ng Th�ch", tbProp={6, 1, 3000}, nCount = 1},
	{szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},	
	{szName=" l��ng", nJxb=1, nCount = 50000000},	
}

tbBaseMaterial = 
{
	{szName="Kim � Kim B�i", tbProp={6, 1, 3001}, nCount = 1},
	{szName="Thanh C�u Th�ch", tbProp={6, 1, 2710}, nCount = 5},
	{szName="V�n L�c Th�ch", tbProp={6, 1, 2711}, nCount = 4},
	{szName="Th��ng Lang Th�ch", tbProp={6, 1, 2712}, nCount = 3},
	{szName="Huy�n Vi�n Th�ch", tbProp={6, 1, 2713}, nCount = 2},
	--{szName="T� M�ng Th�ch", tbProp={6, 1, 3000}, nCount = 1},
	{szName=" l��ng", nJxb=1, nCount = 50000000},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "Kim � H�ng Li�n",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�� Ph� Kim � H�ng Li�n", tbProp = {6,1,2987}, nSuccessRate = 10, nMaxSuccessRate = 80},
					{szName = "Kim Hoa Chi B�o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th�y Chi B�o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V�n Chi B�o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
			},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�� Ph� Kim � H�ng Li�n", tbProp = {6,1,2987}, nCount = 1},
				  {szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{				
		szName = "Kim � Kh�i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�� Ph� Kim � Kh�i", tbProp = {6,1,2982}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B�o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th�y Chi B�o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V�n Chi B�o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�� Ph� Kim � Kh�i", tbProp = {6,1,2982}, nCount = 1},
				  {szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,		
	},
	[3] = 
	{
		szName = "Kim � Th��ng Gi�i Ch�",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�� Ph� Kim � Th��ng Gi�i", tbProp = {6,1,2989}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B�o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th�y Chi B�o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V�n Chi B�o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�� Ph� Kim � Th��ng Gi�i", tbProp = {6,1,2989}, nCount = 1},
				  {szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "Kim � H� Uy�n",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�� Ph� Kim � H� Uy�n", tbProp = {6,1,2986}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B�o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th�y Chi B�o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V�n Chi B�o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�� Ph� Kim � H� Uy�n", tbProp = {6,1,2986}, nCount = 1},
				  {szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "Kim � Y�u ��i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�� Ph� Kim � Y�u ��i", tbProp = {6,1,2985}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B�o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th�y Chi B�o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V�n Chi B�o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�� Ph� Kim � Y�u ��i", tbProp = {6,1,2985}, nCount = 1},
				  {szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "Kim � Y Ph�c",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�� Ph� Kim � Y", tbProp = {6,1,2983}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B�o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th�y Chi B�o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V�n Chi B�o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�� Ph� Kim � Y", tbProp = {6,1,2983}, nCount = 1},
				  {szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "Kim � V� Kh�",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�� Ph� Kim � Kh� Gi�i", tbProp = {6,1,2991}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B�o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th�y Chi B�o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V�n Chi B�o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�� Ph� Kim � Kh� Gi�i", tbProp = {6,1,2991}, nCount = 1},
				  {szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,		
	},
	[8] = 
	{
		szName = "Kim � H�i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�� Ph� Kim � H�i", tbProp = {6,1,2984}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B�o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th�y Chi B�o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V�n Chi B�o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�� Ph� Kim � H�i", tbProp = {6,1,2984}, nCount = 1},
				  {szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "Kim � B�i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�� Ph� Kim � B�i", tbProp = {6,1,2988}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B�o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th�y Chi B�o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V�n Chi B�o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�� Ph� Kim � B�i", tbProp = {6,1,2988}, nCount = 1},
				  {szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "Kim � H� Gi�i Ch�",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "�� Ph� Kim � H� Gi�i", tbProp = {6,1,2990}, nSuccessRate = 10, nMaxSuccessRate = 80},		
					{szName = "Kim Hoa Chi B�o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "Ph� Th�y Chi B�o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V�n Chi B�o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},		
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "�� Ph� Kim � H� Gi�i", tbProp = {6,1,2990}, nCount = 1},
				  {szName="Kim � L�nh", tbProp={6, 1, 2349}, nCount = 1},			
		},				

		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
}


local tbOpt = {}

for i=1, getn(tbFormulaList) do
	tbEquip_jinwu[i].szName = tbFormulaList[i].szName
	tbFormulaList[i].tbProduct = tbEquip_jinwu[i]
	
	local p = tbItem2Jinwu:new(tbFormulaList[i], "Item2Jinwu", INVENTORY_ROOM.room_giveitem)
	
	local szOpt = format("Ch� t�o %s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbOpt, {szOpt, p.SelectEquip, {p, 1, 5}})
end
tinsert(tbOpt, {"H�y b� "})
function tbItem2Jinwu:Dialog()
	do
		Talk(1, "", "Ch�c n�ng t�m ��ng.")
		return
	end
	local msg = "H�p th�nh trang b� Kim � c�n ph�i c� 1 Kim � Kim B�i, 5 vi�n Thanh C�u Th�ch, 4 vi�n V�n L�c Th�ch, 3 vi�n Th��ng Lang Th�ch, 2 vi�n Huy�n Vi�n Th�ch, 1 Kim � L�nh v� 1 trang b� T� M�ng t��ng �ng v�i m�n ph�i v� h� t�n c�ng ch� ��o c�a trang b� ch� t�o, y�u c�u �t nh�t c�n ph�i c� 1 Kim � �� Ph� t��ng �ng, 5000 v�n ng�n l��ng, v� nguy�n li�u l�m t�ng th�m t� l� th�nh c�ng n�u c�n."
	CreateNewSayEx(format("%s, l�a ch�n trang b� m� ng��i mu�n ch� t�o:", msg), %tbOpt)
end


Include("\\script\\event\\equip_publish\\dialog.lua")
MAKE_EQUIP_LIST["jinwu"] = {}
MAKE_EQUIP_LIST["jinwu"].nPak = curpack()
MAKE_EQUIP_LIST["jinwu"].pFun = tbItem2Jinwu.Dialog
MAKE_EQUIP_LIST["jinwu"].pSelf = tbItem2Jinwu
MAKE_EQUIP_LIST["jinwu"].szOpt = "Ch� t�o trang b� Kim �"
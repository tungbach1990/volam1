Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbCompose_RBH = tbActivityCompose:new()
tbFormulaList = 
{
	[1] = 
		{
			szName = "B�ch H� Ph�t Qu�n",
			tbMaterial = {{szName="M�nh B�ch H� Ph�t Qu�n",tbProp={6,1,30291,1,0,0},nCount = 99},},
			tbProduct = {szName="B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},tbParam={2,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},
	[2] = 
		{
			szName = "B�ch H� Kim Kh�i",
			tbMaterial = {{szName="M�nh B�ch H� Kim Kh�i",tbProp={6,1,30292,1,0,0},nCount = 99},},
			tbProduct = {szName="B�ch H� Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},tbParam={6,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},
	[3] = 
		{
			szName = "B�ch H� H�ng Li�n",
			tbMaterial = {{szName="M�nh B�ch H� H�ng Li�n",tbProp={6,1,30293,1,0,0},nCount = 99},},
			tbProduct = {szName="B�ch H� H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},tbParam={1,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},		
	[4] = 
		{
			szName = "B�ch H� H� Uy�n",
			tbMaterial = {{szName="M�nh B�ch H� H� Uy�n",tbProp={6,1,30294,1,0,0},nCount = 99},},
			tbProduct = {szName="B�ch H� H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},tbParam={4,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},		
	[5] = 
		{
			szName = "B�ch H� Ng�c B�i",
			tbMaterial = {{szName="M�nh B�ch H� Ng�c B�i",tbProp={6,1,30295,1,0,0},nCount = 99},},
			tbProduct = {szName="B�ch H� Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},tbParam={9,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},	
	[6] = 
		{
			szName = "B�ch H� H�i",
			tbMaterial = {{szName="M�nh B�ch H� H�i",tbProp={6,1,30296,1,0,0},nCount = 99},},
			tbProduct = {szName="B�ch H� H�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},tbParam={8,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},	
	[7] = 
		{
			szName = "B�ch H� Y�u ��i",
			tbMaterial = {{szName="M�nh B�ch H� Y�u ��i",tbProp={6,1,30297,1,0,0},nCount = 99},},
			tbProduct = {szName="B�ch H� Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},tbParam={5,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},	
	[8] = 
		{
			szName = "B�ch H� Th��ng Gi�i Ch�",
			tbMaterial = {{szName="M�nh B�ch H� Th��ng Gi�i Ch�",tbProp={6,1,30298,1,0,0},nCount = 99},},
			tbProduct = {szName="B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},tbParam={3,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},	
	[9] = 
		{
			szName = "B�ch H� H� Gi�i Ch�",
			tbMaterial = {{szName="M�nh B�ch H� H� Gi�i Ch�",tbProp={6,1,30299,1,0,0},nCount = 99},},
			tbProduct = {szName="B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},tbParam={10,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},
	[10] = 
		{
			szName = "B�ch H� Kh� Gi�i",
			tbMaterial = {{szName="M�nh B�ch H� Kh� Gi�i",tbProp={6,1,30300,1,0,0},nCount = 99},},
			tbProduct = {szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},tbParam={7,0,0,0,0,0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},
}
function tbCompose_RBH:RuongBachHo()
	local tbOpt = {}
	local szTitle = "Ng��i mu�n ��i lo�i R��ng B�ch H� n�o"
	local pEventType = EventSys:GetType("AddNpcOption")
	for i=1, getn(tbFormulaList) do
		local p = tbCompose_RBH:new(tbFormulaList[i], "ChangeRuongBachHo")
		local szOpt = format("��i %s", tbFormulaList[i].szName)
		--tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
		tinsert(tbOpt, {szOpt, p.ComposeDailog, {p}})
	end
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szTitle, tbOpt);
end
pEventType:Reg("Ch��ng ��ng Cung N�", "��i R��ng B�ch H�", tbCompose_RBH.RuongBachHo, {tbCompose_RBH})
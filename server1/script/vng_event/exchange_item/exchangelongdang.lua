Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbCompose_HLD = tbActivityCompose:new()
tbFormulaList = 
{
	[1] = 
		{
			szName = "Huy�t Long ��ng C�p 6",
			tbMaterial = {{szName="M�nh Huy�t Long ��ng [c�p 6]",tbProp={6,1,30290,6,0,0},nCount = 10,},},
			tbProduct = {szName="Huy�t Long ��ng [C�p 6]",tbProp={6,1,30289,6,0,0},},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},
	[2] = 
		{
			szName = "Huy�t Long ��ng C�p 8",
			tbMaterial = {{szName="M�nh Huy�t Long ��ng [c�p 8]",tbProp={6,1,30290,8,0,0},nCount = 10,},},
			tbProduct = {szName="Huy�t Long ��ng [C�p 8]",tbProp={6,1,30289,8,0,0},},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},
	[3] = 
		{
			szName = "Huy�t Long ��ng C�p 9",
			tbMaterial = {{szName="M�nh Huy�t Long ��ng [c�p 9]",tbProp={6,1,30290,9,0,0},nCount = 10,},},
			tbProduct = {szName="Huy�t Long ��ng [C�p 9]",tbProp={6,1,30289,9,0,0},},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},	
	[4] = 
		{
			szName = "Huy�t Long ��ng C�p 12",
			tbMaterial = {{szName="M�nh Huy�t Long ��ng [c�p 12]",tbProp={6,1,30290,12,0,0},nCount = 10,},},
			tbProduct = {szName="Huy�t Long ��ng [C�p 12]",tbProp={6,1,30289,12,0,0},},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
		},	
}
function tbCompose_HLD:HuyetLongDang()
	local tbOpt = {}
	local szTitle = "Ng��i mu�n ��i lo�i Huy�t Long ��ng n�o"
	local pEventType = EventSys:GetType("AddNpcOption")
	for i=1, getn(tbFormulaList) do
		local p = tbCompose_HLD:new(tbFormulaList[i], "ChangeHuyetLongDang")
		local szOpt = format("��i %s", tbFormulaList[i].szName)
		--tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
		tinsert(tbOpt, {szOpt, p.ComposeDailog, {p}})
	end
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szTitle, tbOpt);
end
pEventType:Reg("H�ng rong", "��i Huy�t Long ��ng", tbCompose_HLD.HuyetLongDang, {tbCompose_HLD})
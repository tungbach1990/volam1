Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\composeex.lua")
if not tbCardShop then
	tbCardShop = {}
end
tbCardShop.composeList =
	{
		["Thi�p Xu�n 1"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho�t ��ng l�m b�nh ��n xu�n\t H�p th�nh %s", "Thi�p Xu�n 1"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "Lam Th�y Tinh", tbProp = {4,238,1,1,0,0}, nCount = 1}, --lam thuy tinh
								{szName = "Tinh H�ng B�o Th�ch", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "Ph�c Duy�n L� (��i)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "Thi�p Xu�n", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
		["Thi�p Xu�n 2"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho�t ��ng l�m b�nh ��n xu�n\t H�p th�nh %s", "Thi�p Xu�n 2"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "T� Th�y Tinh", tbProp = {4,239,1,1,0,0}, nCount = 1}, --tu thuy tinh
								{szName = "Tinh H�ng B�o Th�ch", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "Ph�c Duy�n L� (��i)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "Thi�p Xu�n", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
		["Thi�p Xu�n 3"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho�t ��ng l�m b�nh ��n xu�n\t H�p th�nh %s", "Thi�p Xu�n 3"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "L�c Th�y Tinh", tbProp = {4,240,1,1,0,0}, nCount = 1}, --luc thuy tinh
								{szName = "Tinh H�ng B�o Th�ch", tbProp = {4,353,1,1,0,0}, nCount = 1},
								{szName = "Ph�c Duy�n L� (��i)", tbProp = {6,1,124,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "Thi�p Xu�n", tbProp = {6,1,30090,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
	}

function main()
	if tbVNG_LY2011:isActive() ~= 1 then
		return
	end
	local tbMainDialog = tbNpcHead:createDialog()
	tbMainDialog.szTitleMsg = "V�i <color=red>1 <color>Tinh H�ng B�o Th�ch,<color=red>1 <color>B�nh Ph�c Duy�n L� (��i)  v� <color=red>1 <color>trong 3 lo�i th�y tinh l� ��i hi�p s� c� ngay 1  t�m thi�p xu�n th�t ��p."
	tbMainDialog:AddOptEntry("Mua thi�p b�ng Lam Th�y Tinh", tbCardShop.buyCard, {tbCardShop,"Thi�p Xu�n 1"})
	tbMainDialog:AddOptEntry("Mua thi�p b�ng T� Th�y Tinh", tbCardShop.buyCard, {tbCardShop, "Thi�p Xu�n 2"})
	tbMainDialog:AddOptEntry("Mua thi�p b�ng L�c Th�y Tinh", tbCardShop.buyCard, {tbCardShop, "Thi�p Xu�n 3"})
	tbMainDialog:Show()
end

function tbCardShop:buyCard(strCard)	
	local tbItem = self.composeList[strCard]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("[VNG][Lunar Year 2011] [Mua %s]", "Thi�p Xu�n"));
		end
		tbItem.pCompos:ComposeDailog(1);
	end
end
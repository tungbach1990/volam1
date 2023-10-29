Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\composeex.lua")

if not tbBaker then
	tbBaker = {}
end
function main()
	if tbVNG_LY2011:isActive() == 0 then
		return
	end
	tbBaker:main()
end
function tbBaker:main()
	local tbMainDiag = tbNpcHead:createDialog()
	tbMainDiag.szTitleMsg = "Nh�ng ng�y n�y th�t b�n r�n"
	tbMainDiag:AddOptEntry("Gi�i thi�u ho�t ��ng", tbBaker.introduction, {tbBaker})
	tbMainDiag:AddOptEntry("B�nh ch�ng ��c bi�t", tbBaker.composeItem, {tbBaker})
	tbMainDiag:Show()
end
function tbBaker:introduction()
	local tbIntroDialog = tbNpcHead:createDialog()
	tbIntroDialog.szTitleMsg = "M�i ng��i ai c�ng b�n r�n chu�n b� cho ba ng�y t�t, sao ng��i c�n ��ng ��y? H�y gh� th�m trang ch� c�a tr� ch�i �� bi�t th�m chi ti�t nh�!"
	tbIntroDialog:AddOptEntry("Tr� l�i", tbBaker.main, {tbBaker})
	tbIntroDialog:Show()
end
function tbBaker:composeItem()
	local tbComposeDialog = tbNpcHead:createDialog()
	tbComposeDialog.szTitleMsg = "N�u c� �� nguy�n li�u ta s� gi�p ng��i l�m [B�nh ch�ng ��c bi�t]"
	tbComposeDialog:AddOptEntry("L�m b�nh", tbBaker.doCompose, {tbBaker})
	tbComposeDialog:AddOptEntry("Tr� l�i", tbBaker.main, {tbBaker})
	tbComposeDialog:Show()
end

function tbBaker:doCompose()
	local tbItemCompose = 
	{
		["B�nh ch�ng ��c bi�t"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho�t ��ng l�m b�nh ��n xu�n\t H�p th�nh %s", "B�nh ch�ng ��c bi�t"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "B�nh ch�ng", tbProp = {6,1,30086,1,0,0}, nCount = 2},
								{szName = "Gi�y g�i b�nh", tbProp = {6,1,30085,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "B�nh ch�ng ��c bi�t", tbProp = {6,1,30089,1,0,0}, nExpiredTime = tbVNG_LY2011.nEndDay},
					},
					pCompos = nil;
			},
	}
	local tbItem = tbItemCompose["B�nh ch�ng ��c bi�t"]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("H�p th�nh [%s]", "B�nh ch�ng ��c bi�t"));
		end
		tbItem.pCompos:ComposeDailog(1);
	end
end

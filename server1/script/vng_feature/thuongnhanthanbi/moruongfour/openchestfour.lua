Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composeex.lua")
tbChectfour = {};
tbChectfour.tbCompose = 
{
				["Th�n B� Chi Th�"] = 
				{
					tbFormula = 
						{
							szComposeTitle = format("��i nguy�n li�u\t H�p th�nh %s", "Th�n B� Chi Th�"),
							nWidth = 1,
							nHeight = 1,
							nFreeItemCellLimit = 0.02,
							tbMaterial = 
								{
									{szName = "T� th�y tinh", tbProp = {4,239,1,1,0,0}, nCount = 1},
									{szName = "L�c th�y tinh", tbProp = {4,240,1,1,0,0}, nCount = 1},
									{szName = "Lam th�y tinh", tbProp = {4,238,1,1,0,0}, nCount = 1},
									{szName = "Huy�n tinh c�p 1", tbProp = {6,1,147,1,-1,0}, nCount = 50},
									{szName = "Huy�n tinh c�p 2", tbProp = {6,1,147,2,-1,0}, nCount = 50},
									{szName = "Huy�n tinh c�p 3", tbProp = {6,1,147,3,-1,0}, nCount = 50},
									{szName = "C�u Ch�u L�nh", tbProp = {6,1,30117,1,0,0}, nCount = 1},
									{szName = "Long Huy�t Ho�n", tbProp = {6,1,2117,1,0,0}, nCount = 1},
									{szName = "Thi�n B�o Kh� L�nh", tbProp = {6,1,2813,1,0,0}, nCount = 1},
									{szName = "H�nh Hi�p L�nh", tbProp = {6,1,2566,1,0,0}, nCount = 50},
									{szName = "Thi�t La H�n", tbProp = {6,1,23,-1,-1,0}, nCount = 2},
								},
							tbProduct = {szName = "Th�n B� Chi Th�", tbProp = {6,1,30181,1,0,0}, nExpiredTime = 60*24*7},
						},
						pCompos = nil;
				},
				["M� R��ng 4"] = 
				{
					tbFormula = 
						{
							szComposeTitle = format("N�p v�t ph�m\t c� th� %s", "M� ���c r��ng 4"),
							nWidth = 1,
							nHeight = 1,
							nFreeItemCellLimit = 0.02,
							tbMaterial = 
								{
									{szName = "Th�n B� Chi Th�", tbProp = {6,1,30181,1,0,0}, nCount = 3},
									{szName = "Ch�a kh�a th�n b�", tbProp = {6,1,30182,1,0,0}, nCount = 1},
								},
							pProductFun = function (self)
								OpenStoreBox(3)
								Msg2Player("B�n nh�n ���c m� r��ng ch�a �� th� t�")
							end,
							pLimitFun = function (self) 
								return %tbChectfour:LimitStoreBox()
							end,
						},
						pCompos = nil;
				},
}

function tbChectfour:CreateDialog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbChectfour:ComposeItem(strItemName)
	local tbItem = self.tbCompose[strItemName]
	if tbItem then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, strItemName);			
		end
		tbItem.pCompos:ComposeDailog(0);
	end
end
--��i th�n b� chi th�
function tbChectfour:main()
	local tbMainDialog = tbChectfour:CreateDialog()
	tbMainDialog.szTitleMsg = "Kh�ng bi�t ta c� th� gi�p g� cho ��i hi�p ?"
	tbMainDialog:AddOptEntry("��i Th�n B� Chi Th�", tbChectfour.ComposeItem, {tbChectfour, "Th�n B� Chi Th�"})
	tbMainDialog:AddOptEntry("N�p v�t ph�m m� r��ng 4", tbChectfour.ComposeItem, {tbChectfour, "M� R��ng 4"})
	tbMainDialog:Show()
end	

function tbChectfour:CheckStoreBox()
	for i=1, 2 do
		if CheckStoreBoxState(i) == 0 then
			return i
		end 
	end
	return 0
end

function tbChectfour:LimitStoreBox()
		if tbChectfour:CheckStoreBox() > 0 then
			Msg2Player(format("��i hi�p v�n ch�a m� r��ng th� %d",tbChectfour:CheckStoreBox() + 1))
			return 0
		end
		if CheckStoreBoxState(3) > 0 then
			Msg2Player("��i hi�p �� m� r��ng th� 4 r�i, kh�ng th� m� n�a")
			return 0
		end
		return 1
end
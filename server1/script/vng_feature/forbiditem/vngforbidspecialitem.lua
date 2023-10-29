Include("\\script\\item\\forbiditem.lua")

tbVNGForbidItem = {}
tbVNGForbidItem.CHALLENGE_OF_TIME = 1
tbVNGForbidItem.SEVEN_CITY = 2
tbVNGForbidItem.VLDNB = 3
tbVNGForbidItem.tbForbidItem = 
	{
		["Th�n H�nh Ph�"] = {6, 1, 1266},
--		["T�m T�m T��ng �nh ph�"] = {6, 1, 18}, disable trong file forbitheart.txt
--		["H�i th�nh ph� (nh�) "] = {6, 1, 1082},
--		["H�i th�nh ph� (l�n) "] = {6, 1, 1083},
		["T�ng Kim Chi�u th� "] = {6, 1, 155},
		["M�c B�c Truy�n T�ng L�nh"] = {6, 1, 1448},
		["L�nh b�i Vi S�n ��o"] = {6, 1, 2432},
		["L�nh b�i vi s�n ��o l� bao"] = {6, 1, 2525},
	}

tbVNGForbidItem.tbMapSet = 
	{
		--Vuot ai
		[1] =
			{
				464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479,
				480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 
				957, --ai 30
			},
		--seven city
		[2] = 
			{
				926, 927, 928, 929, 930, 931, 932,
			},
		--VLDNB	
		[3] =
			{
				605, 608, 609, 606, 610, 611, 607, 612, 613,
			},
		--Arena
		[4] =
			{
				975,
			},
	}
	
tbVNGForbidItem.tbItemList = {
	["6,1,218"] = {strName = "C�ng T�c ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,219"] = {strName = "B�o T�c ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,220"] = {strName = "Ph� Ph�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,221"] = {strName = "��c Ph�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,222"] = {strName = "B�ng Ph�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,223"] = {strName = "H�a Ph�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,224"] = {strName = "L�i Ph�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,225"] = {strName = "Gi�m Th��ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,226"] = {strName = "Gi�m H�n ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,227"] = {strName = "Gi�m ��c ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,228"] = {strName = "Gi�m B�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,229"] = {strName = "Ph� C�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,230"] = {strName = "��c C�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,231"] = {strName = "B�ng C�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,232"] = {strName = "H�a C�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,233"] = {strName = "L�i C�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,234"] = {strName = "Tr��ng M�nh ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,235"] = {strName = "Tr��ng N�i ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,115"] = {strName = "Y�n H�ng �an", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,116"] = {strName = "X� Lam �an", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,117"] = {strName = "N�i Ph� ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,118"] = {strName = "N�i ��c ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,119"] = {strName = "N�i B�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,120"] = {strName = "N�i H�a ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,121"] = {strName = "N�i �i�n ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,1"] = {strName = "Tr��ng M�nh ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,2"] = {strName = "Gia B�o ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,3"] = {strName = "��i L�c ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,4"] = {strName = "Cao Thi�m ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,5"] = {strName = "Cao Trung ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,6"] = {strName = "Phi T�c ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,7"] = {strName = "B�ng Ph�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,8"] = {strName = "L�i Ph�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,9"] = {strName = "H�a Ph�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,10"] = {strName = "��c Ph�ng ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,60"] = {strName = "B�nh ch�ng H�t d�", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,61"] = {strName = "B�nh ch�ng Th�t heo", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,0,62"] = {strName = "B�nh ch�ng Th�t b�", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,73"] = {strName = "B�ch Qu� L�", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,19"] = {strName = "C�t t��ng h�ng bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,69"] = {strName = "Ho�ng Kim B�o H�p", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,885"] = {strName = "T�n S� M�c y�u b�i", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,886"] = {strName = "T�n S� ��ng y�u b�i", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,887"] = {strName = "T�n S� Ng�n y�u b�i", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,888"] = {strName = "T�n S� Kim y�u b�i", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,889"] = {strName = "Ng� T� T�n S� y�u b�i", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,910"] = {strName = "Bao D��c ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,1074"] = {strName = "H�p l� v�t H�ng bao th�n b�", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,1075"] = {strName = "H�p l� v�t [qu� Huy Ho�ng]", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,1389"] = {strName = "H�nh n�m", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,1781"] = {strName = "C�m nang thay ��i tr�i ��t", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2318"] = {strName = "M�c Ch� B�o H�p", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2319"] = {strName = "��ng Ch� B�o H�p", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2320"] = {strName = "Ng�n Ch� B�o H�p", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2321"] = {strName = "Ho�ng Kim B�o r��ng", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2322"] = {strName = "B�o r��ng B�ch Kim", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2347"] = {strName = "S�t Th� B� B�o", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2374"] = {strName = "B�o r��ng th�n b� c�a D� T�u", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2375"] = {strName = "Ch� T�n B� B�o", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2376"] = {strName = "T�i B�o Th�y T�c", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2527"] = {strName = "H�i thi�n t�i t�o l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2520"] = {strName = "Phi t�c ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2517"] = {strName = "��i l�c ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2377"] = {strName = "C�ng Th�nh Chi�n L� Bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2524"] = {strName = "��c ph�ng ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2515"] = {strName = "Tr��ng m�nh ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2516"] = {strName = "Gia t�c ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2518"] = {strName = "Cao thi�m ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2519"] = {strName = "Cao trung ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2520"] = {strName = "Phi t�c ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2521"] = {strName = "B�ng ph�ng ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2522"] = {strName = "L�i ph�ng ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2523"] = {strName = "H�a ph�ng ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2524"] = {strName = "��c ph�ng ho�n l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2525"] = {strName = "L�nh b�i vi s�n ��o l� bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2830"] = {strName = "Ho�n H�n ��n L� Bao", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2831"] = {strName = "Ti�u Di�u T�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2837"] = {strName = "Ho�n H�n ��n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2953"] = {strName = "�m D��ng Ho�t Huy�t ��n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
	["6,1,2952"] = {strName = "K�ch C�ng Tr� L�c Ho�n", tbForbidInMap = {tbVNGForbidItem.tbMapSet[4],},},
}

function tbVNGForbidItem:IsForbidMap(strItemName, tbMapSet)
	local nW, _, _ = GetWorldPos()
	local tbTempMapSet = {}
	for i = 1, getn(tbMapSet) do
		tbTempMapSet = self.tbMapSet[tbMapSet[i]]
		if not tbTempMapSet then
			Msg2Player("Kh�ng x�c ��nh ���c khu v�c gi�i h�n s� d�ng v�t ph�m")
			return 1
		end
		for j = 1, getn(tbTempMapSet) do
			if nW == tbTempMapSet[j] then
				Msg2Player( format("Khu v�c hi�n t�i kh�ng ���c ph�p s� d�ng <color=yellow>%s",strItemName ))
				return 1
			end
		end
	end	
	return 0	
end

function tbVNGForbidItem:CheckItemUsable(nMapID, strItemCode)
	if not self.tbItemList[strItemCode] then
		return 1
	end
	local tbForbidMap = self.tbItemList[strItemCode].tbForbidInMap
	for i = 1, getn(tbForbidMap) do
		for j = 1, getn(tbForbidMap[i]) do
			if nMapID == tbForbidMap[i][j] then
				return 0
			end
		end
	end
	return 1
end
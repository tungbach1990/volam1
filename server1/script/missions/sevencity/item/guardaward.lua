-- �������ʹ�ýű�
Include("\\script\\lib\\awardtemplet.lua")

--Gi�i h�n �i�m kinh nghi�m m�i ng�y l� 50tri�u khi s� d�ng c�c lo�i b�o r��ng - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
--	{szName = "�� Ph� T� M�ng H�i", 		tbProp = {6, 1, 2716, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "�� Ph� T� M�ng Y�u ��i", 		tbProp = {6, 1, 2717, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "�� Ph� T� M�ng H� Uy�n", 		tbProp = {6, 1, 2718, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "T� Tinh Kho�ng Th�ch", 			tbProp = {6, 1, 30040, 1, 0, 0}, 	nRate = 44},
--	{szName = "Tinh Luy�n Th�ch", 			tbProp = {6, 1, 2280, 1, 0, 0}, 	nRate = 27.34},
--	{szName = "Th�n Quy B� Huy�t ��n (ti�u)", 	tbProp = {6, 1, 2583, 1, 0, 0}, 	nRate = 18.3,	nCount = 10},
--	{szName = "Th�n Quy B� Huy�t ��n (trung)",	tbProp = {6, 1, 2582, 1, 0, 0},		nRate = 10,		nCount = 10},

--Gi�i h�n �i�m kinh nghi�m m�i ng�y l� 50tri�u khi s� d�ng c�c lo�i b�o r��ng - Modified by DinhHQ - 20110428	
--	{szName="�i�m kinh nghi�m", nExp=5000000, nRate=30},
--	{szName="�i�m kinh nghi�m", nExp=10000000, nRate=20},
--	{szName="�i�m kinh nghi�m", nExp=15000000, nRate=15},
--	{szName="�i�m kinh nghi�m", nExp=20000000, nRate=10},
	{szName="�i�m kinh nghi�m 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "V� Tr� L� Bao")
				end,
				nRate = 30,
	},
	{szName="�i�m kinh nghi�m 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "V� Tr� L� Bao")
				end,
				nRate = 20,
	},
	{szName="�i�m kinh nghi�m 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(15000000, "V� Tr� L� Bao")
				end,
				nRate = 15,
	},
	{szName="�i�m kinh nghi�m 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "V� Tr� L� Bao")
				end,
				nRate = 10,
	},
	
	{szName="C�m nang thay ��i tr�i ��t", tbProp={6,1,1781,1,0,0}, tbParam={60}, nRate=8},
	{szName="Ti�n Th�o L� ��c bi�t", tbProp={6,1,1181,1,0,0}, nRate=7},
	{szName="B�ch Ni�n Tr�n L�", tbProp={6,1,2266,1,0,0}, nRate=5},
	{szName="V�n Ni�n Tr�n L�", tbProp={6,1,2268,1,0,0}, nRate=2},
	{szName="Thi�n Ni�n Tr�n L�", tbProp={6,1,2267,1,0,0}, nRate=1},
	{szName="Th�n H�nh Ph�", tbProp={6,1,1266,1,0,0}, nRate=2, nExpiredTime=20160},

}

function main()
	if (CalcFreeItemCellCount() < 1) then
		Say("H�nh trang �t nh�t ph�i c� <color=red>1<color> � tr�ng m�i nh�n ���c ph�n th��ng.")
		return 1
	end
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseGuardAward"})
	return 0
end

function test()
	local rate = 0
	for i = 1, getn(tbAward) do
		rate = rate + tbAward[i].nRate
	end
	if (floor(rate) ~= 100) then
		error(format("invalid rate: %d", rate))
	end
end


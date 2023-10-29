Include("\\script\\activitysys\\config\\17\\head.lua")
-- Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

pActivity.tbAward = {}
pActivity.tbAward["shuizeibaoxiang"] = 
{	
	{szName="�� Ph� T� M�ng Kh�i",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="�� Ph� T� M�ng Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="�� Ph� T� M�ng Y�u ��i",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="�� Ph� T� M�ng H� Uy�n",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="�� Ph� T� M�ng H�ng Li�n",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.03},
	{szName="�� Ph� T� M�ng B�i",tbProp={6,1,2720,1,0,0},nCount=1,nRate=1.8},
	{szName="�� Ph� T� M�ng H�i",tbProp={6,1,2716,1,0,0},nCount=1,nRate=1.8},
	{szName="�� Ph� T� M�ng Th��ng Gi�i Ch�",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.03},
	{szName="�� Ph� T� M�ng H� Gi�i Ch�",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.03},
	{szName="�� Ph� T� M�ng Kh� Gi�i",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.03},
	{szName="T� M�ng L�nh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.3},
	{szName="Huy�n Vi�n L�nh",tbProp={6,1,2351,1,0,0},nCount=1,nRate=1},
	{szName="M�t n� Nguy�n so�i",tbProp={0,11,447,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="H�i long ch�u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="B�ch Ni�n Tr�n L�",tbProp={6,1,2266,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="V�n Ni�n Tr�n L�",tbProp={6,1,2268,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="Thi�n Ni�n Tr�n L�",tbProp={6,1,2267,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName="Th�n H�nh Ph�",tbProp={6,1,1266,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	
	{szName="�i�m kinh nghi�m 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(3000000, "B�o R��ng Th�y T�c")
				end,
				nRate = 25,
	},
	{szName="�i�m kinh nghi�m 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "B�o R��ng Th�y T�c")
				end,
				nRate = 17.78,
	},
	{szName="�i�m kinh nghi�m 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(8000000, "B�o R��ng Th�y T�c")
				end,
				nRate = 7,
	},
	{szName="�i�m kinh nghi�m 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(12000000, "B�o R��ng Th�y T�c")
				end,
				nRate = 4,
	},
	{szName="�i�m kinh nghi�m 5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(15000000, "B�o R��ng Th�y T�c")
				end,
				nRate = 2,
	},
	{szName="�i�m kinh nghi�m 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "B�o R��ng Th�y T�c")
				end,
				nRate = 1,
	},
	
	{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=1,nRate=4},
	{ szName = "Ho�ng Kim �n (C��ng h�a)", tbProp = {0,3205}, nRate = 4, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Ho�ng Kim �n (C��ng h�a)", tbProp = {0,3206}, nRate = 3, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Ho�ng Kim �n (C��ng h�a)", tbProp = {0,3207}, nRate = 2, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Ho�ng Kim �n (C��ng h�a)", tbProp = {0,3208}, nRate = 1.5, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Ho�ng Kim �n (C��ng h�a)", tbProp = {0,3209}, nRate = 1, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Ho�ng Kim �n (Nh��c h�a)", tbProp = {0,3215}, nRate = 4, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Ho�ng Kim �n (Nh��c h�a)", tbProp = {0,3216}, nRate = 3, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Ho�ng Kim �n (Nh��c h�a)", tbProp = {0,3217}, nRate = 2, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Ho�ng Kim �n (Nh��c h�a)", tbProp = {0,3218}, nRate = 1.5, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Ho�ng Kim �n (Nh��c h�a)", tbProp = {0,3219}, nRate = 1, nExpiredTime = 10080, nQuality = 1, nCount = 1},
}

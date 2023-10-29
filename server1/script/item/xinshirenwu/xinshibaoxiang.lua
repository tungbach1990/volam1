Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

function GetDesc(nItem)
	return ""
end
-- Th�m ph�n s� d�ng ch�a kh�a v�ng  -Modifiled by ThanhLD - 20130417	
tbXS_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbXS_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
    		{szName = "�� Ph� T� M�ng Kh�i", tbProp = {6, 1,2714,1,0,0}, nRate = 0.03},
		{szName = "�� Ph� T� M�ng Y", tbProp = {6, 1,2715,1,0,0}, nRate = 0.03},
		{szName = "�� Ph� T� M�ng Y�u ��i", tbProp = {6, 1,2717,1,0,0}, nRate = 0.03},
		{szName = "�� Ph� T� M�ng H� Uy�n", tbProp = {6, 1,2718,1,0,0}, nRate = 0.07},
		{szName = "�� Ph� T� M�ng H�ng Li�n", tbProp = {6, 1,2719,1,0,0}, nRate = 0.02},
		{szName = "�� Ph� T� M�ng B�i", tbProp = {6, 1,2720,1,0,0}, nRate = 0.07},
		{szName = "�� Ph� T� M�ng H�i", tbProp = {6, 1,2716,1,0,0}, nRate = 0.07},
		{szName = "�� Ph� T� M�ng Th��ng Gi�i Ch�", tbProp = {6, 1,2721,1,0,0}, nRate = 0.01},
		{szName = "�� Ph� T� M�ng H� Gi�i Ch�", tbProp = {6, 1,2722,1,0,0}, nRate = 0.01},
		{szName = "�� Ph� T� M�ng Kh� Gi�i", tbProp = {6, 1,2723,1,0,0}, nRate = 0.01},
		{szName = "T� M�ng L�nh", tbProp = {6, 1,2350,1,0,0}, nRate = 0.01},
		{szName = "Huy�n Vi�n L�nh", tbProp = {6, 1,2351,1,0,0}, nRate = 0.2},
		{szName="3.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(3000000, "T�n S� B�o R��ng")
			end,
			nRate = 63.34,
		},
		{szName="5.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(5000000, "T�n S� B�o R��ng")
			end,
			nRate = 30,
		},
		{szName="8.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(8000000, "T�n S� B�o R��ng")
			end,
			nRate = 5,
		},
		{szName="12.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(12000000, "T�n S� B�o R��ng")
			end,
			nRate = 1,
		},
		{szName = "Thi�n B�o Kh� L�nh", tbProp = {6, 1,2813,1,0,0}, nRate = 0.1},
    	},	
	["chiakhoavang"] = 
	{
		-- {szName="X�ch L�n L�nh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.05},
		-- {szName="M�nh X�ch L�n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=0.2},
		-- {szName="X�ch L�n Kim B�i",tbProp={6,1,3392,1,0,0},nCount=1,nRate=0.1},
		-- {szName="X�ch L�n Tr�o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=0.7},
		-- {szName="X�ch L�n Gi�c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=0.3},
		-- {szName="X�ch L�n T�nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=0.1},
		-- {szName="B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={2,0,0,0,0,0}},
		-- {szName="B�ch H� Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.006,tbParam={6,0,0,0,0,0}},
		-- {szName="B�ch H� Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.018,tbParam={5,0,0,0,0,0}},
		-- {szName="B�ch H� H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={1,0,0,0,0,0}},
		-- {szName="B�ch H� Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={9,0,0,0,0,0}},
		-- {szName="B�ch H� H�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={8,0,0,0,0,0}},
		-- {szName="B�ch H� H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={4,0,0,0,0,0}},
		-- {szName="B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={3,0,0,0,0,0}},
		-- {szName="B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={10,0,0,0,0,0}},
		-- {szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.006,tbParam={7,0,0,0,0,0}},
		-- {szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=10,nBindState=-2},
		-- {szName="l��ng",nJxb=1000000,nCount=1,nRate=4},
		-- {szName="l��ng",nJxb=500000,nCount=1,nRate=10},
		-- {szName="T�c Hi�u B�ch C�u Ho�n c�p 150",tbProp={6,1,2975,1,0,0},nCount=1,nRate=3,nExpiredTime=10080,},
		-- {szName="X�ch L�n Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={2,0,0,0,0,0}},
		-- {szName="X�ch L�n Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.001,tbParam={6,0,0,0,0,0}},
		-- {szName="X�ch L�n Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={5,0,0,0,0,0}},
		-- {szName="X�ch L�n H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={1,0,0,0,0,0}},
		-- {szName="X�ch L�n Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={9,0,0,0,0,0}},
		-- {szName="X�ch L�n H�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={8,0,0,0,0,0}},
		-- {szName="X�ch L�n H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={4,0,0,0,0,0}},
		-- {szName="X�ch L�n Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={3,0,0,0,0,0}},
		-- {szName="X�ch L�n H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={10,0,0,0,0,0}},
		-- {szName="X�ch L�n Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.008,tbParam={7,0,0,0,0,0}},
		-- {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
		-- {szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
		-- {szName="Phi phong Ng� Phong (Tr�ng k�ch)",tbProp={0,3475},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
		-- {szName="Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",tbProp={0,3473},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
		-- {szName="Phong V�n Chi�u Binh L� Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},
		-- {szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1.5,nExpiredTime=43200},
		-- {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nRate=0.1,nExpiredTime=10080,nUsageTime = 60},
		-- {szName="Vi�m �� L�nh",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.6,nExpiredTime=20160},
		-- {szName="Long Huy�t Ho�n",tbProp={6,1,2117,1,0,0},nCount=1,nRate=0.6,nExpiredTime=20160},
		-- {szName="L�nh B�i Th�y T�c",tbProp={6,1,2745,1,0,0},nCount=1,nRate=0.6,nExpiredTime=20160},
		-- {szName="H�i thi�n t�i t�o l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Tr� L�c Ho�n L� Bao",tbProp={6,1,30161,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Ho�t Huy�t ��n L� Bao",tbProp={6,1,30160,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Ph� Qu� C�m H�p",tbProp={6,1,2402,1,0,0},nCount=1,nRate=1,nExpiredTime=1440},
		{szName="4.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(4000000, "T�n S� B�o R��ng")
			end,
			nRate = 28.313,
		},
		{szName="5.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(5000000, "T�n S� B�o R��ng")
			end,
			nRate = 18,
		},
		{szName="6.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(6000000, "T�n S� B�o R��ng")
			end,
			nRate = 7,
		},
		{szName="8.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(12000000, "T�n S� B�o R��ng")
			end,
			nRate = 4,
		},
		{szName="10.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(10000000, "T�n S� B�o R��ng")
			end,
			nRate = 2,
		},	
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)	
	local tbKey1 = tbXS_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbXS_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("C�n ph�i c� Ch�a Kh�a V�ng ho�c Ch�a Kh�a Nh� � m�i c� th� m� ���c B�o R��ng T�n S�", 1, "��ng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("S� d�ng Ch�a kh�a nh� �/#VnXSBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("S� d�ng Ch�a kh�a v�ng/#VnXSBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "��ng/Oncancel")
		Say("S� d�ng ch�a kh�a �� m� r��ng:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnXSBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbXS_Key_Require[strKeyType]
	local tbAward = tbXS_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("C�n ph�i c� Ch�a Kh�a V�ng ho�c Ch�a Kh�a Nh� � m�i c� th� m� ���c B�o R��ng T�n S�", 1, "��ng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2812, -1) ~= 1 then
		Say("Kh�ng t�m th�y B�o R��ng T�n S�", 1, "��ng/no")
		return
	end	
	tbAwardTemplet:Give(tbAward, 1, {"TinSu", "SuDungBaoRuongTinSu"})	
end 

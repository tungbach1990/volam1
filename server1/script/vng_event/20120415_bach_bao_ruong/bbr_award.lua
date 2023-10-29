--Ph�n th��ng t� t�nh n�ng B�ch B�o R��ng - Created By DinhHQ - 20120415
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\composeex.lua")
tbBBRAward = {}
tbBBRAward.tbFlag = {
	["LongLenhKy"] = {szName = "Long L�nh K�", tbProp = {6, 1, 3056, 1, 0, 0}},
	["LanLenhKy"] = {szName = "L�n L�nh K�", tbProp = {6, 1, 3057, 1, 0, 0}},
	["QuyLenhKy"] = {szName = "Quy L�nh K�", tbProp = {6, 1, 3059, 1, 0, 0}},
	["PhungLenhKy"] = {szName = "Ph�ng L�nh K�", tbProp = {6, 1, 3058, 1, 0, 0}},
}
tbBBRAward.tbProduct = {
	["LongLenhKy"] = {
		{tbProduct = {szName = "Kim � Ph�t Qu�n - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "Kim � H�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "Kim � Kim Kh�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0}}, nFlagRequire = 900},
		{tbProduct = {szName = "Kim � Y�u ��i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "Kim � H�ng Li�n - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0}}, nFlagRequire = 700},
		{tbProduct = {szName = "Kim � H� Uy�n - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "Kim � Ng�c B�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}}, nFlagRequire = 750},
		{tbProduct = {szName = "Kim � Th��ng Gi�i Ch� - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0}}, nFlagRequire = 1000},
		{tbProduct = {szName = "Kim � H� Gi�i Ch� - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0}}, nFlagRequire = 1000},
		{tbProduct = {szName = "Kim � Kh� Gi�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}}, nFlagRequire = 3000},
		{tbProduct = {szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1}, nFlagRequire = 600},
		{tbProduct = {szName="V� �� H�",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Thanh B�nh L�c",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="H�i Xu�n",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Kh� M�c",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L�u V�n ",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="N� Tr�ch",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L�i H�a Ki�p",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="M� T�y Thi�n H��ng",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="�i�p V� Hoa Phi",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
	["LanLenhKy"] = {
		{tbProduct = {szName="M�t n� V��ng Gi�",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 400},
		{tbProduct = {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080, nUsageTime=60}, nFlagRequire = 30},
		{tbProduct = {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 240},
		{tbProduct = {szName="Phong V�n B�ch M�",tbProp={0,10,19,1,0,0},nCount=1,nExpiredTime=129600}, nFlagRequire = 100, },
		{tbProduct = {szName="Phi�n V� (HSD 1 th�ng)",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 20},
		{tbProduct = {szName="Phi�n V� (HSD 3 th�ng)",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime=129600}, nFlagRequire = 60},
		{tbProduct = {szName="V� �� H�",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Thanh B�nh L�c",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="H�i Xu�n",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Kh� M�c",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L�u V�n ",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="N� Tr�ch",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L�i H�a Ki�p",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="M� T�y Thi�n H��ng",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="�i�p V� Hoa Phi",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
	["QuyLenhKy"] = {
		{tbProduct = {szName="1000 v�n ng�n l��ng", nJxb = 10000000, nCount = 1}, nFlagRequire = 8},
		{tbProduct = {szName="5000 v�n ng�n l��ng", nJxb = 50000000, nCount = 1}, nFlagRequire = 40},
		{tbProduct = {szName="10000 v�n ng�n l��ng", nJxb = 100000000, nCount = 1}, nFlagRequire = 80},
		{tbProduct = {szName="50000 v�n ng�n l��ng", nJxb = 500000000, nCount = 1}, nFlagRequire = 400},
		{tbProduct = {szName="V� �� H�",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Thanh B�nh L�c",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="H�i Xu�n",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Kh� M�c",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L�u V�n ",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="N� Tr�ch",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L�i H�a Ki�p",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="M� T�y Thi�n H��ng",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="�i�p V� Hoa Phi",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},
	},
	["PhungLenhKy"] = {
		{tbProduct = {szName="Ho�ng Kim �n (C��ng h�a) c�p 7",tbProp={0,3211},nCount=1,nQuality = 1,}, nFlagRequire = 2000},
		{tbProduct = {szName="Ho�ng Kim �n (C��ng h�a) c�p 8",tbProp={0,3212},nCount=1,nQuality = 1,nExpiredTime=129600,}, nFlagRequire = 3000},
		{tbProduct = {szName="Ho�ng Kim �n (Nh��c h�a) c�p 7",tbProp={0,3221},nCount=1,nQuality = 1,}, nFlagRequire = 2000},
		{tbProduct = {szName="Ho�ng Kim �n (Nh��c h�a) c�p 8",tbProp={0,3222},nCount=1,nQuality = 1,nExpiredTime=129600,}, nFlagRequire = 3000},
		{tbProduct = {szName="V� �� H�",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Thanh B�nh L�c",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="H�i Xu�n",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Kh� M�c",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L�u V�n ",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="N� Tr�ch",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L�i H�a Ki�p",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="M� T�y Thi�n H��ng",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="�i�p V� Hoa Phi",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},
	},
}
function tbBBRAward:main()
	local tb = {
		format("Ta mu�n s� d�ng Long L�nh K� ��i ph�n th��ng/#tbBBRAward:SelectAward('%s', %d)", "LongLenhKy", 1),
		format("Ta mu�n s� d�ng L�n L�nh K� ��i ph�n th��ng/#tbBBRAward:SelectAward('%s', %d)", "LanLenhKy", 1),
		format("Ta mu�n s� d�ng Quy L�nh K� ��i ph�n th��ng/#tbBBRAward:SelectAward('%s', %d)", "QuyLenhKy", 1),
		format("Ta mu�n s� d�ng Ph�ng L�nh K� ��i ph�n th��ng/#tbBBRAward:SelectAward('%s', %d)", "PhungLenhKy", 1),
		"H�y b�/Oncancel",
	}
	Describe("Khi thu th�p �� s� l��ng l�nh k�, ng��i c� th� �em ��n ta �� ��i ph�n th��ng. Danh s�ch v�t ph�m th��ng v� gi� tr� quy ��i s� ���c c�p nh�t li�n t�c.", getn(tb), tb)
end

function tbBBRAward:SelectAward(strFlag, nStartIndex)	
	local tb1 = self.tbProduct[strFlag]
	if nStartIndex < 1 or nStartIndex > getn(tb1) then
		return
	end
	local tb2
	local nEndIndex
	local tbDialog = {}
	if nStartIndex +11 > getn(tb1) then
		nEndIndex = getn(tb1)
	else
		nEndIndex = nStartIndex + 11
	end
	for i = nStartIndex, nEndIndex do
		tb2 = tb1[i]
		tinsert(tbDialog , format("%s/#tbBBRAward:MakeCompose('%s', %d)", tb2.tbProduct.szName, strFlag, i))
	end
	if nEndIndex < getn(tb1) then	
		tinsert(tbDialog, format("Trang k�/#tbBBRAward:SelectAward('%s', %d)", strFlag, nEndIndex + 1))
	end
	if nStartIndex > 1 then
		tinsert(tbDialog, format("Tr� l�i/#tbBBRAward:SelectAward('%s', %d)", strFlag, nStartIndex - 12))
	end
	tinsert(tbDialog, "H�y b�/Oncancel")
	Describe("Xin h�y ch�n ph�n th��ng:", getn(tbDialog), tbDialog)
end

function tbBBRAward:MakeCompose(strFlag, nProductID)
	local tbTemp = self.tbProduct[strFlag][nProductID]
	local tbMat = {}
	tbMat[1] = {}
	tbMat[1].nCount = tbTemp.nFlagRequire
	tbMat[1].szName = self.tbFlag[strFlag].szName
	tbMat[1].tbProp = self.tbFlag[strFlag].tbProp	
	local tbFormula = {		
		tbMaterial = tbMat,		
		tbProduct = tbTemp.tbProduct,	
		nWidth = 3,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	}
	pCompos = tbActivityCompose:new(tbFormula, strFlag.."DoiPhanThuong");
	pCompos:ComposeDailog(1);
end

pEventType:Reg("L� Quan", "Ph�n th��ng Phong V�n B�o �i�n", tbBBRAward.main, {tbBBRAward})
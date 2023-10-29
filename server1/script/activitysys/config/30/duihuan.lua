Include("\\script\\activitysys\\config\\30\\head.lua")
Include("\\script\\activitysys\\config\\30\\config.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")

local szEventName = "Event_NhaGiaoVN"
local nMaxAskNumber = 2000 -- ����Ͻ�ʱ����֧����


local tbBookPartAward = {
	[20]={szName="Hoa Tri �n",tbProp={6,1,3043,1,0,0},nExpiredTime=20111201},
	[40]={szName="Hoa Tri �n",tbProp={6,1,3043,1,0,0},nCount = 3,nExpiredTime=20111201},
	[60]={szName="Hoa Tri �n",tbProp={6,1,3043,1,0,0},nCount = 4,nExpiredTime=20111201},
	[80]={szName="Hoa Tri �n",tbProp={6,1,3043,1,0,0},nCount = 5,nExpiredTime=20111201},
	[100]={szName="Hoa Tri �n",tbProp={6,1,3043,1,0,0},nCount = 7,nExpiredTime=20111201},
	[200]={nExp_tl=1,nCount = 20000000,},
	[300]={nExp_tl=1,nCount = 20000000,},
	[400]={szName="Thi�n V� H�n",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[500]={szName="Thi�n V� H�n",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[600]={szName="Thi�n V� H�n",tbProp={6,1,3044,1,0,0},nExpiredTime=20111201},
	[700]={szName="Thi�n V� H�n",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[800]={szName="Thi�n V� H�n",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[900]={szName="Thi�n V� H�n",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[1000]={nExp_tl=1,nCount = 20000000,},
	[1100]={szName="Thi�n V� H�n",tbProp={6,1,3044,1,0,0},nCount = 2,nExpiredTime=20111201},
	[1200]={szName="Thi�n V� H�n",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1300]={szName="Thi�n V� H�n",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1400]={szName="Thi�n V� H�n",tbProp={6,1,3044,1,0,0},nCount = 3,nExpiredTime=20111201},
	[1500]={nExp_tl=1,nCount = 50000000,},
	[1600]={nExp_tl=1,nCount = 60000000,},
	[1700]={nExp_tl=1,nCount = 70000000,},
	[1800]={nExp_tl=1,nCount = 80000000,},
	[1900]={nExp_tl=1,nCount = 90000000,},
	[2000]={nExp_tl=1,nCount = 100000000,},
}
local tbBookPartAwardLog ={
	[20] = "SuDung20LanCuonSach",
	[40] = "SuDung40LanCuonSach",
	[60] = "SuDung60LanCuonSach",
	[80] = "SuDung80LanCuonSach",
	[100] = "SuDung100LanCuonSach", 
	[200] = "SuDung200LanCuonSach",
	[300] = "SuDung300LanCuonSach",
	[400] = "SuDung400LanCuonSach",
	[500] = "SuDung500LanCuonSach",
	[600] = "SuDung600LanCuonSach", 
	[700] = "SuDung700LanCuonSach",
	[800] = "SuDung800LanCuonSach",
	[900] = "SuDung900LanCuonSach",
	[1000] = "SuDung1000LanCuonSach",
	[1100] = "SuDung1100LanCuonSach", 
	[1200] = "SuDung1200LanCuonSach",
	[1300] = "SuDung1300LanCuonSach",
	[1400] = "SuDung1400LanCuonSach",
	[1500] = "SuDung1500LanCuonSach",
	[1600] = "SuDung1600LanCuonSach", 
	[1700] = "SuDung1700LanCuonSach",
	[1800] = "SuDung1800LanCuonSach",
	[1900] = "SuDung1900LanCuonSach",
	[2000] = "SuDung2000LanCuonSach",
}

function pContributionAward(nCount)
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(nCount)
		Msg2Player("B�n nh�n ���c "..nCount.." �i�m c�ng hi�n bang h�i")
		%tbLog:PlayerActionLog(%szEventName, "SuDungCuonSachNhanVatPham", nCount.." �i�m c�ng hi�n bang h�i")
	end
end

local tbBookAward = {
	{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.02},
	{szName="Kim � Kim B�i",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.05},
	{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.1},
	{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.1},
	{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.05},
	{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.05},
	{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
	{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.1},
	{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.1},
	{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
	{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
	{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
	{szName="Kim Hoa Chi B�o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.05},
	{szName="Ph� Th�y Chi B�o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.03},
	{szName="Phong V�n Chi B�o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.001},
	{szName="Thanh C�u Th�ch",tbProp={6,1,2710,1,0,0},nCount=1,nRate=0.4},
	{szName="V�n L�c Th�ch",tbProp={6,1,2711,1,0,0},nCount=1,nRate=0.3},
	{szName="Th��ng Lang Th�ch",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.2},
	{szName = "6000000 �i�m Kinh Nghi�m", nExp=6000000,nRate=35},
	{szName = "8000000 �i�m Kinh Nghi�m", nExp=8000000,nRate=22},
	{szName = "12000000 �i�m Kinh Nghi�m", nExp=12000000,nRate=10},
	{szName = "20000000 �i�m Kinh Nghi�m", nExp=20000000,nRate=3},
	{szName = "50000000 �i�m Kinh Nghi�m", nExp=50000000,nRate=0.5},
	{szName = "100000000 �i�m Kinh Nghi�m", nExp=100000000,nRate=0.1},
	{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3},
	{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3},
	{szName="H�i thi�n t�i t�o l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="T�ng Kim Chi�u Binh L�nh",tbProp={6,1,30083,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="Ng�c Qu�n",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=2},
	{szName="Ng�c Tr�ng Luy�n",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2,nExpiredTime=43200},
	{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.04,nExpiredTime=43200},
	{szName="K�ch C�ng Tr� L�c Ho�n",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="�m D��ng Ho�t Huy�t ��n",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="M�c Nh�n L�nh",tbProp={6,1,30105,1,0,0},nCount=5,nRate=9.664},
	{szName="50000 �i�m C�ng Hi�n Bang H�i",nCount=1,nRate=2, pFun = function() %pContributionAward(50000) end},
	{szName="100000 �i�m C�ng Hi�n Bang H�i",nCount=1,nRate=1, pFun = function() %pContributionAward(100000) end},
	{szName="T� M�ng Chi B�o (N�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={1,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (�ai L�ng)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.02,tbParam={4,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (Bao Tay)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={3,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (Ng�c B�i)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={8,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (�o)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={5,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (Gi�y)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={7,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (H�ng Li�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.01,tbParam={0,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (Nh�n Tr�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={2,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (Nh�n D��i)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={9,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (V� Kh�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.005,tbParam={6,0,0,0,0,0}},
}

local tbBaizhiPartLog = {
	[500] = "NopVatPhamGiayTrang500Lan",
	[1000] = "NopVatPhamGiayTrang1000Lan",
	[1500] = "NopVatPhamGiayTrang1500Lan",
	[2000] = "NopVatPhamGiayTrang2000Lan",
	[2500] = "NopVatPhamGiayTrang2500Lan",
	[3000] = "NopVatPhamGiayTrang3000Lan",
}	

function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1431,3287,},
		[2] = {176,1428,3283,},
	}
	local tbNpc = {
		[1] = {
			szName = "��i L�o S�", 
			nLevel = 95,
			nNpcId = 1877,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "Th� ��ng", 
			nLevel = 95,
			nNpcId = 1878,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:GetItemCount(tbMaterial)
	local nMaxCount = -1
	if type(tbMaterial[1]) == "table" then
		for i=1, getn(tbMaterial) do
			local tbProp = tbMaterial[i].tbProp
			tbMaterial[i].nCount = tbMaterial[i].nCount or 1
			local nCount = CalcItemCount(3, tbProp[1], tbProp[2], tbProp[3], -1)
			nCount = floor(nCount / tbMaterial[i].nCount)
			if nMaxCount < 0 then
				nMaxCount = nCount
			else
				nMaxCount = min(nMaxCount, nCount)
			end
		end
	else
		local tbProp = tbMaterial.tbProp
		local nCount = CalcItemCount(3, tbProp[1], tbProp[2], tbProp[3], -1)
		nMaxCount = min(nMaxCount, nCount)
	end
	nMaxCount = max(0, nMaxCount)
	return nMaxCount
end

function pActivity:ConsumeItem(tbMaterial, nCount)
	if type(tbMaterial[1]) == "table" then
		for i=1, getn(tbMaterial) do
			local tbProp = tbMaterial[i].tbProp
			tbMaterial[i].nCount = tbMaterial[i].nCount or 1
			local nTotalCount = nCount * tbMaterial[i].nCount
			if ConsumeItem(3, nTotalCount, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
				Msg2Player(format("Khi ti�u hao %s �� th�t b�i, xin h�y ��i m�t l�t r�i quay l�i",tbMaterial[i].szName))
				return 0
			end
		end
	else
		local tbProp = tbMaterial.tbProp
		if ConsumeItem(3, nCount, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
			Msg2Player(format("Khi ti�u hao %s �� th�t b�i, xin h�y ��i m�t l�t r�i quay l�i",tbMaterial[i].szName))
			return 0
		end
	end
	return 1
end

function pActivity:CheckItemCount(nValue, nTarget)
	if nValue < nTarget then
		Say("Ng��i kh�ng �� nguy�n li�u, xin h�y chu�n b� l�i")
		return 0
	end
	return 1
end

-- �Ͻ��鱾�ɹ�����ز���
--function pActivity:DoHandInBook(nCount, nTaskId)
--	local nPreCount = self:GetTask(nTaskId)
--	local nNowCount = nPreCount + nCount
--	
--	if self:CheckFreeCell(nTaskId, nCount) ~= 1 then
--		return 
--	end
--	tbAwardTemplet:Give(%tbBookAward, nCount, {%szEventName, "SuDungCuonSachNhanVatPham"})
--	for key,value in %tbBookPartAward do
--		if key > nPreCount and key <= nNowCount then
--			tbAwardTemplet:Give(value, 1, {%szEventName,%tbBookPartAwardLog[key]})
--		end
--	end
--	self:AddTask(nTaskId, nCount)
--end

-- �Ͻ���ֽ�ɹ�����ز���
function pActivity:DoHandInPaper(nCount, nTaskId)
	local tbExp = {{nExp_tl=1,nCount = 1000000,},}
	local nPreCount = self:GetTask(nTaskId)
	local nNowCount = nPreCount + nCount
	tbAwardTemplet:Give(tbExp, nCount, {%szEventName, "HandInPaper"})
	for key,value in %tbBaizhiPartLog do
		if key > nPreCount and key <= nNowCount then
			%tbLog:PlayerActionLog(%szEventName, value)
			tbVngTransLog:Write("201111_20Thang11/", 16, value, "N/A", 1)
		end
	end
	self:AddTask(nTaskId, nCount)
end

-- �Ͻ����߽׶��Խ���
function pActivity:GiveAward(nTaskId, nCount)
	if nTaskId == %TSK_HandInBook then
		self:DoHandInBook(nCount, nTaskId)
	elseif nTaskId == %TSK_HandInPaper then
		self:DoHandInPaper(nCount, nTaskId)
	end
	
end

function pActivity:CheckFreeCell(nTaskId, nCount)
	if nTaskId == %TSK_HandInBook then
		local nFreeCount = nCount * 3 -- Į����������3���Ҳ��ɵ���
		if CalcFreeItemCellCount() < nFreeCount then
			Say(format("�� b�o ��m an to�n t�i s�n, xin h�y ��m b�o h�nh trang c�n th�a %d � tr�ng.",nFreeCount))
			return 0
		end
	end
	return 1
end

-- ȷ���Ͻ�����
function pActivity:SureHandIn(tbMaterial, nTaskId, nCount)
	if nCount <= 0 then
		return 
	end	
	--Ki�m tra s� l��ng giao n�p c� v��t qu� gi�i h�n - Modified by DinhHQ - 20111101
	local nMaxCount = 0
	if nTaskId == %TSK_HandInBook then
		nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook) - nCount
	elseif nTaskId == %TSK_HandInPaper then
		nMaxCount = %nMaxPaperCount + self:GetTask(%TSK_UsedZhienhua) * %nPerZhienhua - self:GetTask(%TSK_HandInPaper) - nCount
	end	
		
	if nMaxCount < 0 then
		Say("S� l��ng v��t qu� gi�i h�n, xin h�y nh�p s� kh�c!")
		return 
	end
	
	local nItemCount = self:GetItemCount(tbMaterial)
	if self:CheckItemCount(nItemCount, nCount) ~= 1 then
		return
	end
	
	if self:CheckFreeCell(nTaskId, nCount) ~= 1 then
		return 
	end 
	
	if self:ConsumeItem(tbMaterial, nCount) ~= 1 then
		return 
	end
	
	self:GiveAward(nTaskId, nCount)
end

-- �Ͻ��鱾
--function pActivity:HandInBook()
--	print("Giao n�p Cu�n S�ch")
--	local tbBook = {
--		[1]={szName="Cu�n S�ch",tbProp={6,1,3042,1,0,0},},	
--	}
--	local nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook)
--	if nMaxCount < 1 then
--		Say("Hi�n t�i s� l�n giao n�p c�a ng��i �� ��t ��n gi�i h�n cao nh�t, kh�ng th� giao n�p ���c n�a")
--		return 
--	end
--	print("nMaxCount = " .. nMaxCount)
--	print("nMaxAskNumber" .. %nMaxAskNumber)
--	nMaxCount = min(%nMaxAskNumber, nMaxCount)
--	local nItemCount = self:GetItemCount(tbBook)
--	nMaxCount = min(nMaxCount, nItemCount)
--	if self:CheckItemCount(nMaxCount, 1) ~= 1 then
--		return
--	end
--	g_AskClientNumberEx(0,nMaxCount, format("Nh�p s� (0-%d)", nMaxCount), {self.SureHandIn, {self,tbBook,%TSK_HandInBook}})
--end


-- �Ͻ���ֽ
function pActivity:HandInPaper()
	local tbPape = {
		[1]={szName="Gi�y Tr�ng",tbProp={6,1,3039,1,0,0},},	
	}
	local nMaxCount = %nMaxPaperCount + self:GetTask(%TSK_UsedZhienhua) * %nPerZhienhua - self:GetTask(%TSK_HandInPaper)
	if nMaxCount < 1 then
		Say("Hi�n t�i s� l�n giao n�p c�a ng��i �� ��t ��n gi�i h�n cao nh�t, kh�ng th� giao n�p ���c n�a")
		return 
	end
	nMaxCount = min(%nMaxAskNumber, nMaxCount)
	local nItemCount = self:GetItemCount(tbPape)	
	nMaxCount = min(nMaxCount, nItemCount)
	if self:CheckItemCount(nMaxCount, 1) ~= 1 then
		return
	end
	g_AskClientNumberEx(0,nMaxCount, format("Nh�p s� (0-%d)", nMaxCount), {self.SureHandIn, {self,tbPape,%TSK_HandInPaper}})
end

-- ��ȡ��ʦ�ھ��齱��
function pActivity:TeacherAward()
	local nStartTime = 20111120
	if tonumber(GetLocalDate("%Y%m%d")) ~= nStartTime then
		Say("Ch� c� th� v�o ng�y <color=yellow>  20/11/2011 <color> m�i nh�n ���c ph�n th��ng n�y, hi�n t�i kh�ng th� nh�n ���c")
		return 
	end
	local tbTeacherEXP = { {nExp_tl=1,nCount = 100000000,}, }
	local tbTranslog = {strFolder = "201111_20Thang11/", nPromID = 16, nResult = 1}
	tbAwardTemplet:Give(tbTeacherEXP,1,{%szEventName, "NhanPhanThuongTaiNPCDaiLaoSu", tbTranslog})
	self:AddTask(%TSK_TeacherAward, 1)
end

local tbJinwu = {
	[1]={szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},},
	[2]={szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},},
	[3]={szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},},
	[4]={szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},},
	[5]={szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},},
	[6]={szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},},
	[7]={szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},},
}
-- ��ȡ�ϴ��鱾��������700ʱ�Ľ��ڽ���
function pActivity:JinwuAward()
	print("Nh�n ph�n th��ng �� ph� Kim �")
	local szTitle = "Xin h�y l�a ch�n �� Ph� m� ng��i mu�n nh�n:"
	local tbOpt = {}
	for nIndex=1,getn(%tbJinwu) do
		tinsert(tbOpt, {%tbJinwu[nIndex].szName, self.SelectJinWu,{self, nIndex}})
	end
	tinsert(tbOpt, {"�� ta suy ngh� l�i ��!", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:SelectJinWu(nIndex)
	local nFreeItemCellLimit = 1
	if CalcFreeItemCellCount() < nFreeItemCellLimit then
		Say(format("�� ��m b�o an to�n cho t�i s�n c�a b�n, xin h�y ��m b�o r�ng �t nh�t <color=yellow>%d <color> � tr�ng h�nh trang",nFreeItemCellLimit))
		return 
	end
	tbAwardTemplet:Give(%tbJinwu[nIndex], 1, {%szEventName, "SuDung700LanCuonSach_JinWu"})
	self:AddTask(%TSK_JinwuAward, 1)
end

function pActivity:UseZhienhua()
	local tbUseLog = {
		[10] = "SuDungHoaTriAn10Lan",
		[20] = "SuDungHoaTriAn20Lan",
		}
	self:AddTask(%TSK_UsedZhienhua,1)
	local nUseTime = self:GetTask(%TSK_UsedZhienhua)
	if tbUseLog[nUseTime] then
		%tbLog:PlayerActionLog(%szEventName, tbUseLog[nUseTime])
		tbVngTransLog:Write("201111_20Thang11/", 16, tbUseLog[nUseTime], "N/A", 1)
	end
	Msg2Player(format("S� d�ng th�nh c�ng <color=yellow>%s<color>, nh�n ���c <color=yellow>%d<color> giao n�p <color=yellow>%s<color> l�n","Hoa Tri �n",%nPerZhienhua,"Gi�y Tr�ng"))
end

function pActivity:UseTianyuhun()
	local tbUseLog = {
		[10] = "SuDungThienVuHon10Lan",
		[20] = "SuDungThienVuHon20Lan",
		}
	self:AddTask(%TSK_UsedTianyuhun,1)
	local nUseTime = self:GetTask(%TSK_UsedTianyuhun)
	if tbUseLog[nUseTime] then
		%tbLog:PlayerActionLog(%szEventName, tbUseLog[nUseTime])
		tbVngTransLog:Write("201111_20Thang11/", 16, tbUseLog[nUseTime], "N/A", 1)
	end
	Msg2Player(format("S� d�ng th�nh c�ng <color=yellow>%s<color>, nh�n ���c <color=yellow>%d<color> giao n�p <color=yellow>%s<color> l�n","Thi�n V� H�n",%nPerTianyuhun,"Cu�n S�ch"))
end

function pActivity:CheckBookLimit()
	local nMaxCount = %nMaxBookCount + self:GetTask(%TSK_UsedTianyuhun) * %nPerTianyuhun - self:GetTask(%TSK_HandInBook)
	if nMaxCount < 1 then
		Say("��i hi�p �� s� d�ng t�i �a v�t ph�m n�y, kh�ng th� s� d�ng th�m!")
		return nil
	end
	return 1
end

function pActivity:UseBook()
	self:AddTask(%TSK_HandInBook,1)	
	local tbTranslog = {strFolder = "201111_20Thang11/", nPromID = 16, nResult = 1}
	tbAwardTemplet:Give(%tbBookAward, nCount, {%szEventName, "SuDungCuonSachNhanVatPham", tbTranslog})
	local nUseTime = self:GetTask(%TSK_HandInBook)
	--print(nUseTime)
	if %tbBookPartAward[nUseTime] then
		tbAwardTemplet:Give(%tbBookPartAward[nUseTime], 1, {%szEventName,%tbBookPartAwardLog[nUseTime]})
		tbVngTransLog:Write("201111_20Thang11/", 16, %tbBookPartAwardLog[nUseTime], "N/A", 1)
	end	
end

pActivity.nPak = curpack()
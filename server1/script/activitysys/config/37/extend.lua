Include("\\script\\activitysys\\config\\37\\head.lua")
Include("\\script\\activitysys\\config\\37\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")


function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {176,1566,2944,},
		[2] = {78,1572,3232,},
		[3] = {162,1588,3145,},
	}
	local tbNpc = {	
			szName = "�ng Gi� Noel", 
			nLevel = 95,
			nNpcId = 1880,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc, nMapId, nPosX * 32, nPosY * 32)	
	end
end

function pActivity:YDBZ_GiveStar(YDBZ_mission_match, nTeam)
	local pidx,nj
	local tbPlayer = {}
	local nPlayerCount = 0
	local nOldPlayer = PlayerIndex
	
	for nj = 1, 10 do
		idx , pidx = GetNextPlayer(YDBZ_mission_match, idx, nTeam )
		if pidx > 0 then
			PlayerIndex = pidx
			if PlayerFunLib:CheckTotalLevel(150, "", ">=") == 1 then
				nPlayerCount = nPlayerCount + 1
				tbPlayer[nPlayerCount] = {pidx, 1}
			end
		end
		
		if idx == 0 then
			break;
		end
	end 
	
	for nj = 1, nPlayerCount do
		CallPlayerFunction(tbPlayer[nj][1], PlayerFunLib.GetItem, PlayerFunLib, ITEM_XMAS_STAR, 1, EVENT_LOG_TITLE, "YDBZ_GiveStar")
	end	
end

-- ������ȡ����
function pActivity:GiveXmasTrousers()
	local nDate = self:GetTask(TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then	-- ���һ�μ�¼��ʱ�����ȡʱ����ͬһ��
		nLastOnLineTime = self:GetTask(TSK_LAST_ONLINETIME)
		nCurrentOnLineTime = GetGameTime()
		-- ����ʱ���ɻ�õ�ʥ�����ӵĸ���
		nHour = floor((nCurrentOnLineTime - nLastOnLineTime) / 60 / 60)
		nCurrentOnLineTime = nLastOnLineTime + nHour * 60 * 60
	else -- ���һ�μ�¼ʱ�����ȡ��ʱ����ͬһ��
		local nCurrentH = tonumber(GetLocalDate("%H"))
		local nCurrentM = tonumber(GetLocalDate("%M"))
		local nCurrentS = tonumber(GetLocalDate("%S"))
		nHour = nCurrentH 
		nCurrentOnLineTime = GetGameTime() - nCurrentM * 60 - nCurrentS
	end
	
	nCount = nHour * 10
	if nCount <= 0 then
		Msg2Player("Kho�ng c�ch nh�n l�n tr��c, th�i gian tr�n m�ng c�a ng��i ch�a �� 1 gi�, kh�ng th� nh�n")
		return 
	end
	local nMaxCount = 50 -  self:GetTaskDaily(TSK_XMAS_TROUSERS_DAILY)
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("H�m nay ng��i kh�ng th� nh�n n�a, ng�y mai h�y quay l�i.")
		return 
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
	
	-- ������ȡ��ʱ��
	self:SetTask(TSK_LAST_ONLINETIME,nCurrentOnLineTime)
	self:SetTask(TSK_LAST_ONLINEDATA,nNowDate)

	PlayerFunLib:GetItem(ITEM_XMAS_TROUSERS,nMaxCount, EVENT_LOG_TITLE, "GiveXmasTrousers")
	--Ho�t ��ng 3 - modified by DinhHQ - 20111215
	local tbPumpkinPie = {szName="B�nh b� ��",tbProp={6,1,30166,1,0,0},nExpiredTime=20120101,}
	PlayerFunLib:GetItem(tbPumpkinPie,floor(nMaxCount/10)*40, EVENT_LOG_TITLE, "GivePumpkinPie")
	self:AddTaskDaily(TSK_XMAS_TROUSERS_DAILY, nMaxCount)
end


function pActivity:CheckRandom(nSuccess, szFailLog)
	local rcur=random(1,100)
	if rcur <= nSuccess then
		return 1
	else
		Msg2Player("Th�t ��ng ti�c, l�n h�p th�nh n�y �� th�t b�i, xin h�y th� l�i!")
		szFailLog = szFailLog or ""
		%tbLog:PlayerActionLog(szFailLog, EVENT_LOG_TITLE)
		return 0
	end
end

-- �ϳ�ʥ�����
function pActivity:ComposeXmasGift(nCount)
	for i=1,nCount do
		local nSuccess = 70
		if self:CheckRandom(nSuccess,"GhepHopQuaNoelThatBai") == 1 then
			PlayerFunLib:GetItem({szName = "H�p qu� gi�ng sinh", tbProp={6,1,3080,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "GhepHopQuaNoelThanhCong")
		end
	end
end

-- �ϳ�ʥ�����ˣ�С��
function pActivity:ComposeXmasPerson_S(nCount)
	for i=1,nCount do
	--Change request Event Noel - Modified by DinhHQ - 20111129
		local nSuccess = 70
		if self:CheckRandom(nSuccess, "GhepNguoiTuyet(nho)ThatBai") == 1 then
			PlayerFunLib:GetItem({szName = "�ng Gi� Noel (nh�)", tbProp={6,1,3077,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "GhepNguoiTuyet(nho)ThanhCong")
		end
	end
end

function pActivity:GiveItemAward(tbAward, tbComposeLog, szLogAction, nTaskId)
	tbAwardTemplet:Give(tbAward, 1 , {EVENT_LOG_TITLE, szLogAction})
	local nCount = self:GetTask(nTaskId) + 1
	self:SetTask(nTaskId, nCount)
	if tbComposeLog[nCount] then
		tbLog:PlayerActionLog(tbComposeLog[nCount], EVENT_LOG_TITLE)
	end
end

function pActivity:UseXmasPerson_S()
	local tbAward = 
	{
		[1]={nExp=2000000,},
	}
	local tbUseLog = {
		[500] = "SuDung500LanNguoiTuyet(nho)",
		[1000] = "SuDung1000LanNguoiTuyet(nho)",
		}

	self:GiveItemAward(tbAward, tbUseLog, "UseXmasPerson_S", TSK_XMAS_PERSON_S_LIMIT)
end

function pActivity:UseXmasPerson_M()
	local tbAward = 
	{
		[1]={szName="Huy�n Tinh Kho�ng Th�ch ",tbProp={6,1,147,1,0,0},},
		[2]={nExp_tl=1,},
	}
	local tbUseLog = {
		[50] = "SuDung50LanNguoiTuyet(trung)",
		[100] = "SuDung100LanNguoiTuyet(trung)",
		[150] = "SuDung150LanNguoiTuyet(trung)",
		[200] = "SuDung200LanNguoiTuyet(trung)",
		}
	
	self:GiveItemAward(tbAward, tbUseLog, "SuDungNguoiTuyet(trung)NhanVatPham", TSK_XMAS_PERSON_M_LIMIT)
end

function pActivity:UseXmasPerson_L()
	local tbAward = 
	{
		[1]={nExp=10e6,},
		[2]={
			{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.04},
			{szName="Kim � Kim B�i",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.3},
			{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
			{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
			{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
			{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
			{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
			{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
			{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
			{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
			{szName="Kim Hoa Chi B�o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.2},
			{szName="Ph� Th�y Chi B�o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.1},
			{szName="Phong V�n Chi B�o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.02},
			{szName="H�ng bao An khang",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
			{szName="H�ng bao Sum v�y",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
			{szName="T�ng Kim Chi�u Binh L�nh",tbProp={6,1,30083,1,0,0},nCount=2,nRate=2},
			{szName="H�n Nguy�n Linh L�",tbProp={6,1,2312,1,0,0},nCount=1,nRate=2},
			{szName="H�i long ch�u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2},
			{szName="H�i thi�n t�i t�o l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2},
			{szName="Ho�ng Kim �n (C��ng h�a)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="Ho�ng Kim �n (Nh��c h�a)",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
			{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
			{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
			{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=2},
			{szName="C�n Kh�n T�o H�a �an (��i) ",tbProp={6,1,215,1,0,0},nCount=5,nRate=3},
			{szName="T� M�ng Chi B�o (N�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={1,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (�o)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={5,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (H�ng Li�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={0,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (Ng�c B�i)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={8,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (Gi�y)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={7,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (Bao Tay)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={3,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (Nh�n Tr�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (Nh�n D��i)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (�ai L�ng)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.1,tbParam={4,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (V� Kh�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,tbParam={6,0,0,0,0,0}},
			{szName = "�i�m Kinh Nghi�m", nExp=8000000,nRate=35},
			{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=16},
			{szName = "�i�m Kinh Nghi�m", nExp=15000000,nRate=6},
			{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=1.37},
			{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=0.5},
			{szName = "�i�m Kinh Nghi�m", nExp=100000000,nRate=0.5},
			{szName = "�i�m Kinh Nghi�m", nExp=200000000,nRate=0.01},
		},		
	}
	local tbUseLog = {
		[50] = "SuDung50LanNguoiTuyet(lon)",
		[100] = "SuDung100LanNguoiTuyet(lon)",
		[200] = "SuDung200LanNguoiTuyet(lon)",
		[300] = "SuDung300LanNguoiTuyet(lon)",
		[400] = "SuDung400LanNguoiTuyet(lon)",
		[500] = "SuDung500LanNguoiTuyet(lon)",
		[600] = "SuDung600LanNguoiTuyet(lon)",
		[700] = "SuDung700LanNguoiTuyet(lon)",
		[800] = "SuDung800LanNguoiTuyet(lon)",	
		}
	local tbExtAward = {
		[50] = {nExp=20000000,},
		[100] = {nExp=20000000,},
		[200] = {nExp=20000000,},
		[300] = {nExp=20000000,},
		[400] = {nExp=30000000,},
		[500] = {nExp=40000000,},
		[600] = {nExp=50000000,},
		[700] = {nExp=60000000,},
		[800] = {nExp=100000000,},
	}
	--B� sung ph�n th��ng ��t m�c s� d�ng ng��i tuy�t l�n - Modified By DinhHQ - 20111129
	local nCount = self:GetTask(TSK_XMAS_PERSON_L_LIMIT) + 1
	if tbExtAward[nCount] then
		tbAwardTemplet:Give(tbExtAward[nCount], 1 , {EVENT_LOG_TITLE, tbUseLog[nCount]})
	end
	self:GiveItemAward(tbAward, {}, "SuDungNguoiTuyet(lon)NhanVatPham", TSK_XMAS_PERSON_L_LIMIT)	
end

function pActivity:UseXmasGift()
	local tbAward = 
	{
		[1]={nExp=1e6,},		
	}
	local tbUseLog = {
		[1000] = "SuDung1000HopQuaNoel",
		}
		
	self:GiveItemAward(tbAward, tbUseLog, "UseXmasGift", TSK_XMAS_GIFT_LIMIT)	
end

function pActivity:UseXmasCake()
	local tbAward = 
	{
		nExp=500000,
	}
	local tbUseLog = {
		[1000] = "SuDung1000BanhGiangSinh",
		}
		
	self:GiveItemAward(tbAward, tbUseLog, "UseXmasCake", TSK_XMAS_CAKE_LIMIT)	
end

function pActivity:PlayerOnLogin()
	local nDate = self:GetTask(TSK_LAST_ONLINEDATA)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0
	if nDate ~= nNowDate then	-- �������¼����ͬһ��
		nCurrentOnLineTime = GetGameTime()
		self:SetTask(TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		self:SetTask(TSK_LAST_ONLINEDATA,nNowDate)
	end
end

function pActivity:CheckTimeGetCompensation()
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate < 201112020900 or nNowDate >= 201112040000 then
		Talk(1, "", "Xin th� l�i, hi�n t�i �� qua th�i gian nh�n th��ng")
		return nil
	end
	return 1
end
--Ho�t ��ng th� 3 - Modified By DinhHQ - 20111215
function pActivity:CheckTimeGetFreeExp()
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate < 201112240000 or nNowDate >= 201112252400 then
		Talk(1, "", "Xin th� l�i, hi�n t�i kh�ng ph�i l� th�i gian nh�n th��ng")
		return nil
	end
	return 1
end

function pActivity:UseXmasPerson_Pink()
	local nUsedCount = GetTask(2916)
	local nCurCount = nUsedCount + 1
	if nCurCount > 1500 then
		Talk(1, "", "S� d�ng v�t ph�m ��t gi�i h�n, kh�ng th� s� d�ng th�m.")
		return nil
	end
	SetTask(2916, nCurCount)	
	if GetTask(2916) ~= nCurCount then
		return nil
	end
	local tbExpAward = {
		[1] = {szName = "�i�m kinh nghi�m", nExp = 6e6},
		[2] = {{szName="Ng�i Sao",tbProp={6,1,3081,1,0,0},nCount=1,nRate=40, nExpiredTime = 20120101},},
	}
	tbAwardTemplet:Give(tbExpAward, 1 , {EVENT_LOG_TITLE, "SuDungOngGiaNoelHong"})
	local tbBonusAward = {
		[100] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 5e6}, "PhanThuongSuDung100OngGiaNoelHong"},
		[200] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 10e6}, "PhanThuongSuDung200OngGiaNoelHong"},
		[300] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 10e6}, "PhanThuongSuDung300OngGiaNoelHong"},
		[400] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 20e6}, "PhanThuongSuDung400OngGiaNoelHong"},
		[500] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 20e6}, "PhanThuongSuDung500OngGiaNoelHong"},
		[600] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 20e6}, "PhanThuongSuDung600OngGiaNoelHong"},
		[700] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 20e6}, "PhanThuongSuDung700OngGiaNoelHong"},
		[800] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 30e6}, "PhanThuongSuDung800OngGiaNoelHong"},
		[900] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 30e6}, "PhanThuongSuDung900OngGiaNoelHong"},
		[1000] = {{szName = "M�t n� V��ng Gi�", tbProp = {0,11,561,1,0,0}, nExpiredTime = 20160, nCount=1}, "PhanThuongSuDung1000OngGiaNoelHong"},
		[1100] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 40e6}, "PhanThuongSuDung1100OngGiaNoelHong"},
		[1200] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 40e6}, "PhanThuongSuDung1200OngGiaNoelHong"},
		[1300] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 40e6}, "PhanThuongSuDung1300OngGiaNoelHong"},
		[1400] = {{szName = "�i�m kinh nghi�m kh�ng c�ng d�n", nExp = 50e6}, "PhanThuongSuDung1400OngGiaNoelHong"},
		[1500] = {{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1}, "PhanThuongSuDung1500OngGiaNoelHong"},
	}
	if tbBonusAward[nCurCount] then
		tbAwardTemplet:Give(tbBonusAward[nCurCount][1], 1 , {EVENT_LOG_TITLE, tbBonusAward[nCurCount][2]})
		Msg2Player(format("Ch�c m�ng c�c h� s� d�ng ��n %d v�t ph�m �ng gi� Noel h�ng, nh�n ���c ph�n th��ng %s", nCurCount, tbBonusAward[nCurCount][1].szName))
	end
	local tbItemAward = {
		{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.1},
		{szName="Kim � Kim B�i",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.3},
		{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
		{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
		{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
		{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
		{szName="Kim Hoa Chi B�o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.3},
		{szName="Ph� Th�y Chi B�o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
		{szName="Phong V�n Chi B�o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.03},
		{szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="B�ch C�u Ho�n ��c bi�t",tbProp={6,1,1157,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="K�ch C�ng Tr� L�c Ho�n",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1.2},
		{szName="Ng�c Qu�n",tbProp={6,1,2311,1,0,0},nCount=1,nRate=1.5},
		{szName="Phi�n V� ",tbProp={0,10,7,1,0,0},nCount=1,nRate=0.1,nExpiredTime=259200},
		{szName="Phi�n V� ",tbProp={0,10,7,1,0,0},nCount=1,nRate=0.1,nExpiredTime=129600},
		{szName="�m D��ng Ho�t Huy�t ��n",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1.2},
		{szName="H�i thi�n t�i t�o l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1.6},
		{szName="Ho�ng Kim �n (C��ng h�a)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="Ho�ng Kim �n (Nh��c h�a)",tbProp={0,3221},nCount=1,nRate=0.11,nQuality = 1,nExpiredTime=10080,},
		{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName = "�i�m Kinh Nghi�m", nExp=5000000,nRate=40},
		{szName = "�i�m Kinh Nghi�m", nExp=8000000,nRate=13},
		{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=10},
		{szName = "�i�m Kinh Nghi�m", nExp=15000000,nRate=5},
		{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=1},
		{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=0.5},
		{szName = "�i�m Kinh Nghi�m", nExp=100000000,nRate=0.01},
	}
	tbAwardTemplet:Give(tbItemAward, 1 , {EVENT_LOG_TITLE, "SuDungOngGiaNoelHong"})
	
end

pActivity.nPak = curpack()
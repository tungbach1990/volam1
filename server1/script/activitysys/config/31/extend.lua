Include("\\script\\activitysys\\config\\31\\head.lua")
Include("\\script\\lib\\log.lua")

pActivity.tbNpc = {}

function pActivity:UseBlueBox()
	local tbAward
	tbAward = 
	{
		[1]={szName="S�a T��i",tbProp={6,1,2851,1,0,0},nRate = 40.0,nExpiredTime=20110630,},
		[2]={szName="���ng tinh",tbProp={6,1,2852,1,0,0},nRate = 40.0,nExpiredTime=20110630,},
		[3]={szName="B�t m� ",tbProp={6,1,2853,1,0,0},nRate = 20.0,nExpiredTime=20110630,},
	}
	tbAwardTemplet:Give(tbAward, 1, {"SinhNhatVoLamTruyenKy", "SuDungHopQua(Xanh)"})
end

function pActivity:UseRedBox()
	local tbAward
	tbAward = 
	{
		[1]={szName="SoCoLa",tbProp={6,1,2854,1,0,0},nRate = 30,nExpiredTime=20110630,},
		[2]={szName="B�",tbProp={6,1,2855,1,0,0},nRate = 40,nExpiredTime=20110630,},
		[3]={szName="Kem",tbProp={6,1,2856,1,0,0},nRate = 30,nExpiredTime=20110630,},
	}
	tbAwardTemplet:Give(tbAward, 1, {"SinhNhatVoLamTruyenKy", "SuDungHopQua(Do)"})
end

function pActivity:GetCake(nCount)
	local tbAward
	tbAward = 
	{
		[1]={szName="B�nh Sinh Nh�t nh�",tbProp={6,1,2860,1,0,0},nRate = 40.0,nExpiredTime=20110630,},
		[2]={szName="B�nh Sinh Nh�t L�n",tbProp={6,1,2861,1,0,0},nRate = 60.0,nExpiredTime=20110630,},
	}
	for i = 1, nCount do
		tbAwardTemplet:Give(tbAward, 1, {"SinhNhatVoLamTruyenKy", "HopThanhBanhSinhNhat"})
	end
end

function pActivity:GetRabbit()
	local rtotal = 10000000
	local rcur=random(1,rtotal)
	local szLuaFile = "\\script\\activitysys\\config\\31\\whiterabbit.lua"
	if (rcur > rtotal/2) then 
		--��������
		local x ,y, worldindex = GetPos()
		local nW, nX, nY =GetWorldPos()
		local nNpcIndex = AddNpc(1799, 1, worldindex, x + 5, y + 5, "Th� ")
		SetNpcScript(nNpcIndex, szLuaFile)	
		SetNpcTimer(nNpcIndex, 60*18)
		self.tbNpc[nNpcIndex] = GetName()
		%tbLog:PlayerActionLog("SinhNhatVoLamTruyenKy","ThoXuatHien",  nW, nX, nY)
	end
	
end

function pActivity:UseNaiYouBing()
	print(TSKG_NaiYouBing)
	if(self:CheckTask(1, 500,"","==") == 1) then
		PlayerFunLib:AddExp(5000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhKem500Lan")
	elseif (self:CheckTask(1, 1000,"","==") == 1) then
		PlayerFunLib:AddExp(10000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhKem1000Lan")
	end
	PlayerFunLib:AddExp(1000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhKem")
end

function pActivity:UseXiaoDanGao()
	--print(TKSG_XiaoDanGao)
	if(self:CheckTask(2, 20,"","==") == 1) then
		PlayerFunLib:AddExp(2000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Nho)20Lan")
	elseif (self:CheckTask(2, 40,"","==") == 1) then
		PlayerFunLib:AddExp(4000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Nho)40Lan")
	elseif (self:CheckTask(2, 60,"","==") == 1) then
		PlayerFunLib:AddExp(6000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Nho)60Lan")
	elseif (self:CheckTask(2, 100,"","==") == 1) then
		PlayerFunLib:AddExp(10000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Nho)100Lan")
	elseif (self:CheckTask(2, 200,"","==") == 1) then
		PlayerFunLib:AddExp(15000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Nho)200Lan")
	elseif (self:CheckTask(2, 300,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Nho)300Lan")
	elseif (self:CheckTask(2, 400,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Nho)400Lan")
	elseif (self:CheckTask(2, 500,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Nho)500Lan")
	end
	PlayerFunLib:AddExp(4000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Nho)")
	self:Vn_GetItemAward("PhanThuongItemSuDungBanhSinhNhat(Nho)")
end
	
function pActivity:UseDaDanGao()

--	if(self:CheckTaskDaily(3, 10,"","==") == 1) then
--		PlayerFunLib:AddExp(10000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Lon)10Lan")
--	end
	PlayerFunLib:AddExp(8000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhat(Lon)")
	self:Vn_GetItemAward("PhanThuongItemSuDungBanhSinhNhat(Lon)")
end

function pActivity:UseTeBieDanGao()

	if (self:CheckTask(4, 100,"","==") == 1) then
		PlayerFunLib:AddExp(10000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhatDacBiet100Lan")
	elseif (self:CheckTask(4, 200,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhatDacBiet200Lan")
	elseif (self:CheckTask(4, 300,"","==") == 1) then
		PlayerFunLib:AddExp(30000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhatDacBiet300Lan")
	elseif (self:CheckTask(4, 400,"","==") == 1) then
		PlayerFunLib:AddExp(40000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhatDacBiet400Lan")
	end
	PlayerFunLib:AddExp(15000000,1,"SinhNhatVoLamTruyenKy","SuDungBanhSinhNhatDacBiet")
	
	self:Vn_GetItemAward("PhanThuongItemSuDungBanhSinhNhatDacBiet")	
end

--��ӻNPC
function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {37,1708,3119,},
		[2] = {37,1699,3128,},
	}
	local tbNpc = {
		[1] = {
			szName = "B�nh Sinh Nh�t", 
			nLevel = 95,
			nNpcId = 1797,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "�o�n ��i Nh�n", 
			nLevel = 95,
			nNpcId = 1798,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			}
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
	end
end	

function pActivity:YDBZ_GiveRedBox(YDBZ_mission_match, nTeam)

	local pidx,nj
	local tbPlayer = {}
	local nPlayerCount = 0
	local nOldPlayer = PlayerIndex
	
	AddStatData("jxshengri_yandibosschanchuhongselihe", 1)
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
	
	for i = nPlayerCount + 1, 30 do   
		local p = random(1,nPlayerCount)
		tbPlayer[p][2] = tbPlayer[p][2] + 1
	end	

	for nj = 1, nPlayerCount do
		CallPlayerFunction(tbPlayer[nj][1], PlayerFunLib.GetItem, PlayerFunLib, {tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,}, tbPlayer[nj][2], {"", ""})

			
	end
	
	PlayerIndex = oldplayer		
end

function pActivity:GetFanYu()
	
	local nDate = tonumber(GetLocalDate("%Y12%d"))
	print(nDate)
	
	PlayerFunLib:GetItem({tbProp={0,10,7,1,0,0},nExpiredTime=nDate,},1,"SinhNhatVoLamTruyenKy","DoiVatPhamLongThoLayPhienVu")
end

function pActivity:GiveRedBox(nCount, strMaiDian, strActionLog)
	
	PlayerFunLib:GetItem({tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,}, nCount, "SinhNhatVoLamTruyenKy", strActionLog)
	AddStatData(strMaiDian, 1)
end
	

function pActivity:Vn_GetItemAward(strActionLog)
	local tbItemAward = 
		{
			{szName="�� Ph� T� M�ng Kh�i",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
			{szName="�� Ph� T� M�ng Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
			{szName="�� Ph� T� M�ng Y�u ��i",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
			{szName="�� Ph� T� M�ng H� Uy�n",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
			{szName="�� Ph� T� M�ng B�i",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.3},
			{szName="�� Ph� T� M�ng H�i",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.3},
			{szName="�� Ph� T� M�ng H�ng Li�n",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.15},
			{szName="�� Ph� T� M�ng Th��ng Gi�i Ch�",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
			{szName="�� Ph� T� M�ng H� Gi�i Ch�",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
			{szName="�� Ph� T� M�ng Kh� Gi�i",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
			{szName="Huy�n Vi�n L�nh",tbProp={6,1,2351,1,0,0},nCount=1,nRate=0.3},
			{szName="T� M�ng L�nh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.150},
			{szName="H�nh Hi�p L�nh",tbProp={6,1,2566,1,0,0},nCount=3,nRate=2},
			{szName="L�nh B�i Th�y T�c",tbProp={6,1,2745,1,0,0},nCount=1,nRate=1.5,nExpiredTime=20160},
			{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
			{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1.5,nExpiredTime=20160},
			{szName="T�ng Kim Chi�u Binh L� Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="M�c B�c Truy�n T�ng L�nh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="H�i long ch�u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="Huy�n Thi�n C�m Nang",tbProp={6,1,2355,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=1,nRate=2.185},
			{szName="B�ch Ni�n Tr�n L�",tbProp={6,1,2266,1,0,0},nCount=1,nRate=1.5,nExpiredTime=20160},
			{szName="Thi�n Ni�n Tr�n L�",tbProp={6,1,2267,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="V�n Ni�n Tr�n L�",tbProp={6,1,2268,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
			{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=25},
			{szName="Long Huy�t Ho�n",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1.5,nExpiredTime=20160},
			{szName="Thi�n tinh b�ch c�u ho�n",tbProp={6,1,2183,1,0,0},nCount=1,nRate=1},
			{szName="B�ch C�u Ho�n ��c bi�t",tbProp={6,1,1157,1,0,0},nCount=1,nRate=1},
			{szName="H�i thi�n t�i t�o l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1},
			{szName="Ng�c Qu�n",tbProp={6,1,2311,1,0,0},nCount=1,nRate=1},
			{szName="H�ng bao Sum v�y",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.17},
			{szName="H�ng bao An khang",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.15},
			{szName = "�i�m Kinh Nghi�m", nExp=4000000,nRate=19.045},
			{szName = "�i�m Kinh Nghi�m", nExp=6000000,nRate=16},
			{szName = "�i�m Kinh Nghi�m", nExp=8000000,nRate=10},
			{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=3},
			{szName="T� Kim Ch�n ��n",tbProp={6,1,2263,1,0,0},nCount=1,nRate=0.15,tbParam={2000000000}},
			{szName="Huy�n Ch�n ��n",tbProp={6,1,1678,1,0,0},nCount=1,nRate=0.15,tbParam={1500000000}},
			{szName="Huy�t Ch�n ��n",tbProp={6,1,1677,1,0,0},nCount=1,nRate=0.15,tbParam={1000000000}},
			{szName="B�ch Ch�n ��n",tbProp={6,1,1676,1,0,0},nCount=1,nRate=0.15,tbParam={500000000}},
		}
	tbAwardTemplet:Give(tbItemAward, 1, {"SinhNhatVoLamTruyenKy", strActionLog})
end

function pActivity:Vn_CheckPLDTime()
	local nHour = tonumber(GetLocalDate("%H"));
	local tb_sptime = {
		[10] = 1,
		[14] = 1,
		[16] = 1,
		[18] = 1,
		[20] = 1,
	};
	if (tb_sptime[nHour] and tb_sptime[nHour] == 1) then
		return 1
	else
		return nil
	end
end

function pActivity:Vn_AwardOnSJMatchCount()
	PlayerFunLib:AddTaskDaily(2725, 1)
	local nSJDailyMatchCount = PlayerFunLib:GetTaskDailyCount(2725)
	if nSJDailyMatchCount <= 0 or nSJDailyMatchCount > 2 then
		return
	end
	local nAwardCount = 0
	local strAction = ""
	if nSJDailyMatchCount == 1 then
		nAwardCount = 10
		strAction = "HoanThanhTranTKDauTien"
	elseif nSJDailyMatchCount == 2 then
		nAwardCount = 20
		strAction = "HoanThanhTranTKThuHai"
	end
	PlayerFunLib:GetItem({tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,},nAwardCount,"SinhNhatVoLamTruyenKy",strAction)
end

function pActivity:Vn_AwardOnCOTMatchCount()
	PlayerFunLib:AddTaskDaily(2726, 1)
	local nCOTDailyMatchCount = PlayerFunLib:GetTaskDailyCount(2726)
	if nCOTDailyMatchCount <= 0 or nCOTDailyMatchCount > 3 then
		return
	end	
	local nAwardCount = 0
	local strAction = ""
	if nCOTDailyMatchCount == 1 then
		nAwardCount = 5
		strAction = "HoanThanhVuotAiLan1"
	elseif nCOTDailyMatchCount == 2 then
		nAwardCount = 10
		strAction = "HoanThanhVuotAiLan2"
	elseif nCOTDailyMatchCount == 3 then
		nAwardCount = 15
		strAction = "HoanThanhVuotAiLan3"
	end
	PlayerFunLib:GetItem({tbProp={6,1,2863,1,0,0},nExpiredTime=20110630,},nAwardCount,"SinhNhatVoLamTruyenKy",strAction)
end
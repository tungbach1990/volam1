Include("\\script\\activitysys\\config\\33\\head.lua")
Include("\\script\\activitysys\\config\\33\\variables.lua")
Include("\\script\\lib\\objbuffer_head.lua")

pActivity.tbNpc = {}
pActivity.nPak = curpack()
SeptemperRewardsCityMapID = nil

function SetSeptemperRewardsCityMapID(handle)
	
	local CityMapID = ObjBuffer:PopObject(handle);
	SeptemperRewardsCityMapID = CityMapID;
end
	

--��ӻNPC
function pActivity:AddInitNpc()
	local tbNpcPos = {
		[1] = {37,1749,3076,},
		[2] = {37,1707,3120,},
	}
	local tbNpc = {
		[1] = {
			szName = "T��ng ��i", 
			nLevel = 95,
			nNpcId = 1785,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			},
		[2] = {
			szName = "H�ng Nga", 
			nLevel = 95,
			nNpcId = 1867,
			nIsboss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua",
			}
	}
	for i=1,getn(tbNpcPos) do
		local nMapId, nPosX, nPosY = unpack(tbNpcPos[i])
		basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
	end
end	

function pActivity:HandinString(nComposeCount)
	nComposeCount = nComposeCount or 1
	
	if(self:CheckTask(1, 0,"","==") == 1) then
		AddStatData("jxjiuyue_shangjiaodiyigeshengzi", 1)
	end
	
	if(self:CheckTask(1, 500,"","<") == 1) and 
		(self:CheckTask(1, 500 - nComposeCount,"",">=") == 1) then
		PlayerFunLib:AddExp(5000000,1,"Event_QuocKhanhVN","NopVatPhamDayThung500Lan")
		tbVngTransLog:Write(%strQK_TranslogFolder, %nQK_PromotionID, "NopDayThung500Lan", "5000000 exp", 1)
	end
	
	if(self:CheckTask(1, 1000,"","<") == 1)  and 
		(self:CheckTask(1, 1000 - nComposeCount,"",">=") == 1)then
		PlayerFunLib:AddExp(5000000,1,"Event_QuocKhanhVN","NopVatPhamDayThung1000Lan")
		tbVngTransLog:Write(%strQK_TranslogFolder, %nQK_PromotionID, "NopDayThung1000Lan", "5000000 exp", 1)
		AddStatData("jxjiuyue_shangjiaoshengzidadaoshangxian", 1)
	end 	
	
	for i = 1, nComposeCount do
		PlayerFunLib:AddExp(1000000,1,"Event_QuocKhanhVN","NopDayThung")
		tbVngTransLog:Write(%strQK_TranslogFolder, %nQK_PromotionID, "NopDayThung", "1000000 exp", 1)		
	end
end

function pActivity:ConvertFireworks(nComposeCount)
	nComposeCount = nComposeCount or 1
	AddStatData("jxjiuyue_guoqinghuapao", nComposeCount)
end

function pActivity:ConvertMooncake(nComposeCount)
	nComposeCount = nComposeCount or 1
	AddStatData("jxjiuyue_hanyueyuebing", nComposeCount)
end

function pActivity:UseFirworks()
	
	local nTime = tonumber(date("%H"))
	local multiple = 1
	if SeptemperRewardsCityMapID ~= nil and nTime == 20 then
		if PlayerFunLib:CheckInMap(SeptemperRewardsCityMapID) == 1 then
			multiple = 1.1
		else
			multiple = 1
		end
	end		
	
	local tbAwardExp = {
			[1]={nExp_tl=1,nRate = 50.0,nCount = 3000000*multiple,},
			[2]={nExp_tl=1,nRate = 45.0,nCount = 5000000*multiple,},
			[3]={nExp_tl=1,nRate = 4.0,nCount = 10000000*multiple,},
			[4]={nExp_tl=1,nRate = 1.0,nCount = 200000000*multiple,},
		}
		
	local tbAward = {
				{szName="�� Ph� T� M�ng Kh�i",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng Y�u ��i",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng H� Uy�n",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng B�i",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng H�i",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng H�ng Li�n",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.3},
				{szName="�� Ph� T� M�ng Th��ng Gi�i Ch�",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
				{szName="�� Ph� T� M�ng H� Gi�i Ch�",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
				{szName="�� Ph� T� M�ng Kh� Gi�i",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
				{szName="Thi�n ni�n th�t tinh th�o",tbProp={6,1,1675,1,0,0},nCount=1,nRate=0.1},
				{szName="T� M�ng L�nh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
				{szName="H�n Nguy�n Linh L�",tbProp={6,1,2312,1,0,0},nCount=1,nRate=0.4},
				{szName="Th�n H�nh Ph�",tbProp={6,1,1266,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
				{szName="H�i thi�n t�i t�o l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
				{szName="B�c ��u truy�n c�ng thu�t",tbProp={6,1,1672,1,0,0},nCount=1,nRate=0.3},
				{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=1,nRate=3},
				{szName="Thi�n tinh b�ch c�u ho�n",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="B�ch C�u Ho�n ��c bi�t",tbProp={6,1,1157,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=26.54},
				{szName="H�i long ch�u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="Vi�m �� L�nh",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="T�ng Kim Chi�u Binh L� Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="Ng�c Tr�ng Luy�n",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2},
				{szName="Phi phong Kinh L�i (D�ch chuy�n t�c th�i)",tbProp={0,3470},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
				{szName="H�i th�nh ph� (l�n) ",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.1},
				{szName = "�i�m Kinh Nghi�m", nExp=6000000,nRate=30},
				{szName = "�i�m Kinh Nghi�m", nExp=9000000,nRate=25},
				{szName="H�ng bao Sum v�y",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
				{szName="H�ng bao An khang",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
				{szName="T� M�ng Th��ng Gi�i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {2}},
				{szName="T� M�ng H� Gi�i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {9}},
				{szName="T� M�ng H�ng Li�n Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {0}},
				{szName="T� M�ng H�i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {7}},
				{szName="T� M�ng Ng�c B�i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {8}},
				{szName="T� M�ng H� Uy�n Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {3}},
				{szName="T� M�ng Y�u ��i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {4}},
				{szName="T� M�ng Kim Kh�i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {5}},
				{szName="T� M�ng Ph�t Qu�n Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {1}},
			}		
	if (self:CheckTask(4, 20,"","==") == 1) then
		PlayerFunLib:AddExp(2000000,1,"Event_QuocKhanhVN","SuDung20LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 40,"","==") == 1) then
		PlayerFunLib:AddExp(4000000,1,"Event_QuocKhanhVN","SuDung40LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 60,"","==") == 1) then
		PlayerFunLib:AddExp(6000000,1,"Event_QuocKhanhVN","SuDung60LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 80,"","==") == 1) then
		PlayerFunLib:AddExp(8000000,1,"Event_QuocKhanhVN","SuDung80LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 100,"","==") == 1) then
		PlayerFunLib:AddExp(10000000,1,"Event_QuocKhanhVN","SuDung100LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 200,"","==") == 1) then
		PlayerFunLib:AddExp(12000000,1,"Event_QuocKhanhVN","SuDung200LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 300,"","==") == 1) then
		PlayerFunLib:AddExp(14000000,1,"Event_QuocKhanhVN","SuDung300LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 400,"","==") == 1) then
		PlayerFunLib:AddExp(16000000,1,"Event_QuocKhanhVN","SuDung400LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 500,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_QuocKhanhVN","SuDung500LanPhaoHoaQuocKhanh")
		local tb500Award = {szName="T� M�ng Chi B�o",tbProp={6,1,30140,1,0,0},nExpiredTime = 20111001,tbParam = {10}}
		local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
		tbAwardTemplet:Give(tb500Award, 1, {"Event_QuocKhanhVN", "SuDung500LanPhaoHoaQuocKhanhNhanVatPham",tbTranslog})
	elseif (self:CheckTask(4, 600,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_QuocKhanhVN","SuDung600LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 700,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_QuocKhanhVN","SuDung700LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 800,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_QuocKhanhVN","SuDung800LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 900,"","==") == 1) then
		PlayerFunLib:AddExp(20000000,1,"Event_QuocKhanhVN","SuDung900LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 1000,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_QuocKhanhVN","SuDung1000LanPhaoHoaQuocKhanh")
		local tb1000Award = {szName="T� M�ng Chi B�o",tbProp={6,1,30140,1,0,0},nExpiredTime = 20111001,tbParam = {10}}
		local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
		tbAwardTemplet:Give(tb1000Award, 1, {"Event_QuocKhanhVN", "SuDung1000LanPhaoHoaQuocKhanhNhanVatPham", tbTranslog})
	elseif (self:CheckTask(4, 1100,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_QuocKhanhVN","SuDung1100LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 1200,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_QuocKhanhVN","SuDung1200LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 1300,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_QuocKhanhVN","SuDung1300LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 1400,"","==") == 1) then
		PlayerFunLib:AddExp(25000000,1,"Event_QuocKhanhVN","SuDung1400LanPhaoHoaQuocKhanh")
	elseif (self:CheckTask(4, 1500,"","==") == 1) then
		PlayerFunLib:AddExp(30000000,1,"Event_QuocKhanhVN","SuDung1500LanPhaoHoaQuocKhanh")
		local tb1500Award = {szName="T� M�ng Chi B�o",tbProp={6,1,30140,1,0,0},nExpiredTime = 20111001,tbParam = {6}}
		local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
		tbAwardTemplet:Give(tb1500Award, 1, {"Event_QuocKhanhVN", "SuDung1500LanPhaoHoaQuocKhanhNhanVatPham", tbTranslog})
	end	
	local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}
	tbAwardTemplet:Give(tbAward, 1, {"Event_QuocKhanhVN", "SuDungPhaoHoaQuocKhanhNhanVatPham", tbTranslog})
	tbAwardTemplet:Give(tbAwardExp, 1, {"", ""})	
	CastSkill(251, 1);
end

function pActivity:UseMooncake()
	local tbAward = {
				{szName="�� Ph� T� M�ng Kh�i",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng Y�u ��i",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng H� Uy�n",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng B�i",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng H�i",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.5},
				{szName="�� Ph� T� M�ng H�ng Li�n",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.3},
				{szName="�� Ph� T� M�ng Th��ng Gi�i Ch�",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.15},
				{szName="�� Ph� T� M�ng H� Gi�i Ch�",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.15},
				{szName="�� Ph� T� M�ng Kh� Gi�i",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.15},
				{szName="Thi�n ni�n th�t tinh th�o",tbProp={6,1,1675,1,0,0},nCount=1,nRate=0.1},
				{szName="T� M�ng L�nh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.1},
				{szName="H�n Nguy�n Linh L�",tbProp={6,1,2312,1,0,0},nCount=1,nRate=0.4},
				{szName="Th�n H�nh Ph�",tbProp={6,1,1266,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
				{szName="H�i thi�n t�i t�o l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
				{szName="B�c ��u truy�n c�ng thu�t",tbProp={6,1,1672,1,0,0},nCount=1,nRate=0.3},
				{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=1,nRate=3},
				{szName="Thi�n tinh b�ch c�u ho�n",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="B�ch C�u Ho�n ��c bi�t",tbProp={6,1,1157,1,0,0},nCount=1,nRate=0.3,nExpiredTime=20160},
				{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=3,nExpiredTime=43200},
				{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=26.54},
				{szName="H�i long ch�u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="Vi�m �� L�nh",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="T�ng Kim Chi�u Binh L� Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
				{szName="Ng�c Tr�ng Luy�n",tbProp={6,1,30104,1,0,0},nCount=1,nRate=0.2},
				{szName="Phi phong Kinh L�i (D�ch chuy�n t�c th�i)",tbProp={0,3470},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=20160,},
				{szName="H�i th�nh ph� (l�n) ",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.1},
				{szName = "�i�m Kinh Nghi�m", nExp=6000000,nRate=30},
				{szName = "�i�m Kinh Nghi�m", nExp=9000000,nRate=25},
				{szName="H�ng bao Sum v�y",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.1},
				{szName="H�ng bao An khang",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.1},
				{szName="T� M�ng Th��ng Gi�i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {2}},
				{szName="T� M�ng H� Gi�i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {9}},
				{szName="T� M�ng H�ng Li�n Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {0}},
				{szName="T� M�ng H�i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {7}},
				{szName="T� M�ng Ng�c B�i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {8}},
				{szName="T� M�ng H� Uy�n Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {3}},
				{szName="T� M�ng Y�u ��i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.07,nExpiredTime=20111001,tbParam = {4}},
				{szName="T� M�ng Kim Kh�i Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.05,nExpiredTime=20111001,tbParam = {5}},
				{szName="T� M�ng Ph�t Qu�n Chi B�o",tbProp={6,1,30140,1,0,0},nCount=1,nRate=0.06,nExpiredTime=20111001,tbParam = {1}},
			}	
	local tbTranslog = {strFolder = %strQK_TranslogFolder, nPromID = %nQK_PromotionID, nResult = 1}	
	tbAwardTemplet:Give(tbAward, 1, {"Event_QuocKhanhVN", "SuDungBanhTrungThuHanNguyet",tbTranslog})	
	PlayerFunLib:AddExp(5000000,1,"","")
end





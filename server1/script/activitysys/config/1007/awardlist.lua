tbLogUse_Big_Box = {
		[100] = {"Sudung100HopQuanLon"}, 
		[200] = {"Sudung200HopQuanLon"},
		[300] = {"Sudung300HopQuanLon"},
		[400] = {"Sudung400HopQuanLon"},
		[500] = {"Sudung500HopQuanLon"},
		[600] = {"Sudung600HopQuanLon"},
		[700] = {"Sudung700HopQuanLon"},
		[800] = {"Sudung800HopQuanLon"},
		[900] = {"Sudung900HopQuanLon"},
		[1000] = {"Sudung1000HopQuanLon"},
		[1100] = {"Sudung1100HopQuanLon"},
		[1200] = {"Sudung1200HopQuanLon"},
		[1300] = {"Sudung1300HopQuanLon"},
		[1400] = {"Sudung1400HopQuanLon"},
		[1500] = {"Sudung1500HopQuanLon"},
		[1600] = {"Sudung1600HopQuanLon"},
		[1700] = {"Sudung1700HopQuanLon"},
		[1800] = {"Sudung1800HopQuanLon"},
		[1900] = {"Sudung1900HopQuanLon"},
		[2000] = {"Sudung2000HopQuanLon"},
}
tbUse_Big_Box_AdditionalAward = {
	-- [200] 		= {szName="Ch�n Nguy�n ��n (trung)",
	-- 						pFun = function (tbItem, nItemCount, szLogTitle)
	-- 							local tbItemName = {szName="Ch�n Nguy�n ��n (trung)", tbProp={6,1,30228,1,0,0},nCount=300,nBindState=-2}
	-- 							if CalcFreeItemCellCount() > 1 then 
	-- 								tbAwardTemplet:Give(tbItemName, 1, {"EVENT_PHUNU", "PhanThuongDatMoc200"})		
	-- 							end
	-- 						end						
	-- 				},
	-- [400] 		= 
	-- {
	-- 		{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=500},
	-- 		{szName = "Phi Phong C�p 6",
	-- 		 pFun = function (tbItem, nItemCount, szLogTitle)
	-- 					local tbItemName = {
	-- 							[1] = {szName="Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=7*24*60},
	-- 							[2] = {szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=7*24*60},
	-- 							[3] = {szName="Phi phong Ng� Phong (Tr�ng k�ch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=7*24*60},
	-- 					}
	-- 					local nRan = random(1,3)
	-- 					tbAwardTemplet:Give(tbItemName[nRan], 1, {"EVENT_PHUNU", "PhanThuongDatMoc400"})		
	-- 				end									
	-- 		},
	-- },
	-- [800] 		= 
	-- {
	-- 		{szName="Huy�t Long ��ng c�p 6",tbProp= {6,1,30289,6,0,0}, nCount=10},
	-- 		{szName="Ch�n Nguy�n ��n (trung)",
	-- 				pFun = function (tbItem, nItemCount, szLogTitle)
	-- 					local tbItemName = {szName="Ch�n Nguy�n ��n (trung)", tbProp={6,1,30228,1,0,0},nCount=500,nBindState=-2}
	-- 					if CalcFreeItemCellCount() > 1 then 
	-- 						tbAwardTemplet:Give(tbItemName, 1, {"EVENT_PHUNU", "PhanThuongDatMoc800"})		
	-- 					end
	-- 				end						
	-- 		},
	-- },
	-- [1200] 		= 
	-- {
	-- 	{szName="Huy�t Long ��ng c�p 6",tbProp= {6,1,30289,6,0,0}, nCount=10},
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=500},
	-- },	
	-- [1600] 		= 
	-- {
	-- 	{szName="Huy�t Long ��ng c�p 6",tbProp= {6,1,30289,6,0,0}, nCount=10},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",
	-- 				pFun = function (tbItem, nItemCount, szLogTitle)
	-- 					local tbItemName = {szName="Ch�n Nguy�n ��n (trung)", tbProp={6,1,30228,1,0,0},nCount=500,nBindState=-2}
	-- 					if CalcFreeItemCellCount() > 1 then 
	-- 						tbAwardTemplet:Give(tbItemName, 1, {"EVENT_PHUNU", "PhanThuongDatMoc200"})		
	-- 					end
	-- 				end						
	-- 		},
	-- },
	-- [2000] 		= 
	-- {
	-- 	{szName="Huy�t Long ��ng c�p 6",tbProp= {6,1,30289,6,0,0}, nCount=10},
	-- 	{szName="Phong v�n chi�n m�",tbProp={0,10,20,1, 0,0}, nCount=1,nExpiredTime=7 * 60 * 24},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",
	-- 				pFun = function (tbItem, nItemCount, szLogTitle)
	-- 					local tbItemName = {szName="Ch�n Nguy�n ��n (trung)", tbProp={6,1,30228,1,0,0},nCount=500,nBindState=-2}
	-- 					if CalcFreeItemCellCount() > 1 then 
	-- 						tbAwardTemplet:Give(tbItemName, 1, {"EVENT_PHUNU", "PhanThuongDatMoc200"})		
	-- 					end
	-- 				end						
	-- 		},
	-- },
}
tbAward_A = 
{
	-- ["AwardNomal"] = {
	-- 	{szName="B�ch H� B�o Th�ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=0.1},
	-- 	{szName="B�ch H� Thi�n Th�ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=0.05},
	-- 	{szName="B�ch H� Th�n Th�ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=0.03},
	-- 	{szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.03},
	-- 	{szName="B�ch H� Kim B�i",tbProp={6,1,3183,1,0,0},nCount=1,nRate=0.04},
	-- 	{szName="B�o R��ng Kim � Kh�i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.025},
	-- 	{szName="B�o R��ng Kim � Y ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.025},
	-- 	{szName="B�o R��ng Kim � H�i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.025},
	-- 	{szName="B�o R��ng Kim � Y�u ��i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.025},
	-- 	{szName="B�o R��ng Kim � H� Uy�n( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.025},
	-- 	{szName="B�o R��ng Kim � H�ng Li�n( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.025},
	-- 	{szName="B�o R��ng Kim � B�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.025},
	-- 	{szName="B�o R��ng Kim � Th��ng Gi�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.018},
	-- 	{szName="B�o R��ng Kim � H� Gi�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.018},
	-- 	{szName="B�o R��ng Kim � V� Kh�( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.01},
	-- 	{szName="B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={2,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B�ch H� Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.003},
	-- 	{szName="B�ch H� H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B�ch H� H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B�ch H� Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={9,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B�ch H� H�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B�ch H� Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.006},
	-- 	{szName="B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.006},
	-- 	{szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.002},
	-- 	{szName="�� Ph� B�ch H� Kh�i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="�� Ph� B�ch H� Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.03},
	-- 	{szName="�� Ph� B�ch H� H�i",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="�� Ph� B�ch H� Y�u ��i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="�� Ph� B�ch H� H� Uy�n",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="�� Ph� B�ch H� H�ng Li�n",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="�� Ph� B�ch H� B�i",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="�� Ph� B�ch H� Th��ng Gi�i",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="B�ch H� �� Ph� H� Gi�i",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="�� Ph� B�ch H� Kh� Gi�i",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.02},
	-- 	{szName="100 v�n l��ng",nJxb=1000000, nCount = 1,nRate=4},
	-- 	{szName="200 v�n l��ng",nJxb=2000000, nCount = 1,nRate=2},
	-- 	{szName="500 v�n l��ng",nJxb=5000000, nCount = 1,nRate=1},
	-- 	{szName="1000 v�n l��ng",nJxb=10000000, nCount = 1,nRate=0.4},
	-- 	{szName="2000 v�n l��ng",nJxb=20000000, nCount = 1,nRate=0.2},
	-- 	{szName="5000 v�n l��ng",nJxb=50000000, nCount = 1,nRate=0.1},
	-- 	{szName="M�nh Huy�t Long ��ng c�p 6",tbProp={6,1,30290,6,0,0},nCount=1,nRate=10},
	-- 	{szName="M�nh Huy�t Long ��ng c�p 9",tbProp={6,1,30290,9,0,0},nCount=1,nRate=5},
	-- 	{szName="B�ch H� Tr�ng Luy�n Ng�c",tbProp={6,1,3187,1,0,0},nCount=1,nRate=0.2},
	-- 	{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=5},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=14,nBindState=-2},
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=5,nRate=14},
	-- 	{szName="Huy�t Long ��ng c�p 6",tbProp={6,1,30289,6,0,0},nCount=1,nRate=0.5},
	-- 	{szName="Huy�t Long ��ng c�p 9",tbProp={6,1,30289,9,0,0},nCount=1,nRate=0.3},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=5000000,nRate=24.52},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=8000000,nRate=13},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=3},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=1},
	-- },
	-- ["AwardSpecial"] = {
	-- 	{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.3,nExpiredTime=43200},
	-- 	{szName="B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={2,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B�ch H� Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B�ch H� H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B�ch H� H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B�ch H� Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={9,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B�ch H� H�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B�ch H� Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.3},
	-- 	{szName="B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.3},
	-- 	{szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.1},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=50},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=22.58},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=100000000,nRate=9.5},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=200000000,nRate=4},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=500000000,nRate=1},
	-- 	{szName="B�o R��ng Kim � Kh�i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.6},
	-- 	{szName="B�o R��ng Kim � Y ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.6},
	-- 	{szName="B�o R��ng Kim � H�i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.6},
	-- 	{szName="B�o R��ng Kim � Y�u ��i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.6},
	-- 	{szName="B�o R��ng Kim � H� Uy�n( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.6},
	-- 	{szName="B�o R��ng Kim � H�ng Li�n( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.6},
	-- 	{szName="B�o R��ng Kim � B�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.6},
	-- 	{szName="B�o R��ng Kim � Th��ng Gi�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.5},
	-- 	{szName="B�o R��ng Kim � H� Gi�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.5},
	-- 	{szName="B�o R��ng Kim � V� Kh�( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.3},
	-- 	{szName="B�ch H� B�o Th�ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=2},
	-- 	{szName="B�ch H� Thi�n Th�ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=1},
	-- 	{szName="B�ch H� Th�n Th�ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=0.8},
	-- 	{szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.02},
	-- },
	-- ["AwardMocNho"] = {
	-- 	{szName="200 v�n l��ng",nJxb=2000000, nCount = 1,nRate=3},
	-- 	{szName="Huy�t Long ��ng c�p 6",tbProp={6,1,30289,6,0,0},nCount=1,nRate=7},
	-- 	{szName="Huy�t Long ��ng c�p 9",tbProp={6,1,30289,9,0,0},nCount=1,nRate=4},
	-- 	{szName="B�ch H� Tr�ng Luy�n Ng�c",tbProp={6,1,3187,1,0,0},nCount=1,nRate=0.5},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=36.3},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=12},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=5.5},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=100000000,nRate=3},
	-- 	{szName = "�i�m Kinh Nghi�m", nExp=200000000,nRate=1},
	-- 	{szName="B�o R��ng Kim � Kh�i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.2},
	-- 	{szName="B�o R��ng Kim � Y ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B�o R��ng Kim � H�i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B�o R��ng Kim � Y�u ��i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B�o R��ng Kim � H� Uy�n( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B�o R��ng Kim � H�ng Li�n( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B�o R��ng Kim � B�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.2},
	-- 	{szName="B�o R��ng Kim � Th��ng Gi�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B�o R��ng Kim � H� Gi�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B�o R��ng Kim � V� Kh�( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.1},
	-- 	{szName="B�ch H� B�o Th�ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=2},
	-- 	{szName="B�ch H� Thi�n Th�ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=1},
	-- 	{szName="B�ch H� Th�n Th�ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=0.8},
	-- 	{szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=1},
	-- 	{szName="B�ch H� Kim B�i",tbProp={6,1,3183,1,0,0},nCount=1,nRate=1},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=10,nBindState=-2},
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=5,nRate=10},
	-- },
}	
Include("\\script\\lib\\awardtemplet.lua")
tbAward_A = 
{
	-- ["HarvestPlants"] = {--Ph�n th��ng tr�ng c�y
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=1,nRate=30},
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=2,nRate=8},
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=3,nRate=4},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",
	-- 			pFun = function (tbItem, nItemCount, szLogTitle)
	-- 				local tbItemName = {szName="Ch�n Nguy�n ��n (trung)", tbProp={6,1,30228,1,0,0},nCount=1,nBindState=-2}
	-- 				if CalcFreeItemCellCount() > 1 then 
	-- 					tbAwardTemplet:Give(tbItemName, 1, {"GH_2012", "TrongCayThienLocNhanThuong1CND"})		
	-- 				end
	-- 			end,
	-- 			nRate=30										
	-- 	},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",
	-- 			pFun = function (tbItem, nItemCount, szLogTitle)
	-- 				local tbItemName = {szName="Ch�n Nguy�n ��n (trung)", tbProp={6,1,30228,1,0,0},nCount=2,nBindState=-2}
	-- 				if CalcFreeItemCellCount() > 1 then 
	-- 					tbAwardTemplet:Give(tbItemName, 1, {"GH_2012", "TrongCayThienLocNhanThuong2CND"})		
	-- 				end
	-- 			end,
	-- 			nRate=3										
	-- 	},
	-- 	{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.04,nExpiredTime=43200},
	-- 	{szName="M�c Nh�n L�nh",tbProp={6,1,30105,1,0,0},nCount=5,nRate=3.48308},
	-- 	{szName="C�ng Hi�n L� bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	-- 	{szName="Phong V�n Phi T�c ho�n",tbProp={6,1,190,1,0,0},nCount=10,nRate=5,nExpiredTime=20160},
	-- 	{szName="C�n Kh�n T�o H�a �an (��i) ",tbProp={6,1,215,1,0,0},nCount=10,nRate=5},
	-- 	{szName="Phong V�n Chi�u Binh L�nh",tbProp={6,1,30083,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	-- 	{szName="L�nh b�i ",tbProp={6,1,157,1,0,0},nCount=10,nRate=5},
	-- 	{szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
	-- 	{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	-- 	{szName="Ki�n Thi�t L� Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	-- 	{szName="Nh�t K� C�n Kh�n Ph�",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.3,nExpiredTime=43200},
	-- 	{szName="V�",tbProp={6,1,30260,1,0,0},nCount=1,nRate=0,nExpiredTime=20121101},
	-- 	{szName="L�m",tbProp={6,1,30261,1,0,0},nCount=1,nRate=0.00026,nExpiredTime=20121101},
	-- 	{szName="Truy�n",tbProp={6,1,30262,1,0,0},nCount=1,nRate=0.0028,nExpiredTime=20121101},
	-- 	{szName="K�",tbProp={6,1,30263,1,0,0},nCount=1,nRate=0.0028,nExpiredTime=20121101},
	-- 	{szName="M�nh ch� V�",tbProp={6,1,30268,1,0,0},nCount=1,nRate=0.00026,nExpiredTime=20121101},
	-- 	{szName="M�nh ch� L�m",tbProp={6,1,30269,1,0,0},nCount=1,nRate=0.0108,nExpiredTime=20121101},
	-- 	{szName="M�nh ch� Truy�n",tbProp={6,1,30270,1,0,0},nCount=1,nRate=0.08,nExpiredTime=20121101},
	-- 	{szName="M�nh ch� K�",tbProp={6,1,30271,1,0,0},nCount=1,nRate=0.08,nExpiredTime=20121101},
	-- },
	-- ["HuoYueDu_dynamics"] = {--Ph�n th��ng �� N�ng ��ng
	-- 		{szName="M�nh ch� B�t",tbProp={6,1,30272,1,0,0},nCount=1,nRate=0,nExpiredTime=20121101},
	-- 		{szName="M�nh ch� M�ch",tbProp={6,1,30273,1,0,0},nCount=1,nRate=0.08,nExpiredTime=20121101},
	-- 		{szName="M�nh ch� Ch�n",tbProp={6,1,30274,1,0,0},nCount=1,nRate=0.75,nExpiredTime=20121101},
	-- 		{szName="M�nh ch� Kinh",tbProp={6,1,30275,1,0,0},nCount=1,nRate=0.75,nExpiredTime=20121101},
	-- 		{szName="B�t",tbProp={6,1,30264,1,0,0},nCount=1,nRate=0.75,nExpiredTime=20121101},
	-- 		{szName="M�ch",tbProp={6,1,30265,1,0,0},nCount=1,nRate=2.7,nExpiredTime=20121101},
	-- 		{szName="Ch�n",tbProp={6,1,30266,1,0,0},nCount=1,nRate=21,nExpiredTime=20121101},
	-- 		{szName="Kinh",tbProp={6,1,30267,1,0,0},nCount=1,nRate=21,nExpiredTime=20121101},
	-- 		{szName = "�i�m Kinh Nghi�m", nExp=2000000,nRate=52.97},
	-- },
}
tbAward_B = 
{		
	-- szName = "Phi Phong C�p 6",
	-- 	pFun = function (tbItem, nItemCount, szLogTitle)
	-- 		local tbItemName = {
	-- 				[1] = {szName="Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=259200},
	-- 				[2] = {szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200},
	-- 				[3] = {szName="Phi phong Ng� Phong (Tr�ng k�ch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200},
	-- 		}
	-- 		local nRan = random(1,3)
	-- 		tbAwardTemplet:Give(tbItemName[nRan], 1, {"GH_2012", "NopChuVoLamTruyenKyDuoi9"})		
	-- 	end									
}

tbAward_C = { 
	-- {szName="Ch�n Nguy�n ��n (trung)", tbProp={6,1,30228,1,0,0},nCount=1,nBindState=-2},
	-- {szName="H� m�ch ��n", tbProp={6,1,3203,1,0,0},nCount=2},
}

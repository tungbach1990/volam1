tbAward_A = { --Phan thuong thu ho�ch		
	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=1,nRate=30},
	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=2,nRate=8},
	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=3,nRate=4},
	{szName="Ch�n Nguy�n ��n (trung)",
			pFun = function (tbItem, nItemCount, szLogTitle)
				local tbItemName = {szName="Ch�n Nguy�n ��n (trung)", tbProp={6,1,30228,1,0,0},nCount=1,nBindState=-2}
				if CalcFreeItemCellCount() > 1 then 
					tbAwardTemplet:Give(tbItemName, 1, {"GH_2012", "TrongCayThienLocNhanThuong1CND"})		
				end
			end,
			nRate=30										
	},
	{szName="Ch�n Nguy�n ��n (trung)",
			pFun = function (tbItem, nItemCount, szLogTitle)
				local tbItemName = {szName="Ch�n Nguy�n ��n (trung)", tbProp={6,1,30228,1,0,0},nCount=2,nBindState=-2}
				if CalcFreeItemCellCount() > 1 then 
					tbAwardTemplet:Give(tbItemName, 1, {"GH_2012", "TrongCayThienLocNhanThuong2CND"})		
				end
			end,
			nRate=3										
	},
	{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
	{szName="M�c Nh�n L�nh",tbProp={6,1,30105,1,0,0},nCount=5,nRate=3.65},
	{szName="C�ng Hi�n L� bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Phong V�n Phi T�c ho�n",tbProp={6,1,190,1,0,0},nCount=10,nRate=5,nExpiredTime=20160},
	{szName="C�n Kh�n T�o H�a �an (��i) ",tbProp={6,1,215,1,0,0},nCount=10,nRate=5},
	{szName="Phong V�n Chi�u Binh L�nh",tbProp={6,1,30083,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="L�nh b�i T�ng Kim",tbProp={6,1,157,1,0,0},nCount=10,nRate=5},
	{szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
	{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Ki�n Thi�t L� Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Nh�t K� C�n Kh�n Ph�",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.3,nExpiredTime=43200},
}

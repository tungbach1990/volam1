
tbAwardList = {}
tbAwardLog = {}

--you can defind award but you need to consider Bag space
tbAwardList["TREE"] = {
	[1]={szName="Xo�i",tbProp={6,1,3093,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[2]={szName="Tr�i M�ng C�u",tbProp={6,1,3094,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[3]={szName="Tr�i Cam",tbProp={6,1,3095,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[4]={szName="Tr�i L�",tbProp={6,1,3096,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[5]={szName="Tr�i B��i",tbProp={6,1,3097,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[6]={szName="N�i Chu�i",tbProp={6,1,3098,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[7]={szName="Tr�i H�ng",tbProp={6,1,3099,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[8]={szName="D�a",tbProp={6,1,3100,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[9]={szName="�u ��",tbProp={6,1,3101,1,0,0},nCount = 5,nExpiredTime=20120201,},
	[10]={szName="Tr�i Sung",tbProp={6,1,3102,1,0,0},nCount = 5,nExpiredTime=20120201,},
	}
	
tbAwardLog["TREE"] = {
	[1] = "ThuDuoc5QuaXoaiTrenCayBachQua",
	[2] = "ThuDuoc5DuDuTrenCayBachQua",
	[3] = "ThuDuoc5QuaBuoiTrenCayBachQua",
	[4] = "ThuDuoc5QuaLeTrenCayBachQua",
	[5] = "ThuDuoc5QuaSungTrenCayBachQua",
	[6] = "ThuDuoc5QuaChuoiTrenCayBachQua",
	[7] = "ThuDuoc5MangCauTrenCayBachQua",
	[8] = "ThuDuoc5QuaHongTrenCayBachQua",
	[9] = "ThuDuoc5QuaDuaTrenCayBachQua",
	[10] = "ThuDuoc5QuaCamTrenCayBachQua",
	}	
	
tbAwardList["WUGUOBAIYINPAN"] = {
	[1]={nExp=1000000,},
	}	
tbAwardLog["WUGUOBAIYINPAN"] = "used wuguobaiyinpan"

tbAwardList["WUGUOBAIYINPAN_REDBAG"] = {
	{szName="Bao L� X� N�m M�i (nh�)",tbProp={6,1,3108,1,0,0},nRate = 30.0,nExpiredTime=20120201,},
	}	
tbAwardLog["WUGUOBAIYINPAN_REDBAG"] = "SuDungMamBacNguQuaNhanBaoLiXiNamMoi"

tbAwardLog["WUGUOBAIYINPAN_USED"] = {
	[500] = "SuDungMamBacNguQua500Lan",
	[1000] = "SuDungMamBacNguQua1000Lan",
	}

--Thay ��i ph�n th��ng s� d�ng m�m v�ng ng� qu� - Modified By DinhHQ - 20120103
--tbAwardList["WUGUOHUANGJINPAN"] = {
--	[1]={szName="Huy�n Tinh Kho�ng Th�ch ",tbProp={6,1,147,1,0,0}},
--	[2]={nExp=1,},
--	}
tbAwardLog["WUGUOHUANGJINPAN"] = "SuDungMamVangNguQuaNhanPhanThuongVatPham"

tbAwardList["WUGUOHUANGJINPAN_REDBAG"] = {
	{szName="Bao L� X� N�m M�i (nh�)",tbProp={6,1,3108,1,0,0},nRate = 60.0,nExpiredTime=20120201,},
	}
tbAwardLog["WUGUOHUANGJINPAN_REDBAG"] = "SuDungMamVangNguQuaNhanBaoLiXiNamMoi"

tbAwardList["WUGUOHUANGJINPAN_USED"] = {
	[100] = {nExp=10000000,},
	[200] = {nExp=10000000,},
	[300] = {nExp=10000000,},
	[400] = {nExp=10000000,},
	[500] = {nExp=20000000,},
	[600] = {nExp=20000000,},
	[700] = {nExp=20000000,},
	[800] = {nExp=20000000,},
	[900] = {nExp=20000000,},
	[1000] = {nExp=30000000,},
	[1100] = {nExp=30000000,},
	[1200] = {nExp=30000000,},
	[1300] = {nExp=30000000,},
	[1400] = {nExp=30000000,},
	[1500] = {nExp=40000000,},
	[1600] = {nExp=40000000,},
	[1700] = {nExp=40000000,},
	[1800] = {nExp=40000000,},
	[1900] = {nExp=40000000,},
	--Change request event t�t - Modified By DinhHQ - 20120103
	--[2000] = {nExp=50000000,},	
	[2000] = {szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,},
	}

tbAwardLog["WUGUOHUANGJINPAN_USED"] = {
	[100] = "SuDungMamVangNguQua100Lan",
	[200] = "SuDungMamVangNguQua200Lan",
	[300] = "SuDungMamVangNguQua300Lan",
	[400] = "SuDungMamVangNguQua400Lan",
	[500] = "SuDungMamVangNguQua500Lan",
	[600] = "SuDungMamVangNguQua600Lan",
	[700] = "SuDungMamVangNguQua700Lan",
	[800] = "SuDungMamVangNguQua800Lan",
	[900] = "SuDungMamVangNguQua900Lan",
	[1000] = "SuDungMamVangNguQua1000Lan",
	[1100] = "SuDungMamVangNguQua1100Lan",
	[1200] = "SuDungMamVangNguQua1200Lan",
	[1300] = "SuDungMamVangNguQua1300Lan",
	[1400] = "SuDungMamVangNguQua1400Lan",
	[1500] = "SuDungMamVangNguQua1500Lan",
	[1600] = "SuDungMamVangNguQua1600Lan",
	[1700] = "SuDungMamVangNguQua1700Lan",
	[1800] = "SuDungMamVangNguQua1800Lan",
	[1900] = "SuDungMamVangNguQua1900Lan",
	[2000] = "SuDungMamVangNguQua2000Lan",
	}
--Thay ��i ph�n th��ng m�m v�ng ng� qu� - Modified By DinhHQ - 20120103 - Server c�
tbAwardList["WUGUOHUANGJINPAN"] = {
	[1] ={nExp=6000000,}, 
	[2] = {
		{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.05},
		{szName="Kim � Kim B�i",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
		{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.1},
		{szName="Kim Hoa Chi B�o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.2},
		{szName="Ph� Th�y Chi B�o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.1},
		{szName="Phong V�n Chi B�o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.05},
		{szName="Vi�m �� L�nh",tbProp={6,1,1617,1,0,0},nCount=1,nRate=1},
		{szName="Long Huy�t Ho�n",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="Th��ng Lang Th�ch",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.5},
		{szName="V�n L�c Th�ch",tbProp={6,1,2711,1,0,0},nCount=1,nRate=1},
		{szName="Thanh C�u Th�ch",tbProp={6,1,2710,1,0,0},nCount=1,nRate=1},
		{szName="Ng�c Qu�n",tbProp={6,1,2311,1,0,0},nCount=1,nRate=0.1},
		{szName="Thi�n tinh b�ch c�u ho�n",tbProp={6,1,2183,1,0,0},nCount=1,nRate=0.3},
		{szName="T�ng Kim Chi�u Binh L� Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="Tr��ng sinh",tbProp={0,3491},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="B�t H�i",tbProp={0,3492},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="V� Uy",tbProp={0,3493},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="Nh��c Th�y",tbProp={0,3494},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="Tr�n Nh�c",tbProp={0,3495},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="Y�n Ba",tbProp={0,3496},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="Th�n Tu�",tbProp={0,3497},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="Truy Anh ",tbProp={0,3498},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="Long ��m",tbProp={0,3499},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="L�u Hu�nh",tbProp={0,3500},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="Cu�ng Lan",tbProp={0,3501},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="Th�y Ng�c B�ng Huy�n",tbProp={0,3502},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="H�ng Anh",tbProp={0,3503},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="Ng�ng Tuy�t H�n S��ng",tbProp={0,3504},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="Di�u Gi�i Tr�n Duy�n",tbProp={0,3505},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="L�c Ph� Qu�n Tinh",tbProp={0,3506},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
		{szName="Ho�ng Kim �n C�p 7 (C��ng h�a)",tbProp={0,3211},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="Ho�ng Kim �n C�p 7 (Nh��c h�a)",tbProp={0,3221},nCount=1,nRate=0.05,nQuality = 1,nExpiredTime=10080,},
		{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName = "�i�m Kinh Nghi�m", nExp=5000000,nRate=40},
		{szName = "�i�m Kinh Nghi�m", nExp=8000000,nRate=13},
		{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=10},
		{szName = "�i�m Kinh Nghi�m", nExp=15000000,nRate=5},
		{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=1.6},
		{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=0.5},
		{szName = "�i�m Kinh Nghi�m", nExp=100000000,nRate=0.05},
	},
}
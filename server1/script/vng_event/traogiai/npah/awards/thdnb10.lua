--H� tr� trao gi�i th��ng cho ng��i chi�n th�ng - Created by DinhHQ - 20110607
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201201100000
tbCurSeason.nEndDate = 201201152400
tbCurSeason.strName = "Nh�n th��ng gi�i ��u THDNB 10"
tbCurSeason.strNPC = "L� Quan"
tbCurSeason.nID = 7
tbCurSeason.tbAccList = {		
	["360net"]={[1]={{nAwardID=8,nCount=60},},[2]={{nAwardID=2,nCount=1},{nAwardID=7,nCount=32},{nAwardID=8,nCount=14},{nAwardID=10,nCount=4},{nAwardID=13,nCount=4},},[3]={{nAwardID=14,nCount=15},{nAwardID=22,nCount=1},},},
	["ainoiminhkovip"]={[1]={{nAwardID=7,nCount=16},{nAwardID=8,nCount=32},{nAwardID=13,nCount=1},},},
	["andyrockdick"]={[1]={{nAwardID=4,nCount=60},},[2]={{nAwardID=7,nCount=60},},[3]={{nAwardID=4,nCount=14},{nAwardID=7,nCount=14},{nAwardID=10,nCount=4},{nAwardID=13,nCount=4},},[4]={{nAwardID=2,nCount=4},},[5]={{nAwardID=20,nCount=1},{nAwardID=24,nCount=1},},},
	["bedongdanh12345"]={[1]={{nAwardID=8,nCount=60},},[2]={{nAwardID=6,nCount=4},{nAwardID=7,nCount=32},{nAwardID=8,nCount=14},{nAwardID=11,nCount=1},},[3]={{nAwardID=10,nCount=16},{nAwardID=14,nCount=32},},[4]={{nAwardID=2,nCount=7},{nAwardID=13,nCount=16},},[5]={{nAwardID=21,nCount=1},{nAwardID=23,nCount=1},},[6]={{nAwardID=24,nCount=1},},},
	["buihoaininh2000"]={[1]={{nAwardID=4,nCount=60},},[2]={{nAwardID=7,nCount=60},},[3]={{nAwardID=4,nCount=14},{nAwardID=7,nCount=14},{nAwardID=10,nCount=4},{nAwardID=13,nCount=4},},[4]={{nAwardID=2,nCount=4},},[5]={{nAwardID=21,nCount=1},{nAwardID=23,nCount=1},},},
	["buocduongdoi"]={[1]={{nAwardID=7,nCount=16},{nAwardID=8,nCount=32},{nAwardID=13,nCount=1},},},
	["caidgithe"]={[1]={{nAwardID=4,nCount=60},},[2]={{nAwardID=7,nCount=60},},[3]={{nAwardID=4,nCount=14},{nAwardID=7,nCount=14},{nAwardID=10,nCount=8},{nAwardID=13,nCount=8},},[4]={{nAwardID=2,nCount=7},},[5]={{nAwardID=20,nCount=1},{nAwardID=21,nCount=1},},[6]={{nAwardID=22,nCount=1},{nAwardID=23,nCount=1},},},
	["chichichi90"]={[1]={{nAwardID=2,nCount=2},{nAwardID=7,nCount=32},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},[2]={{nAwardID=4,nCount=32},},[3]={{nAwardID=22,nCount=1},},},
	["chikilled2"]={[1]={{nAwardID=8,nCount=60},},[2]={{nAwardID=7,nCount=32},{nAwardID=8,nCount=14},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},},
	["himeyue"]={[1]={{nAwardID=4,nCount=32},},[2]={{nAwardID=2,nCount=2},{nAwardID=7,nCount=32},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},[3]={{nAwardID=23,nCount=1},},},
	["hoangduocsu60"]={[1]={{nAwardID=8,nCount=60},},[2]={{nAwardID=2,nCount=1},{nAwardID=7,nCount=32},{nAwardID=8,nCount=14},{nAwardID=10,nCount=4},{nAwardID=13,nCount=4},},[3]={{nAwardID=14,nCount=16},{nAwardID=22,nCount=1},},},
	["icegirl2707"]={[1]={{nAwardID=4,nCount=32},},[2]={{nAwardID=2,nCount=2},{nAwardID=7,nCount=32},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},[3]={{nAwardID=20,nCount=1},},},
	["internetlac"]={[1]={{nAwardID=4,nCount=60},},[2]={{nAwardID=7,nCount=60},},[3]={{nAwardID=4,nCount=14},{nAwardID=7,nCount=14},{nAwardID=10,nCount=4},{nAwardID=13,nCount=4},},[4]={{nAwardID=2,nCount=4},},[5]={{nAwardID=20,nCount=1},{nAwardID=22,nCount=1},},},
	["laoninh"]={[1]={{nAwardID=4,nCount=32},},[2]={{nAwardID=2,nCount=2},{nAwardID=7,nCount=32},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},[3]={{nAwardID=22,nCount=1},},},
	["mercedesbmw"]={[1]={{nAwardID=4,nCount=32},},[2]={{nAwardID=2,nCount=2},{nAwardID=7,nCount=32},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},[3]={{nAwardID=23,nCount=1},},},
	["ngocha012"]={[1]={{nAwardID=4,nCount=60},},[2]={{nAwardID=7,nCount=60},},[3]={{nAwardID=4,nCount=14},{nAwardID=7,nCount=14},{nAwardID=10,nCount=8},{nAwardID=13,nCount=8},},[4]={{nAwardID=20,nCount=1},{nAwardID=21,nCount=1},},[5]={{nAwardID=2,nCount=7},},[6]={{nAwardID=22,nCount=1},{nAwardID=23,nCount=1},},[7]={{nAwardID=24,nCount=1},},},
	["nguyenhuuducthanh"]={[1]={{nAwardID=3,nCount=60},},[2]={{nAwardID=4,nCount=60},},[3]={{nAwardID=7,nCount=60},},[4]={{nAwardID=3,nCount=14},{nAwardID=4,nCount=14},{nAwardID=5,nCount=4},{nAwardID=6,nCount=4},{nAwardID=7,nCount=14},{nAwardID=11,nCount=5},{nAwardID=12,nCount=1},},[5]={{nAwardID=10,nCount=32},{nAwardID=19,nCount=1},},[6]={{nAwardID=20,nCount=1},{nAwardID=21,nCount=1},},[7]={{nAwardID=22,nCount=1},{nAwardID=23,nCount=1},},[8]={{nAwardID=13,nCount=32},{nAwardID=24,nCount=1},},},
	["nguyentrungthe"]={[1]={{nAwardID=8,nCount=60},},[2]={{nAwardID=7,nCount=32},{nAwardID=8,nCount=14},{nAwardID=10,nCount=8},},[3]={{nAwardID=2,nCount=4},{nAwardID=13,nCount=8},},[4]={{nAwardID=14,nCount=32},},[5]={{nAwardID=21,nCount=1},{nAwardID=24,nCount=1},},},
	["nmtieuthu3000"]={[1]={{nAwardID=7,nCount=16},{nAwardID=8,nCount=32},{nAwardID=13,nCount=1},},},
	["thachsung21"]={[1]={{nAwardID=4,nCount=32},},[2]={{nAwardID=2,nCount=2},{nAwardID=7,nCount=32},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},[3]={{nAwardID=24,nCount=1},},},
	["thienvuong0802"]={[1]={{nAwardID=4,nCount=32},},[2]={{nAwardID=2,nCount=2},{nAwardID=7,nCount=32},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},[3]={{nAwardID=21,nCount=1},{nAwardID=22,nCount=1},},},
	["thuthaolq"]={[1]={{nAwardID=4,nCount=60},},[2]={{nAwardID=7,nCount=60},},[3]={{nAwardID=4,nCount=14},{nAwardID=5,nCount=2},{nAwardID=6,nCount=2},{nAwardID=7,nCount=14},{nAwardID=10,nCount=16},{nAwardID=11,nCount=1},{nAwardID=12,nCount=1},},[4]={{nAwardID=2,nCount=5},{nAwardID=13,nCount=16},},[5]={{nAwardID=19,nCount=1},{nAwardID=20,nCount=1},},[6]={{nAwardID=21,nCount=1},{nAwardID=22,nCount=1},},[7]={{nAwardID=24,nCount=1},},},
	["tomvodich0"]={[1]={{nAwardID=8,nCount=60},},[2]={{nAwardID=7,nCount=32},{nAwardID=8,nCount=14},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},},
	["tuanbdp"]={[1]={{nAwardID=4,nCount=60},},[2]={{nAwardID=7,nCount=60},},[3]={{nAwardID=2,nCount=4},{nAwardID=4,nCount=14},{nAwardID=7,nCount=14},{nAwardID=10,nCount=4},},[4]={{nAwardID=21,nCount=1},{nAwardID=23,nCount=1},},[5]={{nAwardID=13,nCount=4},{nAwardID=24,nCount=1},},},
	["tuyenkhoang1"]={[1]={{nAwardID=7,nCount=16},{nAwardID=8,nCount=32},{nAwardID=13,nCount=1},},},
	["volamduky3"]={[1]={{nAwardID=7,nCount=16},{nAwardID=8,nCount=32},{nAwardID=13,nCount=1},},},
	["vominhhoa81"]={[1]={{nAwardID=8,nCount=60},},[2]={{nAwardID=7,nCount=32},{nAwardID=8,nCount=14},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},},
	["votthienthanh1983"]={[1]={{nAwardID=4,nCount=32},},[2]={{nAwardID=2,nCount=2},{nAwardID=7,nCount=32},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},[3]={{nAwardID=21,nCount=1},},},
	["xinlola"]={[1]={{nAwardID=8,nCount=60},},[2]={{nAwardID=7,nCount=32},{nAwardID=8,nCount=14},{nAwardID=10,nCount=2},{nAwardID=13,nCount=2},},},
	["vanminh210315"]={[1]={{nAwardID=15,nCount=1},},},
	["drthanh141987"]={[1]={{nAwardID=16,nCount=1},},},
	["kieuphong24"]={[1]={{nAwardID=2,nCount=1},{nAwardID=17,nCount=1},},},
	["anhdich"]={[1]={{nAwardID=15,nCount=1},},},
	["tienngon1"]={[1]={{nAwardID=1,nCount=1},{nAwardID=18,nCount=1},},},
	["kau2onlinekt"]={[1]={{nAwardID=16,nCount=1},},},
	["conchuotme123"]={[1]={{nAwardID=9,nCount=1},},},
	["hoanghaclau2529"]={[1]={{nAwardID=9,nCount=1},},},
	["nguyenphucsang"]={[1]={{nAwardID=9,nCount=1},},},
	["leanhtu25071984"]={[1]={{nAwardID=9,nCount=1},},},
	["thanhxd77"]={[1]={{nAwardID=9,nCount=1},},},
	["tranvanthu10121985"]={[1]={{nAwardID=9,nCount=1},},},
	["trangxu2001"]={[1]={{nAwardID=1,nCount=1},},},
	["thiensaumenh"]={[1]={{nAwardID=1,nCount=1},},},
	["hoavuong255"]={[1]={{nAwardID=1,nCount=1},},},
	["blueyuzil"]={[1]={{nAwardID=1,nCount=1},},},
	["sboy01"]={[1]={{nAwardID=1,nCount=1},},},
	["khattinh02"]={[1]={{nAwardID=1,nCount=1},},},
	["hongtam20102001"]={[1]={{nAwardID=1,nCount=1},},},
	["tuyetthethany2011"]={[1]={{nAwardID=1,nCount=1},},},
	["peterchen88888"]={[1]={{nAwardID=2,nCount=1},},},
	["honghiquan2992011"]={[1]={{nAwardID=2,nCount=1},},},
	["thejong008"]={[1]={{nAwardID=2,nCount=1},},},
	["mytomsong112"]={[1]={{nAwardID=2,nCount=1},},},
	["vipkute20091990"]={[1]={{nAwardID=2,nCount=2},},},
	["daikangoc2000"]={[1]={{nAwardID=2,nCount=1},},},
	["pvlb1981"]={[1]={{nAwardID=2,nCount=1},},},
	["maimaibennhau1903"]={[1]={{nAwardID=1,nCount=1},},},
	["xuanhancty"]={[1]={{nAwardID=2,nCount=1},},},
	["tuangayok"]={[1]={{nAwardID=2,nCount=1},},},
	["viethung231289"]={[1]={{nAwardID=2,nCount=1},},},
	["chieuanhcac2007"]={[1]={{nAwardID=2,nCount=1},},},
	["ngamytieumuoi"]={[1]={{nAwardID=2,nCount=1},},},	
}
tbCurSeason.tbPrizeList = {		
	[1]={szName="Phi�n V� (HSD 6 th�ng)",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime=259200},
	[2]={szName="Phi�n V� (kh�ng HSD)",tbProp={0,10,7,1,0,0},nCount=1},
	[3]={szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200},
	[4]={szName="Ho�ng Ch�n ��n",tbProp={6,1,2264,1,0,0},nCount=1},
	[5]={szName="Ho�ng Kim �n (C��ng h�a)",tbProp={0,3212},nCount=1,nQuality = 1,nExpiredTime=259200,},
	[6]={szName="Ho�ng Kim �n (Nh��c h�a)",tbProp={0,3222},nCount=1,nQuality = 1,nExpiredTime=259200,},
	[7]={szName="H�ng bao An khang",tbProp={6,1,2105,1,0,0},nCount=1},
	[8]={szName="Huy�n Ch�n ��n",tbProp={6,1,1678,1,0,0},nCount=1,tbParam={1500000000}},
	[9]={szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1},
	[10]={szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=259200,nUsageTime=-1},
	[11]={szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200,},
	[12]={szName="Phi phong Ng� Phong (Tr�ng k�ch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200,},
	[13]={szName="Qu� Ho�ng Kim (100)",tbProp={6,1,30095,1,0,0},nCount=1},
	[14]={szName="T� Kim Ch�n ��n",tbProp={6,1,2263,1,0,0},nCount=1,tbParam={2000000000}},
	[15] = {
		szName = "B� trang b� Kim � C�n L�n �ao",
		[1]={szName="Kim � Nguy�t �nh H�ng Li�n",tbProp={0,2265},nCount=1,nQuality = 1,},
		[2]={szName="Kim � Nguy�t �nh ��o Qu�n",tbProp={0,2266},nCount=1,nQuality = 1,},
		[3]={szName="Kim � Nguy�t �nh Th��ng Gi�i",tbProp={0,2267},nCount=1,nQuality = 1,},
		[4]={szName="Kim � Nguy�t �nh H� Uy�n",tbProp={0,2268},nCount=1,nQuality = 1,},
		[5]={szName="Kim � Nguy�t �nh Th�c Y�u",tbProp={0,2269},nCount=1,nQuality = 1,},
		[6]={szName="Kim � Nguy�t �nh ��o B�o",tbProp={0,2270},nCount=1,nQuality = 1,},
		[7]={szName="Kim � Nguy�t �nh B�o �ao",tbProp={0,2271},nCount=1,nQuality = 1,},
		[8]={szName="Kim � Nguy�t �nh Ngoa",tbProp={0,2272},nCount=1,nQuality = 1,},
		[9]={szName="Kim � Nguy�t �nh B�i",tbProp={0,2273},nCount=1,nQuality = 1,},
		[10]={szName="Kim � Nguy�t �nh H� Gi�i",tbProp={0,2274},nCount=1,nQuality = 1,},
	},
	[16] = {
		szName = "B� trang b� Kim � V� �ang Kh�",
		[1]={szName="Kim � L�c H�p Ph�",tbProp={0,2245},nCount=1,nQuality = 1,},
		[2]={szName="Kim � L�c H�p Qu�n",tbProp={0,2246},nCount=1,nQuality = 1,},
		[3]={szName="Kim � L�c H�p Th��ng Gi�i",tbProp={0,2247},nCount=1,nQuality = 1,},
		[4]={szName="Kim � L�c H�p T�",tbProp={0,2248},nCount=1,nQuality = 1,},
		[5]={szName="Kim � L�c H�p Ph�p ��i",tbProp={0,2249},nCount=1,nQuality = 1,},
		[6]={szName="Kim � L�c H�p ��o B�o",tbProp={0,2250},nCount=1,nQuality = 1,},
		[7]={szName="Kim � L�c H�p Ki�m",tbProp={0,2251},nCount=1,nQuality = 1,},
		[8]={szName="Kim � L�c H�p L�",tbProp={0,2252},nCount=1,nQuality = 1,},
		[9]={szName="Kim � L�c H�p Ng�c B�i",tbProp={0,2253},nCount=1,nQuality = 1,},
		[10]={szName="Kim � L�c H�p H� Gi�i",tbProp={0,2254},nCount=1,nQuality = 1,},
	},
	[17] = {
		szName = "B� trang b� Kim � ���ng M�n N� Ti�n",
		[1]={szName="Kim � B�ch L�c H�ng Li�n",tbProp={0,2185},nCount=1,nQuality = 1,},
		[2]={szName="Kim � B�ch L�c Qu�n",tbProp={0,2186},nCount=1,nQuality = 1,},
		[3]={szName="Kim � B�ch L�c Th��ng Gi�i",tbProp={0,2187},nCount=1,nQuality = 1,},
		[4]={szName="Kim � B�ch L�c H� Uy�n",tbProp={0,2188},nCount=1,nQuality = 1,},
		[5]={szName="Kim � B�ch L�c Th�c Y�u",tbProp={0,2189},nCount=1,nQuality = 1,},
		[6]={szName="Kim � B�ch L�c Gi�p Y",tbProp={0,2190},nCount=1,nQuality = 1,},
		[7]={szName="Kim � B�ch L�c Ti�n",tbProp={0,2191},nCount=1,nQuality = 1,},
		[8]={szName="Kim � B�ch L�c L�",tbProp={0,2192},nCount=1,nQuality = 1,},
		[9]={szName="Kim � B�ch L�c Tr�y",tbProp={0,2193},nCount=1,nQuality = 1,},
		[10]={szName="Kim � B�ch L�c H� Gi�i",tbProp={0,2194},nCount=1,nQuality = 1,},
	},
	[18] = {
		szName = "B� trang b� Kim � Nga My Ki�m",
		[1]={szName="Kim � V� � Ch�u Li�n",tbProp={0,2115},nCount=1,nQuality = 1,},
		[2]={szName="Kim � V� � Ph�t ��i",tbProp={0,2116},nCount=1,nQuality = 1,},
		[3]={szName="Kim � V� � Th��ng Gi�i",tbProp={0,2117},nCount=1,nQuality = 1,},
		[4]={szName="Kim � V� � H� Uy�n",tbProp={0,2118},nCount=1,nQuality = 1,},
		[5]={szName="Kim � V� � Th�c Y�u",tbProp={0,2119},nCount=1,nQuality = 1,},
		[6]={szName="Kim � V� � Sa Y",tbProp={0,2120},nCount=1,nQuality = 1,},
		[7]={szName="Kim � V� � Tr��ng Ki�m",tbProp={0,2121},nCount=1,nQuality = 1,},
		[8]={szName="Kim � V� � ?Ngoa",tbProp={0,2122},nCount=1,nQuality = 1,},
		[9]={szName="Kim � V� � H��ng Nang",tbProp={0,2123},nCount=1,nQuality = 1,},
		[10]={szName="Kim � V� � H� Gi�i",tbProp={0,2124},nCount=1,nQuality = 1,},
	},
	[19] = {
		szName = "B� trang b� Kim � Thi�n Nh�n �ao (Max Option)",
		[1]={szName="Kim � �nh Huy�t H�ng Li�n",tbProp={0,3415},nCount=1,nQuality = 1,},
		[2]={szName="Kim � �nh Huy�t Qu�n Mi�n",tbProp={0,3416},nCount=1,nQuality = 1,},
		[3]={szName="Kim � �nh Huy�t Th��ng Gi�i",tbProp={0,3417},nCount=1,nQuality = 1,},
		[4]={szName="Kim � �nh Huy�t H� Uy�n",tbProp={0,3418},nCount=1,nQuality = 1,},
		[5]={szName="Kim � �nh Huy�t Y�u ��i",tbProp={0,3419},nCount=1,nQuality = 1,},
		[6]={szName="Kim � �nh Huy�t Gi�p",tbProp={0,3420},nCount=1,nQuality = 1,},
		[7]={szName="Kim � �nh Huy�t �ao",tbProp={0,3421},nCount=1,nQuality = 1,},
		[8]={szName="Kim � �nh Huy�t Ngoa",tbProp={0,3422},nCount=1,nQuality = 1,},
		[9]={szName="Kim � �nh Huy�t B�i",tbProp={0,3423},nCount=1,nQuality = 1,},
		[10]={szName="Kim � �nh Huy�t H� Gi�i",tbProp={0,3424},nCount=1,nQuality = 1,},
	},
	[20] = {
		szName = "B� trang b� Kim � Thi�u L�m �ao (Max Option)",
		[1]={szName="Kim � B�n Nh��c H�ng Li�n",tbProp={0,3255},nCount=1,nQuality = 1,},
		[2]={szName="Kim � B�n Nh��c T�ng M�o",tbProp={0,3256},nCount=1,nQuality = 1,},
		[3]={szName="Kim � B�n Nh��c Th��ng Gi�i",tbProp={0,3257},nCount=1,nQuality = 1,},
		[4]={szName="Kim � B�n Nh��c H� Uy�n",tbProp={0,3258},nCount=1,nQuality = 1,},
		[5]={szName="Kim � B�n Nh��c Y�u ��i",tbProp={0,3259},nCount=1,nQuality = 1,},
		[6]={szName="Kim � B�n Nh��c C� Sa",tbProp={0,3260},nCount=1,nQuality = 1,},
		[7]={szName="Kim � B�n Nh��c Gi�i �ao",tbProp={0,3261},nCount=1,nQuality = 1,},
		[8]={szName="Kim � B�n Nh��c T�ng H�i",tbProp={0,3262},nCount=1,nQuality = 1,},
		[9]={szName="Kim � B�n Nh��c Y�u Tr�y",tbProp={0,3263},nCount=1,nQuality = 1,},
		[10]={szName="Kim � B�n Nh��c H� Gi�i",tbProp={0,3264},nCount=1,nQuality = 1,},
	},
	[21] = {
		szName = "B� trang b� Kim � ���ng M�n N� Ti�n (Max Option)",
		[1]={szName="Kim � B�ch L�c H�ng Li�n",tbProp={0,3365},nCount=1,nQuality = 1,},
		[2]={szName="Kim � B�ch L�c Qu�n",tbProp={0,3366},nCount=1,nQuality = 1,},
		[3]={szName="Kim � B�ch L�c Th��ng Gi�i",tbProp={0,3367},nCount=1,nQuality = 1,},
		[4]={szName="Kim � B�ch L�c H� Uy�n",tbProp={0,3368},nCount=1,nQuality = 1,},
		[5]={szName="Kim � B�ch L�c Th�c Y�u",tbProp={0,3369},nCount=1,nQuality = 1,},
		[6]={szName="Kim � B�ch L�c Gi�p Y",tbProp={0,3370},nCount=1,nQuality = 1,},
		[7]={szName="Kim � B�ch L�c Ti�n",tbProp={0,3371},nCount=1,nQuality = 1,},
		[8]={szName="Kim � B�ch L�c L�",tbProp={0,3372},nCount=1,nQuality = 1,},
		[9]={szName="Kim � B�ch L�c Tr�y",tbProp={0,3373},nCount=1,nQuality = 1,},
		[10]={szName="Kim � B�ch L�c H� Gi�i",tbProp={0,3374},nCount=1,nQuality = 1,},
	},
	[22] = {
		szName = "B� trang b� Kim � V� �ang Kh� (Max Option)",
		[1]={szName="Kim � L�c H�p Ph�",tbProp={0,3425},nCount=1,nQuality = 1,},
		[2]={szName="Kim � L�c H�p Qu�n",tbProp={0,3426},nCount=1,nQuality = 1,},
		[3]={szName="Kim � L�c H�p Th��ng Gi�i",tbProp={0,3427},nCount=1,nQuality = 1,},
		[4]={szName="Kim � L�c H�p T�",tbProp={0,3428},nCount=1,nQuality = 1,},
		[5]={szName="Kim � L�c H�p Ph�p ��i",tbProp={0,3429},nCount=1,nQuality = 1,},
		[6]={szName="Kim � L�c H�p ��o B�o",tbProp={0,3430},nCount=1,nQuality = 1,},
		[7]={szName="Kim � L�c H�p Ki�m",tbProp={0,3431},nCount=1,nQuality = 1,},
		[8]={szName="Kim � L�c H�p L�",tbProp={0,3432},nCount=1,nQuality = 1,},
		[9]={szName="Kim � L�c H�p Ng�c B�i",tbProp={0,3433},nCount=1,nQuality = 1,},
		[10]={szName="Kim � L�c H�p H� Gi�i",tbProp={0,3434},nCount=1,nQuality = 1,},
	},
	[23] = {
		szName = "B� trang b� Kim � C�n L�n �ao (Max Option)",
		[1]={szName="Kim � Nguy�t �nh H�ng Li�n",tbProp={0,3445},nCount=1,nQuality = 1,},
		[2]={szName="Kim � Nguy�t �nh ��o Qu�n",tbProp={0,3446},nCount=1,nQuality = 1,},
		[3]={szName="Kim � Nguy�t �nh Th��ng Gi�i",tbProp={0,3447},nCount=1,nQuality = 1,},
		[4]={szName="Kim � Nguy�t �nh H� Uy�n",tbProp={0,3448},nCount=1,nQuality = 1,},
		[5]={szName="Kim � Nguy�t �nh Th�c Y�u",tbProp={0,3449},nCount=1,nQuality = 1,},
		[6]={szName="Kim � Nguy�t �nh ��o B�o",tbProp={0,3450},nCount=1,nQuality = 1,},
		[7]={szName="Kim � Nguy�t �nh B�o �ao",tbProp={0,3451},nCount=1,nQuality = 1,},
		[8]={szName="Kim � Nguy�t �nh Ngoa",tbProp={0,3452},nCount=1,nQuality = 1,},
		[9]={szName="Kim � Nguy�t �nh B�i",tbProp={0,3453},nCount=1,nQuality = 1,},
		[10]={szName="Kim � Nguy�t �nh H� Gi�i",tbProp={0,3454},nCount=1,nQuality = 1,},
	},
	[24] = {
		szName = "B� trang b� Kim � Nga Mi Ki�m (Max Option)",
		[1]={szName="Kim � V� � Ch�u Li�n",tbProp={0,3295},nCount=1,nQuality = 1,},
		[2]={szName="Kim � V� � Ph�t ��i",tbProp={0,3296},nCount=1,nQuality = 1,},
		[3]={szName="Kim � V� � Th��ng Gi�i",tbProp={0,3297},nCount=1,nQuality = 1,},
		[4]={szName="Kim � V� � H� Uy�n",tbProp={0,3298},nCount=1,nQuality = 1,},
		[5]={szName="Kim � V� � Th�c Y�u",tbProp={0,3299},nCount=1,nQuality = 1,},
		[6]={szName="Kim � V� � Sa Y",tbProp={0,3300},nCount=1,nQuality = 1,},
		[7]={szName="Kim � V� � Tr��ng Ki�m",tbProp={0,3301},nCount=1,nQuality = 1,},
		[8]={szName="Kim � V� � ?Ngoa",tbProp={0,3302},nCount=1,nQuality = 1,},
		[9]={szName="Kim � V� � H��ng Nang",tbProp={0,3303},nCount=1,nQuality = 1,},
		[10]={szName="Kim � V� � H� Gi�i",tbProp={0,3304},nCount=1,nQuality = 1,},
	},
}
--tbCurSeason.tbFreeBagRequire = {
--	[1] = 0,
--	[2] = 	0,
--	[3] = 0,
--	[4] = 0,
--	[5] = 0,
--	[6] = 1,
--	[7] = 1,
--	[8] = 1,
--	[9] = 1, --fsda
--	[10] = 1,
--	[11] = 1,
--}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 4, nBit = 1},	
	[2] = {nExtPoint = 4, nBit = 2},
	[3] = {nExtPoint = 4, nBit = 3},
	[4] = {nExtPoint = 4, nBit = 4},
	[5] = {nExtPoint = 4, nBit = 5},
	[6] = {nExtPoint = 4, nBit = 6},
	[7] = {nExtPoint = 4, nBit = 7},
	[8] = {nExtPoint = 4, nBit = 8},
}
tbCurSeason.tbLog = {"THDNB10", "NhanThuongTaiLeQuan"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end
--H� tr� trao gi�i th��ng cho ng��i chi�n th�ng - Created by DinhHQ - 20110607
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201207260000
tbCurSeason.nEndDate = 201207312400
tbCurSeason.strName = "Nh�n th��ng gi�i ��u THDNB 11"
tbCurSeason.strNPC = "Chi�n T�m T�n Gi�"
tbCurSeason.nID = 11
tbCurSeason.tbAccList = {		
		["000taquocdung"]={[1]={{nAwardID=12,nCount=1},},},
		["2sthoangdzuong2"]={[1]={{nAwardID=4,nCount=3},{nAwardID=7,nCount=3},},},
		["andyrockdick"]={[1]={{nAwardID=7,nCount=60},},[2]={{nAwardID=6,nCount=60},},[3]={{nAwardID=6,nCount=14},{nAwardID=7,nCount=14},{nAwardID=9,nCount=16},{nAwardID=12,nCount=16},},},
		["anhhungxabuon"]={[1]={{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["ansinhhd1"]={[1]={{nAwardID=2,nCount=1},},},
		["bkchampionx"]={[1]={{nAwardID=10,nCount=1},},},
		["caidgithe"]={[1]={{nAwardID=7,nCount=60},},[2]={{nAwardID=6,nCount=60},},[3]={{nAwardID=6,nCount=14},{nAwardID=7,nCount=14},{nAwardID=9,nCount=24},},[4]={{nAwardID=12,nCount=24},},},
		["camyve84"]={[1]={{nAwardID=2,nCount=1},},},
		["changsitinhtiengiang1991"]={[1]={{nAwardID=2,nCount=1},},},
		["chichichi90"]={[1]={{nAwardID=7,nCount=32},{nAwardID=9,nCount=4},{nAwardID=11,nCount=1},{nAwardID=12,nCount=4},},},
		["chuphuc1811"]={[1]={{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["chuyenmotnguoidien2407"]={[1]={{nAwardID=7,nCount=32},{nAwardID=9,nCount=4},{nAwardID=10,nCount=1},{nAwardID=12,nCount=4},},},
		["cuchuoilaihd"]={[1]={{nAwardID=2,nCount=1},},},
		["culinhthanchuong2005"]={[1]={{nAwardID=3,nCount=1},},},
		["daikangoc2000"]={[1]={{nAwardID=12,nCount=1},},},
		["doctorvcc"]={[1]={{nAwardID=7,nCount=60},},[2]={{nAwardID=6,nCount=60},},[3]={{nAwardID=6,nCount=14},{nAwardID=7,nCount=14},{nAwardID=9,nCount=16},{nAwardID=12,nCount=16},},},
		["doibinhyen"]={[1]={{nAwardID=2,nCount=1},},},
		["doivedau2015"]={[1]={{nAwardID=12,nCount=1},},},
		["dulongcongtu89"]={[1]={{nAwardID=4,nCount=2},{nAwardID=7,nCount=2},{nAwardID=12,nCount=1},},},
		["dungtrocno10"]={[1]={{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["dungtrocno15"]={[1]={{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["flocakeu402"]={[1]={{nAwardID=7,nCount=16},{nAwardID=9,nCount=2},{nAwardID=12,nCount=2},},},
		["gaconhtmdc"]={[1]={{nAwardID=7,nCount=16},{nAwardID=9,nCount=8},{nAwardID=12,nCount=8},},},
		["giakhanh989875"]={[1]={{nAwardID=1,nCount=1},},},
		["hanhyeuquan1136"]={[1]={{nAwardID=7,nCount=32},{nAwardID=9,nCount=4},{nAwardID=10,nCount=1},{nAwardID=12,nCount=4},},},
		["hero1002"]={[1]={{nAwardID=7,nCount=16},{nAwardID=9,nCount=8},{nAwardID=12,nCount=8},},},
		["hoalovelan"]={[1]={{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["hoangtuancdkd"]={[1]={{nAwardID=4,nCount=2},{nAwardID=7,nCount=2},},},
		["hongquanss"]={[1]={{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["huanhanhkiem"]={[1]={{nAwardID=12,nCount=1},},},
		["inmulove00"]={[1]={{nAwardID=1,nCount=1},{nAwardID=5,nCount=8},},},
		["internetlac"]={[1]={{nAwardID=7,nCount=60},},[2]={{nAwardID=6,nCount=60},},[3]={{nAwardID=6,nCount=14},{nAwardID=7,nCount=14},{nAwardID=9,nCount=24},},[4]={{nAwardID=12,nCount=24},},},
		["khjnaobjetyeu1102"]={[1]={{nAwardID=2,nCount=2},{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["kingcar"]={[1]={{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["lamng0"]={[1]={{nAwardID=7,nCount=16},{nAwardID=9,nCount=2},{nAwardID=12,nCount=2},},},
		["lamphong88888"]={[1]={{nAwardID=1,nCount=1},},},
		["leduy1203"]={[1]={{nAwardID=3,nCount=1},},},
		["loidung021108"]={[1]={{nAwardID=2,nCount=2},},},
		["longthieutien1102"]={[1]={{nAwardID=12,nCount=1},},},
		["lovehung110"]={[1]={{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},{nAwardID=8,nCount=1},{nAwardID=10,nCount=1},},},
		["luuduydongls"]={[1]={{nAwardID=12,nCount=1},},},
		["minhhai72"]={[1]={{nAwardID=7,nCount=60},},[2]={{nAwardID=6,nCount=60},},[3]={{nAwardID=4,nCount=60},},[4]={{nAwardID=4,nCount=14},{nAwardID=6,nCount=14},{nAwardID=7,nCount=14},},[5]={{nAwardID=9,nCount=32},},[6]={{nAwardID=12,nCount=32},},},
		["netlife"]={[1]={{nAwardID=2,nCount=1},{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["ngamicuibap777"]={[1]={{nAwardID=1,nCount=1},{nAwardID=2,nCount=1},},},
		["ngaytrove010812"]={[1]={{nAwardID=1,nCount=1},},},
		["ngovancuong1986vn"]={[1]={{nAwardID=12,nCount=1},},},
		["nguyenanhtuan0102"]={[1]={{nAwardID=4,nCount=2},{nAwardID=7,nCount=2},{nAwardID=12,nCount=1},},},
		["nguyenhuy198520052005"]={[1]={{nAwardID=7,nCount=16},{nAwardID=9,nCount=2},{nAwardID=12,nCount=2},},},
		["nguyenvantam756431911"]={[1]={{nAwardID=12,nCount=1},},},
		["nhaanhnhaem"]={[1]={{nAwardID=5,nCount=8},},},
		["nhatanhzoro"]={[1]={{nAwardID=7,nCount=60},},[2]={{nAwardID=6,nCount=60},},[3]={{nAwardID=6,nCount=14},{nAwardID=7,nCount=14},{nAwardID=9,nCount=16},{nAwardID=12,nCount=16},},},
		["nicelehoan4"]={[1]={{nAwardID=12,nCount=2},},},
		["onggiabatcuop68"]={[1]={{nAwardID=12,nCount=1},},},
		["peruacon16"]={[1]={{nAwardID=2,nCount=1},{nAwardID=8,nCount=1},},},
		["pprinces1259"]={[1]={{nAwardID=3,nCount=1},{nAwardID=4,nCount=2},{nAwardID=7,nCount=2},},},
		["quangnt63"]={[1]={{nAwardID=7,nCount=32},{nAwardID=9,nCount=24},},[2]={{nAwardID=12,nCount=24},},},
		["quangtien82"]={[1]={{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["quyenchip35"]={[1]={{nAwardID=7,nCount=16},{nAwardID=9,nCount=2},{nAwardID=12,nCount=2},},},
		["rappertc01"]={[1]={{nAwardID=12,nCount=1},},},
		["rotbomgiangbom"]={[1]={{nAwardID=2,nCount=1},},},
		["skyline86xx"]={[1]={{nAwardID=2,nCount=1},},},
		["sonim20"]={[1]={{nAwardID=1,nCount=1},},},
		["thanhphuc2711985"]={[1]={{nAwardID=2,nCount=1},},},
		["thansoaivolam2"]={[1]={{nAwardID=7,nCount=32},{nAwardID=9,nCount=17},},[2]={{nAwardID=12,nCount=16},},},
		["tienngon1"]={[1]={{nAwardID=1,nCount=1},},},
		["tieulo007"]={[1]={{nAwardID=7,nCount=16},{nAwardID=9,nCount=2},{nAwardID=12,nCount=2},},},
		["tramvu0609250206"]={[1]={{nAwardID=2,nCount=1},},},
		["tranhoangtam0936134882"]={[1]={{nAwardID=2,nCount=1},},},
		["tuanbdp"]={[1]={{nAwardID=7,nCount=60},},[2]={{nAwardID=6,nCount=60},},[3]={{nAwardID=4,nCount=60},},[4]={{nAwardID=9,nCount=60},},[5]={{nAwardID=12,nCount=60},},[6]={{nAwardID=4,nCount=14},{nAwardID=6,nCount=14},{nAwardID=7,nCount=14},{nAwardID=9,nCount=14},},[7]={{nAwardID=12,nCount=14},},},
		["viettranet"]={[1]={{nAwardID=7,nCount=32},{nAwardID=9,nCount=4},{nAwardID=10,nCount=1},{nAwardID=12,nCount=4},},},
		["vinhthitheo19935"]={[1]={{nAwardID=12,nCount=1},},},
		["vinhthitheo19936"]={[1]={{nAwardID=12,nCount=1},},},
		["vodangvip91"]={[1]={{nAwardID=1,nCount=1},{nAwardID=4,nCount=1},{nAwardID=7,nCount=1},},},
		["votthienthanh1983"]={[1]={{nAwardID=7,nCount=60},},[2]={{nAwardID=6,nCount=60},},[3]={{nAwardID=6,nCount=14},{nAwardID=7,nCount=14},{nAwardID=9,nCount=16},{nAwardID=12,nCount=16},},},
		["vtd2610"]={[1]={{nAwardID=3,nCount=1},},},
}
tbCurSeason.tbPrizeList = {		
	{szName="Phi�n V� ",tbProp={0,10,7,1,0,0},nCount=1},
	{szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1},
	{szName="B� trang b� Kim � (Max Option) - T� ch�n h� ph�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={22,0,0,0,0,0},},
	{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1},
	{szName="�� Ph� B�ch H� Y",tbProp={6,1,3174,1,0,0},nCount=1},
	{szName="Ho�ng Ch�n ��n",tbProp={6,1,2264,1,0,0},nCount=1},
	{szName="H�ng bao An khang",tbProp={6,1,2105,1,0,0},nCount=1},
	{szName="M�t n� V��ng Gi�",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=43200},
	{szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=259200},
	{szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200,},
	{szName="Phi phong Ng� Phong (Tr�ng k�ch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200,},
	{szName="Qu� Ho�ng Kim (100)",tbProp={6,1,30095,1,0,0},nCount=1},	
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
	[1] = {nExtPoint = 4, nBit = 2},	
	[2] = {nExtPoint = 4, nBit = 3},
	[3] = {nExtPoint = 4, nBit = 4},
	[4] = {nExtPoint = 4, nBit = 5},
	[5] = {nExtPoint = 4, nBit = 6},
	[6] = {nExtPoint = 4, nBit = 7},
	[7] = {nExtPoint = 4, nBit = 8},	
}
tbCurSeason.nFreeCellRequire = 60
tbCurSeason.tbLog = {"THDNB11", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end
IncludeLib("FILESYS")
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
Include("\\script\\vng_event\\traogiai\\npah\\awards\\13\\awardlist.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201012010000
tbCurSeason.nEndDate = 201212062400
tbCurSeason.strName = "Trao gi�i UNION v� b�c th�m THDNB"
tbCurSeason.strNPC = "Chi�n T�m T�n Gi�"
tbCurSeason.nID = 13
tbCurSeason.nFreeCellRequire  = 60
tbCurSeason.tbAccList = tbAwardList
tbCurSeason.tbPrizeList = {	
	[1] = {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080,nUsageTime=60},
	[2] = {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=259200},
	[3] = {szName="X�ch Long C�u",tbProp={0,10,9,1,0,0},nCount=1},
	[4] = {szName="Huy�t Long ��ng C�p 6",tbProp={6,1,30289,6,0,0},nCount=1},
	[5] = {szName="T�i Thi�n L�c Ph�c",tbProp={6,1,3268,1,0,0},nCount=1,nExpiredTime=20160},
	[6] = {szName = "�i�m Kinh Nghi�m", nExp=100000000},
	[7] = {szName = "�i�m Kinh Nghi�m", nExp=150000000},
	[8] = {szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=1,nBindState=-2},
	[9] = {szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=1},
	[10] = {szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=3,tbParam={7,0,0,0,0,0}},
	[11] = {szName="T� H�i Ti�u Di�u ��n L� H�p",tbProp={6,1,2398,1,0,0},nCount=1,nExpiredTime=20160},
	[12] = {szName="Vi�m �� L�nh",tbProp={6,1,1617,1,0,0},nCount=1,nExpiredTime=20160},
	[13] = {szName="Long Huy�t Ho�n",tbProp={6,1,2117,1,0,0},nCount=1,nExpiredTime=20160},
	[14] = {szName="Ng�c Tr�ng Luy�n L� H�p",tbProp={6,1,30323,1,0,0},nCount=1,nExpiredTime=10080,nBindState=-2},
	[15] = {szName="T�i Qu� S� Ki�n",tbProp={6,1,30324,1,0,0},nCount=1,nExpiredTime=10080,nBindState=-2},
}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 5, nBit = 13},	
}
tbCurSeason.tbLog = {"UNION_THDNB", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end

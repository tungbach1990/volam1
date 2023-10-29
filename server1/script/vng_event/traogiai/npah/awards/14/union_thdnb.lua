IncludeLib("FILESYS")
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
Include("\\script\\vng_event\\traogiai\\npah\\awards\\14\\awardlist.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201301170000
tbCurSeason.nEndDate = 201301232400
tbCurSeason.strName = "Nh�n th��ng trao gi�i THDNB 12"
tbCurSeason.strNPC = "Chi�n T�m T�n Gi�"
tbCurSeason.nID = 14
tbCurSeason.nFreeCellRequire  = 60
tbCurSeason.tbAccList = tbAwardList
tbCurSeason.tbPrizeList = {	
	[1] = {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=259200},
	[2] = {szName="Ho�ng ch�n ��n",tbProp={6,1,2264,6,0,0},nCount=1},
	[3] = {szName="H�n nguy�n ch�n ��n",tbProp={6,1,30301,1,0,0},nCount=1},
	[4] = {szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200},
	[5] = {szName="Nh�t K� C�n Kh�n Ph�", tbProp={6,1,2126,1,0,0}, nCount=1,nBindState=-2},	
	[6] = {szName="B�ch H� Tr�ng Luy�n Ng�c",tbProp={6,1,3187,1,0,0},nCount=1,nBindState=-2},
	[7] = {szName="T� Kim Ch�n ��n",tbProp={6,1,2263,1,0,0},nCount=1,tbParam={2000000000},nBindState=-2},
	[8] = {szName="Huy�n Ch�n ��n",tbProp={6,1,1678,1,0,0},nCount=1,tbParam={1500000000},nBindState=-2},
	[9] = {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200},
	[10] = {szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=1},
	[11] = {szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nBindState=-2},
	[12]={szName="Qu� Ho�ng Kim (100)",tbProp={6,1,30095,1,0,0},nCount=1},
	[13] = {szName="Phong V�n B�ch M�",tbProp={0,10,19,1,0,0},nCount=1},
	[14] = {szName="B� trang b� B�ch H� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,0,0,0,0,0}},
	[15] = {szName="M�t n� - Anh h�ng chi�n tr��ng L� H�p",tbProp={6,1,30361,1,0,0},nCount=1,nExpiredTime=7*24*60},
	[16] = {szName="B�o r��ng Ho�ng Ch�n ��n",tbProp={6,1,30362,1,0,0},nCount=1,nExpiredTime=7*24*60},
	[17] = {szName="R��ng h�n nguy�n ch�n ��n",tbProp={6,1,30363,1,0,0},nCount=1,nExpiredTime=7*24*60},
}

tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 5, nBit = 10},	
}
tbCurSeason.tbLog = {"UNION_THDNB", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end

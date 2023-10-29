IncludeLib("FILESYS")
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")
Include("\\script\\vng_event\\traogiai\\npah\\awards\\11\\awardlist.lua")
tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201210180000
tbCurSeason.nEndDate = 201210312400
tbCurSeason.strName = "Nh�n th��ng Ti�m Long Nh�t H�i"
tbCurSeason.strNPC = "Chi�n T�m T�n Gi�"
tbCurSeason.nID = 11
tbCurSeason.nFreeCellRequire  = 60
tbCurSeason.tbAccList = tbAwardList
tbCurSeason.tbPrizeList = {	
	[1] = {szName="V�ng H�o Quang Ti�m Long Nh�t H�i",nTittleID=3004,nExpiredTime=259200},
	[2] = {szName="Phi phong c�p 6 l� h�p",tbProp={6,1,30302,1,0,0},nCount=1,nExpiredTime=7*60*24},
	[3] = {szName="Phong V�n B�ch M�",tbProp={0,10,19,1,0,0},nCount=1},
	[4] = {szName="�� Ph� B�ch H� Y",tbProp={6,1,3174,1,0,0},nCount=1},
	[5] = {szName="H�n Nguy�n Ch�n ��n",tbProp={6,1,30301,1,0,0},nCount=1},
	[6] = {szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=1},
	[7] = {szName="Phi�n V� ",tbProp={0,10,7,1,0,0},nCount=1},
	[8] = {szName="Ho�ng kim �n c�p 8 l� h�p",tbProp={6,1,30303,1,0,0},nCount=1,nExpiredTime=7*60*24},
	[9] =  {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=129600},
	[10] = {szName="�� Ph� B�ch H� Kh� Gi�i",tbProp={6,1,3182,1,0,0},nCount=1},
	[11] = {szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1},
	[12] = {szName="M�t n� V��ng Gi�",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=129600},
}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 5, nBit = 12},	
}
tbCurSeason.tbLog = {"TraoGiaiTiemLongNhatHoi", "NhanThuongTaiChienTamTonGia"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end

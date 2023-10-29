--H� tr� trao gi�i th��ng CSM Talk - Created by DinhHQ - 20130423
Include("\\script\\vng_event\\traogiai\\npah\\vng_awardclass.lua")
Include("\\script\\vng_event\\traogiai\\npah\\vng_toolaward.lua")

tbCurSeason = tbAwardClass:New()
tbCurSeason.nStartDate = 201304250000
tbCurSeason.nEndDate = 201304262400
tbCurSeason.strName = "Nh�n th��ng CSM Talk"
tbCurSeason.strNPC = "Chi�n T�m T�n Gi�"
tbCurSeason.nID = 16
tbCurSeason.tbAccList = {	
	["ngchinh27111988"]={[1]={{ nAwardID = 1, nCount = 1},},},
	["thangbkhn"]={[1]={{ nAwardID = 1, nCount = 1},},},
	["hoangvikhang"]={[1]={{ nAwardID = 1, nCount = 1},},},
	["vogiandao7777"]={[1]={{ nAwardID = 1, nCount = 1},},},
	["youngman1102"]={[1]={{ nAwardID = 1, nCount = 1},},},
	["ngocbich022009"]={[1]={{ nAwardID = 1, nCount = 1},},},
	["thanhliem1993123"]={[1]={{ nAwardID = 1, nCount = 1},},},
	["ghetpequa"]={[1]={{ nAwardID = 1, nCount = 1},},},
	["ga8ancom"]={[1]={{ nAwardID = 1, nCount = 1},},},
	["thangdenne2003"]={[1]={{ nAwardID = 1, nCount = 1},},},
	["nguyenvanvan51"]={[1]={{ nAwardID = 1, nCount = 1},},},
}
tbCurSeason.tbPrizeList = {	
	[1] ={
		[1] = {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=20,nExpiredTime=43200},
		[2] = {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=10,nExpiredTime=43200},
		[3] = {szName="L� Bao Phi Phong",tbProp={6,1,30360,1,0,0},nCount=10,nExpiredTime=10080, tbParam={6,0,10080,0,0,0}},
		szName = "G�i ph�n th��ng CSM Talk",
	},
}
tbCurSeason.tbExtPointBit = {
	[1] = {nExtPoint = 3, nBit = 15},
}
tbCurSeason.tbLog = {"TraoThuongCSMTalk", "NhanThuongTaiChienTam"}
if tbCurSeason:IsOver() == 1 then
	tbCurSeason = nil
else
	tbVngToolAward:AddSeason(tbCurSeason)
end
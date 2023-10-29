Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\vng_script\\features\\online_get_award\\onlinedef.lua")
Include("\\script\\lib\\log.lua")

tbOnlineGetAward = tbOnlineGetAward or {}

tbOnlineGetAward.EVENT_LOG_TITLE = "LOGEVENT_CTC_ONLINE"
tbOnlineGetAward.TIME_ONLINE = 60*60 --60 phut moi nhan duoc 1phan thuong
DATE_END = 20160301
tbOnlineGetAward.nStartDate = 201602010000
tbOnlineGetAward.nEndDate = 201602292400
tbOnlineGetAward.nLevel = 100

tbOnlineGetAward.AwardOnline = {szName="Qu� N�m M�i", tbProp={6,1,30403,1,0,0},nCount = 2, nExpiredTime=DATE_END,nBindState=-2}
tbOnlineGetAward.AwardTriAn ={
	 {szName="M�t n� V��ng Gi� ",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=7*24*60,nBindState=-2},
	 {szName = "Phi V�n Th�n M�", tbProp = {0,10,8,1,0,0}, nCount = 1,nExpiredTime=7*24*60,nBindState=-2},
	 {szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=5,nExpiredTime=7*24*60,nBindState=-2},
	 {szName = "�i�m Kinh Nghi�m", nExp=10000000,},	 
}
tbOnlineGetAward.BitTaskTriAn = {nTaskID = 2734,nStartBit = 26,nBitCount = 1,nMaxValue = 1}

function tbOnlineGetAward:main()
	if (tbOnlineGetAward:IsActive() ~=1) then	
		return
	end
	if GetLevel() < self.nLevel  then
		return Talk(1,"",format("��ng c�p kh�ng �� %d �� nh�n thi�p, h�y c� g�ng luy�n t�p.",self.nLevel))
	end
	local szMsg = format("<npc>Trong d�p T�t c� truy�n, c�c b�ng h�u b�n t�u giang h� 60 ph�t s� nh�n ���c ph�n th��ng t� ta\n")
	local tbOpt = {}
	
	tinsert(tbOpt, {format("Nh�n l� x� t�t B�nh Th�n"), self.GetAwardOnline, {self}})
	tinsert(tbOpt, {format("Nh�n qu� Tri �n"), self.GetAwardTriAn, {self}})
	tinsert(tbOpt, {format("Xem th�i gian t�ch l�y online"), self.ShowOnlineTime, {self}})	
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end

function tbOnlineGetAward:GetOnlineTime()
	local nNowTime = GetCurServerTime()
	local nOnlineTime = 0
	local nLastLogInTime = GetTask(tbAccOnlineTime.TSK_LAST_ONLINETIME)
	local nTodayTime = tbAccOnlineTime:ConvertTMToTime(tonumber(GetLocalDate("%Y%m%d")))
	if(nTodayTime > nLastLogInTime) then --qua ngay reset tich l�y time
		SetTask(self.TSK_SAVE_TIME, 0)
		SetTask(tbAccOnlineTime.TSK_LAST_ONLINETIME, GetCurServerTime())
		--print("-----GetOnlineTime Reset  TSK_SAVE_TIME: "..GetTask(self.TSK_SAVE_TIME))
	end
	--print("-----GetOnlineTime - nLastLogInTime 1: "..nLastLogInTime)
	--print("-----GetOnlineTime - nTodayTime 1: "..nTodayTime)
	if(nTodayTime <= nLastLogInTime) then
		nOnlineTime = GetTask(tbAccOnlineTime.TSK_SAVE_TIME)+ (nNowTime - nLastLogInTime)
		--print("-----GetOnlineTime - nOnlineTime 1: "..nOnlineTime)
	else
		nOnlineTime = nNowTime - nTodayTime
		--print("-----GetOnlineTime - nOnlineTime 2: "..nOnlineTime)
	end	
	return  nOnlineTime
end

--Nhan qua tri an
function tbOnlineGetAward:GetAwardTriAn()
	--kiem tra o trong hanh trang
	if PlayerFunLib:CheckFreeBagCellWH(2, 8, 1, "default") ~= 1  then
		return
	end
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(self.BitTaskTriAn, 1, format("C�c h� �� nh�n th��ng Tri �n r�i, m�i nh�n v�t ch� nh�n ���c 1 l�n."), "<") then
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.BitTaskTriAn, 1)
	tbAwardTemplet:Give(self.AwardTriAn,1,{self.EVENT_LOG_TITLE,"NhanThuongTriAn"})	
	Msg2Player("Ch�c m�ng c�c h� nh�n ���c ph�n th��ng Tri �n T�t B�nh Th�n!")	
end

function tbOnlineGetAward:GetAwardOnline()
	--kiem tra o trong hanh trang
	if PlayerFunLib:CheckFreeBagCell(5,"Ph�i c� �t nh�t 5 � tr�ng m�i c� th� nh�n th��ng.") ~= 1 then
		return
	end
	local nToTalTime= self:GetOnlineTime()
	--print("-----GetAwardOnline - nToTalTime: "..nToTalTime) 
	local nNumAward  =  floor(nToTalTime/self.TIME_ONLINE)	
	if nNumAward > 0 then
		local nNewTimeOnline = nToTalTime - nNumAward*self.TIME_ONLINE
		SetTask(tbAccOnlineTime.TSK_LAST_ONLINETIME, GetCurServerTime())
		SetTask(tbAccOnlineTime.TSK_SAVE_TIME,nNewTimeOnline)
		--print("-----GetAwardOnline - nNumAward: "..nNumAward)
		--print("-----GetAwardOnline - nNewTimeOnline: "..nNewTimeOnline)		
		tbAwardTemplet:Give(self.AwardOnline,nNumAward,{self.EVENT_LOG_TITLE,"NhanThuongOnline"})		
		return
	end
	return Talk(1,"","Th�i gian t�ch l�y ch�a �� �� nh�n th��ng.")
end


function tbOnlineGetAward:ShowOnlineTime()
	local nToTalTime= self:GetOnlineTime()
	local nMin = floor(nToTalTime/60)
	local nSec = nToTalTime - nMin*60	
	Talk(1, "", format("Th�i gian Online trong ng�y l� <color=yellow>%s<color> ph�t <color=yellow>%s<color> gi�y.",nMin,nSec))
end
function tbOnlineGetAward:IsActive()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate >= self.nStartDate  and nCurDate <= self.nEndDate  then
		return 1
	end	
	return 0
end

EventSys:GetType("AddNpcOption"):Reg("Th�n T�i Du Xu�n ","Nh�n qu� t�t B�nh Th�n", tbOnlineGetAward.main,{tbOnlineGetAward})


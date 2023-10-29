Include("\\script\\misc\\eventsys\\type\\player.lua")
IncludeLib("SETTING")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")
Include("\\vng_script\\events\\trao_title_tdb\\head.lua")
Include("\\vng_script\\events\\traogiai\\vng_toolaward.lua")
function tbGetTitleTDB:GetTitle_TDB2()
	if (self:IsActive() ~=1) then	
		return
	end
	local nCheck, nTitleId = self:CheckIsAccTDB2()
	if  nCheck ~= 1 then
		Talk(1,"","C�c h� kh�ng ph� h�p �i�u ki�n l�nh th��ng")
		return
	end
	local nTitleIdtype = Title_GetTitleInfo(nTitleId)
	
	if nTitleIdtype ~= 0 then
		Title_RemoveTitle(nTitleId)
	end	
	SetTask(TASK_ACTIVE_TITLE, nTitleId)	
		
	local nTime = Tm2Time(2016, 4, 30, 24,0 )
	local nServerTime = GetCurServerTime()
	local nExpiredTime = nTime - nServerTime
	if nExpiredTime <= 0 then
		return
	end
	local nDay	= floor(mod(nExpiredTime,1000000) / 10000);
	local nMon	= mod(floor(nExpiredTime / 1000000) , 100)	
	print("VngToolAward:Active_Title nDay: "..nDay)
	print("VngToolAward:Active_Title nMon: "..nMon)	
	
	 local nType = 2 --��n th�i gian h� th�ng s� h�t h�n
	Title_AddTitle(nTitleId, nType, nExpiredTime*18)
	Title_ActiveTitle(nTitleId)	
	
	local sz_title = Title_GetTitleName(nTitleId)	
	print("tbGetTitleTDB:GetTitle_TDB2 nExpiredTime: "..nExpiredTime)
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"NhanThanhCong: "..sz_title)
	Talk(1,"",format("Ch�c m�ng b�n �� nh�n ���c danh hi�u <color=yellow>%s<color>", sz_title))
	Msg2Player(format("Ch�c m�ng b�n �� nh�n ���c danh hi�u <color=yellow>%s<color>", sz_title));
end

function tbGetTitleTDB:CheckIsAccTDB2()
	local nCheck = nil
	local nIDTitle = nil	
	for k,v in TITLE_TAKSID_TDB2 do
		if tbVNG_BitTask_Lib:getBitTask(v) == 1 then
			nCheck = 1
			nIDTitle = k
		end
	end
	return nCheck, nIDTitle
end

function tbGetTitleTDB:IsActive()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate >= self.nStartDate  and nCurDate <= self.nEndDate  then
		return 1
	end	
	return 0
end
local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
if nCurDate <= 201604302400 then
	EventSys:GetType("AddNpcOption"):Reg("S� Gi� Trao Th��ng","Nh�n l�i danh hi�u Tuy�t ��nh Bang", tbGetTitleTDB.GetTitle_TDB2,{tbGetTitleTDB})
end

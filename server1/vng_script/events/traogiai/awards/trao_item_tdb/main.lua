Include("\\script\\misc\\eventsys\\type\\player.lua")
IncludeLib("SETTING")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")
Include("\\vng_script\\events\\traogiai\\awards\\trao_item_tdb\\head.lua")


function tbGetAwardItemTDB:main()
	if self:CheckIsAccTDB2() ~= 1 then
		return Talk(1,"",format("Ch� c� bang ch� trong danh s�ch m�i nh�n ���c th��ng. Ng��i kh�ng n�m trong danh s�ch nh�n th��ng gi�i ��u Tuy�t ��nh Bang."))	
	end
	local szTitle = format("<color=yellow>Gi�i th��ng c�c h� ���c nh�n:<color>\n")
	local tbOpt = {}	
	if self:CheckTypeAwardTDB2() == 1 then
		tinsert(tbOpt, {format("Nh�n M�t N� V��ng gi�"), tbGetAwardItemTDB.GetAwardTDB2, {tbGetAwardItemTDB,TYPE_MATNA}})
		tinsert(tbOpt, {format("Nh�n b� An bang"), tbGetAwardItemTDB.GetAwardTDB2, {tbGetAwardItemTDB,TYPE_ANBANG}})
		tinsert(tbOpt, {format("Nh�n ng�a B�n Ti�u"), tbGetAwardItemTDB.GetAwardTDB2, {tbGetAwardItemTDB,TYPE_BONTIEU}})
	else
		tinsert(tbOpt, {format("Nh�n b� An bang"), tbGetAwardItemTDB.GetAwardTDB2, {tbGetAwardItemTDB,TYPE_ANBANG}})
	end
	tinsert(tbOpt, {format("Nh�n ng�a Phi V�n"), tbGetAwardItemTDB.GetAwardTDB2, {tbGetAwardItemTDB,TYPE_PHIVAN}})
	tinsert(tbOpt, {format("Nh�n 10 Thi�t la h�n l� bao"), tbGetAwardItemTDB.tbGetAwardTLH_QHK, {tbGetAwardItemTDB,TYPE_TLH}})
	tinsert(tbOpt, {format("Nh�n 10 Qu� ��i ho�ng kim"), tbGetAwardItemTDB.tbGetAwardTLH_QHK, {tbGetAwardItemTDB,TYPE_QUAHK}})
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szTitle, tbOpt)
end
--nhan phan thuong
function tbGetAwardItemTDB:GetAwardTDB2(nType)
	if (self:IsActive() ~=1) then	
		return
	end
	if self:CheckIsAccTDB2() ~= 1 then
		return Talk(1,"",format("Ch� c� bang ch� trong danh s�ch m�i nh�n ���c th��ng. Ng��i kh�ng n�m trong danh s�ch nh�n th��ng gi�i ��u Tuy�t ��nh Bang."))	
	end
	local szAccount = GetAccount()
	local nCount = tbAwardItemTDB2[szAccount][nType]
	if not tbPackAward[nType] then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE.."LOI_Khongcobangphanthuong")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_LIMIT_GET_AWARD_TDB2[nType]) == 1 then
		return Talk(1,"","Ch�ng ph�i c�c h� �� nh�n ph�n th��ng n�y r�i �!")
	end
	if PlayerFunLib:CheckFreeBagCellWH(4, 10, 1, "default") ~= 1  then
		return
	end
	tbVNG_BitTask_Lib:setBitTask(tbBITTSK_LIMIT_GET_AWARD_TDB2[nType], 1)
	VngExtPointLib:SetBitValueByVersion(EXT_POINT_AWARD_TDB_2,0)
	
	tbAwardTemplet:Give(tbPackAward[nType],nCount,{EVENT_LOG_TITLE,"NhanThuongType: "..nType})			
	Talk(1,"",format("Ch�c m�ng b�n �� nh�n ph�n th��ng th�nh c�ng."))	
end
--nhan phan thuong TLH, Qua HK
function tbGetAwardItemTDB:tbGetAwardTLH_QHK(nType)
	if (self:IsActive() ~=1) then	
		return
	end
	if not tbPackAward[nType] then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE.."LOI_Khongcobangphanthuong")
		return
	end
	local szAccount = GetAccount()
	local nCount = tbAwardItemTDB2[szAccount][nType]
	if not nCount then
		return
	end
	local CurCount  = tbVNG_BitTask_Lib:getBitTask(tbBITTSK_LIMIT_GET_AWARD_TDB2[nType])*10 --m�i l�n nh�n 10 v�t ph�m
	if CurCount >= nCount then
		return Talk(1,"","Ch�ng ph�i c�c h� �� nh�n h�t ph�n th��ng n�y r�i �!")
	end
	if PlayerFunLib:CheckFreeBagCell(10,"Ph�i c� �t nh�t 10 � tr�ng m�i c� th� nh�n th��ng.")~= 1 then
		return
	end
	tbVNG_BitTask_Lib:addTask(tbBITTSK_LIMIT_GET_AWARD_TDB2[nType], 1)
	VngExtPointLib:SetBitValueByVersion(EXT_POINT_AWARD_TDB_2,0)
	
	tbAwardTemplet:Give(tbPackAward[nType],10,{EVENT_LOG_TITLE,"NhanThuongType: "..nType.."- Soluongdanhan:.."..(CurCount+10)})	
	Talk(1,"",format("Ch�c m�ng b�n �� nh�n ph�n th��ng th�nh c�ng."))	
end
function tbGetAwardItemTDB:CheckTypeAwardTDB2()
	local szAccount = GetAccount()
	if szAccount == "tyanh71717171" or  szAccount == "hieubeonlyb99" or szAccount == "kevinokok" or szAccount == "xitrum11o2b" then
		 return 1
	end
	return 2
end

function tbGetAwardItemTDB:CheckIsAccTDB2()
	local nCheck  = 0	
	local szAccount = GetAccount()
	--kiem tra lan dau tien chua nhan: ��ng acc v� ���c b�t bit
	for k,v in tbAwardItemTDB2 do
		if (szAccount == k) and (VngExtPointLib:GetBitValueByVersion(EXT_POINT_AWARD_TDB_2) == 1) then
			nCheck = 1
		end
	end
	--kiem tra role nay da nhan thuong roi
	for n,m in tbBITTSK_LIMIT_GET_AWARD_TDB2 do
		if  tbVNG_BitTask_Lib:getBitTask(m) >= 1 then
			nCheck = 1			
		end
	end
	return nCheck
end

function tbGetAwardItemTDB:IsActive()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate >= self.nStartDate  and nCurDate <= self.nEndDate  then
		return 1
	end	
	return 0
end

local nDate = tonumber(GetCurrentTime())
if nDate <= Tm2Time(2016, 1, 15, 0 ) then	
	EventSys:GetType("AddNpcOption"):Reg("S� Gi� Trao Th��ng","Nh�n gi�i th��ng Tuy�t ��nh Bang 2", tbGetAwardItemTDB.main,{tbGetAwardItemTDB})
end

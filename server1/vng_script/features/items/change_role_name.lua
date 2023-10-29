--Change role name 1 -by thanhld 20150818
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")

tbAddChangeName = {}
tbAddChangeName.TASK_KS_ChangeName = 2320
tbAddChangeName.TASK_Use_Time = 2781
tbAddChangeName.WAIT_TIME  = 3*24*60*60 --3 ng�y
tbAddChangeName.LOG_TITLE = "LOG_FEATURE_CTC"
function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	--kiem tra trong thoi gian event dua top khong duoc dung
	if tbAddChangeName:ForbitUse_InEvent() ~= 1 then
		Talk(1,"","�ang trong th�i gian s� ki�n �ua top kh�ng th� s� d�ng.")
		return 1
	end
	local nCheck, _, _ = tbAddChangeName:Check_TimeReUse()
--	if  nCheck  == 0 then		
--		Talk(1, "", format("Th�i gian ch� s� d�ng l�n ti�p theo: <color=yellow>%s<color> h <color=yellow>%s<color> ph.",nHour,nMin))
--		return 1
--	end
	local szTitle = ""
	local tbOpt = {}
	local nState = GetTask(tbAddChangeName.TASK_KS_ChangeName)
	if nState ~= 0 then
		local nCheck, nHour, nMin = tbAddChangeName:Check_TimeReUse()
		szTitle = format("C�c h� �ang c� m�t l�n ��i t�n t�i npc <color=yellow>C�i T�nh L�o Nh�n<color> � c�c th�n trang. H�y mau �i g�p �ng ta")	
	elseif nCheck  == 0 then
		--print("thoi gian su dung chua du")
		local _, nHour, nMin = tbAddChangeName:Check_TimeReUse()
		szTitle = format("Th�i gian ch� s� d�ng l�n ti�p theo: <color=yellow>%s<color>h <color=yellow>%s<color>ph.",nHour,nMin)	
	else	
		szTitle = format("S� d�ng v�t ph�m n�y c�c h� nh�n ���c m�t l�n ��i t�n t�i npc <color=yellow>C�i T�nh L�o Nh�n<color> � c�c th�n trang.")
		tinsert(tbOpt,format("Ta ��ng �/#tbAddChangeName:AddChangeName(%d)",nItemIdx))
	end	
	tinsert(tbOpt, "Tho�t/no")
	if getn(tbOpt) > 0 then		
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end


function tbAddChangeName:AddChangeName(nItemIdx)
	if GetTask(self.TASK_KS_ChangeName) ~= 0 then
		Msg2Player("C�c h� �ang c� m�t c� h�i thay ��i danh t�nh r�i, h�y ��n g�p C�i T�nh L�o Nh�n.")
		Talk(1,"","C�c h� �ang c� m�t c� h�i thay ��i danh t�nh r�i, h�y ��n g�p C�i T�nh L�o Nh�n.")
		return 
	end
	if IsMyItem(nItemIdx) ~=1 then
		return
	end
	
	RemoveItemByIndex(nItemIdx)
	SetTask(self.TASK_Use_Time,  tonumber( GetCurServerTime()))
	SetTask(self.TASK_KS_ChangeName, 1)
	Msg2Player("�� nh�n ���c m�t c� h�i thay ��i danh t�nh, h�y ��n g�p C�i T�nh L�o Nh�n.")
	Talk(1,"","C�c h� �� nh�n ���c m�t c� h�i thay ��i danh t�nh, h�y ��n g�p  <color=yellow>C�i T�nh L�o Nh�n<color> � c�c th�n trang")
	tbLog:PlayerActionLog(self.LOG_TITLE,"NhanDuoc1LanDoiTen" )
end

--check thoi gian su dung
function tbAddChangeName:Check_TimeReUse()
	local nCurTime = tonumber(GetCurServerTime())
	local nLastUseTime = GetTask(self.TASK_Use_Time)
	
	if nLastUseTime == 0 then		
		return 1
	end	
	local nSpendTime = nCurTime - nLastUseTime
--	print("Check_TimeReUse nCurTime: "..nCurTime)		
--	print("Check_TimeReUse nLastUseTime: "..nLastUseTime)		
--	print("Check_TimeReUse nSpendTime: "..nSpendTime)		
	if (nCurTime > nLastUseTime) and (nSpendTime < self.WAIT_TIME) then
		local nCurWaitTime = self.WAIT_TIME - nSpendTime
		local nHour = floor(nCurWaitTime/(60*60))	
		local nMin = floor((nCurWaitTime - nHour*60*60)/60)		
		--print("Check_TimeReUse: "..nHour.."-"..nMin)		
		
		return 0,nHour, nMin
	end
	--print("Check_TimeReUse: return 1 ")
	return 1
end

--check thoi gian trong event dua top ko dc su dung
--event dua top thang 9
function tbAddChangeName:ForbitUse_InEvent()
	local nStartDate = 201509230000
	local nEndDate   = 201510012400
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if (nCurDate >= nStartDate and nCurDate < nEndDate) then
		return 0
	else
		return 1
	end
end

Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");

tbVngZenYuan = {};
tbVngZenYuan.nCountZenYuan= 1000;
tbVngZenYuan.TSK_DAILY_LIMIT = 3069;
--tbVngZenYuan.MAX_ZenYuan_PER_MONTH = 5;
--function tbVngZenYuan:CheckMonth()
--	local nMonthValue = GetTask(self.TSK_MONTH)
--	local nNowValue = tonumber(GetLocalDate("%Y%m"))
--	if nNowValue ~= nMonthValue then
--		SetTask(self.TSK_MONTH,nNowValue)
--		return 1
--	end
--	return 0
--end
--function tbVngZenYuan:CheckZenYuan()
--	if self:CheckMonth() == 1 then
--		SetTask(self.TSK_LIMIT_MONTH,0)
--	end
--	local nTaskVal = GetTask(self.TSK_LIMIT_MONTH)
--	if (nTaskVal) >= self.MAX_ZenYuan_PER_MONTH then
--		return 1
--	end
--	return 0
--end

function main(nItemIndex)
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
--	if tbVngZenYuan:CheckZenYuan() == 1 then
--			Msg2Player(format("Th�ng n�y �� s� d�ng <color=yellow>%d <color>H�n nguy�n ch�n ��n, kh�ng th� nh�n th�m.", tbVngZenYuan.MAX_ZenYuan_PER_MONTH))
--		return 1
--	end
	if PlayerFunLib:CheckTaskDaily(tbVngZenYuan.TSK_DAILY_LIMIT, 1, nil, "<") ~= 1 then
		Talk(1, "", "M�i ng�y ch� ���c ph�p s� d�ng 1 v�t ph�m n�y.")
		return 1
	end
	PlayerFunLib:AddTaskDaily(tbVngZenYuan.TSK_DAILY_LIMIT, 1)
	PlayerFunLib:AddTask(4000,tbVngZenYuan.nCountZenYuan)
	tbLog:PlayerActionLog("SuDungHonNguyenChanDon", format("NhanDuoc%dDiemChanNguyen", tbVngZenYuan.nCountZenYuan), format("Ch�n nguy�n hi�n t�i %d", GetTask(4000)))
--	PlayerFunLib:AddTask(tbVngZenYuan.TSK_LIMIT_MONTH,1)
	Msg2Player("Ch�c m�ng ��i hi�p nh�n �u�c <color=yellow>1000 <color>�i�m Ch�n Nguy�n")
	return 0
end
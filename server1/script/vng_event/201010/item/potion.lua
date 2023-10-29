Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

 tbAwardExpUseLinhDuoc = {szName = "�i�m kinh nghi�m", nExp = 10e6}
 
 TASK_LIMIT_EXP_USE_LINHDUOC 	= 2770
 TASK_DAILY_USE_LINHDUOC			= 2771
 
function main(nItemIndex)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	
	if GetLevel() < 50 then
		Say("C�p 50 tr� l�n m�i c� th� s� d�ng v�t ph�m n�y!",0)
		return 1
	end
	
	if (PlayerFunLib:CheckTaskDaily(TASK_DAILY_USE_LINHDUOC,5,"M�i ng�y ch� c� th� s� d�ng t�i �a 5 l�n!","<") ~= 1) then
			return 1
	end
	
	if (GetTask(TASK_LIMIT_EXP_USE_LINHDUOC) >= 120) then
		Say("��i hi�p �� ��t t�i �a s� l�n s� d�ng Linh D��c!",0)
		return 1
	end
	
	SetTask(TASK_LIMIT_EXP_USE_LINHDUOC, GetTask(TASK_LIMIT_EXP_USE_LINHDUOC) + 1)
	PlayerFunLib:AddTaskDaily(TASK_DAILY_USE_LINHDUOC,1)
	
	tbAwardTemplet:GiveAwardByList(tbAwardExpUseLinhDuoc, "S� d�ng Linh D��c");
	return 0
end
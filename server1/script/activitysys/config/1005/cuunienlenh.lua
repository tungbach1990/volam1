Include("\\script\\activitysys\\config\\1005\\main_func.lua")
function main(nItemIdx)
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		Talk(1, "", "C�c h� kh�ng �� �i�u ki�n tham gia ch��ng tr�nh.")
		return 1
	end
	if tbPVLB_Check:CheckTime() ~= 1 then
		Talk(1, "", "Hi�n t�i kh�ng ph�i l� th�i gian di�n ra ch��ng tr�nh.")
		return 1
	end
	local nW, _, _ = GetWorldPos()
	if nW >= 520 and nW <= 526 then
	
	else
		if PlayerFunLib:VnCheckInCity () ~= 1 then
			return 1
		end
	end
	tbPVLB_Main:MainDialog()
	return 1
end
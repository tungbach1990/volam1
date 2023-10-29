Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>Ng��i mu�n r�i kh�i Nguy�t Ca ��o kh�ng?"
	tbDailog:AddOptEntry("X�c nh�n", leave_sure)
	tbDailog:Show() 
end

function leave_sure()
	NewWorld(80, 1346, 3360)
end
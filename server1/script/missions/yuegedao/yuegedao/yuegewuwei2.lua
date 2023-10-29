Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>�� nhi�u n�m qua, ta ch� th�y to�n l� nh�ng ng��i l�n ��o, nh�ng ch�a th�y m�t ai lu�n ki�m th�nh c�ng �� r�i ��o, ��i hi�p ng��i th�t l� h�u t�nh r�i."
	G_TASK:OnMessage("Nguy�t Ca ��o", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end
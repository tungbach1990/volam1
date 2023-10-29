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
	tbDailog.szTitleMsg = "<npc>Th� phi th�nh b�i chuy�n ��u kh�ng, bi�t bao nhi�u v� l�m cao th� �� b� ch�n v�i t�i ch�n n�y, ��ng ti�c l� khi lu�n ki�m, ch� v� mu�n ��t ���c b� k�p tuy�t v� h�c, kh�ng �t hi�p s� v�n kh�ng ng�i hi�m nguy. ��i hi�p tu�i h�ng c�n tr�, xin h�y th�n tr�ng m� h�nh x�."
	G_TASK:OnMessage("Nguy�t Ca ��o", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end
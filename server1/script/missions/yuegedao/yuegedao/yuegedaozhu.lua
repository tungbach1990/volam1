Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local TSK_LV150_SKILL = 2885
	local YUEGEDAO_150SKILL_TASKSTATE = 14
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	local nTaskStep = floor(GetTask(TSK_LV150_SKILL)/100)
	if nTaskStep < YUEGEDAO_150SKILL_TASKSTATE then
		tbDailog.szTitleMsg = "<npc>N�u nh� ��i hi�p kh�ng h� run s�, th� h�y ph�n t�i cao th�p v�i t�i h� �i, l� �� vang danh thi�n h�, luy�n ���c tuy�t k� hay l� s� b� giam c�m t�i ��y, th� do trr�n chi�n n�y quy�t ��nh."
	else
		tbDailog.szTitleMsg = "<npc>N�u nh� h�u duy�n th� v�n c� th� g�p l�i, c�n kh�ng duy�n th� v�n c� c�i �� nh� ��n nhau, ��i hi�p h�y r�i ��o �i, con ���ng giang h� t� nay v� sau xin h�y b�o tr�ng."
	end
	G_TASK:OnMessage("Nguy�t Ca ��o", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end
-- �ٰ���·�ˡ�ҶС��
-- by��Dan_Deng(2003-09-16)

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
	if (GetSex() == 0) then
		tbDailog.szTitleMsg = "<npc>C�ng t�, ti�u n� l� ng��i ch�a xu�t c�c, ng��i c� theo ta ho�i nh� v�y, r�t cu�c l� c� � g�? N�u nh� �� cho m�u n��ng ta bi�t ���c, th� r�t phi�n ph�c."
	else
		tbDailog.szTitleMsg = "<npc>Ti�u mu�i, mu�i c� chuy�n g� sao?"
	end
	G_TASK:OnMessage("Thi�n Nh�n", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end;

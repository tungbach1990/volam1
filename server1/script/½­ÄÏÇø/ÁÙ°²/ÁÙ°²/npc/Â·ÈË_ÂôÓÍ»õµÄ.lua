-- �ٰ���·�ˡ����ͻ���
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
	tbDailog.szTitleMsg = "<npc>Th�ng bao c�i! Du t�c c�i! C��ng kh�i oa ��ch ��c du t�c c�i."
	G_TASK:OnMessage("Thi�n Nh�n", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end;

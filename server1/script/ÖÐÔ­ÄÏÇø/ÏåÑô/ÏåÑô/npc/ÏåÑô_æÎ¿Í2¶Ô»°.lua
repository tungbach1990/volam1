--��ԭ���� ������ �ο�2�Ի�
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main(sel)
		local nNpcIndex = GetLastDiagNpc();
		local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<npc>Th�i cu�c b�y gi� nh�ng con d�n b� t�nh ngay c�m c�ng kh�ng c� m� �n cho �� no, quan l�i th� t�c l�c kh�p n�i."
		G_TASK:OnMessage("Th�y Y�n", tbDailog, "DialogWithNpc")
		tbDailog:Show() 
end;



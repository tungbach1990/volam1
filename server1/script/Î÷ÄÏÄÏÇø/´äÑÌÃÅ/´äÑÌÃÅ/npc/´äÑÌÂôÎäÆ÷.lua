--������ �������ĵ��ӶԻ�
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) or (GetLastFactionNumber() == 5) then
		local nNpcIndex = GetLastDiagNpc();
		local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end

		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<npc>C�ng phu c�a b�n m�n quan tr�ng l� bi�n ho� kh�n l��ng, kh�ng nh� nh�ng v� c�ng t�m th��ng kh�c."
		tbDailog:AddOptEntry("Giao d�ch", yes)
		tbDailog:AddOptEntry("Kh�ng giao d�ch", no)
		G_TASK:OnMessage("Th�y Y�n", tbDailog, "DialogWithNpc")
		tbDailog:Show()
	else
		Talk(1,"","M�n ch� c� l�nh, binh kh� c�a b�n m�n ch� d�nh cho t� mu�i ��ng m�n.")
	end
end;

function yes()
Sale(66)
end;

function no()
end;

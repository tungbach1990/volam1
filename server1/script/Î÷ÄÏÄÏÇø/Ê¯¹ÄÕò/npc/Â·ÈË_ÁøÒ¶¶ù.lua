--ʯ���� ·�� ��Ҷ�� ���������ͷ�
-- By: Dan_Deng(2003-09-03)

function main(sel)
	UTask_world22 = GetTask(22)
	if (UTask_world22 == 0) then		-- ��������
		if (GetSex() == 0) then
			Say("Ca ca, cha c�a mu�i �ang d�y v� ngh� � ngo�i th�n, huynh c� th� gi�p mang c�m cho �ng �y kh�ng? ",2,"Gi�p c� �y mang c�m. /W22_get_yes","Kh�ng r�nh, �ang b�n. /W22_get_no")
		else
			Say("T� t�, cha c�a mu�i �ang d�y v� ngh� � ngo�i th�n. T� c� th� gi�p mang c�m cho �ng �y kh�ng? ",2,"Gi�p c� �y mang c�m. /W22_get_yes","Kh�ng r�nh, �ang b�n. /W22_get_no")
		end
	elseif (UTask_world22 == 5) then
		if (HaveItem(233) == 0) then		-- ���߶���
			AddEventItem(233)
			if (GetSex() == 0) then
				Talk(1,"","Ca ca, huynh ��ng qu�n mang c�m �i nha. ")
			else
				Talk(1,"","T� t�, t� ��ng qu�n mang c�m �i nha. ")
			end
		else
			if (GetSex() == 0) then
				Talk(1,"","Ca ca c� th� nhanh m�t t� ���c kh�ng, c�m �� ngu�i l�nh c� r�i. ")
			else
				Talk(1,"","T� t� c� th� nhanh m�t t� ���c kh�ng, c�m �� ngu�i l�nh c� r�i. ")
			end
		end
	else				-- ������Ի�
		Talk(1,"","M� ta �� �i theo g� ��n �ng kh�c, ta ���c �ng ta nu�i d��ng, khinh c�ng �ng r�t gi�i, �ng c� lu�n luy�n c�ng v�i ng��i ngo�i th�n. ")
	end
end;

function W22_get_yes()
	SetTask(22,5)
	AddEventItem(233)
	AddNote("Nh�n nhi�m v�: Gi�p Li�u Di�p Nhi mang c�m ra cho v� s� � ngo�i th�n. ")
	Msg2Player("Nh�n nhi�m v�: Gi�p Li�u Di�p Nhi mang c�m ra cho v� s� � ngo�i th�n. ")
end

function W22_get_no()
end

--ʯ���� ·�� ��ү ��������Ǯ
-- By: Dan_Deng(2003-09-04)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(197) == 1 then
		allbrother_0801_FindNpcTaskDialog(197)
		return 0;
	end
	UTask_world23 = GetTask(23)
	if (UTask_world23 == 3) then		-- ��������
		if (GetSex() == 0) then
			Say("Sao h�? Mu�n ta x�a n� cho A To�n �? Chuy�n �� kh�ng kh�, nh�ng ng��i ph�i mang ti�n ��n, 300 l��ng kh�ng thi�u m�t xu. ",2,"Gi�p h� tr� ti�n /W23_pay_yes","M�c k� h� /W23_pay_no")
		else
			Say("Sao h�? Mu�n ta x�a n� cho A To�n �? Chuy�n �� kh�ng kh�, nh�ng ng��i ph�i mang ti�n ��n, 300 l��ng kh�ng thi�u m�t xu. ",2,"Gi�p h� tr� ti�n /W23_pay_yes","M�c k� h� /W23_pay_no")
		end
	elseif (UTask_world23 >= 6) then
		Talk(1,"","���c r�i! V� ng��i �� thay h� tr� ti�n, ta s� �� ng��i kh�i b� m�t m�t, kh�ng �i t�m h� t�nh s� n�a.")
	else				-- ������Ի�
		Talk(1,"","Ti�n ti�n ti�n! Th�i bu�i n�y c�i g� c�ng l� ti�n. C� ti�n l� l�o t�, kh�ng ti�n l� con r�a r�t ��u. ")
	end
end;

function W23_pay_yes()
	if (GetCash() >= 300) then
		Talk(2,"","��ng xem th��ng ng��i kh�c! ��y l� 300 l��ng c�m l�y! "," Ha ha! C� ti�n t� nhi�n d� n�i chuy�n.")
		SetTask(23,6)
		Pay(300)
		AddNote("A M� v� A To�n �� tr� h�t n� r�i, mau �i b�o c�i tin t�t l�nh n�y cho h� �i. ")
		Msg2Player("A M� v� A To�n �� tr� h�t n� r�i, mau �i b�o c�i tin t�t l�nh n�y cho h� �i. ")
	else
		Talk(1,""," ��i ta �i l�y 300 l��ng ��! ")
	end
end

function W23_pay_no()
end

--��ԭ���� �ν�ս�� ����������ҽ
--���� 2004-10-14

function main(sel)
if (GetCurCamp() == 2) then
	SetFightState(0)
	Say("T��ng qu�n c�n mua g� kh�ng?", 2, "Mua thu�c /yes", "Kh�ng mua/no")
else
	Talk(1,"","Nh�n m�t ng��i l�m la l�m l�t! Mu�n l�a g�t ta b�n th�n d��c c�a ��i Kim qu�c cho ng��i �?")
end;
end;

function yes()
Sale(53)
end;

function no()
end;
--��ԭ���� �ν�ս�� �ξ��������ҽ
--���� 2004-10-14

function main(sel)
if (GetCurCamp() == 1) then
	SetFightState(0)
	Say("Tr�ng s� n�n mua �t th��ng d��c ph�ng th�n! Chi�n tr��ng sinh t� kh� l��ng!", 2, "Mua thu�c /yes", "Kh�ng mua/no")
else
	Talk(1,"","Ng��i ��u! Mau ��n b�t gian t�!")
end;
end;

function yes()
Sale(53)
end;

function no()
end;
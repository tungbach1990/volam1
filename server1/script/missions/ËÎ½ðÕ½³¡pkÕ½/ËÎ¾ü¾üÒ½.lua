--��ԭ���� �ν�ս�� �ξ���ҽ
--����

function main(sel)
	if (GetCurCamp() == 1) then
		Say("Tr�ng s� n�n mua �t th��ng d��c ph�ng th�n! Chi�n tr��ng sinh t� kh� l��ng!", 2, "Mua thu�c /yes", "Kh�ng mua/no")
	else
		Talk(1,"","Ng��i ��u! Mau ��n b�t gian t�!")
	end
end;

function yes()
Sale(53)
end;

function no()
end;
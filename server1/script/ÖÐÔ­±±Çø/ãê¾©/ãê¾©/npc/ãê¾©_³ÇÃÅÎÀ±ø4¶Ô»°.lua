--��ԭ���� �꾩�� ��������4�Ի���������������
-- by��Dan_Deng(2003-08-01)

Include("\\script\\global\\map_helper.lua")
npc_name = "<#> V� binh Th�nh m�n"

function default_talk()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(121) == 0)) then		--�������������
		Say("Ng��i �n gan h�m m�t g�u r�i h�? T�i l�m n�o ��ng nha m�n ng��i kh�ng g�nh n�i ��u.",4,"Ng��i ph�i ph�c t�ng m�nh l�nh � ��y v� �i�u ki�n /enroll_S1_wrong","Nh�ng ng��i h�nh nghi�p v� n��c v� d�n /enroll_S1_correct","Ph� thi�n chi h�, m�c phi v��ng th�, so�i th� chi binh, m�c phi v��ng th�n /enroll_S1_wrong","T�n t�m b�o qu�c ch�t c�ng kh�ng h�i h�n  /enroll_S1_wrong")
	else
		Talk(1,"","B�n ng��i Kim kh�ng gi�ng ng��i H�n ch�ng ta! Ch�ng ch�n bi�t g� ��n chuy�n li�m s�!")
	end
end;

function enroll_S1_correct()
	Talk(1,"","X�ch ��ng kho�ng m�c d� kh�ng ��ng gi� g� nh�ng c�ng xin t�ng ng��i l�m qu� v�y!")
	AddEventItem(121)
	Msg2Player("Nh�n ���c X�ch ��ng kho�ng")
	AddNote("Tr� l�i c�u h�i c�a v� binh, nh�n ���c X�ch ��ng kho�ng")
end;

function enroll_S1_wrong()
	Talk(1,"","B�n ng��i Kim kh�ng gi�ng ng��i H�n ch�ng ta! Ch�ng ch�n bi�t g� ��n chuy�n li�m s�!")
end;

-- �꾩 ·��NPC ��������������������
-- by��Dan_Deng(2003-08-01)

function main()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(122) == 0)) then		--�������������
		Say("��i ng��i kh�ng ai kh�ng c� hi�m nguy! Qua r�i s� r�n luy�n th�m b�n t�nh ki�n c��ng",2,"Ta Cho r�ng: �� l�: C�i g� m�nh kh�n mu�n th� ��ng l�m cho ng��i kh�c /enroll_S2_A","Tr�n ���ng th�y chuy�n b�t b�nh kh�ng th� l�m ng�. �� m�i l� hi�p ngh�a /enroll_S2_B")
	else
		Talk(1,"","H�y c� g�ng n� l�c nh�! V� n��c v� d�n! V� b� t�nh thi�n h�.")
	end
end;

function enroll_S2_A()
	Say("��i ng��i kh�ng ai kh�ng c� hi�m nguy! Qua r�i s� r�n luy�n th�m b�n t�nh ki�n c��ng",3,"H�y c� g�ng n� l�c nh�. V� n��c v� d�n. V� thi�n h� b� t�nh /enroll_S2_wrongA","�� ta suy ngh�, t�m m�t c�ch gi�i quy�t t�t nh�t /enroll_S2_correct","Cho d� ���c l�i cho m�nh th� c�ng ��ng l�m cho ng��i kh�c b� t�n th��ng /enroll_S2_wrongA")
end;

function enroll_S2_B()
	Say("� ��y c� 500 l��ng b�c, xin nh�n l�y!",3,"�a t� /enroll_S2_wrongB","Ta c� th� gi�p cho ng��i ���c g� ��y? /enroll_S2_wrongB","Th�t s� kh�ng d�m l�m phi�n /enroll_S2_correct")
end;

function enroll_S2_correct()
	Talk(1,"","Xem nh� ta v� ng��i c� duy�n! T�ng ng��i Qu�ng Ho�c H��ng n�y �� l�m qu� tao ng�!")
	AddEventItem(122)
	Msg2Player("Nh�n ���c Qu�ng Ho�c H��ng ")
	AddNote("Tr� l�i ���c c�u h�i c�a T�n Kh� T�t, nh�n ���c Qu�ng Ho�c H��ng ")
end;

function enroll_S2_wrongA()
	Talk(1,"","��i ng��i kh�ng ai kh�ng c� hi�m nguy! Qua r�i s� r�n luy�n th�m b�n t�nh ki�n c��ng")
end;

function enroll_S2_wrongB()
	Talk(1,"","Ng��i th�y ti�n l� s�ng m�t th� l�m sao c� th� ph�t huy ch�nh kh�? Ng��i th�t khi�n ta th�t v�ng!")
end;

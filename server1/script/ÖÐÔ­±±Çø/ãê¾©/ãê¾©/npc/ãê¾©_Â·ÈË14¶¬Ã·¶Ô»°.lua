--description: ��ԭ���� �꾩�� ·��14��÷�Ի� ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),3)
		if (UTask_trsub60 == 0) then
			DelItem(130)			--�����ؽ��������Ҽ���������ߵ����	
			Say("Th�y Ti�u H�i nh� t�i kh�ng? Kh�ng bi�t n� l�i ch�y �i ��u ch�i r�i, ng��i c� th� gi�p ta t�m n� ���c kh�ng?", 2, "���c!/L60_sub3_yes", "Ta c�n c� vi�c kh�c. /L60_sub3_no")
		elseif (UTask_trsub60 == 2) then
			Talk(1,"","T�m th�y Ti�u H�i nh� t�i ch�a?")
		elseif (UTask_trsub60 == 4) then
			Talk(2, "", "Ti�u H�i �ang ch�i � qu�ng tr��ng, l�t n�a s� v�!", "C�m �n ng��i! Ti�u H�i nh� ta sau n�y l�n l�n ch� c�n ���c ph�n n�a nh� ng��i l� t�t r�i! Ta t�ng c�ng kh�ng c� g� qu� gi�, ch� c� m�t thanh ki�m n�y v�n l� v�t ph�ng th�n. Th�y ng��i c�ng l� m�t ng��i t�p v�, xin t�ng thanh �o�n ki�m n�y cho ng")
			AddEventItem(130)
			Msg2Player("Nh�n ���c thanh ki�m Kh� T� ")
			SetTask(28, SetByte(GetTask(28),3,10))
			AddNote("V� ��n nh� c�a ��ng Mai, nh�n ���c thanh ki�m Kh� T� ")
		elseif (UTask_trsub60 == 10) and (HaveItem(130) == 0) then
			AddEventItem(130)
			Msg2Player("Nh�n ���c thanh ki�m Kh� T� ")
			Talk(1,"","Thanh ki�m n�y m�c d� kh�ng qu� gi� g�, nh�ng l� m�t ch�t th�nh � c�a ta, ng��i ��ng t� ch�i n�a.")
		else
			Talk(1,"","Cha Ti�u H�i kh�ng c� � nh�, ��a con n�y l�i kh�ng bi�t nghe l�i! ")
		end
	else
		i = random(0,2)
		if (i == 0) then
			Talk(1,"","Th�y Ti�u H�i nh� t�i ��u kh�ng? Kh�ng bi�t n� ch�y �i ��u ch�i r�i!")
		elseif (i == 1) then
			Talk(1,"","Cha Ti�u H�i kh�ng c� � nh�, m�i chuy�n ��u do t�i qu�n xuy�n, v�y m� n� l�i kh�ng nghe l�i! ")
		else
			Talk(1,"","Th� c�c hi�n gi� kh�ng t�t! mu�n s�ng qua ng�y th�t kh�!")
		end;
	end
end;

function L60_sub3_yes()
	Talk(1,"","Phi�n ng��i qu�! ")
	SetTask(28, SetByte(GetTask(28),3,2))
	AddNote("T�m g�p ��ng Mai t�i m�t khu d�n c� ph�a ��ng B�c Bi�n Kinh, gi�p N�ng ta t�m Ti�u H�i ")
	Msg2Player("��ng Mai nh� ng��i gi�p c� �y �i t�m Ti�u H�i v� ")
end;

function L60_sub3_no()
	Talk(1,"","Chao �i! ��a con n�y th�t khi�n ng��i ta ph�i lo l�ng! ")
end;

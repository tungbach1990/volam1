-- ������ ·�� ����
-- 2004/4/17 ���Ա������� by fangjieying

function main()
	Uworld76 = GetTask(76)
	if (Uworld76 == 10) then
		Talk(1,"","M�t con tu�n m� ��ng n�i g�c c�y, h�nh nh� �ang d�ng tai l�n nghe l�i b�n n�i")
		SetTask(76,20)
		Msg2Player("Xem ra con ng�a n�y �� b� b�nh, vi�c B�nh ��i gia nh� ph�i ch�ng l� c� li�n quan ��n chuy�n n�y ")
	elseif (Uworld76 == 50) and (HaveItem(375) == 1) then		-- �κ���
		DelItem(375)
		SetTask(76,60)
		DelMagic(396)
		if (HaveMagic(397) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(397)
		end
		Msg2Player("B�n l�nh ng� ���c t�m ph�p V� L� tr�ng Sinh ")
		Talk(1,"","B�n ��a Huy�t D�ng h�a cho ng�a nu�t, ��ng th�i v�n kh�i 'Xu�n Phong V� L�' K� thu�t T�m ph�p, m�t c�a B�n H�a d�n d�n s�ng l�n. Cho ��n l�c n�y b�n m�i th�t s� l�nh ng� ���c'V� L� ph�c sinh' T�m ph�p")
	elseif (Uworld76 >10) and (Uworld76 < 50) then
		Talk(1,"","B�n H�a h� vang l�n m�t ti�ng nh� s�m ��ng ngang tai")
	elseif (Uworld76 > 50) then
		Talk(1,"","B�n �� ch�a ln�h b�nh cho B�n H�a")
	else
		Talk(1,"","��y l� con ng�a c� l�ng �� nh� m�u, t�n g�i 'B�nH�a'")
	end
end

--description: ����20������ ��ʯ��ʯ����ǰСʯ��
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2);
	if (UTask_tm == 20*256+20) then		-- 20�����񣬵�һ�������ĸ���
		if (HaveItem(37) == 1) and (HaveItem(38) == 1) and (HaveItem(39) == 1) and (HaveItem(40) == 1) then
			Talk(9, "", "Cho d� ng��i �� t�m ���c 4 ch� 'Thi�n Nh�p Gi� T�', t�i sao c�n d�m � l�i? Ch�ng l� tr�n ��i n�y c� ng��i kh�ng s� ch�t?", "Thi�n h� kh�ng c� ai kh�ng s� ch�t, nh�ng kh�ng th� g�p ���c ng��i th�n ch�ng ph�i �au kh� h�n ch�t sao?", "R�t c�c ng��i l� ai?", "V�n b�i l� �� t� ���ng M�n, ��n m�i S� c� tr� v� ���ng M�n �o�n t� v�i Ch��ng m�n s� huynh! ", "Ta kh�ng c� huynh tr��ng g� h�t! Ng��i th�n c�a ta �� ch�t h�t r�i! N�m x�a l�c ta b� �u�i kh�i S� m�n, kh�ng c� ai n�i gi�p ta m�t l�i n�o! L�c �� ta �� th�, ��i n�y s� kh�ng b��c v�o ���ng M�n n�a b��c! ", "N�u S� c� kh�ng c� ch�t l�u luy�n v�i ���ng M�n, t�i sao l�i �n c� � Tr�c H�i h�u s�n?", "���ng U:.....", "S� c�, �� nhi�u n�m nay, Ch��ng m�n c� h�i ti�c �� kh�ng c�n S� ph� �u�i S� c� ra kh�i gia m�n, t�i sao ng��i kh�ng cho �ng ta m�t c� h�i b� ��p? Hu�ng chi huynh mu�i t�nh th�m h� t�t ch� v� m�t l�c n�ng gi�n m� �n h�n c� ��i?", "Ng��i kh�ng c�n nhi�u l�i! ���c! Ta cho ng��i m�t c� h�i. N�m �� l�c ta r�i kh�i gia m�n. Nh�t th�i v�t Kim H�ng khuy�n c�a cha t�ng xu�ng Ph� Th�y h�. N�u ng��i c� th� t�m gi�p ta, ta s� tha th� cho b�n h�! ")
   		DelItem(37)	
			DelItem(38)
			DelItem(39)
			DelItem(40)
			SetTask(2, 20*256+40)
			AddNote("Tr�n bia �� tr��c ph�ng ���ng U, nh�n nhi�m v� �i h� Ph� Th�y t�m Kim H�ng Quy�n ")
		else
			Talk(1,"","B�n kh�ng c� kh�u quy�t, kh�ng th� th�ng qua bia �� n�i chuy�n v�i ���ng U.")
			AddNote("� ph�a tr��c bia �� t�i V� T�m C�c bi�t l� ph�i t�m kh�u quy�t bia �� trong c�c tr��c. ")
		end
	elseif (UTask_tm == 20*256+40) then
		if (HaveItem(41) == 1) then
			Talk(2, "", "S� c�! �� t� �� �� t�m ���c Kim H�ng khuy�n d��i Ph� Th�y h�, S� c� c� th� suy ngh� l�i kh�ng?", "Ng��i ��a Kim H�ng khuy�n cho ��i ca ta, th�y chi�c v�ng n�y s� bi�t ta �� tha th� cho huynh �y.")
	  		SetTask(2, 20*256+60)
	  		Msg2Player("���ng U l�nh cho b�n mang Kim H�ng Quy�n giao cho ���ng C�u ch��ng m�n. ")
  			AddNote("���ng U l�nh cho b�n mang Kim H�ng Quy�n giao cho ���ng C�u ch��ng m�n. ")
		else								--û�еõ����߶�ʧ������Ȧ���Է�����
			Talk(1,"","N�u ng��i c� th� t�m ���c cho ta chi�c Kim H�ng khuy�n d��i Ph� Th�y h�, ta s� tha th� cho b�n h�! ")
		end
	elseif ((UTask_tm == 20*256+60) and (HaveItem(41) == 0)) then		-- ���߶���
		AddEventItem(41)
		Talk(1,"","Sao ng��i nhi�u chuy�n th�! �� chi�c v�ng l�i ��y! C�n ng��i th� bi�n mau �i!")
	elseif (UTask_tm >= 30*256) then
		Say("Ta s�ng thanh t�nh m�t m�nh quen r�i, kh�ng th�ch ai qu�y nhi�u! Chuy�n c� qua r�i, n�i nhi�u v� �ch, ng��i v� �i!", 0)
	else
		Talk(1,"","Tr�n bia �� c� vi�t: 'Thi�n Nh�p Gi�, s�t v� x�'. Ch� 's�t' vi�t b�ng m�u m�u r�t l� ��c bi�t. ")
	end
end;

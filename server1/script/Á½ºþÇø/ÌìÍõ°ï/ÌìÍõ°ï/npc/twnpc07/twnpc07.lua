--description: ������ˮ��
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 1) then
			Talk(3, "", "Ta th�ch nh�t l� �n tr�ng lu�c, nh�ng v� nh� ngh�o, kh�ng th� mua tr�ng ���c", "Ti�u b�ng h�u! Ng��i gi�p ta ��o giun ta s� cho ng��i tr�ng lu�c, ���c kh�ng?", "���c! Nh� ph�i gi� l�i h�a nh�!")
			AddNote("��ng � cho Thu� Sinh m�y qu� tr�ng, ��i l�i Thu� Sinh gi�p ��o tr�ng ")
			Msg2Player("��ng � cho Thu� Sinh m�y qu� tr�ng, ��i l�i Thu� Sinh gi�p ��o tr�ng ")
			SetTask(14, 3)
		elseif (UTask_tw40sub == 7) and (HaveItem(149) == 1) then	-- ���������
			Talk(3, "", "Ta �� ��o ���c giun r�i, c� th� cho ta tr�ng ���c ch�a?", "Ti�u b�ng h�u! 3 qu� tr�ng cho ng��i n�y!", "C�m �n ��i ca! Trong ��y c� n�m con giun �� ��o ���c!")
			DelItem(149)
			AddEventItem(150)
			Msg2Player("Nh�n ���c n�m con giun ��t ")
			SetTask(14, 9)
			AddNote("Cho Thu� Sinh tr�ng, l�y ���c 5 con tr�ng ")
		elseif (UTask_tw40sub == 0) then
			Talk(1, "", "Ta th�ch nh�t l� �n tr�ng lu�c, nh�ng v� nh� ngh�o, kh�ng th� mua tr�ng ���c")
		elseif (UTask_tw40sub == 9) and (HaveItem(150) == 0) then
			AddEventItem(150)
			Talk(2,"","Ti�u b�ng h�u! Ta kh�ng c�n th�n n�n �� l�m m�t nh�ng con giun r�i, ng��i c� th� gi�p ta ��o l�i m�y con ���c kh�ng?","C�ng may, �� r�nh r�i n�n �� ��o th�m ���c 5 con, t�ng cho huynh!")
		elseif (UTask_tw40sub >= 9) then
			Talk(1, "", "C�m �n huynh �� t�ng tr�ng")
		else
			Talk(1,"","Trong n�y c� m�y con giun ta v�a ��o ���c. Huynh c� th� t�ng ta m�y qu� tr�ng �� kh�ng?")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","Sau n�y �� l�n l�n c�ng mu�n gi�ng D��ng th�c th�c, V��ng b� b�. C�c v� ��u l� nh�ng ��i anh h�ng ���c m�i ng��i k�nh tr�ng")
		else
			Talk(1,"","H�m qua �� c� �i c�u xin D��ng th�c th�c d�y v� c�ng cho ��, nh�ng th�c �y kh�ng ��ng �, n�i l� �� c�n qu� nh�, �� kh�ng bi�t khi n�o �� m�i c� th� l�n ���c ch� ")
		end
	end
end;

-- ����·�ˡ���ũ
-- by��Dan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-05-24) ȭ����������

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub2 = GetTask(53)
	if (Uworld75 == 10) and (U75_sub2 < 10) then		-- �����У���ȡ������
		if (HaveItem(384) == 1) then
			SetTask(53,10)
			AddNote("Nhi�m v� quy�n khuynh thi�n h�: �i D��c V��ng C�c h�i ba ��a hoa C�m M�c T�c d�m Hoa N�ng. ")
			Msg2Player("Nhi�m v� quy�n khuynh thi�n h�: �i D��c V��ng C�c h�i ba ��a hoa C�m M�c T�c d�m Hoa N�ng. ")
			Talk(1,"","L�c s� huynh mu�n tr�c nghi�m l�i ng��i? T�t qu�! ��i L� b�n m�a hoa th�m, c�n thi�u T� M�c T�c k� ph�m c�a D��c v��ng C�c. Ng��i h�y gi�p ta h�i 3 �o� v�!")
		else
		 	Talk(1,"","M�t b�c th� c�ng kh�ng c�, kh�ng ch�ng kh�ng c� k�u ta l�m sao tin ng��i?")
		end
	elseif (Uworld75 == 10) and (U75_sub2 == 10) then		-- ����������ж�
		if (GetItemCount(112) >= 3) then
			DelItem(112)
			DelItem(112)
			DelItem(112)
			SetTask(53,20)
			AddNote("Nhi�m v� quy�n khuynh thi�n h�: Ho�n th�nh nhi�m v� h�i C�m M�c T�c. ")
			Msg2Player("Nhi�m v� quy�n khuynh thi�n h�: Ho�n th�nh nhi�m v� h�i C�m M�c T�c. ")
			Talk(1,"","Th�t l� tuy�t v�i, ��ng l� nh�t ph�m! Ta s� ph�i ng��i �i th�ng b�o L�c s� huynh r�ng ta ��ng � r�i.")
		else
			Talk(1,"","V�n ch�a t�m ���c �?")
		end
	else
		i = random(0,99)
		if (i < 25) then
			Talk(1,"","V�n Nam tr� hoa nh�t thi�n h�, ��i l� tr� hoa nh�t V�n Nam, hoa tr� trong m�t ng��i ��i L� ch�ng ta l� hoa ��p nh�t thi�n h�, ngay c� M�u ��n c�ng kh�ng s�nh b�ng.")
		elseif (i < 50) then
			Talk(1,"","Nh� nh� � ��i L� ��u tr�ng hoa tr�, m�i n�m ��u t� ch�c tri�n l�m h�i hoa.")
		elseif (i < 75) then
			Talk(1,"","Hoa tr� ��p nh�t to�n ��i L� l� do �ng l�o h� �o�n tr�ng, �ng �y s�ng � m�t ng�i nh� nh� b�n b� Nh� H�i. Hoa tr� c�a l�o h�n h� �o�n m�i n�m ��n m�a h�i hoa lu�n ��oc ch�n l� hoa ��p nh�t.")
		else
			Talk(1,""," �ng l�o h� �o�n n�y c� ��i y�u hoa nh� th�nh c�i b�nh, hoa tr� m� �ng �y tr�ng ch� b�n cho ng��i c� duy�n v�i �ng �y, c�n ng��i kh�c th� d� cho c� �em n�i v�ng n�i b�c �ng �y c�ng kh�ng b�n.")
		end
	end
end;

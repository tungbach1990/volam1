-- ���ϱ��� �ɶ��� �ο�1�Ի�.lua�������ʣ�ȭ����������
-- By: Dan_Deng(2004-05-24)

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub1 = GetTask(52)
	if (Uworld75 == 10) and (U75_sub1 < 10)then		-- �����У���ȡ������
		 if (HaveItem(384) == 1) then
			SetTask(52,10)
			AddNote("Nhi�m v� Quy�n khuynh thi�n h�: �i Nh�n ��ng S�n b�t b�y con nh�n gi�m Ph��ng Th�ch ")
			Msg2Player("Nhi�m v� Quy�n khuynh thi�n h�: �i Nh�n ��ng S�n b�t b�y con nh�n gi�m Ph��ng Th�ch ")
			Talk(1,""," ��i s� huynh �� cho ph�p th� ph�i l�m m�i ���c! Ta mu�n ti�n ��y th� ng��i. �i Nh�n ��ng s�n thay ta b�t b�y con nh�n.")
		 else
		 	Talk(1,"","Ngay c� phong th� c�n kh�ng c� th� l�m sao m� ta tin ng��i h�?")
		end
	elseif (Uworld75 == 10) and (U75_sub1 == 10) then		-- ����������ж�
		if (GetItemCount(86) >= 7) then
			for i = 1,7 do DelItem(86) end
			Talk(1,"","��y ��ng l� con nh�n m� ta c�n. Hay qu� hay qu�! Ta c� s� ng��i �� g�p v�n �� g� r�i!")
			SetTask(52,20)
			AddNote("Nhi�m v� quy�n khuynh thi�n h�: Nhi�m v� b�t 7 con nhi�n �� ho�n th�nh. ")
			Msg2Player("Nhi�m v� quy�n khuynh thi�n h�: Nhi�m v� b�t 7 con nhi�n �� ho�n th�nh. ")
		else
			Talk(1,"","Vi�c m� ta giao cho ng��i c� kh� kh�ng?")
		end
	else
		Talk(1,"","Th�y ng��i c�ng l� m�t ng��i th�ch luy�n ch�, h�m n�o r�nh r�i thi th� m�t b�a nh�!")
	end
end;

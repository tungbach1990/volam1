--�������� ���踮 ·��6�̴���Ի�����ȭ����������
-- By: Dan_Deng(2004-05-24)

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub3 = GetTask(54)
	if (Uworld75 == 10) and (U75_sub3 < 10) then		-- �����У���ȡ������
		if (HaveItem(384) == 1) then
			SetTask(54,10)
			AddNote("��n h�m Thi�u L�m M�c Nh�n gi�p Th�i ��i th�c t�m hoa sen v�ng. ")
			Msg2Player("��n h�m Thi�u L�m M�c Nh�n gi�p Th�i ��i th�c t�m hoa sen v�ng. ")
			Talk(1,"","Ti�c l� c� ��i ta nghi�n c�u v� h�c, v�n ch�a c� con. Nghe n�i trong Thi�u L�m M�c Nh�n H�ng c� hoa sen v�ng, ���c ph�t t� ph� h�, c� th� gi�p ng��i ta c� con")
		else
		 	Talk(1,"","Ngay c� b�c th� c�ng kh�ng c�, ch� d�a v�o l�i n�i l�m sao tin ng��i?")
		end
	elseif (Uworld75 == 10) and (U75_sub3 == 10) then		-- ����������ж�
		if (HaveItem(26) == 1) then
			DelItem(26)
			SetTask(54,20)
			AddNote("T�m ra hoa sen v�ng, nhi�m v� ho�n th�nh. ")
			Msg2Player("T�m ra hoa sen v�ng, nhi�m v� ho�n th�nh. ")
			Talk(1,"","Ha ha! C� ph�i �� l� ng�c b�i trong truy�n thuy�t kh�ng? H�o ti�u t�! C�m �n ng��i! Vi�c ng��i h�c quy�n ph�p, ta ho�n to�n t�n th�nh.")
		else
			Talk(1,"","C�n ch�a t�m ���c hoa sen v�ng � ")
		end
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","L�o th�i gia ch�ng ta m�y ��i ��n truy�n, kh�ng c� con trai, th�t c� l�i v�i li�t t� li�t t�ng!")
		else
			Talk(1,"","B�t hi�u c� 3 �i�u, kh�ng c� ng��i n�i d�i l� �i�u l�n nh�t!")
		end
	end
end;

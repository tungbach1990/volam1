--���ϱ��� ����� ·��1���ϵ��Ի�
--����������������ϵ���ҩ
--suyu
-- Update: Dan_Deng(2003-08-11)

function main(sel)
	UTask_world21 = GetTask(49);
	if ((UTask_world21 == 0) and (GetLevel() >= 3)) then		-- ��������
		Say("Ta c� ho m�i kh�ng ng�t. Kh�ng bi�t khi n�o H�ng Mai m�i tr� v�, t�i l�c ph�i ��n D��c �i�m h�t thu�c th�i�Kh�c...kh�c", 2, "Gi�p /yes", "Kh�ng gi�p /no")
	elseif (UTask_world21 == 1) then
		if (HaveItem(179) == 1) then		--�ж�����Ƿ��õ�ҩ
			Talk(1,"","�a t� hi�p kh�ch! M�t ng�y n�o ��, ta b�o H�ng Mai l�m cho ng��i 1 ��i gi�y!")
			DelItem(179)		--ɾ��������ϵ�ҩ
			SetTask(49, 3)
			AddNote("�� thay l�o Ng� l�y v� 10 vi�n Xuy�n B�i Ho�n, Ng� H�ng Mai s� t�ng cho m�t ��i gi�y �� t� �n ")
			Msg2Player("�� thay l�o Ng� l�y v� 10 vi�n Xuy�n B�i Ho�n, Ng� H�ng Mai s� t�ng cho m�t ��i gi�y �� t� �n ")
		else
			Talk(1,"","Ng��i c� th� ��n d��c ph�ng h�i xem. T� ��y �i v� h��ng T�y v�i b��c l� t�i r�i! �kh�c�kh�c�H�y nh� l� 10 vi�n Xuy�n B�i ho�n, phi�n ng��i gi�p ta!")
		end
	else				-- ������Ի�
		Talk(1,"","S�c kh�e ta v� b� nh� ��u kh�ng kh�e, khu� n� v� ch�m s�c v� ch�ng ta m� v�n ch�a l�y ch�ng, b�c l�m cha m� nh� ta th�t kh�ng ph�i v�i con g�i m�nh!")
	end
end;

function yes()
	Talk(1,"","Ng��i c� th� ��n d��c ph�ng h�i xem. T� ��y �i v� h��ng T�y v�i b��c l� t�i r�i! �kh�c�kh�c�H�y nh� l� 10 vi�n Xuy�n B�i ho�n, phi�n ng��i gi�p ta!")
	SetTask(49, 1)
	AddNote("Nh�n nhi�m v� thay Ng� l�o gia ��n ti�m thu�c l�y thu�c ")
	Msg2Player("Nh�n nhi�m v� thay Ng� l�o gia ��n ti�m thu�c l�y thu�c ")
end;

function no()
end;

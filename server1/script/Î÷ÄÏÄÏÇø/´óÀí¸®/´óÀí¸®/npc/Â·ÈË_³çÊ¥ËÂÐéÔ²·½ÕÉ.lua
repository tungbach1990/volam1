-- ����ǡ�·�ˡ���ʥ����Բ���ɣ�������50������
-- by��Dan_Deng(2003-07-27)

function main()
	UTask_cy = GetTask(6)
	if (UTask_cy == 50*256+10) then		--50������
		SetTask(6,50*256+32)
		Talk(4,"","Ph��ng tr��ng ��i s�! ta l� �� t� Th�y Y�n, Ch��ng m�n b�o ta ��n gi�p qu� t� t�m l�i b�o v�t.","A Di �� Ph�t! V�y l�m phi�n Th� ch�! B�n c�o�p �� tr�n v�o Thi�n T�m Th�p.","Th�p n�y l� th�nh ��a c�a ��i L�, cho n�n �� ph�ng ng��i kh�c x�m nh�p v�o n�n trong th�p c� r�t nhi�u ��ng nh�n. Khi Th� ch� v�o b�t t�n tr�m c�n ph�i c�n th�n!","��i s� y�n t�m! ")
	elseif (UTask_cy == 50*256+32) and (HaveItem(5) == 1) then		-- ���
		SetTask(6,50*256+50)
		DelItem(5)
		Talk(3,"","Ph��ng Tr��ng ��i S�! ��y l� V� ��ng Quan �m m� qu� t� �� b� m�t, b�y gi� xin ���c ho�n tr� l�i.","A Di �� Ph�t! B�o v�t tr�n t� �� t�m l�i ���c, ��ng l� B� T�t ph� h�! C�m �n Th� ch�! Xin chuy�n l�i c�m �n ��n Ch��ng m�n qu� ph�i.","��i s� kh�ng n�n kh�ch s�o!")
		Msg2Player("Giao V� ��ng Quan �m cho H� vi�n ph��ng tr��ng ")
		AddNote("Giao V� ��ng Quan �m cho H� vi�n ph��ng tr��ng ")
	elseif (UTask_cy >= 50*256+32) and (UTask_cy < 50*256+50) then		-- ���������
		Talk(1,"","T�t c� tr�ng nh� v�o n� th� ch� ta s� � ��y ��c kinh c�u nguy�n cho th� ch�.")
	elseif (UTask_cy >= 50*256+50) then						-- ��������Ժ�
		Talk(1,"","Xin �a t� Th� ch�! �n ��c c�a Th� ch� B�n t� kh�ng bi�t l�y g� �� c�m k�ch.")
	else
		Talk(3,"","V� ��ng Quan �m l� m�t trong nh�ng S�ng Th�nh Ng� B�o c�a b�n t�, ��y l� ni�m t� h�o c�a S�ng Th�nh T� ","Ng��i xu�t gia sao m� c� l�ng ki�u ng�o hi�u th�ng ch�? ","L�i gi�o hu�n c�a th� ch� th�t khi�n b�n t�ng ph�i suy x�t l�i. A Di �� Ph�t, A Di �� Ph�t, A Di �� Ph�t. ")
	end
end;

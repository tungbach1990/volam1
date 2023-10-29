--description: ��ԭ���� �꾩�� ·��12����ŶԻ� ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),2)
		if (UTask_trsub60 == 0) then 
			DelItem(128)			--�����ؽ��������Ҽ���������ߵ����
			AddNote("T�i c�a B�c th�nh Bi�n Kinh, ng�i t�n g�u, �o�n ch� v�i T�n T� T�i ")
			L60_sub2_Q1()
		elseif (UTask_trsub60 == 2) then
			L60_sub2_Q1()
		elseif (UTask_trsub60 == 3) then
			L60_sub2_Q2()
		elseif (UTask_trsub60 == 4) then 
			L60_sub2_Q3()
		elseif (UTask_trsub60 == 5) then 
			L60_sub2_Q4()
		elseif (UTask_trsub60 == 6) then 
			L60_sub2_Q5()
		elseif (UTask_trsub60 == 10) and (HaveItem(128) == 0) then		-- ���߶�ʧ
			AddEventItem(128)
			Talk(1,"","T�i h� r�t b�i ph�c s� th�ng minh c�a c�c h�, xin h�y nh�n thanh ki�m n�y, ��ng t� ch�i! ")
		else
			Talk(1,"","B�i ph�c, b�i ph�c!")
		end
	else
		i = random(0,3)
		if (i == 0) then
			Talk(1,"","Qu�c ph� s�n h� t�i, th�nh xu�n th�o m�c th�m. C�m th�i hoa ti�n l�, t�nh bi�t �i�u kinh t�m. �i th�t ��ng th��ng!         ")
		elseif (i == 1) then
			Talk(1,"","Y�n long h�n th�y nguy�t long sa; D� b�c t�u chu�n c�n t�u gia; Th��ng n� b�t tri vong qu�c h�n; C�ch giang �u x��ng h�u ��nh hoa. �y! Th�t ��ng th��ng! ��ng th��ng! ")
		elseif (i == 2) then
			Talk(1,"","T�n Th�i Minh Nguy�t H�n Th�i Quan, V�n L� Tr��ng Chinh Nh�n V� Ho�n. ��m S� Long Th�nh Phi T��ng T�i, B�t Gi�o H� M� �� �m S�n!Chao �i! Th�t ��ng th��ng! ")
		else
			Talk(1,"","Y�n li�u h�a ki�u, phong li�n th�y m�, tham sai th�p v�n nh�n gia, tr�ng h� �i�p �i�p thanh giai, h�u tam thu qu� t�, t�p l� h� hoaChao �i! ��ng h�n! ��ng h�n!....N�u nh� kh�ng ph�i l� v� b�i th� n�y th� c� l� Kim qu�c c�ng �� kh�ng kh�i bin")
		end
	end
end

function L60_sub2_Q1()
	Say("Ti�u sinh c� m�y ch� n�y. Trong m�t l�c b�i r�i ch�a th� �o�n ra, kh�ng bi�t ng��i c� th� �o�n ���c kh�ng. 'S�ng ti�n minh nguy�t quang'l� ch� g�? ", 3, "Ho�ng /no1", "Kho�ng /L60_sub2_Q2", "��m /no1")
end;

function no1()
	SetTask(28, SetByte(GetTask(28),2,2))
	Talk(1,"","Ch� th� nh�t ng��i ��an ch�a ra �?")
end;

function L60_sub2_Q2()
	Say("�m! C�n ch� th� hai: 'H�u c��c kho�i nh� phong, �i�m h�a h�u thanh �m, gia th�y tr� thi�t th�nh, tr��ng th�o hoa t��ng ph�ng'l� ch� g� v�y? ", 3, "Th��ng /no2", "Lu�n /no2", "Bao /L60_sub2_Q3")
end;

function no2()
	SetTask(28, SetByte(GetTask(28),2,3))
	Talk(1,"","Phi d� phi d�! ")
end;

function L60_sub2_Q3()
	Say("���c r�i! C�n ch� th� 3: 'B�t ch�nh ch� vi v�n ti�t khu�t' l� ch� g� v�y?", 3, "c�i /L60_sub2_Q4", "Oai /no3", "Th�t /no3")
end;

function no3()
	SetTask(28, SetByte(GetTask(28),2,4))
	Talk(1,"","Ta th�y kh�ng ph�i v�y!")
end;

function L60_sub2_Q4()
	Say("Th� ch� th� 4: '�i�m �i�m hu�nh h�a chi�u giang bi�n' l� ch� g� v�y?", 3, "Tr�c /no4", "��m /L60_sub2_Q5", "N�ng /no4")
end;

function no4()
	SetTask(28, SetByte(GetTask(28),2,5))
	Talk(1,"","H�nh nh� kh�ng ��ng ph�i kh�ng?")
end;

function L60_sub2_Q5()
	Say("Ch� cu�i m�i l� kh� �o�n nh�t! '��nh ti�n nguy�t ��i �nh, �nh h� nh�n tr�n nh�t h�ng'", 3, "Li�u /L60_sub2_prise", "Li�u /no5", "�ng /no5")
end;

function no5()
	SetTask(28, SetByte(GetTask(28),2,6))
	Talk(1,"","Chao �i! Cu�i c�ng c�ng ch�ng xong! ")
end;

function L60_sub2_prise()
	Talk(1,"","B�i ph�c! Ti�u sinh r�t vui ���c k�t b�n v�i ng��i, T� ph� c�a ti�u sinh v�n l� nh� v�, ��n ��i ti�u sinh th� b� v� theo v�n. Nh�ng ch� l� m�t th� sinh v� d�ng th�i. T� ph� c�a ti�u sinh c� truy�n l�i c�y �o�n ki�m n�y, nh�ng m� ��i v�i ti�u s")
	AddEventItem(128)
	SetTask(28, SetByte(GetTask(28),2,10))
	AddNote("�o�n ��ng t�t c� nh�ng c�u �� c�a t�n t� t�i, ���c t�ng cho c�y �ao �o�n Th�y ")
	Msg2Player("Nh�n ���c c�y �ao �o�n Th�y ")
end;

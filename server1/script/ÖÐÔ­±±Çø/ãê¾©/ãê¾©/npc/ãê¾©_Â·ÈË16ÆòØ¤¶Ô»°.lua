--description: ��ԭ���� �꾩�� ·��16��ؤ�Ի� ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4)
	Uworld38 = GetByte(GetTask(38),2)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),4)
		if (UTask_trsub60 == 0) then 
			DelItem(131)			--�����ؽ��������Ҽ���������ߵ����
			Say("Xin cho ch�t ti�n l�! ", 2, "Cho /yes1", "Kh�ng cho! /no")
		elseif (UTask_trsub60 == 2) then 
			Say("Xin cho ch�t ti�n l�! ", 2, "Cho /yes2", "Kh�ng cho! /no")
		elseif (UTask_trsub60 == 4) then 
			Say("Xin cho ch�t ti�n l�! ", 2, "Cho /yes3", "Kh�ng cho! /no")
		elseif (UTask_trsub60 == 10) then
			if (HaveItem(131) == 0) then
				AddEventItem(131)
				Talk(1,"","Thanh ki�m n�y m�c d� kh�ng ��ng ti�n, nh�ng c�ng l� m�t ch�t t�m � c�a ta, xin ��ng ch�i t�!")
			else
				Talk(1,"","X�ng ��ng l� b�n t�t! ���c! Ta nh�n ng��i l� h�o huynh ��!")
			end
		end
	elseif (Uworld38 == 10) then		-- �����������������
		if ((HaveItem(121) == 1) and (HaveItem(122) == 1) and (HaveItem(218) == 1)) then		-- ��ͭ�󡢹�޽�㡢�ᾧʯ
			Say("Ch� c�n cho ta ba m�n g� kh�ng ��ng gi� tr�n ng��i c�a ng��i c�ng ���c",2,"Cho ng��i /SLenroll_S4_yes","Ch� l� gi� d�i m� th�i. Ki�n quy�t kh�ng cho /no")
		else
			Talk(1,"","V� hi�p kk�ch n�y! Ti�n �� r�ng th�nh thang! Xin b� th� cho k� h�n �t b�c l�!")
		end
	elseif ((Uworld38 == 20) and (HaveItem(219) == 0)) then		--�����У�֤�����Ŷ���
		Talk(2,"","T� ra ng��i c�ng ch� kh� h�n ta ch�t n�o!","Kh�ng sao! Ta vi�t l�i cho ng��i b�c th� l� ���c.")
		AddEventItem(219)
	elseif (UTask_tr > 60*256+20) then
		Talk(1,"","X�ng ��ng l� b�n t�t! ���c! Ta nh�n ng��i l� h�o huynh ��!")
	else
		Talk(1,"","V� thi�u hi�p n�y, h�y ph�t huy tinh th�n hi�p ngh�a v� t� �i! Th�t ��ng th��ng cho Khi�u h�a t� ta! Cho ta xin m��i m�y v�n l��ng �i!")
--		Talk(1,"","��ؤ���������о�����������һ�ھƺȰɣ��ҿ���û���ԣ��ɲ���û�ƺȰ���")
	end
end;

function SLenroll_S4_yes()
	Talk(1,"","X�ng ��ng l� b�n t�t! ���c! Ta nh�n ng��i l� h�o huynh ��!")
	DelItem(121)
	DelItem(122)
	DelItem(218)
	AddEventItem(219)
	Uworld38 = SetByte(GetTask(38),2,20)
	SetTask(38,Uworld38)
	Msg2Player("Nh�n ���c m�t b�c th� t� tay �n m�y. ")
	AddNote("Nh�n ���c m�t b�c th� t� tay �n m�y. ")
end;

function yes1()
	if (GetCash() >= 10) then
		Pay(10)
		Talk(1,"","Ch� b�y nhi�u th�i �? H�! Sao keo ki�t v�y! ")
		SetTask(28, SetByte(GetTask(28),4,2))
	else
		Talk(1,"","Xin l�i! Ta kh�ng �em �� ti�n.")
	end
end;

function yes2()
	if (GetCash() >= 50) then
		Pay(50)
		Talk(1,"","H�! ��ng t��ng ta l� �n m�y th� d� xem th��ng nha! ")
		SetTask(28, SetByte(GetTask(28),4,4))
	else
		Talk(1,"","Ta kh�ng c� ti�n!.")
	end
end;

function yes3()
	if (GetCash() >= 100) then
		Pay(100)
		Talk(1,"","Ta t�ng ng��i thanh ki�m n�y, g�i l� ch�t l�ng th�nh �! Xin ��ng t� ch�i!")
		AddEventItem(131)
		Msg2Player("Nh�n ���c thanh ki�m: Di�t H�n ")
		SetTask(28, SetByte(GetTask(28),4,10))
		AddNote("G�p ���c �n m�y tr��c c�a T��ng qu�c t� � Bi�n Kinh, b� th� li�n ti�p 3 l�n, nh�n ��� thanh ki�m Di�t H�n ")
	else
		Talk(1,"","Ta th�t l�c b�t t�ng t�m! ")
	end
end;

function no()
	Talk(1,"","Tr�n ��i n�y ng��i th�y l�i qu�n ngh�a nhi�u qu�! ")
end;

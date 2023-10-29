--������ ·�� �Ϲ��� �������񣺽��ܹ���
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world25 = GetTask(25)
	if (UTask_world25 == 0) then		-- ��������
		Talk(2,"W25_get","�� tr�nh cu�c lo�n chi�n n�y, t�i h� t� Trung Nguy�n ��n ��y! Nh�ng kh�ng bi�t b�y gi� n�n �i v� h��ng n�o!","Ng��i c� th� t�m m�t c�ng vi�c, sau �� t� t� ngh� ��n chuy�n n�y!")
	elseif (UTask_world25 == 6) then
		Talk(1,"W25_prise","B� ch� � L� qu�n �� ��ng � cho ng��i ��n gi�p vi�c � ��!")
	else				-- ������Ի�
		Talk(1,"","�y! Chi�n tranh � Trung Nguy�n n�y th�t l� kh�c li�t! Ta b� b�t tham gia v�o cu�c chi�n n�y �� 2 n�m! Th�t s� kh�ng ch�u n�i n�a n�n �� ��o t�u! Hy v�ng l� c� th� s�ng y�n �n � th� tr�n nh� b� n�y ��n su�t ��i")
	end
end;

function W25_get()
	Say("T�i h� ch�a bi�t ���c g� v� v�ng ��t n�y, c�ng ch�a bi�t n�i ��u s� ch�a nh�n m�nh!",2,"Gi�p h�n ngh� ra bi�n ph�p! /W25_get_yes","Kh�ch l� tinh th�n h�n! /W25_get_no")
end

function W25_get_yes()
	Talk(1,""," �� ta th� h�i gi�p ng��i, xem c� vi�c g� th�ch h�p kh�ng!")
	SetTask(25,3)
	AddNote("Nh�n nhi�m v� gi�i thi�u c�ng vi�c cho Th��ng Quan Thu ")
	Msg2Player("Nh�n nhi�m v� gi�i thi�u c�ng vi�c cho Th��ng Quan Thu ")
end

function W25_get_no()
	Talk(1,"","V�y th� ta kh�ng gi�p ���c cho ng��i r�i! Nh�ng m� ng��i c� tin t��ng r�ng tr�i kh�ng tuy�t ���ng c�a ng��i ��u! H�y tr�n t�nh l�n! R�i s� c� c�ch th�i!")
end

function W25_prise()
	Talk(1,"","T�i h� th�t kh�ng bi�t l�m sao �� th� hi�n l�ng c�m k�ch c�a m�nh! ��y l� v�t ph�ng th�n tr�n ���ng ��o t�u, hy v�ng s� h�u d�ng ��i v�i huynh")
	SetTask(25,10)
	AddRepute(3)
	AddNote("H�y �i t�m m�t tin vui v� c�ng vi�c b�o cho Th��ng Quan Thu, ho�n th�nh nhi�m v�! ")
	Msg2Player("H�y �i t�m m�t tin vui v� c�ng vi�c b�o cho Th��ng Quan Thu, ho�n th�nh nhi�m v�! ")
	i = random(0,8)
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(i <= 5) then
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	else
		i = i - 6
		AddItem(0, 1, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	end
	Msg2Player("Nh�n ���c m�t m�n binh kh� ")
	Msg2Player("Danh v�ng c�a b�n t�ng th�m 3 �i�m ")
end

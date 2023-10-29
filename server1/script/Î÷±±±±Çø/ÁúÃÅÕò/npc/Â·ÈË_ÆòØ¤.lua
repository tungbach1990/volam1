--������ ·�� ��ؤ ���������ӿ���
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world26 = GetTask(26)
	if (UTask_world26 == 0) and (GetLevel() >= 2) then		-- ��������
		if (GetSex() == 0) then
			Talk(4,"W26_get","V� ��i hi�p n�y, xin gi�p ta 1 vi�c. ","Sao?","B�n c� th� gi�p ta chuy�n l�i t�i Mi Nhi c� n��ng trong tr�n kh�ng? ","L�i g�. ")
		else
			Talk(4,"W26_get","V� ��i hi�p n�y, xin gi�p ta 1 vi�c. ","Sao?","B�n c� th� gi�p ta chuy�n l�i t�i Mi Nhi c� n��ng trong tr�n kh�ng? ","L�i g�. ")
		end
	elseif (UTask_world26 == 6) then
		Talk(1,"W26_prise","R�t cu�c ng��i �� b�o ta n�i ra � ngh�a g� khi�n cho Tri�u My Nhi �au kh� tuy�t v�ng!? Th�t l� ��ng th��ng!")
	elseif (UTask_world26 >= 10) then
		Talk(1,"","Tr�ng s�m ch�ng th� s�ng, n�i bu�n �au tim gan! Ai n�i m�a xu�n ��p, ch� th�y hoa r�ng t�n. �i! L�u l�c nh� th� n�y th� c�n m�t m�i n�o g�p m�i ng��i!")
	else				-- ������Ի�
		Talk(1,"","C�i g�? B� th� cho ta �? �i �i�ta ��u c� xin ti�n! ��ng c� ngh� ta l� �n m�y.")
	end
end;

function W26_get()
	Say("H�y n�i v�i c� �y l� Ti�u D�ch �nh �� ch�t r�i. C�n n�a, kh�ng ���c n�i l� ta n�i!",2,"Gi�p /W26_get_yes","Kh�ng gi�p /W26_get_no")
end

function W26_get_yes()
	Talk(1,"","Kh�ng bi�t ng��i n�i g� n�a! Nh�ng ta c�ng s� �i m�t chuy�n!")
	SetTask(26,3)
	AddNote("Nhi�m v� k� ti�p: G�up l�o �n m�y ��a tin cho Tri�u Mi Nhi ")
	Msg2Player("Nhi�m v� k� ti�p: G�up l�o �n m�y ��a tin cho Tri�u Mi Nhi ")
end

function W26_get_no()
	Talk(2,"","Th�t l� th�nh c�u k� l�! Huynh kh�ng n�i r� th� ta kh�ng gi�p ��u.","V�y�. ta t�m ng��i kh�c gi�p v�y!")
end

function W26_prise()
	Talk(1,"",":�m�t l�i kh� n�i h�t! ��y c� ch� th�nh �! Xin nh�n l�y!")
	SetTask(26,10)
	AddNote("N�i ph�n �ng c�a Tri�u Mi Nhi cho C�i Bang, ho�n th�nh nhi�m v�. ")
	Msg2Player("N�i ph�n �ng c�a Tri�u Mi Nhi cho C�i Bang, ho�n th�nh nhi�m v�. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
	if(GetSex() == 0) then
		AddItem(0, 8, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("���c m�t m�nh Ng�u b� H� Uy�n. ")
	else
		AddItem(0, 8, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("���c m�t Thanh ��ng Ng�c Tr�c. ")
	end
	AddRepute(5)
	Msg2Player("Danh v�ng c�a b�n t�ng th�m 5 �i�m ")
end

--ʯ���� ·�� ����&��ȫ �������񣺻�Ǯ
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world23 = GetTask(23)
	if (UTask_world23 == 0) and (GetLevel() >= 3) then		-- ��������
		Talk(3,"W23_get","A To�n, con ��ng �i, s�c kh�e nh� v�y m� �i ��u?","A M� ��ng c�n con, n�u con kh�ng �i h�i n�m l�y ti�n � ��u ra? Th�m Gia s� kh�ng tha cho ch�ng ta!","X�y ra chuy�n g� v�y?")
	elseif (UTask_world23 == 6) then
		Talk(2,"W23_prise","Ta �� gi�p c�c ng��i tr� n� r�i!","Th�t c�m �n ��i hi�p!")
	else				-- ������Ի�
		if (random(0,1) == 0) then
			Talk(1,"","Nh�n th�y A Quy�n nh� b�n c�nh v�a xinh v�a hi�u chuy�n, ta c�ng mu�n c� m�t ��a con, nh�ng ch�ng ta hi�n gi� r�t c�c, thi�u n� ng��i ta, l�m g� c� ti�n nu�i con n�i.")
		else
			Talk(1,"","�i! H�i tr��c s�c kh�e ta t�t l�m, b�i v� c� l�n h�i c� �u t� xu�ng n��c, t� �� ng� b�nh kh�ng th� n�o ch�a tr� ")
		end
	end
end;

function W23_get()
	Say("Ai d�! Ch�ng ta thi�u ti�n Th�m Gia trong th�n, nh�ng v� A To�n l�m b�nh r�t l�u, kh�ng c� ti�n tr� n�. Th�m gia b�o mang nh� ch�ng ta b�n ho�c c�m �� l�y ti�n tr� �ng.",2,"��ng v�i, �� ta quy�t ��nh gi�m �ng. /W23_get_yes","V�n �� thi�u n� th� m�i ng��i ph�i c� g�ng h�n. /W23_get_no")
end;

function W23_get_yes()
	SetTask(23,3)
	Talk(1,"","Y�n t�m! Giao cho ta �i! C�c ng��i � ��y ch� tin c�a ta.")
	AddNote("Nh�n nhi�m v� gi�p A M� v� A To�n gi�i quy�t g�nh n�ng, �p Th�m gia b� n�. ")
	Msg2Player("Nh�n nhi�m v� gi�p A M� v� A To�n gi�i quy�t g�nh n�ng, �p Th�m gia b� n�. ")
end

function W23_get_no()
end

function W23_prise()
	Talk(1,"","��y l� qu�n �o do ch�nh tay ta may, xin h�y nh�n l�y!")
	SetTask(23,10)
	AddNote("N�i v�i A M� v� A To�n l� �� tr� h�t n�, nhi�m v� ho�n th�nh. ")
	Msg2Player("N�i v�i A M� v� A To�n l� �� tr� h�t n�, nhi�m v� ho�n th�nh. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(GetSex() == 0) then
		AddItem(0, 2, 2, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("Nh�n C�n y ")
	else
		AddItem(0, 2, 10, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("Nh�n C�m Sam ")
	end
	AddRepute(7)
	Msg2Player("Danh v�ng c�a b�n t�ng th�m 7 �i�m. ")
end;

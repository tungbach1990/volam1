--��Ȫ�� ·�� ����
--��Ȫ����������������ѩ��
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world20 = GetTask(20)
	if (UTask_world20 == 0) and (GetLevel() >= 5) then 		--��������
		Talk(2,"W20_get","T�t c� c�c m�n �n trong thi�n h� ch�a c� m�n n�o m� ta ch�a l�m qua. Nh�ng m� c� m�t m�n g�i l�'�m D��ng B�ch Tuy�t M�' l� ta l�m m�i v�n ch�a ���c ","T�i sao v�y?")
	elseif (UTask_world20 == 5) then
		if (HaveItem(231) == 1) and (HaveItem(232) == 1) then		-- �������
			SetTask(20,10)
			DelItem(231)
			DelItem(232)
			Talk(1,"","D��ng xu�n Linh Chi! B�ch Tuy�t B�ch h�p. T�t l�m! Th�t kh�ng bi�t ph�i l�m sao �� c�m t� ng��i. ��y l� ch�t �t l�ng th�nh, xin h�y nh�n l�y ")
			AddNote("Mang D��ng Xu�n Linh Chi v� B�ch Tuy�t B�ch H�p giao cho Chung C�m, ho�n th�nh nh��m v� ")
			Msg2Player("Mang D��ng Xu�n Linh Chi v� B�ch Tuy�t B�ch H�p giao cho Chung C�m, ho�n th�nh nh��m v� ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			if(GetSex() == 0) then
				AddItem(0, 9, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("Nh�n ���c m�t mi�ng Ng�c B�i ")
			else
				AddItem(0, 9, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("Nh�n ���c m�t t�i x� H��ng m�u �en ")
			end
			AddRepute(8)
			Msg2Player("Danh v�ng c�a b�n t�ng th�m 8 �i�m ")
		else
			Talk(1,"","Sao h�? Hai m�n �� �� ng��i ��u t�m v� ���c r�i �?")
		end
	elseif (UTask_world20 == 10) then		-- �����Ѿ����
		Talk(1,"","Th�t l� c�m �n ng��i")
	else
		Talk(1,"","�i trong thi�n h�, �n c�c m�n �n c�a thi�n h�. C� ��i ta t�m huy�t ch� l� ���c �n t�t c� c�c m�n ngon trong thi�n h� m� th�i ")
	end
end;

function W20_get()
	Say("M�n �n n�y c�n ph�i c� 'D��ng Xu�n Linh Chi v� B�ch tuy�t B�ch h�p,nghe n�i ch� c� � th�n Long tuy�n m�i c� hai th� n�y. Ta �� t�m r�t l�u r�i nh�ng v�n ch�a t�m ���c ch�ng ",2,"T�m gi�p �ng ta /W20_get_yes","Kh�ng m�ng ��n /W20_get_no")
end

function W20_get_yes()
	SetTask(20,5)
	Talk(1,"","�� ta gi�p �ng t�m!")
	AddNote("Nh�n nhi�m v� gi�p Chung C�m �i t�m D��ng Xu�n Linh Chi v� B�ch Tuy�t B�ch H�p ")
	Msg2Player("Nh�n nhi�m v� gi�p Chung C�m �i t�m D��ng Xu�n Linh Chi v� B�ch Tuy�t B�ch H�p ")
end

function W20_get_no()
end

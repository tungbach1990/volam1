--��ԭ���� ������ ·��˫˫�ĶԻ�
--��������������: ���ֻ�
--by Dan_Deng(2003-07-21)
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world40 = GetTask(68)
	if ((UTask_world40 == 0) and (GetLevel() >= 6)) then		--��������
		Say("Ti�u n� l�m m�t chi�c nh�n m� �� l�i r�i, t�m ho�i kh�ng th�y, �� l� chi�c nh�n ti�u n� th�ch nh�t.", 2, "Ta s� gi�p c� t�m n�. /yes", "Th�t l� phi�n ph�c. /no")
	elseif ((UTask_world40 == 3) and (HaveItem(191) == 1)) then		-- �������
		DelItem(191)
		Talk(2,"finish_select","��y c� ph�i l� nh�n c�a c� n��ng kh�ng?","��ng r�i, th�t c�m �n, xin h�y nh�n ch�t th�nh � c�a ti�u n�.")
	elseif (UTask_world40 <= 3) then		-- �����е���ͨ�Ի�
		Talk(1,"","Hy v�ng c� th� t�m l�i ���c chi�c nh�n c�a ta. ")
	else
		i = random(0,2)
		if (i==0) then
			Talk(1,"","��y l� chi�c nh�n do m� ti�u n� �� l�i, ti�u n� r�t th�ch n�.")
		elseif (i==1) then
			Talk(1,"","N�m ngo�i m� ti�u n� l�m b�nh qua ��i, ch� �� l�i chi�c nh�n n�y th�i.")
		else
			Talk(1,"","Hu hu hu! Ti�u n� nh� m� qu�.")
		end
	end
end;

function yes()
	SetTask(68,1)
	Msg2Player("Nh�n nhi�m v�: Gi�p Song Song t�m l�i chi�c nh�n. ")
	AddNote("Nh�n nhi�m v�: Gi�p Song Song t�m l�i chi�c nh�n. ")
end;

function no()
	Talk(1,"","�i, kh�ng bi�t chi�c nh�n �� r�i � ��u?")
end;

function finish_select()
	Say("��y l� 200 l��ng, xin h�y nh�n l�y.", 2, "Nh�n. /finish_a","T�ch�i /finish_b")
end;

function finish_a()
	Talk(1,"","Xin �a t�.")
	Earn(200)
	SetTask(68,4)
	AddRepute(7)
	Msg2Player("Ho�n th�nh nhi�m v�: Gi�p Song Song t�m l�i chi�c nh�n, l�y ���c 200 l��ng b�c. ")
	AddNote("Ho�n th�nh nhi�m v�: Gi�p Song Song t�m l�i chi�c nh�n, l�y ���c 200 l��ng b�c. ")
	Msg2Player("Danh ti�ng giang h� c�a b�n t�ng th�m 7 �i�m ")
end;

function finish_b()
	Talk(2,"","Ng��i tr�n giang h� gi�p �� nhau l� chuy�n th��ng t�nh, C� n��ng kh�ng c�n ph�i kh�ch kh�.","C�c h� th�t l� m�t ng��i hi�p ngh�a, ti�u n� c� m�t chi�c th�t l�ng da s�i, xin t�ng c�c h� �� ph�ng th�n.")
	SetTask(68,5)
	AddRepute(9)
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
	AddItem(0,6,0,2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
	Msg2Player("Ho�n th�nh nhi�m v�: Gi�p Song Song t�m l�i chi�c nh�n. L�y ���c m�t chi�c th�t l�ng da s�i. ")
	AddNote("Ho�n th�nh nhi�m v�: Gi�p Song Song t�m l�i chi�c nh�n. L�y ���c m�t chi�c th�t l�ng da s�i. ")
	Msg2Player("Danh v�ng c�a b�n t�ng th�m 9 �i�m ")
end;

--ʯ���� ·�� ���� �������񣺰���Ľ�ָ
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world24 = GetTask(24)
	if (UTask_world24 == 0) and (GetLevel() >= 5) then		-- ��������
		Say("Chi�c nh�n c�a ta t�m kh�ng th�y, nh�t ��nh l� con linh mi�u tha �i r�i. ",2,"Gi�p c� ta t�m. /W24_get_yes","Gi� v� nh� kh�ng nghe/W24_get_no")
	elseif (UTask_world24 == 5) and (HaveItem(234) == 1) then		-- �������
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
		if (GetSex() == 0) then
			W24_rank = "<#> T�m b�a h� th�n n�y ta gi� c�ng ch�ng �ch g�, h�y c�m l�y coi nh� l� t� l�."
			AddItem(0, 4, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("���c mi�ng l�nh ph� h� th�n L�c C�ng Th�ch. ")
		else
			W24_rank = "<#> S�i d�y chuy�n n�y m�c d� r�t ��p nh�ng l� c�a m�t k� ��ng gh�t t�ng cho ta, b�y gi� ta ��a l�i cho ng��i."
			AddItem(0, 4, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("���c m�t d�y chuy�n ��ng. ")
		end
		Talk(1,"","<#> �i ch�! ��y ch�ng ph�i l� chi�c nh�n c�a ta sao? Th�t c�m �n ng��i �� t�m n� gi�p ta!"..W24_rank)
		SetTask(24,10)
		DelItem(234)
		AddRepute(7)
		AddNote("Giao nh�n cho A Kinh. Ho�n th�nh nhi�m v� ")
		Msg2Player("Giao nh�n cho A Kinh. Ho�n th�nh nhi�m v� ")
		Msg2Player("Danh v�ng c�a b�n t�ng th�m 7 �i�m. ")
	else				-- ������Ի�
		Talk(1,"","Th�n ta con g�i ��u kh�o tay, th��ng c�t gi�y k�nh th�n b�i ph�t, ta th�ch nh�t l� chi�c nh�n n�y, l�m r�t tinh x�o.")
	end
end;

function W24_get_yes()
	SetTask(24,5)
	Talk(1,"","��ng lo! Ta s� �i t�m l�i cho mu�i!")
	AddNote("Nh�n nhi�m v�: Gi�p A Kinh t�m chi�c nh�n b� ��nh m�t. ")
	Msg2Player("Nh�n nhi�m v�: Gi�p A Kinh t�m chi�c nh�n b� ��nh m�t. ")
end

function W24_get_no()
end

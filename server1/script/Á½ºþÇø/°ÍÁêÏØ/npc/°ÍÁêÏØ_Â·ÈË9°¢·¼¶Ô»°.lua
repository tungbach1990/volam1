--������ ������ ·��9�����Ի�
--�������������񣺰����ļ�ױ
--suyu
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world20 = GetTask(48);
	if ((UTask_world20 == 0) and (GetLevel() >= 2)) then		-- ��������
		Say("B� m� �� s�p x�p h�n s� cho em,nh�ng nh� em ngh�o qu�, ��n m�t m�n c�a h�i m�n cho ra d�ng c�ng kh�ng c�! G�n ��y trong tr�n xu�t hi�n m�t ng��i th��ng nh�n t� ph��ng xa ��n, anh/ch� c� th� h�i gi�p em xem c� m�n n�o gi� r� m�t ch�t kh�ng?", 2, "Gi�p /yes", "Kh�ng gi�p /no")
	elseif(UTask_world20 == 1) then
		if(HaveItem(181) == 1) then
			DelItem(181)
			SetTask(48, 3)			-- ������ʱ��Ϊ�����ظ����
			Talk(1,"","A! ��i b�ng tai n�y ��p qu�,c� l� �� t�n c�a anh/ch� kh�ng �t ti�n! ��y l� ��i gi�y em t� l�m, t�ng cho anh/ch�!")
			AddNote("��a ��i b�ng tai cho A ph��ng, ho�n th�nh nhi�m v�. ")
			Msg2Player("��a ��i b�ng tai cho A ph��ng, ho�n th�nh nhi�m v�. ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
			if(GetSex() == 0) then
				AddItem(0, 7, 6, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("Nh�n ���c m�t chi�c kh�n ")
			else
				AddItem(0, 7, 8, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("Nh�n ���c m�t chi�c tr�m ")
			end
			AddRepute(6)		-- ������6��
			Msg2Player("Thanh th� giang h� c�a b�n ���c gia t�ng 6 �i�m. ")
		else
			Talk(1,"","Ng��i th��ng nh�n �� � trong th� tr�n, l�m phi�n anh/ch� h�i gi�p v�i. ")
		end
	else				-- ������Ի�
		if (random(0,1) == 0) then
			Talk(1,"","Con g�i c�a ng� d�n, cu�i c�ng c�ng g� v�o nh� ng� d�n, l�m v� c�a ng� d�n. ")
		else
			Talk(1,"","B� m� �� s�p x�p h�n s� cho em, nh�ng em kh�ng mu�n l�m v� m�t ng� d�n, nh�ng kh�ng c�n c�ch n�o kh�c, l�i c�a cha m� kh�ng th� c�i l�i. ")
		end
	end
end;

function yes()
	Talk(1,"","Ng��i th��ng nh�n �� � trong th� tr�n, l�m phi�n anh/ch� h�i gi�p v�i. ")
	SetTask(48, 1)
	Msg2Player("Nh�n nhi�m v�: A ph��ng nh� b�n �i xem th�, xem c� m�n trang s�c n�o gi� r� l�m c�a h�i m�n ���c kh�ng ")
	AddNote("Nh�n nhi�m v�: A ph��ng nh� b�n �i xem th�, xem c� m�n trang s�c n�o gi� r� l�m c�a h�i m�n ���c kh�ng ")
end;

function no()
end;

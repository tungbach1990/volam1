--������ ������ ·��4С��Ի�
--��������������С��ĵ���
--suyu
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world18 = GetTask(46);
	if (UTask_world18 == 0) then		-- ��������
		Say("Hu!!hu! B� ch�u h�m qua �i ��nh c� g�p ph�i m�a l�n, b�y gi� l�m b�nh r�i, b�y gi� c�n l�n c�n s�t n�a. B� kh�ng kh�i b�nh, kh�ng th� �i ��nh c�, ch�ng ch�u bi�t �n c�i g�? C�/ch� c� th� gi�p ch�u ��n c�u c�u Ng� th�n y kh�ng? �ng �y l� m�t ng��i t�t, ch�c ch�n s� gi�p!",2,"Gi�p /yes","Kh�ng gi�p /no")
	elseif(UTask_world18 == 1) then		-- �������
		if(HaveItem(180) == 1) then
			Talk(1,"","�! ��y l� thu�c T� B� ho�n �?Nh� v�y b�nh t�nh c�a b� ch�u nh�t ��nh s� kh�i. C�/ch� th�t l� m�t ng��i t�t, C�/ch� h�y nh�n l�y ��i gi�y n�y, c�a m� ch�u l�m ��y. ")
			DelItem(180)
			SetTask(46, 2)
			AddNote("��a T� B� ho�n c�a Ti�u Ng�, ho�n th�nh nhi�m v�. ")
			Msg2Player("��a T� B� ho�n c�a Ti�u Ng�, ho�n th�nh nhi�m v�. ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
			if(GetSex() == 0) then
				AddItem(0, 5, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("L�y ���c ��i gi�y c� ")
			else
				AddItem(0, 5, 2, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("L�y ���c ��i gi�y th�u. ")
			end
			AddRepute(5)		-- ������6��
			Msg2Player("Danh v�ng c�a b�n t�ng th�m 5 �i�m")
		else
			SetTask(46, 1)
			Talk(1,"","C�/ch� v�n ch�a t�m ���c thu�c T� B� ho�n �?B�nh t�nh c�a b� ch�u bi�t t�nh sao b�y gi�, huhuhu��")
		end
	else							-- ������״̬
		if (random(0,1) == 0) then
			Talk(1,"","B� ch�u l� ng� d�n tr�n ��ng ��nh h�,m�i ng�y ��u ph�i ra h� ��nh c�, n�u h�m n�o g�p s�ng to gi� l�n, c� khi ��n m�y ng�y li�n kh�ng th� v� nh�. ")
		else
			Talk(1,"","Ch�u r�t lo cho b�, n�u ch�u l� con trai th� t�t qu�, l�c �� ch�u s� gi�p b� ��nh c�. ")
		end
	end
end;

function yes()
	Talk(1,"","Ch�u nh� l�c tr��c c� nghe ��i phu n�i u�ng thu�c T� B� ho�n s� h�t s�t, nh�ng nh� ch�ng ch�u ngh�o qu� kh�ng th� mua ���c. ")
	SetTask(46, 1)
	Msg2Player("Ti�p nh�n nhi�m v�: B� c�a Ti�u Ng� b� b�nh, gi�p �ng �y mua T� B� ho�n �� ch�a b�nh. ")
	AddNote("Ti�p nh�n nhi�m v�: B� c�a Ti�u Ng� b� b�nh, gi�p �ng �y mua T� B� ho�n �� ch�a b�nh. ")
end;

function no()
	Talk(1,"","Ch�u ph�i � ��y ti�p t�c ch� nh�ng ng��i h�o t�m. ")
end;

--description: ���ϱ��� �ɶ��� �������ϰ� ������10������
--author: yuanlan	
--date: 2003/5/24
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>C� h�ng th� ��n ta l�m �� �� kh�ng? C� ch� �n ch� � ��ng ho�ng!"

function main(sel)
	UTask_em = GetTask(1)
	if ((UTask_em == 10*256+20) and (HaveItem(18) == 1) and (HaveItem(19) == 1)) then
		Talk(5, "", "��i ca! C� th� gi�p ta h�n l�i hai m�nh g��ng ��ng n�y kh�ng?", "N�u ��i cho ng��i kh�c mu�n kh�i ph�c g��ng ��ng th� kh� nh� l�n tr�i, nh�ng ��i v�i ta th� c� m�t b� truy�n �� v� l�i, ng��i t�m ��ng ng��i r�i ��, nh�ng m�...", "C�n bao nhi�u ti�n �� kh�i ph�c g��ng ��ng?", "Ch� c�n ng��i gi�p ta t�m m�t lo�i kho�ng c� t�n L��ng Ng�n Kho�ng, ta s� gi�p ng��i v� l�i g��ng ��ng, nghe n�i kho�ng n�y c� � khu r�ng b�n Th�nh T�y, nh�ng v� n�i �� c� nhi�u d� th� n�n kh�ng ai d�m lui t�i.","���c r�i, ta �� hai m�nh g��ng � ��y, l�p t�c �i t�m L��ng Ng�n Kho�ng.")
		DelItem(18)
		DelItem(19)
		SetTask(1, 10*256+40)
		AddNote("��n Th�nh �� t�m ���c th� r�n, bi�t ���c c�n c� L��ng Ng�n Kho�ng �� v� g��ng ��ng")
		Msg2Player("��n Th�nh �� t�m ���c th� r�n, bi�t ���c c�n c� L��ng Ng�n Kho�ng �� v� g��ng ��ng")
	elseif (UTask_em == 10*256+40) then
		if (HaveItem(118) == 1) then
			Talk(1, "", "T�t! �� c� L��ng Ng�n Kho�ng, ta s� gi�p ng��i v� l�i g��ng ��ng.")
			DelItem(118)
			AddEventItem(20)
			SetTask(1, 10*256+60)
			AddNote("Giao L��ng Ng�n Kho�ng cho th� r�n, l�y ���c g��ng ��ng ho�n ch�nh")
			Msg2Player("Nh�n ���c ���c g��ng ��ng ho�n ch�nh")
		else
			tiejiang_city("<dec><npc>Nghe n�i khu r�ng � ph�a t�y th�nh c� L��ng Ng�n Kho�ng, kh�ng c� L��ng Kho�ng th�ch th� kh�ng th� s�a ch�a g��ng b�ng ��ng ���c.");
		end
	elseif ((UTask_em == 10*256+60) and (HaveItem(20) == 0)) then		-- �����У�ͭ������
		AddEventItem(20)
		Msg2Player("C� ���c g��ng ��ng �� v� xong.")
		Talk(1,"","G��ng ��ng ng��i �� ��y kh�ng l�y n�a �h?")
	else
		tiejiang_city(TIEJIANG_DIALOG);
	end
end;

function yes()
Sale(13)  			--�������׿�
end;


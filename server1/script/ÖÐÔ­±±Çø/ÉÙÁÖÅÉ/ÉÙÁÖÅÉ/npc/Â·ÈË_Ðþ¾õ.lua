-- ���� ·��NPC ���� 30������
-- by��Dan_Deng(2003-08-01)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 30*256+20) and (HaveItem(27) == 1) then		--30���������
			Talk(2,"L30_prise","S� th�c! M�y ng��i trong T�m Th�p l� tay ch�n c�a ng��i Kim, b�n h� �� �m th�m tr�m m�t quy�n 'B�t Nh� Ba La M�t �a T�m Kinh', nh�ng �� t� �� �o�t l�i ���c, xin m�i s� th�c xem qua.","A Di �� Ph�t! Th�t may ng��i s�m ph�t hi�n ra �m m�u c�a b�n h�, �o�t v� kinh th�, n�u kh�ng th� h�u qu� kh� l��ng, l�n n�y ng��i l�p c�ng l�n r�i, b�n t�a s� th�ng ng��i l�m �� t� 30 c�p!")
		elseif ((UTask_sl == 30*256) and (GetLevel() >= 30)) then		--30������
			Say("V�a l�c n�y c� v� t�ng nh�n l�i b�o c�o, n�i r�ng ph�t hi�n m�t s� ng��i l� m�t �ang c� h�nh vi b� �n trong Thi�t Th�p, ng��i ��ng � ��n �� xem th� kh�ng?",2,"��ng �!/L30_get_yes","Ta c�n c� vi�c kh�c. /L30_get_no")
		else							-- ����Ի�
			Talk(1,"","Kim Qu�c xem ch�ng ta nh� c�y kim trong m�t h�, m�y l�n ph�i ng��i ��n g�y s� v�i Thi�u L�m.")
		end
	else
		Talk(1,"","V� c�ng Thi�u L�m ch�ng ta x�a ��n nay ���ng ���ng ch�nh ch�nh, l�ng d� �� l��ng t� bi.")
	end
end;

function L30_get_yes()
	Talk(1,"","V�t v� cho ng��i qu�, ph�i c�n th�n ��!")
	SetTask(7,30*256+10)
	AddNote("�i Th�p L�m �i�u tra b�n ng��i kh� nghi. ")
	Msg2Player("�i Th�p L�m �i�u tra b�n ng��i kh� nghi. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","�a t� s� th�c!")
	DelItem(27)
	SetTask(7,40*256)
	SetRank(4)
--	AddMagic(16)
	add_sl(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("L�y l�i ���c B�t Nh� Ba La M�t �a T�m Kinh, th�ng ch�c H� Ph�p La H�n. ")
	Msg2Player("Ch�c m�ng b�n! B�n �� th�ng ch�c H� Ph�p La H�n c�a Thi�u L�m ph�i! H�c ���c v� c�ng La H�n Tr�n. ")
end;

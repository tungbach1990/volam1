--description: �䵱�ɵ�˼�ϡ��䵱50������
--author: yuanlan
--date: 2003/5/16
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-17)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wd = GetTask(5)
	if (GetFaction() == "wudang") and (GetSeries() == 4) then
		if (UTask_wd == 50*256) and (GetLevel() >= 50) then		-- 50����������
			Say("�� t� b�n ph�i l�y ngh�a hi�p h�nh t�u thi�n h�. Th�n l� �� t� V� �ang theo l� ph�i lu�n l�m �i�u thi�n. G�n ��y � <color=Red>Thi�n T�m ��ng<color> xu�t hi�n 1 ��m ��o ph� ��ng ��u l� <color=Red>Thi�t C�c<color>. Ch�ng chuy�n c��p c�a gi�t ng��i", 2, "Vi�c ngh�a n�n l�m /L50_get_yes", "E r�ng kh� c� th� nh�n nhi�m v� /L50_get_no")
		elseif (UTask_wd == 50*256+80) then 			-- 50���������
			Talk(2, "L50_prise", "�� t� �� �em to�n b� s� ti�n l�y ���c c�a b�n th� ph� ��a cho d�n ngh�o.", "L�m R�t t�t! X�ng ��ng l� �� t� b�n ph�i! ")
		elseif (UTask_wd > 50*256) and (UTask_wd < 50*256+50) then					--50�������һ�ڣ���δ���
			Talk(1,"","N�i �n n�u c�a b�n th� ph� �� � <color=Red>Thi�n T�m ��ng<color>, t�n c�m ��u l�<color=Red>Thi�t C�c<color>. Nh� �em to�n b� <color=Red>ng�n l��ng<color> t�ng cho d�n ngh�o � <color=Red>T��ng D��ng<color>. ")
		elseif (UTask_wd >= 50*256+50) and (UTask_wd < 60*256) then					--50������ڶ��ڣ���δ���
			AddNote("Tr� l�i Long H� �i�n g�p ��n T� Nam, bi�t ���c ph�i �em to�n b� ng�n l��ng giao cho ��ng t�u ngh�o nh�t � Th�nh b�c. ")
			Msg2Player("�em to�n b� ng�n l��ng t�ng cho ��ng t�u ngh�o nh�t � th�nh B�c. ")
			Talk(1,"","Nghe n�i trong <color=Red>T��ng D��ng<color> ng��i ngh�o nh�t l� <color=Red>ch� d�u ��ng gia<color>, ng��i �em <color=Red>to�n b� ng�n l��ng<color> l�y ���c c�a b�n th� ph� t�ng cho ch� ta.")
		else					--�Ѿ����50��������δ��ʦ
			Talk(1,"","Ta b�nh sinh th�ch nh�t giao k�t v�i nh�ng ng��i c� t�nh c� ngh�a,��i gia ra giang h�,h�nh hi�p tr��ng ngh�a.")
		end
	elseif (UTask_wd >= 70) then									--�Ѿ���ʦ
		Talk(1,"","Vi�c c�a ��i ng��i, c�ng ��ng qu� th��ng c�m, thi�n h� r�ng l�n �� ch� �� ta dung th�n. Hy v�ng ng��i b�o tr�ng! ")
	else
		Talk(1,"","Thi�n h� lo�n l�c, s�i h� h�p qu�n, g�y h�a th� nh�n, g�y ra ��i ho�! Ta l� ng��i h�c v�, th�y c�nh nh� v�y l�m sao c� th� ��ng nh�n, l�m sao x�ng ��ng v�i hai ch� ' hi�p ngh�a'!")
	end
end;

function L50_get_yes()
	Talk(1,"","R�t t�t! Nh�ng ��ng qu�n �em <color=Red>ng�n l��ng<color> l�y ���c cho l�o b� t�nh ngh�o kh� trong <color=Red>T��ng D��ng<color>.")
	SetTask(5, 50*256+20)
	AddNote("T�i �i�n Long H� V� �ang ph�i g�p ��n T� Nam, nh�n nhi�m v� h�nh thi�n, �i ��ng Thi�n T�m Ph�c Ng�u s�n v� d�n tr� h�i. ")
	Msg2Player("T�i �i�n Long H� V� �ang ph�i g�p ��n T� Nam, nh�n nhi�m v� h�nh thi�n, �i ��ng Thi�n T�m Ph�c Ng�u s�n v� d�n tr� h�i. ")
end;

function L50_get_no()
	Talk(1,"","Tr� b�o cho d�n l� tr�ch nhi�m c�a ng��i h�c v�, t�i sao ng��i kh��c t�?")
end;

function L50_prise()
	SetRank(12)
	SetTask(5, 60*256)
--	AddMagic(157)
	add_wd(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n! B�n �� tr� th�nh Ch��ng Kinh ��o Nh�n! H�c ���c v� c�ng To� V�ng V� Ng� c�a V� �ang ph�i. ")
	AddNote("V� t�i �i�n Long H� V� �ang ph�i, ph�c m�nh ��n T� Nam, ho�n th�nh nhi�m v� Nh�t h�nh nh�t thi�n. Tr� th�nh Ch��ng Kinh ��o Nh�n. ")
end;

--description: ������ǰ�� ����������10������
--author: yuanlan	
--date: 2003/4/24
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3);
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 10*256) and (GetLevel() >= 10) then
			Say("Ng��i m�i gia nh�p b�n bang? Mu�n tr� th�nh Th� V� tr��ng, c�n ph�i ��n <color=Red>Thi�n V��ng ��o S�n ��ng<color> l�y v� <color=Red>3 vi�n K� Huy�t Th�ch<color>. Ng��i c� gan l�m kh�ng?", 2, "���ng nhi�n d�m. /L10_get_yes", "T�i h� mu�n t�p luy�n th�m m�t th�i gian n�a /L10_get_no")
		elseif (UTask_tw == 10*256+20) and (GetItemCount(91) >= 3 ) then				--��Ѫʯ��Ŀ����Ϊ3
			L10_prise()
		elseif (UTask_tw > 10*256) and (UTask_tw < 10*256+50) then					--�Ѿ��ӵ�10��������δ���
			Talk(1,"","��n <color=Red>Thi�n V��ng ��o S�n ��ng<color> l�y v� <color=Red>3 vi�n K� Huy�t Th�ch<color> r�i h�ng t�nh!")
		else					--�Ѿ����10��������δ��ʦ��ȱʡ�Ի���
			Talk(1,"","Huynh �� b�n m�n ��u l� nh�ng huynh �� c� ho�i b�o l�n, l�o phu gh�t nh�t l� nh�ng lo�i tr�m g� s� ch� ")
		end
	elseif (UTask_tw >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Nam t� h�n ��i tr��ng phu, �� ra h�nh t�u giang h� c�n ph�i ��nh thi�n l�p ��a, n�u nh� ng��i l�m chuy�n g� tr�i v�i ��o ngh�a giang h� l�o phu nh�t ��nh s� kh�ng tha cho ng��i ��u")
	else
		Talk(1,"","L�o phu xem bang ch� gi�ng nh� con g�i ru�t c�a m�nh, b�t lu�n x�y ra chuy�n g� l�o phu c�ng ��u d�c h�t l�c �� b�o v� c� ta")
	end
end;

function L10_get_yes()
	Talk(1,"","R�t t�t! V�y m�i l� nam t� h�n! ��n <color=Red>Thi�n V��ng ��o S�n ��ng<color> l�y v� <color=Red>3 vi�n K� Huy�t Th�ch<color> r�i h�ng t�nh!")
	SetTask(3, 10*256+20)
	AddNote("T�i ti�n �i�n Thi�n V��ng bang (201, 198) g�p V��ng H�u, ti�p nh�n <color=red>nhi�m v� K� Huy�t Th�ch<color>, �i ��n ��o s�n ��ng t�m 3 vi�n K� Huy�t Th�ch ")
	Msg2Player("T�i ti�n �i�n Thi�n V��ng bang g�p V��ng H�u, ti�p nh�n nhi�m v� K� Huy�t Th�ch �i ��n ��o s�n ��ng t�m 3 vi�n K� Huy�t Th�ch. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","L�m r�t t�t! L�o phu s� phong cho ng��i l�m Th� V� tr��ng! Sau n�y c� r�t nhi�u th� th�ch �ang ch�, ng��i c�n ph�i ti�p t�c c� g�ng")
	for i = 1, (GetItemCount(91)) do DelItem(91) end
	SetTask(3, 20*256)
	SetRank(44)
	add_tw(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
--	AddMagic(26)
--	AddMagic(23)
--	AddMagic(24)
	Msg2Player("Ch�c m�ng B�n! �� ���c phong l�m tr��ng th�. H�c ���c: Thi�n V��ng Ch�y Ph�p, Thi�n V��ng Th��ng Ph�p, Thi�n V��ng �ao Ph�p. ")
	AddNote("Quay l�i ti�n �i�n, mang 3 vi�n K� Huy�t Th�ch giao cho V��ng H�u, ho�n th�nh nhi�m v� K� Huy�t Th�ch, ���c phong l�m Tr��ng th� v�. ")
end;

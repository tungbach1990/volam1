-- ���� ���� ����� 50������
-- by��Dan_Deng(2003-07-31)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl >= 50*256+64) and (UTask_kl < 60*256) and (HaveItem(10) == 1)) then		--50���������
			L50_prise()
		elseif ((UTask_kl == 50*256) and (GetLevel() >= 50)) then		--50������
			Say("Ph�a sau n�i C�n L�n c� m�t huy�t ��ng, b�n trong c� giam m�t qu�i nh�n. T�n qu�i nh�n n�y lu�n mi�ng n�i r�ng h�n s� san b�ng C�n L�n ph�i n�y, k�t qu� l� b� Ch��ng M�n ��nh b�i, nh�t v�o trong ��ng. B�n ph�i c� m�t quy lu�t �� t� n�o ���c th�ng c�p 50 �t s� ��nh b�i ���c h�n, nh�ng ph�i l�y ���c t�c c�a h�n �� ch�ng minh ",2,"Xin cho �� t� �i th� xem /L50_get_yes","�� t� v� ngh� ch�a cao, e r�ng kh�ng th�ng n�i /L50_get_no")
		else
			Talk(1,"","Ng��i h�y ph�t huy nh�ng s� tr��ng c�a m�nh, t�y c� �ng bi�n!")
		end
	else
		Talk(1,"","Ta ��y xem tr�ng nh�t l� t�nh b�n, ng��i nh�n t� th� v� ��ch m�. Ha! Ha! Ha!")
	end
end;

function L50_get_yes()
	Talk(1,"","C� ch� kh�, th� th� ta s� cho ng��i c� h�i n�y!")
	SetTask(9,50*256+64)
	AddNote("Nh�n ���c nhi�m v� c�p 50 c�a C�n L�n ph�i: ��nh b�i B�ng Huy�n Qu�i Nh�n, ��ng th�i b�t l�y 1 t�m t�c l�m b�ng ch�ng. ")
	Msg2Player("Nh�n ���c nhi�m v� c�p 50 c�a C�n L�n ph�i: ��nh b�i B�ng Huy�n Qu�i Nh�n, ��ng th�i b�t l�y 1 t�m t�c l�m b�ng ch�ng. ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(2,"","H� ph�p! �� t� may m�n kh�ng b� m�ng!","���c l�m! Ng��i ���c th�ng ti�n tr� th�nh Th� Ph� Thi�n t��ng. H�y nh� k�! Ch� c�n trung th�nh v�i ta, c� b�t c� �ch l�i g� ta ��u kh�ng qu�n ng��i!")
	DelItem(10)
	SetTask(9,60*256)
	SetRank(24)
--	AddMagic(176)
--	AddMagic(90)
	add_kl(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n! �� tr� th�nh Th� Ph� Thi�n t��ng! H�c ���c Cu�ng Phong S�u �i�n, M� Tung �o �nh ")
	AddNote("L�y ���c t�c c�a B�ng Huy�t qu�i nh�n, ho�n th�nh nhi�m v� c�p 50 c�a C�n L�n ph�i. ���c phong Th� Ph� Thi�n T��ng. ")
end;

--description: ��������ʹ�Űء�����30������
--author: yuanlan	
--date: 2003/4/25
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if ((UTask_tw == 30*256) and (GetLevel() >= 30) and (GetFaction() == "tianwang")) then
			Say("Th�t xui x�o! H�m qua ta �i ngang qua <color=Red>Y�n T� ��ng<color>, �� l�m r�i m�t <color=Red>Thi�n V��ng l�nh<color>. �� l� t�n v�t c�a b�n bang. N�u kh�ng t�m l�i ���c�.H�y!..", 2, "Gi�p t�m Thi�n V��ng l�nh /L30_get_yes", "Ta kh�ng quan t�m!/L30_get_no")
		elseif (UTask_tw == 30*256+20) and (HaveItem(145) == 1 ) then
			L30_prise()
		elseif (UTask_tw > 30*256) and (UTask_tw < 40*256) then					--�Ѿ��ӵ�30��������δ���
			Talk(1,"","<color=Red>Thi�n V��ng l�nh<color> m�t � <color=Red>Y�n T� ��ng<color>. N�u ng��i t�m l�i ���c, ta s� phong ng��i l� Ch��ng �� ��u L�nh.")
		elseif (UTask_tw >= 40*256) then					--�Ѿ����30��������δ��ʦ
			Talk(1,"","H�o huynh ��! Ng��i �� gi�p ta m�t vi�c l�n r�i!")
		else
			Talk(1,"","Ch�ng ta b�c kh�ng Kim binh, Nam ph�ng Tri�u T�ng, hai b�n ��u t�c chi�n th�t kh�ng d� d�ng g� ")
		end
	elseif (UTask_tw >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Xu�t s� r�i ��ng qu�n th��ng xuy�n tr� v� th�m c�c huynh �� nh�!")
	else
		Talk(1,"","��ng coi th��ng bang ch� l� m�t n� nhi.C� ta x� l� c�c vi�c trong bang t�t c� ��u ��u ra ��, th��ng ph�t ph�n minh, trong l�ng m�i ng��i ��u r�t k�nh tr�ng c� ta.")
	end
end;

function L30_get_yes()
	Talk(1,"","<color=Red>Thi�n V��ng l�nh<color> m�t � <color=Red>Y�n T� ��ng<color>. N�u ng��i t�m l�i ���c, ta s� phong ng��i l� Ch��ng �� ��u L�nh.")
	SetTask(3, 30*256+20)
	AddNote("T�i c�a T�y Thi�n �i�n, ti�p nh�n nhi�m v� <color=red>Thi�n V��ng l�nh<color>, �i ��n Y�n T� ��ng t�m Thi�n V��ng l�nh ")
	Msg2Player("T�i c�a T�y Thi�n �i�n ti�p nh�n nhi�m v� Thi�n V��ng l�nh, �i ��n Y�n T� ��ng t�m Thi�n V��ng l�nh ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","Th� ra Thi�n V��ng L�nh �� b� b�n c��p � Y�n T� ��ng tr�m m�t, may l� t�m l�i ���c, n�u kh�ng s� b� bang ch� qu� tr�ch. Ng��i th�t �� gi�p ta m�t vi�c l�n. B�n s� n�i l�i s� gi� l�y l�i, nh�t ��nh s� phong ng��i l�m Ch��ng �� ��u L�nh.")
	DelItem(145)
	SetRank(46)
	SetTask(3, 40*256)
--	AddMagic(37)
--	AddMagic(35)
--	AddMagic(31)
	add_tw(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Mang Thi�n V��ng l�nh giao cho C� B�ch, ho�n th�nh nhi�m v� Thi�n V��ng l�nh. ���c phong l�: Ch��ng �� ��u L�nh. H�c ���c B�t Phong Tr�m, D��ng Quan Tam �i�p, H�ng V�n Quy�t. ")
	AddNote("Tr� l�i ��o Thi�n V��ng mang Thi�n V��ng l�nh giao cho C� B�ch, ho�n th�nh nhi�m v�, ���c phong l�: Ch��ng �� ��u L�nh ")
end;

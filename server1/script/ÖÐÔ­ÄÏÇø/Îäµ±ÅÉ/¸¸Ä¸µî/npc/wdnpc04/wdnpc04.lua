--description: �䵱��Ҧʯ�š��䵱20�������ط���������
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ��أ�ȡ����˽ű���ز��ݣ�


-- �޸ĺ���а��������ص��䵱��Ҧʯ����ű�
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\global\\skills_table.lua");

function main()

-- ������ϵͳ��а��������صĽű� --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()


	if (myTaskValue==170) then -- �����䵱�ɺ���Ҧʯ�ŵĶԻ�
		task_level40_01();
		return
	elseif (myTaskValue==209) then -- ��ҵȼ����� 40 �����ٴλ���ʱ
		task_level40_02();
		return
	elseif (myTaskValue==210) then 
		Say("Hy v�ng ng��i c� th� gi�p gi�p v� l�m d�p tr� ��i n�n n�y.",0);
		return
	elseif (myTaskValue==220) then
		task_level40_06();
		return 
	end
		
	
-- ������ϵͳ��а��������صĽű� --



	UTask_wd = GetTask(5);
	if (GetFaction() == "wudang") and (GetSeries() == 4) then
--		Ϊ��ʱ������򲹶�������ֵΪ35��ѧ�����䵱����(151)��δѧ�����ķ�(156)�ģ�Ҳ���Խ�20��������ȡ����
--		if ((UTask_wd == 20*256) or (((UTask_wd == 35) or (UTask_wd >= 30*256)) and (HaveMagic(151) >= 0) and (HaveMagic(156) == -1))) and (GetLevel() >= 20) then
		if (UTask_wd == 20*256) and (GetLevel() >= 20) then
			Say("Ta ���c s� ph� nu�i d��ng th�nh ng��i, d�y ta v� c�ng, ��i v�i ta �n tr�ng nh� n�i. M�y ng�y n�a l� t�i l� th� 80 tu�i c�a s� ph�,ta �� l�y t�an b� ti�n d�nh d�m �� mua <color=Red>Thi�n T�m ��o B�o<color> � T��ng D��ng, ��nh bi�u s� ph� l�m l� ", 2, "Gi�p �� t�m ki�m/L20_get_yes", "Ta b�n r�i/L20_get_no")
		elseif (UTask_wd == 20*256+20) then
			if (HaveItem(66) == 1) then
				SetTask(5, 20*256+40)
				AddNote("Tr� v� Ph� M�u �i�n, bi�t ���c c� th� ��n T��ng D��ng g�p �ng ch� t�p h�a t�m c�ch v� ��o b�o.")
				Msg2Player("�i T��ng D��ng g�p �ng ch� t�p h�a t�m c�ch v� ��o b�o.")
				Talk(2, "", "Th�t xui qu�! ��o b�o �� b� S�i �� c�n r�ch, ph�i l�m sao ��y?", "��o b�o n�y mua � ti�m t�p h�a T��ng D��ng, ta �i <color=Red>T��ng D��ng<color> t�m <color=Red>ch� ti�m t�p h�a <color> ngh� c�ch.")
			else
				Talk(1,"","Ta nh� <color=Red>Thi�n T�m ��o B�o<color> b� ��nh r�i � <color=Red>H�a Lang ��ng<color>.")
			end
		elseif (UTask_wd == 20*256+80) and (HaveItem(68) == 1) then
			L20_prise()
		elseif (UTask_wd == 20*256+40) and (HaveItem(66) == 0) then		-- ��������Ʒ��ʧ���ݴ���
			AddEventItem(66)
			Msg2Player("T�m ���c 'Thi�n T�m ��o b�o b� r�ch'.")
			Talk(1,"","Ng��i n�i ��n t�m ch� ti�m t�p h�a s�a ��o b�o, sao l�i kh�ng mang theo ��o b�o?")
		elseif (UTask_wd >= 20*256+40) and (UTask_wd < 30*256) then					--�Ѿ��ӵ�20��������δ���
			Talk(2,"","Kh�ng c� Thi�n T�m ��o B�o, ta l�y g� �� l�m sao ch�c th� S� ph�?","Ta ��n T��ng D��ng t�m ti�m t�p h�a ngh� c�ch.")
		else
			Talk(1,"","Ta th�y v� c�ng s� ph� ng�y c�ng th�m h�u kh�ng th� l��ng ���c,c� ��i ta h�c c�ng kh�ng n�i.")
		end
	elseif (UTask_wd >= 70) then								--�Ѿ���ʦ
		Talk(1,"","S� ph� th��ng n�i 'H�i n�p b�ch xuy�n, h�u dung t�c ��i, b�ch l�p thi�n nh�n, v� d�c t�c c��ng', ta mu�n t�ng c�u n�y cho ng��i!")
	else
		Talk(1,"","S� ph� ��i v�i ta �n tr�ng nh� n�i, y�u th��ng ta nh� cha m� ta!")
	end
end;

function L20_get_yes()
	Talk(1,"","Hay l�m! Xin �a t�! Ta nh� <color=Red>Thi�n T�m ��o B�o<color> b� r�i <color=Red>H�a Lang ��ng<color>.")
	SetTask(5, 20*256+20)
	AddNote("G�p ��o Th�ch M�n, nh�n nhi�m v� ��o b�o, ��n H�a Lang ��ng t�m Thi�n T�m ��o b�o.")
	Msg2Player("G�p ��o Th�ch M�n, nh�n nhi�m v� ��o b�o, ��n H�a Lang ��ng t�m Thi�n T�m ��o b�o.")
end;

function L20_get_no()
	Talk(1,"","Ta ��nh t� �i t�m th�i!.")
end;

function L20_prise()
	Talk(1,"","Qu� nhi�n s�a ���c r�i! Hay qu�! Th�t c�m �n!")
	DelItem(68)
	SetRank(9)
	SetTask(5, 30*256)
--	AddMagic(159)
	add_wd(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! B�n �� ���c th�ng l�m Thanh Tu ��o Nh�n! H�c ���c Th�t Tinh Tr�n!")
	AddNote("Tr� v� Ph� M�u �i�n, �em Thi�n T�m ��o b�o giao cho ��o Th�ch M�n, ho�n th�nh nhi�m v� ��o b�o. ���c phong l� Thanh Tu ��o Nh�n.")
end;

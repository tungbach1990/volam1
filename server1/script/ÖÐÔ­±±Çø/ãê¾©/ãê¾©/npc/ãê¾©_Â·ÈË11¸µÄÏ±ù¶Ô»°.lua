-------------------------------------------------------------------------
-- FileName		:	�꾩_·��11���ϱ��Ի�.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-28 15:22:45
-- Desc			:	��ԭ���� �꾩�� ·��11���ϱ��Ի�
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")

function main(sel)
	Uworld75 = nt_getTask(75)
	U75_sub4 = nt_getTask(55)
	Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 ~= 0 ) then
		funanbing()
	elseif (Uworld75 == 10) and (U75_sub4 < 10) then		-- �����У���ȡ������
		if (HaveItem(384) == 1) then
			nt_setTask(55,10)
			AddNote("Nhi�m v� Quy�n khuynh thi�n h�: ��n D��ng Ch�u mua Kim L�ng Xu�n cho Ph� Nam B�ng.")
			Msg2Player("Nhi�m v� Quy�n khuynh thi�n h�: ��n D��ng Ch�u mua Kim L�ng Xu�n cho Ph� Nam B�ng.")
			Talk(1,""," Th�i bu�i n�y c�n h�c v� c�ng �� l�m g�? �y! Mu�n h�c c�ng ���c!�i D��ng ch�u mua gi�p ta Kim L�ng Xu�n nh�.")
		else
		 	Talk(1,""," Ngay c� m�t phong th� c�ng kh�ng c�, ch� n�i mi�ng kh�ng th� l�m sao ta c� th� tin ng��i ���c?")
		end
	elseif (Uworld75 == 10) and (U75_sub4 == 10) then		-- ����������ж�
		if (HaveItem(77) == 1) then
			DelItem(77)
			nt_setTask(55,20)
			AddNote("Nhi�m v� Quy�n khuynh thi�n h�: ho�n th�nh vi�c mua r��u")
			Msg2Player("Nhi�m v� Quy�n khuynh thi�n h�: ho�n th�nh vi�c mua r��u")
			Talk(1,"","H�! R��u 'Kim L�ng Xu�n' n�y ngon tuy�t! ���c! Ta ��ng �! ")
		else
			Talk(1,"","Kim L�ng Xu�n v�n c�n ch�a mua v� sao?")
		end
	else
		Talk(1,"","H�m nay c� r��u ta u�ng cho say, ch�ng c�n bi�t ai l�m thi�n t� ai l�m qu�n th�n ")
	end
end;

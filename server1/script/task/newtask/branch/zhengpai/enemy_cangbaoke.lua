-------------------------------------------------------------------------
-- FileName		:	enemy_cangbaoke.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_�ر���
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 == 40 ) then
		AddEventItem(504)
		Msg2Player("B�n nh�n ���c m�t quy�n K� ph� Thi�n T�n ��a Khuy�t.")
	end
	if ( GetItemCount(504) >= 5 ) then
		Talk(1,"","B�n l�y ���c 5 quy�n Thi�n T�n ��a Khuy�t k� ph�, h�y tha cho T�ng B�o Kh�ch.")
	end
end


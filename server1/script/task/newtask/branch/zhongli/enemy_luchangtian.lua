-------------------------------------------------------------------------
-- FileName		:	enemy_luchangtian.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_·����
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
function OnDeath()
Uworld1054 = nt_getTask(1054)
	if (Uworld1054 == 80 ) then
		SetMemberTask(1054,80,90,Uworld1054_give) 
	end
end

function Uworld1054_give()
	AddOwnExp(15000)
	AddExp_Skill_Extend(15000)
	Msg2Player("L� Tr��ng Thi�n �� b� b�n khu�t ph�c, nhi�m v� ho�n th�nh, b�n c� th� v� t�m B�o k� s�ng b�c.")
	Talk(1,"","Kh�ng ng� ta su�t ��i ngang d�c cu�i c�ng l�i b� b�i d��i tay m�t ti�u t�! Nh�c nh� thay!")
end

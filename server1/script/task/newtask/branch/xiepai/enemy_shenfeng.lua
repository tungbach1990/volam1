-------------------------------------------------------------------------
-- FileName		:	enemy_shenfeng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-01-07 15:04:14
-- Desc			:	ս��_���
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 == 80 ) then
		SetMemberTask(1058,80,90,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(30000)
	AddExp_Skill_Extend(30000)
	Msg2Player("B�n �� h� g�c t�n V� s� gi� d�ng Th�m Phong. Nhi�m v� ho�n th�nh. C� th� tr� v� t�m Th�c B�t Ho�i Xuy�n!")
	Talk(1,"","�� c�u t�p ch�ng Kim Qu�c!")
end


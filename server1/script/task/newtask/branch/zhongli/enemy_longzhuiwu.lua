-------------------------------------------------------------------------
-- FileName		:	enemy_longzhuiwu.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-1-5 15:04:14
-- Desc			:	ս��_��׷��
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1057 = nt_getTask(1057)
	if ( Uworld1057 == 80 ) then
		SetMemberTask(1057,80,90,zhengbranch4) 
	end
end

function zhengbranch4()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("B�n �� gi�t ���c Long Truy V� tr� th� cho Li�u Nam V�n. C� th� quay v� g�p �ng ta.")
	Talk(1,"","Ng��i.......")
end

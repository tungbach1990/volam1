-------------------------------------------------------------------------
-- FileName		:	enemy_shiyisheng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_ʩ����
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1059 = nt_getTask(1059)
	if ( Uworld1059 == 100 ) then
		SetMemberTask(1059,100,110,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(60000)
	AddExp_Skill_Extend(60000)
	Msg2Player("B�n b�t ���c Thi Nghi Sinh, h�y quay v� ph�c m�nh Th�c B�t Ho�i Xuy�n.")
	Talk(1,"","Ng��i mu�n l�m g�? Ng��i mu�n ��a ta �i ��u?")
end


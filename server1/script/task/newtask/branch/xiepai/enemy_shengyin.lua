-------------------------------------------------------------------------
-- FileName		:	enemy_shengyin.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_ʢ��
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1061 = nt_getTask(1061)
	if ( Uworld1061 == 100 ) then
		SetMemberTask(1061,100,110,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("B�n �� h� g�c Th�nh Do�n, h�y quay v� ph�c m�nh Th�c B�t Ho�i Xuy�n.")
	Talk(1,"","Kim C�u! Gi�t ta, th�nh T��ng D��ng c�ng kh�ng b� c�c ng��i ph� ���c! Ch� c�n to�n d�n m�t l�ng, kh�ng c� vi�c g� kh�ng th�!")
end


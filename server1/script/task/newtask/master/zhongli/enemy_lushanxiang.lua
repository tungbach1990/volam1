-------------------------------------------------------------------------
-- FileName		:	enemy_lushanxiang.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:06:22
-- Desc			:	ս��_��������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 80 ) then
		SetMemberTask(1002,80,90,zhongtask2) 
	end
end

function zhongtask2()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("B�n h�y quay v� t�m Ph� Nam B�ng.")
	Talk(1,"","Ta c� t��ng m�nh l� Thi�n h� �� nh�t kho�i th�, kh�ng ng� ng��i c�n nhanh h�n ta.")
end

		

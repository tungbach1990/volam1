-------------------------------------------------------------------------
-- FileName		:	enemy_xuzili.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:08:09
-- Desc			:	ս��_������
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 150 ) then
		SetMemberTask(1002,150,160,zhongtask3) 
	end
end

function zhongtask3()
	AddOwnExp(100000)
	AddExp_Skill_Extend(100000)
	Msg2Player("B�n nh�n ���c B�ch Long T�c, quay v� t�m L� Thu Th�y.")
	Talk(1,"","M�t m�n b�o b�i h�i ng��i, th�t kh�ng ��ng ch�t n�o......")
end


		

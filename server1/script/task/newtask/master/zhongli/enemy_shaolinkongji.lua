-------------------------------------------------------------------------
-- FileName		:	enemy_shaolinkongji.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:07:27
-- Desc			:	ս��_���ֿռ�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 280 ) then
		SetMemberTask(1002,280,290,zhongtask5) 
	end
end

function zhongtask5()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("B�n nh�n ���c hai b� Long Kh�, h�y quay v� t�m Ph� Nam B�ng.")
	Talk(1,"","A Di �� Ph�t, Th�n Kh� � ��y, Th� ch� l�y �i.")
end


		

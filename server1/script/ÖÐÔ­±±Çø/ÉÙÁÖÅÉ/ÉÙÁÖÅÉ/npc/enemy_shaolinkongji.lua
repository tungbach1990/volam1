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
		Talk(1,"Uworld1002_give","A Di �� Ph�t, Th�n Kh� � ��y, Th� ch� l�y �i.")
	end
end

function zhongtask5()
	AddOwnExp(600000)
	Msg2Player("B�n nh�n ���c hai b� Long Kh�, h�y quay v� t�m Ph� Nam B�ng.")

end

function Uworld1002_give()

	SetMemberTask(1002,280,290,zhongtask5) 
	
end
		

-------------------------------------------------------------------------
-- FileName		:	ս��_Թ��.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-15 14:34:32
-- Desc			:	Թ��
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1001 = nt_getTask(1001)
	if (Uworld1001 == 240 ) then
		SetMemberTask(1001,240,250,newtask4)
	end
end

function newtask4()
	AddOwnExp(230000)
	AddExp_Skill_Extend(230000)
	Msg2Player("B�n l�y ���c th� c�p O�n ��c.")
	Msg2Player("B�n c� th� v� L�m An g�p M�nh Ph�m.")
	Talk(1,"","��i ng��i ai c�ng m�t l�n ch�t! Nh�ng ch�t nh� th� n�y th�t kh�ng cam t�m!")
end

	

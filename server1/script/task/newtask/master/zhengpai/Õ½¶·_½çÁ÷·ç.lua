-------------------------------------------------------------------------
-- FileName		:	ս��_������.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-15 14:29:59
-- Desc			:	������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1001 = nt_getTask(1001)
	if (Uworld1001 == 100 ) then
		SetMemberTask(1001, 100, 110, newtask2)
	end
end

function newtask2()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("B�n l�y ���c Ho�ng Kim L�n.")
	Msg2Player("B�n c� th� v� ��i L� g�p M�c S�u.")
	Talk(1, "", "Ho�ng Kim L�n � ��y! Ng��i c�m �i! Th� n�y h�i c� ��i C�ng t� ta! ��y l� ma v�t, ng��i h�y c�n th�n!")
end

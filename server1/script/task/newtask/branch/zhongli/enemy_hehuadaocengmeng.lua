-------------------------------------------------------------------------
-- FileName		:	enemy_hehuadaocengmeng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-1-5 15:04:14
-- Desc			:	ս��_�ɻ�������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1055 = nt_getTask(1055)
Uworld1012 = nt_getTask(1012)
	if ( Uworld1012 >= 20 ) and ( Uworld1055 == 100 ) then
		nt_setTask(1012,0)
		SetMemberTask(1055,100,110,zhengbranch4) 
	elseif ( Uworld1055 == 100 ) then
		Uworld1012 = Uworld1012 + 10
		nt_setTask(1012,Uworld1012)
		Talk(1,"","��ng t��ng ng��i c� th� ��c �, c�n t� mu�i ta ��y!")
	end
end

function zhengbranch4()
	AddOwnExp(60000)
	AddExp_Skill_Extend(60000)
	Msg2Player("B�n �� ��nh b�i H� Hoa ��o, c� th� quay v� g�p Ch� nh�n L�nh Th��ng Ti�u c�c ph�c m�nh.")
	Talk(1,""," Ch�t r�i th� t�t ban ��m s� kh�ng g�p �c m�ng.")
end

-------------------------------------------------------------------------
-- FileName		:	enemy_panrulong.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	ս��_������
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1050 = nt_getTask(1050)
	if (Uworld1050 == 120 ) then
		SetMemberTask(1050,120,130,zhengbranch1) 
	end
end

function zhengbranch1()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("Phan Nh� Long l�c s�p ch�t n�i, h�n ta kh�ng ph�i l� ng��i h�nh th�ch Nh�c Phi! Ho�n th�nh nhi�m v�.B�n c� th� v� g�p Ng�o V�n T�ng.")
	Talk(1,"","Phan Nh� Long: N�m x�a gi�t Nh�c Phi l� k� kh�c, ta ch�ng qua l� m�t t�n l�u la m� th�i.")
end



-------------------------------------------------------------------------
-- FileName		:	enemy_qijifeng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-1-5 15:04:14
-- Desc			:	ս��_�뼴��
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1053 = nt_getTask(1053)
	if ( Uworld1053 == 60 ) then
		SetMemberTask(1053,60,70,zhengbranch4) 
	end
end

function zhengbranch4()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("B�n �� ��nh b�i T� T�c Phong, tr��c khi l�m chung n�i m�t c�u r�t kh� hi�u. B�n c�m th�y n�n quay v� h�i Ng�o V�n T�ng.")
	Talk(1,"","Ha ha! Ng��i t��ng l� Nh�c Phi do ta gi�t sao? Ta cho ng��i bi�t ��ng h�ng t�m ra th� ph�m......")
end

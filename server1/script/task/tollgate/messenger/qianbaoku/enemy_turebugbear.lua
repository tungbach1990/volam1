-------------------------------------------------------------------------
-- FileName		:	enemy_turebugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-19 21:07:14
-- Desc			:   ǧ����ؿ���С�ֽű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�



function turesure_killbugbear()
	--local Uworld1205 = nt_getTask(1205)  --��ʹ����
	local Uworld1213 = nt_getTask(1213)  --˫������ʱ��
	if ( Uworld1213 ~= 0 ) then       --�ж��Ƿ�˫������ʱ��
		if  ( GetGameTime() - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("Th�i gian t�ng g�p ��i �i�m kinh nghi�m c�a b�n �� k�t th�c!")
		else
			AddOwnExp(TUREBUGBEAR_EXP)    --����һ���ľ���
		end
	end
	--messenger_killnpc_jifen(TUREBUGBEAR_MESSENGEREXP,TUREBUGBEAR_MAPID)
	messenger_killbugbear_inteam(TUREBUGBEAR_EXP,TUREBUGBEAR_MAPID)   --���Ӷ�������Ҿ���
end


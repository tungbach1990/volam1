-------------------------------------------------------------------------
-- FileName		:	enemy_flybugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   ��֮��ؿ���С�ֽű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");


function messenger_killbugbear()
	--local Uworld1205 = nt_getTask(3000)  --��ʹ����
	local Uworld1213 = nt_getTask(1213)  --˫������ʱ��
	if ( Uworld1213 ~= 0 ) then       --�ж��Ƿ�˫������ʱ��
		if  ( GetGameTime() - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("Th�i gian t�ng g�p ��i �i�m kinh nghi�m c�a b�n �� k�t th�c!")
		else
			AddOwnExp(FLYBUGBEAR_EXP)    --����һ���ľ���
		end
	end
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 1);
	messenger_killnpc_jifen(FLYBUGBEAR_MESSENGEREXP,FLYBUGBEAR_MAPID)
	messenger_killbugbear_inteam(FLYBUGBEAR_EXP,FLYBUGBEAR_MAPID)   --���Ӷ�������Ҿ���
end


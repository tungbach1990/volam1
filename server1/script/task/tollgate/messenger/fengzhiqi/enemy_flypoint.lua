-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   ��֮��ؿ��Ķ���С�ֽű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�

function messenger_killpoint()
	--local Uworld1205 = nt_getTask(3000)  --��ʹ����
	local Uworld1213 = nt_getTask(1213)  --˫������ʱ��
	local Uworld1214 = nt_getTask(1214)  --�����ֿ���
	
		if ( Uworld1213 ~= 0 ) then       --�ж��Ƿ�˫������ʱ��
			if  ( GetGameTime() - Uworld1213 >= 1200 ) then
				nt_setTask(1213,0)
				Msg2Player("Th�i gian t�ng g�p ��i �i�m kinh nghi�m c�a b�n �� k�t th�c!")
			else
				AddOwnExp(FLYPOINT_EXP)    --����һ���ľ��飬ֻ�д����ù����������������ſ���
			end
		end
		
		messenger_killnpc_jifen(FLYPOINT_MESSENGEREXP,FLYPOINT_MAPID)
		messenger_killbugbear_inteam(FLYPOINT_EXP,FLYPOINT_MAPID)   --���Ӷ�������Ҿ���
		nt_setTask(1214,0)
	
		Msg2Player("Ch�c m�ng b�n ho�n th�nh nhi�m v�!"..killfly[Uworld1214][3].."!")
end
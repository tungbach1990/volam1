-------------------------------------------------------------------------
-- FileName		:	enemy_tembugbear.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 14:43:14
-- Desc			:   ɽ����ؿ���С�ֽű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");


function temple_killbugbear()
	local _, _, nMapIndex = GetPos()
	--local Uworld1205 = nt_getTask(3000)  --��ʹ����
	local Uworld1213 = nt_getTask(1213)  --˫������ʱ��
	local Uworld1214 = nt_getTask(1214)  --������ͽ�������
	if ( Uworld1213 ~= 0 ) then       --�ж��Ƿ�˫������ʱ��
		if  ( GetGameTime() - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("Th�i gian t�ng g�p ��i �i�m kinh nghi�m c�a b�n �� k�t th�c!")
		else
			AddOwnExp(TEMBUGBEAR_EXP)    --����һ���ľ���
		end
	end
	
	if  ( Uworld1214 ~= 0 ) then
		nt_setTask(1214,Uworld1214+1)
	end
	
	if ( Uworld1214+1 >= 20 ) then
		Msg2Player("B�n �� ho�n th�nh t�m nguy�n �ao Y�u tr��c l�c l�m chung, nh�n ���c t�i s�n c�a anh ta �� l�i.")
		if ( SubWorldIdx2ID( nMapIndex ) == 390 ) then
			AddOwnExp(50000)
			nt_setTask(3000,nt_getTask(3000)+16)
		elseif ( SubWorldIdx2ID( nMapIndex ) == 391 ) then
			AddOwnExp(100000)
			nt_setTask(3000,nt_getTask(3000)+18)
		elseif ( SubWorldIdx2ID( nMapIndex ) == 392 ) then
			AddOwnExp(150000)
			nt_setTask(3000,nt_getTask(3000)+24)
		end
		nt_setTask(1214,0)
	end
	messenger_killnpc_jifen(TEMBUGBEAR_MESSENGEREXP,TEMBUGBEAR_MAPID)
	messenger_killbugbear_inteam(TEMBUGBEAR_EXP,TEMBUGBEAR_MAPID)   --���Ӷ�������Ҿ���
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 8);
end


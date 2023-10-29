-------------------------------------------------------------------------
-- FileName		:	enemy_flypoint.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 18:30:14
-- Desc			:   ��֮��ؿ��Ķ���С�ֽű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function messenger_killrefresh()
	
	local _, _, nMapIndex = GetPos()
	local Uworld3000 = nt_getTask(3000)  --��ʹ����
	local Uworld1213 = nt_getTask(1213)  --˫������ʱ��
	local Uworld1215 = nt_getTask(1215)  --boss���ˢ�ֵĴ�ֿ���
	
		if ( Uworld1213 ~= 0 ) then       --�ж��Ƿ�˫������ʱ��
			if  ( GetGameTime() - Uworld1213 >= 1200 ) then
				nt_setTask(1213,0)
				Msg2Player("Th�i gian t�ng g�p ��i �i�m kinh nghi�m c�a b�n �� k�t th�c!")
			else
				AddOwnExp(FLYREFRESH_EXP)    --����һ���ľ���
			end
		end
		
		nt_setTask(1215,Uworld1215+1)
		
		if ( nt_getTask(1215) >= 13 ) then
			local w = random(1,5) --����õ�һ���ö���
			if ( w== 3 ) then  
				--AddItem()
			end
						
			nt_setTask(1215,0)
			Msg2Player("B�n �� ti�u di�t Kim Qu�c H� B�o K�.")
		end
		
		SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 2);
		if ( SubWorldIdx2ID( nMapIndex ) == 387 ) and ( GetGlbValue(811) >= 1 ) then  --�жϵ�ͼ�ڻ����������
			SetGlbValue(811,GetGlbValue(811) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 388 ) and ( GetGlbValue(812) >= 1 ) then
			SetGlbValue(812,GetGlbValue(812) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 389 ) and ( GetGlbValue(813) >= 1 ) then
			SetGlbValue(813,GetGlbValue(813) - 1 )
		end	
		
		messenger_killnpc_jifen(FLYREFRESH_MESSENGEREXP,FLYREFRESH_MAPID)
		messenger_killbugbear_inteam(FLYREFRESH_EXP,FLYREFRESH_MAPID)   --���Ӷ�������Ҿ���

end
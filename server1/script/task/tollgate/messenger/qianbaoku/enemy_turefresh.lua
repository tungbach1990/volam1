-------------------------------------------------------------------------
-- FileName		:	enemy_turefresh.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-19 21:36:14
-- Desc			:   ǧ����ؿ��ĵ����ű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�

function ture_killrefresh()
	
	local _, _, nMapIndex = GetPos()
	
	--local Uworld1205 = nt_getTask(3000)  --��ʹ����
	local Uworld1213 = nt_getTask(1213)  --˫������ʱ��
	local Uworld1215 = nt_getTask(1215)  --boss���ˢ�ֵĴ�ֿ���
	
		if ( Uworld1213 ~= 0 ) then       --�ж��Ƿ�˫������ʱ��
			if  ( GetGameTime() - Uworld1213 >= 1200 ) then
				nt_setTask(1213,0)
				Msg2Player("Th�i gian t�ng g�p ��i �i�m kinh nghi�m c�a b�n �� k�t th�c!")
			else
				AddOwnExp(TUREREFRESH_EXP)    --����һ���ľ���
				nt_setTask(1215,Uworld1215+1)
			end
		end
		
		if ( SubWorldIdx2ID( nMapIndex ) == 393 ) and ( GetGlbValue(814) >= 1 ) then  --�жϵ�ͼ�ڻ����������
			SetGlbValue(814,GetGlbValue(814) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) and ( GetGlbValue(815) >= 1 ) then
			SetGlbValue(815,GetGlbValue(815) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) and ( GetGlbValue(816) >= 1 ) then
			SetGlbValue(816,GetGlbValue(816) - 1 )
		end
		
		if ( nt_getTask(1215) >= 11 ) then
			local w = random(1,5) --����õ�һ���ö���
			if ( w== 3 ) then  
				--AddItem()
			end
			nt_setTask(1215,0)
		end
		Msg2Player("Nh�n ���c ph�n th��ng")
		
		messenger_killnpc_jifen(TUREREFRESH_MESSENGEREXP,TUREREFRESH_MAPID)
		messenger_killbugbear_inteam(TUREREFRESH_EXP,TUREREFRESH_MAPID)   --���Ӷ�������Ҿ���

end
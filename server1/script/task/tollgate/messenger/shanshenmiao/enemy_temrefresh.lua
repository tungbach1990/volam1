-------------------------------------------------------------------------
-- FileName		:	enemy_temrefresh.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 10:28:14
-- Desc			:   ɽ����ؿ��ĵ����ֵܽű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�

function temple_killrefresh()
	local _, _, nMapIndex = GetPos()
	--local Uworld3000 = nt_getTask(3000)  --��ʹ����
	local Uworld1213 = nt_getTask(1213)  --˫������ʱ��
	local Uworld1215 = nt_getTask(1215)  --boss���ˢ�ֵĴ�ֿ���
	
		if ( Uworld1213 ~= 0 ) then       --�ж��Ƿ�˫������ʱ��
			if  ( GetGameTime() - Uworld1213 >= 1200 ) then
				nt_setTask(1213,0)
				Msg2Player("Th�i gian t�ng g�p ��i �i�m kinh nghi�m c�a b�n �� k�t th�c!")
			else
				AddOwnExp(TEMREFRESH_EXP)    --����һ���ľ���
				nt_setTask(1215,Uworld1215+1)
			end
		end
		
		if ( SubWorldIdx2ID( nMapIndex ) == 390 ) and ( GetGlbValue(817) >= 1 ) then  --�жϵ�ͼ�ڻ����������
			SetGlbValue(817,GetGlbValue(817) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 391 ) and ( GetGlbValue(818) >= 1 ) then
			SetGlbValue(818,GetGlbValue(818) - 1 )
		elseif ( SubWorldIdx2ID( nMapIndex ) == 392 ) and ( GetGlbValue(819) >= 1 ) then
			SetGlbValue(819,GetGlbValue(819) - 1 )
		end
		
		if ( nt_getTask(1215) >= 11 ) then
			local w = random(1,5) --����õ�һ���ö���
			if ( w== 3 ) then  
				AddItem()
			end
			nt_setTask(1215,0)
		end
		messenger_killnpc_jifen(TEMREFRESH_MESSENGEREXP,TEMREFRESH_MAPID)
		messenger_killbugbear_inteam(TEMREFRESH_EXP,TEMREFRESH_MAPID)   --���Ӷ�������Ҿ���
		print(temrefresh);
end
-------------------------------------------------------------------------
-- FileName		:	partner_reward.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-14 14:43:15
-- Desc			:  	ͬ����������ű�
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
IncludeLib("PARTNER")
IncludeLib("TITLE")  --���ӳƺ�ͷ�ļ�
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua") --���ӻԻ�֮ҹ˫���
Include("\\script\\task\\newtask\\newtask_head.lua")
TabFile_Load( "\\settings\\task\\partner\\reward\\reward_allprize.txt" , "rewardprize");	 --���ͬ�������ı��
Include([[\script\tong\tong_award_head.lua]]);--�����Ŀ�깱�׶�by־ɽ
Include ("\\script\\task\\partner\\master\\partner_master_main_05.lua");
TITLETIME = 30 * 24 * 60 * 60 * 18 * 36  --�ƺż��ܵ�ִ��ʱ��

------------------------------------1:ͬ�����������д�������Ľű�����,RewardTaskIdΪ���������������------------------------------0-----------------
function reward_startreward2(RewardTaskId,RewardTaskLevel) 

	local Uworld1236 = nt_getTask(1236) --��������������������������¼��ҵ�ǰɱ���˶���ֻ���
	local Uworld1237 = nt_getTask(1237) --��¼���������ŵ��������
	local Uworld1238 = nt_getTask(1238) --��¼��������������ڵ��������
	local Uworld1239 = nt_getTask(1239) --��¼��ҽ���������������
	local Uworld1240 = nt_getTask(1240) --��¼���ͬ�龭�齱�����������
	local Uworld1241 = nt_getTask(1241) --��¼��ҵ����Ѿ��������������������
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	
	if ( Uworld1237 ~= 0 ) then
		Msg2Player("����������Ѿ��ӵ������������ٿ����µľ���ɡ�")
		return 1
	elseif ( Uworld1238 == 0 ) then                                    --��ʼ�����һ����������
		Msg2Player("��ӭ�㿪ʼ����ĵ�һ��������������͡�")
		nt_setTask(1238,NowDate)
	elseif ( Uworld1238 ~= 0 ) and ( Uworld1238 ~= NowDate ) then  --�������������Ѿ�����
		Msg2Player("������������Ѿ�����ȫ�µ�һ�졣��ȥ������������������û�������û�н���������ȡ����")
		reward_cleartaskvalue()
		return 1
	elseif ( Uworld1238 == NowDate ) then                           --��������ʱ�ڷ���Ҫ��
		if ( Uworld1241 >= 10 ) then                                 --������������Ѿ��ﵽ����
			Msg2Player("���ڽ���������������������Ѿ��ﵽ�����ޣ��뼰ʱ����������������ˡ������ټ���Ŭ����лл��")
			return 1
		end
	end		
	
	if  ( reward_beckon(RewardTaskLevel) ~= 10 ) then              	--�ж������ͬ����صĲ���,����ֵΪ10ʱ��ʾ�д���
		return 1
	end
	reward_justdoit(RewardTaskId)                                   --���������ϸ�����
end


------------------------------------------------�ж�ͬ���Ƿ���ϵ�ǰ�������Ҫ��-----------------------------------------------

function reward_beckon(RewardTaskLevel)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()   --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	
	if ( NpcCount == 0 ) then
		Msg2Player("�㵱ǰû��ͬ�飬��ô����������ȥ�ҳ��������ˣ�Ȼ��������ﵽ�����򣬴ӽ��ʵ��Ӵ����ͬ���ȡ�")
		return 1
	elseif ( partnerstate == 0 ) then
		Msg2Player("��ֻ���ٻ��������ͬ�飬���ܴ���������ͬ����������")
		return 1
	elseif ( PARTNER_GetLevel(partnerindex)+10 < RewardTaskLevel ) then
		Msg2Player("�Բ������������������ڵ�ͬ����˵���ڼ����ˣ�������Щ�ͼ�����������")
		return 1
	elseif ( PARTNER_GetTaskValue(partnerindex, 2) == 1 ) then
		Msg2Player("�㵱ǰͬ�黹����������û���꣬���ȴ��������������лл��")
		return 1
	elseif ( PARTNER_GetTaskValue(partnerindex, 2) == 0 ) then  --����������������Ĵ�����Ϊ0
		local j = 0
		for i =1,NpcCount do
			if (  PARTNER_GetTaskValue(i,2) ~= 0  ) then
				Msg2Player("���Ѿ���ͬ���������������ˣ���û�н�����֮ǰ����ͬ���ǲ�������������ġ�лл��")
				j = j+1
			end 
		end
		
		if ( j == 0 ) then
			return 10
		else
			return 1
		end
		 
	else
		return 10
	end
	
end

------------------------------------------------������������-------------------------------------------------------

function reward_justdoit(RewardTaskId)    
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	
	if ( PARTNER_GetTaskValue(partnerindex, 2) == 0 )  or ( PARTNER_GetTaskValue(partnerindex, 2) == 2 ) then               
		 PARTNER_SetTaskValue(partnerindex,2,1)                          --���õ�ǰ����ͬ��Ϊ������������״̬      
	else       
		Msg2Player("�㵱ǰͬ�黹����������û���꣬лл��")
		return 1
	end
	
	nt_setTask(1237,RewardTaskId)                                   --����ǰ�ӵ������Ŵ洢����
	AddPlayerEvent(RewardTaskId)                                    --�����þ�����Ե�ɱ������
	Msg2Player("���Ѿ�˳���������������ڽ�������ɡ�")
	
end



-------------------------------------------2:ɱ���������ʱ���õĽű�����-----------------------------------------

function reward_killfinish(nPlayerIdx, nTaskID ,EventID)
	oldPlayerIndex = PlayerIndex
	PlayerIndex = nPlayerIdx
	
	local Uworld1236 = nt_getTask(1236) --��������������������������¼��ҵ�ǰɱ���˶���ֻ���
	local Uworld1237 = nt_getTask(1237) --��¼���������ŵ��������
	local Uworld1238 = nt_getTask(1238) --��¼��������������ڵ��������
	local Uworld1239 = nt_getTask(1239) --��¼��ҽ���������������
	local Uworld1240 = nt_getTask(1240) --��¼���ͬ�龭�齱�����������
	local Uworld1241 = nt_getTask(1241) --��¼��ҵ����Ѿ��������������������
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	local NpcCount = PARTNER_Count()
	
	if ( Uworld1238 ~= NowDate ) then
		Msg2Player("�Բ����㵱ǰ�����������Ѿ������˹涨�����ڣ��������񽫱�����ӽ�������")
		reward_cleartaskvalue()
	elseif ( NpcCount == 0 ) then
		Msg2Player("�Բ�����һ��ͬ�鶼û�У�����ô�������������أ��������ʧ���ˡ�")
		reward_cleartaskvalue()
	else
		local w = 0
		for i =1,NpcCount do
			if ( PARTNER_GetTaskValue(i,2) == 1 ) then
				PARTNER_SetTaskValue(i,2,2)
				w = w+1
			end
		end
		
		if ( w == 0 ) then
			Msg2Player("�Բ������ͬ����û��˭�����������񣬸������ѱ�ȡ���ˡ�")
			reward_cleartaskvalue()
		else
			nt_setTask(1241,Uworld1241+1)
			tongaward_partner_xiulian()--�����Ŀ�깱�׶�by־ɽ
			if ( nt_getTask(1241) == nt_getTask(1246) ) then  --1246Ϊ�������ÿ������������Ĵ���
				Msg2Player("�������������ɴ����Ѵ�"..nt_getTask(1246).."�Σ��뼰ʱȥ�������˴��һ�������")
			end
			local prize_peopleexp  = tonumber( TabFile_GetCell( "rewardprize" ,EventID - 4 , 2 )) --�����Ҹõõľ���                   
			local prize_partnerexp = tonumber( TabFile_GetCell( "rewardprize" ,EventID - 4 , 3 )) --���ͬ��õõľ���
			local prize_parameter  = nt_getTask(1241)*0.1+1
			prize_partnerexp = prize_partnerexp*prize_parameter
			
			prize_peopleexp  = prize_peopleexp  * greatnight_huang_event(5)
			prize_partnerexp = prize_partnerexp * greatnight_huang_event(5)

			nt_setTask(1239,Uworld1239+prize_peopleexp)                                       --����ҽ��Ӧ��þ���ӵ�������
			nt_setTask(1240,Uworld1240+prize_partnerexp)                                      --��ͬ����Ӧ��þ���ӵ�������
			nt_setTask(1237,0)                                                                --����¼�����ŵı������
			Msg2Player("��ϲ�����Ѿ�����˵�ǰ��ͬ����������")
			local x = nt_getTask(1246) - nt_getTask(1241)
			Msg2Player("�����컹�����"..x.."��ͬ����������")
		end
	end
	PlayerIndex = oldPlayerIndex
end


---------------------------------------------3����ͬ����������Ľű�-----------------------------------------------

function reward_givetask2()
	local Uworld1236 = nt_getTask(1236) --��������������������������¼��ҵ�ǰɱ���˶���ֻ���
	local Uworld1237 = nt_getTask(1237) --��¼���������ŵ��������
	local Uworld1238 = nt_getTask(1238) --��¼��������������ڵ��������
	local Uworld1239 = nt_getTask(1239) --��¼��ҽ���������������
	local Uworld1240 = nt_getTask(1240) --��¼���ͬ�龭�齱�����������
	local Uworld1241 = nt_getTask(1241) --��¼��ҵ����Ѿ��������������������
	local NowDate = tonumber(date("%y%m%d")) --��õ�ǰ����
	
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	
	if ( Uworld1238 ~= NowDate ) then        --ʱ�䲻��
		Msg2Player("�Բ����㵱ǰ�����������Ѿ������˹涨�����ڣ��������񽫱�����ӽ�������")
		reward_cleartaskvalue()
	elseif ( Uworld1241 == 0 ) then          --����Ϊ��
		Msg2Player("����컹û������������������Ŭ����")
	elseif ( PARTNER_GetTaskValue(partnerindex, 2) == 0 ) then
		Msg2Player("���ͬ�鲢���������ȥ������������Ǹ�ͬ�飬�뽫��ȷͬ���ٻ�������")  
	elseif ( NpcCount == 0 ) then
		Msg2Player("�㵱ǰû��ͬ�飬��ȡ���˽���Ŷ��")
	elseif ( partnerstate == 0 ) then
		Msg2Player("�㵱ǰû���ٻ���ͬ��������ȡ���˽���Ŷ��") 
	elseif ( nt_getTask(1239) ~= 0 ) and ( nt_getTask(1240) ~= 0 ) then
		if ( PARTNER_GetTaskValue(partnerindex, 2) ~= 0 ) then
			PARTNER_AddExp(partnerindex,Uworld1240 ,1) 
			AddOwnExp(Uworld1239)
			nt_setTask(1239,0)
			nt_setTask(1240,0) 
			Msg2Player("��������ͬ���Ѿ�����˽�������ɵ�ͬ����������Ľ�����")
		else
			Msg2Player("�Բ�����������λͬ�鲢û�н�ͬ����������")
		end

		if ( PARTNER_GetTaskValue(partnerindex, 2) == 2 ) and ( nt_getTask(1237) == 0 ) then  --�����Ϊ����ʼ״̬����1237���ѱ��������״̬�ĺ������ʱ
			if ( nt_getTask(1241) == 10 ) then
				local Uworld1242 = nt_getTask(1242)
				nt_setTask(1242,Uworld1242+1)
				taskProcess_005_AddTimes:doTaskEntity();
			end
			PARTNER_SetTaskValue(partnerindex,2,0)
			if ( nt_getTask(1242) == 30 ) and ( GetBit(GetTask(1269),4) == 0 ) then
				nt_setTask(1245,5)
				nt_setTask(1246,20)
				Msg2Player("��ϲ����������֮���ĳƺţ�ÿ����������������ɵĴ������ӵ�20�Σ�")
				Title_AddTitle(80, 1, TITLETIME);
				Title_ActiveTitle( 80 );
				nt_setTask(1269,SetBit(GetTask(1269),4,1)) 
				reward_cleartaskvalue()
			end
		end
	else
		Msg2Player("�߿��߿�����Ҫ���ң�") 
	end

end

--------------------------------------------������й�ʱ�����������ֵ---------------------------------------------
function reward_cleartaskvalue()
	nt_setTask(1237,0)
	nt_setTask(1238,0)
	nt_setTask(1239,0)
	nt_setTask(1240,0)
	nt_setTask(1241,0)
	local partnerindex,partnerstate = PARTNER_GetCurPartner()       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count()
	if ( NpcCount ~= 0 ) then
		for i=1,NpcCount do
			if ( PARTNER_GetTaskValue(i,2) ~= 0 ) then
				PARTNER_SetTaskValue(i,2,0) 
			end
		end
	end
end


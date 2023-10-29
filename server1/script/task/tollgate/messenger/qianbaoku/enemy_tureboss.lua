-------------------------------------------------------------------------
-- FileName		:	enemy_tureboss.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-19 16:09:14
-- Desc			:   ǧ����ؿ��ı���ű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�
Include("\\script\\event\\birthday_jieri\\200905\\class.lua")
Include("\\script\\event\\jiaoshi_jieri\\200910\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")

thiefdeathscript = "\\script\\task\\tollgate\\messenger\\qianbaoku\\thiefdeathscript.lua"

Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--�����乤�ߺ���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������

function messenger_turego()
	
	local _, _, nMapIndex = GetPos()
--------------------------------------------------------��������------------------------------------------
	local name = GetName()
	local Uworld1201 = nt_getTask(1203)  --ǧ����������������
	local Uworld1204 = nt_getTask(1204)  --�������������ص��������
	local Uworld3000 = nt_getTask(3000)  --��ʹ����
	local Uworld1206 = nt_getTask(1206)  --��ʹ�ƺ�
	local Uworld1207 = nt_getTask(1207)  --��ʹ����ǰɱ�ּ�����
	local Uworld1208 = nt_getTask(1210)  --ǧ����ɱ�ּ�����
	local Uworld1211 = nt_getTask(1211)  --��ʹ����ؿ���ʼʱ��
	local Uworld1213 = nt_getTask(1213)  --˫������ʱ��
	local Uworld1214 = nt_getTask(1214)  --������Ů���鿪��
	local Uworld1215 = nt_getTask(1215)  --bossˢ�ֿ���
	local messenger_nowtime = GetGameTime()  --�����ҵ�ǰ����ʱ��
	local Uworld1212  =  messenger_nowtime - Uworld1211 --�����ҵ�ǰ�ڸùؿ���ͼ����ʱ��

	local Npcindex = GetLastDiagNpc()
	SetTaskTemp(180,Npcindex)    --����ǰBoss�����浽һ����ʱ������
	local nBoxIndex = GetTaskTemp(181)
	SetTaskTemp(181,0)           --��ֹɱ��һ��boss�����Ҽ������ô˱���������
	
	local nTask1203 = nt_getTask(1203)
	if nTask1203 == 20 then
    	local nTaskStatus = %add_task_step(nBoxIndex)--�����ƽ�
    	
    	if nTaskStatus == 30 then
    		--�������
    		nt_setTask(1203,25)
    		Talk(1, "", name.."��i nh�n, nhi�m v� c�a ng��i �� ho�n th�nh, xin h�y �i t�m Ti�u Tr�n.")
    		return 1
    	elseif nTaskStatus==20 then
    		--������Լ���
    		--do nothing
    		return 1
    	else
    		--����ʧ��
    		losemessengertask()
    		Talk(1, "", "Th�t xin l�i ! "..name.."Ng��i m� r��ng kh�ng ��ng tr�t t�, nhi�m v� th�t b�i .")
    	end
    elseif nTask1203 == 25 then
    	Talk(1, "", "Nhi�m v� c�a ng��i �� ho�n th�nh, xin h�y �i t�m Ti�u Tr�n.")
    end

------------------------------------------------------�����ж�--------------------------------------------
	
--	--��������Ƿ�ɱ���˸����Ӷ�Ӧ�ػ��ߵ��жϷ��ڵ��øýű��ĵط�����
	if ( Uworld1213 ~= 0 ) and ( Uworld1214 ~= 0 ) and ( Uworld1215 ~= 0 ) then  --�����������Ͷ��Ѿ���������
		Msg2Player("Ng��i c�n c� nhi�m v� ch�a ho�n th�nh, c� g�ng l�n .") 
	else
		local messenger_choice = random(1,40)
		--if ( messenger_choice == 4 ) then  --����һ�����ش���
		--	local lucky_hongbao = random(1,10)
--		--	if ( lucky_hongbao == 5 ) then
--		--		AddItem(6,1,402,0,0,0)      
--		--		Msg2Player("������һ�����ش���")
--		--	end
		if ( messenger_choice == 7) then  --���û�еõ���������������ӻ���20����
			if ( Uworld1213 == 0 ) then
				nt_setTask(1213,messenger_nowtime)
				Msg2Player("Ng��i l�y ���c gi�t qu�i ���c g�p ��i kinh nghi�m 20 ph�t nh�n th��ng!")
				AddSkillState( 548, 1, 1, 21600 )
			else
				Msg2Player("Ng��i th�nh c�ng m� th�nh c�ng m�t b�o r��ng.")
			end
		elseif ( messenger_choice == 11 ) then  --���ӻ���10 
			nt_setTask(3000,Uworld3000+20)
			tongaward_message(20);	--by Сɽ
			Msg2Player("Ng��i � ��y nhi�m v� t�n s� �� t�ch l�y �i�m t�ng th�m 20 �i�m!")
		
		elseif ( messenger_choice == 13 ) then  --���ٻ���10
			if ( Uworld3000 >= 10 ) then 
			nt_setTask(3000,Uworld3000-10)
			Msg2Player("Ng��i nhi�m v� t�n s� �� b� gi�m �i 10 �i�m t�ch l�y")
			
			end
		elseif ( messenger_choice == 16 )  then  --���û�д����������ֵ�ʢ����������ĳ�����������ʢ��
			local lucky_dingdian = random(1,3)  --���ƶ�����Ů���ּ��ʼ���3��
			if ( lucky_dingdian == 2 ) then
				local TureParam = GetNpcParam(Npcindex,NPC_PARAM_ID)
				if ( SubWorldIdx2ID( nMapIndex ) == 393 ) then
					for i=1,getn(turegirl) do 
						if ( TureParam == turegirl[i][10]) then
							Mid = SubWorldID2Idx(turegirl[i][3]);   			  --����npc
							if (Mid >= 0 ) then
								TabValue4 = turegirl[i][4] * 32
								TabValue5 = turegirl[i][5] * 32
								newtasknpcindex = AddNpc(turegirl[i][1],turegirl[i][2],Mid,TabValue4,TabValue5,turegirl[i][6],turegirl[i][7],turegirl[i][8]);
								SetNpcScript(newtasknpcindex, turegirl[i][9]);
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) then
					for i=1,getn(turegirl2) do 
						if ( TureParam == turegirl2[i][10]) then
							Mid = SubWorldID2Idx(turegirl2[i][3]);   			  --����npc
							if (Mid >= 0 ) then
								TabValue4 = turegirl2[i][4] * 32
								TabValue5 = turegirl2[i][5] * 32
								newtasknpcindex = AddNpc(turegirl2[i][1],turegirl2[i][2],Mid,TabValue4,TabValue5,turegirl2[i][6],turegirl2[i][7],turegirl2[i][8]);
								SetNpcScript(newtasknpcindex, turegirl2[i][9]);
								
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) then
					for i=1,getn(turegirl3) do 
						if ( TureParam == turegirl3[i][10]) then
							Mid = SubWorldID2Idx(turegirl3[i][3]);   			  --����npc
							if (Mid >= 0 ) then
								TabValue4 = turegirl3[i][4] * 32
								TabValue5 = turegirl3[i][5] * 32
								newtasknpcindex = AddNpc(turegirl3[i][1],turegirl3[i][2],Mid,TabValue4,TabValue5,turegirl3[i][6],turegirl3[i][7],turegirl3[i][8]);
								SetNpcScript(newtasknpcindex, turegirl3[i][9]);
							end
						end
					end
				end
			end
			
		elseif ( messenger_choice == 19 ) then 	--�ڸ�boss�������if ( messenger_npcindex == turerobber[i][10]) ��npc
			local lucky_shuachu = random(1,3)
			if ( lucky_shuachu == 2 ) then
				local lucky_time = 1
				if ( SubWorldIdx2ID( nMapIndex ) == 393 ) and ( GetGlbValue(814) < 10 ) then
					SetGlbValue(814,GetGlbValue(814)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --��õ�ǰ����npc�Ĵ������ֵ����Ӧ��������ֵ�ڸ�npc�����ش���
					Msg2Player("B�o Kh� ��o T�c : Ng��i ng��i ng��i, ng��i l� th� n�o ph�t hi�n ta, ai nha nha, phi�n n�o, tr�m c� b�o b�i c�n c� ng��i qu�y r�y! �i t�m ch�t �i ng��i !")	
				
					for i=1,getn(turerobber) do  								  --ȥ����boss���������ɵ�npc�����Ѱ�ҷ��ϸ�boss����������
						if ( messenger_npcindex == turerobber[i][10]) then   	  --������Ѱ�ҷ���npc�����ı�����ֵ
							Tid = SubWorldID2Idx(turerobber[i][3]);   			  --����npc
							if (Tid >= 0 ) then
								TabValue4 = turerobber[i][4] * 32
								TabValue5 = turerobber[i][5] * 32
								newtasknpcindex = AddNpc(turerobber[i][1],turerobber[i][2],Tid,TabValue4,TabValue5,turerobber[i][6],turerobber[i][7],turerobber[i][8]);
								SetNpcScript(newtasknpcindex, turerobber[i][9]);
								SetNpcDeathScript(newtasknpcindex, thiefdeathscript);
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 394 ) and ( GetGlbValue(815) < 10 ) then
					SetGlbValue(815,GetGlbValue(815)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --��õ�ǰ����npc�Ĵ������ֵ����Ӧ��������ֵ�ڸ�npc�����ش���
					Msg2Player("B�o Kh� ��o T�c : Ng��i ng��i ng��i, ng��i l� th� n�o ph�t hi�n ta, ai nha nha, phi�n n�o, tr�m c� b�o b�i c�n c� ng��i qu�y r�y! �i t�m ch�t �i ng��i !")	
				
					for i=1,getn(turerobber2) do  								  --ȥ����boss���������ɵ�npc�����Ѱ�ҷ��ϸ�boss����������
						if ( messenger_npcindex == turerobber2[i][10]) then   	  --������Ѱ�ҷ���npc�����ı�����ֵ
							Tid = SubWorldID2Idx(turerobber2[i][3]);   			  --����npc
							if (Tid >= 0 ) then
								TabValue4 = turerobber2[i][4] * 32
								TabValue5 = turerobber2[i][5] * 32
								newtasknpcindex = AddNpc(turerobber2[i][1],turerobber2[i][2],Tid,TabValue4,TabValue5,turerobber2[i][6],turerobber2[i][7],turerobber2[i][8]);
								SetNpcScript(newtasknpcindex, turerobber2[i][9]);
								SetNpcDeathScript(newtasknpcindex, thiefdeathscript);
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 395 ) and ( GetGlbValue(816) < 10 ) then
					SetGlbValue(816,GetGlbValue(816)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --��õ�ǰ����npc�Ĵ������ֵ����Ӧ��������ֵ�ڸ�npc�����ش���
					Msg2Player("B�o Kh� ��o T�c : Ng��i ng��i ng��i, ng��i l� th� n�o ph�t hi�n ta, ai nha nha, phi�n n�o, tr�m c� b�o b�i c�n c� ng��i qu�y r�y! �i t�m ch�t �i ng��i !")		
				
					for i=1,getn(turerobber3) do  								  --ȥ����boss���������ɵ�npc�����Ѱ�ҷ��ϸ�boss����������
						if ( messenger_npcindex == turerobber3[i][10]) then   	  --������Ѱ�ҷ���npc�����ı�����ֵ
							Tid = SubWorldID2Idx(turerobber3[i][3]);   			  --����npc
							if (Tid >= 0 ) then
								TabValue4 = turerobber3[i][4] * 32
								TabValue5 = turerobber3[i][5] * 32
								newtasknpcindex = AddNpc(turerobber3[i][1],turerobber3[i][2],Tid,TabValue4,TabValue5,turerobber3[i][6],turerobber3[i][7],turerobber3[i][8]);
								SetNpcScript(newtasknpcindex, turerobber3[i][9]);
								SetNpcDeathScript(newtasknpcindex, thiefdeathscript);
							end
						end
					end
				end
			end
		end
	end
----------------------------------------------------��boss�����Ļ�������-------------------------------------------------------
	if ( Uworld1213 ~= 0 ) then       --�ж��Ƿ�˫������ʱ��
		if  (  messenger_nowtime - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("Ng�i � v�n quan trung l�y ���c g�p ��i kinh nghi�m th�i gian �� k�t th�c !")
		else
			AddOwnExp(TUREBOSS_EXP)    --����һ���ľ���
		end
	end

	if (tbJiaoShi2009:IsActive() == 1) then	-- 2009��ʦ�ڵ���ˮī
		--print("123");
		tbAwardTemplet:GiveAwardByList({szName="Th�y M�c", tbProp={6,1,2175,1,0,0},nExpiredTime=20091203,}, "2009 Teacher's Day Messenger's Box give ink");
	end
	local Uworld3000 = nt_getTask(3000)
	local Uworld1207 = nt_getTask(1207)
	local Uworld1207 = nt_getTask(1210)
	
	messenger_killnpc_jifen(TUREBOSS_MESSENGEREXP,TUREBOSS_MAPID)
	SetMessengerPlayer(1207,1210,TUREBOSS_EXP,TUREBOSS_MAPID)   --����ǧ����ɱ���������ӵ�ǰ�ؿ�ɱ���������Ӿ���
	if ( lucky_time == 1 ) then
		HideNpc(GetTaskTemp(180),TUREBOSS_RELIVE*60*18)  --18��Ϊһ��  ���ظöԻ��͵�npc
		lucky_time = 0
	else
		HideNpc(GetTaskTemp(180),TUREBOSS_RELIVE*18)  --18��Ϊһ��  ���ظöԻ��͵�npc
	end
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 4);
end

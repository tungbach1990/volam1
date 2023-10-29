-------------------------------------------------------------------------
-- FileName		:	enemy_temzhiboss.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-18 10:27:14
-- Desc			:   ɽ����ؿ��ı�־boss�ű�
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua") --��������������ݱ�����
Include("\\script\\task\\tollgate\\messenger\\lib_messenger.lua") --��������ж�
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");

function messenger_templego(KillerNpcIndex)
	local _, _, nMapIndex = GetPos()
------------------------------------------------------��������------------------------------------------
	local name = GetName()
	local Uworld1201 = nt_getTask(1202)  --ɽ����������������
	local Uworld1204 = nt_getTask(1204)  --�������������ص��������
	local Uworld3000 = nt_getTask(3000)  --��ʹ����
	local Uworld1206 = nt_getTask(1206)  --��ʹ�ƺ�
	local Uworld1207 = nt_getTask(1207)  --��ʹ����ǰɱ�ּ�����
	local Uworld1208 = nt_getTask(1209)  --ɽ����ɱ�ּ�����
	local Uworld1211 = nt_getTask(1211)  --��ʹ����ؿ���ʼʱ��
	local Uworld1213 = nt_getTask(1213)  --˫������ʱ��
	local Uworld1214 = nt_getTask(1214)  --������ͽ���鿪��
	local Uworld1215 = nt_getTask(1215)  --bossˢ�ֿ���
	local messenger_nowtime = GetGameTime()  --�����ҵ�ǰ����ʱ��
	local Uworld1212  =  messenger_nowtime - Uworld1211 --�����ҵ�ǰ�ڸùؿ���ͼ����ʱ��
	local Npcindex = KillerNpcIndex	
	
------------------------------------------------------�����ж�--------------------------------------------
	
	if ( Uworld1213 ~= 0 ) and ( Uworld1214 ~= 0 ) and ( Uworld1215 ~= 0 ) then  --�����������Ͷ��Ѿ���������
		--Msg2Player("�㻹������û����ɣ����͡�")  ����������
	else
		local messenger_choice = random(1,40)
		--if ( messenger_choice == 4 ) then  --����һ�����ش���
		--	local lucky_hongbao = random(1,10)
		--	if ( lucky_hongbao == 5 ) then
		--		AddItem(6,1,402,0,0,0)      
		--		Msg2Player("������һ�����ش���")
		--	end
		if ( messenger_choice == 7) then  --���û�еõ���������������ӻ���20����
			if ( Uworld1213 == 0 ) then
				nt_setTask(1213,messenger_nowtime)
				Msg2Player("B�n nh�n ���c ph�n th��ng t�ng g�p ��i �i�m kinh nghi�m khi gi�t qu�i trong 20 ph�t!")
				AddSkillState( 548, 1, 1,21600)
			else
				Msg2Player("B�n th�nh c�ng h� t�n �ao Y�u.")
			end
		elseif ( messenger_choice == 11 ) then  --���ӻ���10 
			nt_setTask(3000,Uworld3000+20)
			tongaward_message(20);	--by Сɽ
			Msg2Player("�i�m t�ch l�y trong nhi�m v� T�n S� c�a b�n t�ng l�n 20 �i�m!")
			AddSkillState( 509, 1, 0, 180)
		elseif ( messenger_choice == 13 ) then  --���ٻ���10
			if ( Uworld3000 >= 10 ) then 
			nt_setTask(3000,Uworld3000-10)
			Msg2Player("�i�m t�ch l�y trong nhi�m v� T�n S� c�a b�n gi�m �i 10 �i�m!")
			AddSkillState( 509, 1, 0, 180)
			end
		elseif ( messenger_choice == 16 ) then  --���û�д����������ֵ��¼���������ĳ������������¼�
			local lucky_dingdian = random(1,3)
			if ( lucky_dingdian == 2 ) then
				if ( Uworld1214 == 0 ) then                            
					nt_setTask(1214,Uworld1214+10)									--��¼��killfly����ȡ�õ�����
					Msg2Player("Tr��c khi �ao Y�u t�t th� anh ta n�i v�i b�n do b� th� h� �ao Th� h�m h�i n�n anh ta m�i gi�t ng��i v� s�. Hy v�ng b�n c� th� gi�p anh ta h� 10 t�n �ao Th� s� c� nhi�u b�t ng� cho b�n ��y!")
					AddSkillState( 509, 1, 0, 180)
				else 
					Msg2Player("B�n th�nh c�ng h� t�n �ao Y�u.")
					--SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 7);
				end
			end
			
		elseif ( messenger_choice == 19 ) then 	--�ڸ�boss�������if ( messenger_npcindex == templeboss[i][10]) ��npc
			local lucky_shuachu = random(1,3)
			if ( lucky_shuachu == 2 ) then
				if ( SubWorldIdx2ID( nMapIndex ) == 390 ) and ( GetGlbValue(817) < 10 )  then
					SetGlbValue(817,GetGlbValue(817)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --��õ�ǰ����npc�Ĵ������ֵ����Ӧ��������ֵ�ڸ�npc�����ش���
			
					for i=1,getn(templeboss) do  								  --ȥ����boss���������ɵ�npc�����Ѱ�ҷ��ϸ�boss����������
						if ( messenger_npcindex == templeboss[i][10]) then   	  --������Ѱ�ҷ���npc�����ı�����ֵ
							Tid = SubWorldID2Idx(templeboss[i][3]);   			  --����npc
							if (Tid >= 0 ) then
								TabValue4 = templeboss[i][4] * 32
								TabValue5 = templeboss[i][5] * 32
								newtasknpcindex = AddNpc(templeboss[i][1],templeboss[i][2],Tid,TabValue4,TabValue5,templeboss[i][6],templeboss[i][7],templeboss[i][8]);
								SetNpcScript(newtasknpcindex, templeboss[i][9]);
								Msg2Player(templeboss[i][7]..": Ng��i d�m gi�t ca ca ta, h�m nay ng��i ph�i n�p m�ng!")
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 391 ) and ( GetGlbValue(818) < 10 ) then
					SetGlbValue(818,GetGlbValue(818)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --��õ�ǰ����npc�Ĵ������ֵ����Ӧ��������ֵ�ڸ�npc�����ش���
			
					for i=1,getn(templeboss2) do  								  --ȥ����boss���������ɵ�npc�����Ѱ�ҷ��ϸ�boss����������
						if ( messenger_npcindex == templeboss2[i][10]) then   	  --������Ѱ�ҷ���npc�����ı�����ֵ
							Tid = SubWorldID2Idx(templeboss2[i][3]);   			  --����npc
							if (Tid >= 0 ) then
								TabValue4 = templeboss2[i][4] * 32
								TabValue5 = templeboss2[i][5] * 32
								newtasknpcindex = AddNpc(templeboss2[i][1],templeboss2[i][2],Tid,TabValue4,TabValue5,templeboss2[i][6],templeboss2[i][7],templeboss2[i][8]);
								SetNpcScript(newtasknpcindex, templeboss2[i][9]);
								Msg2Player(templeboss2[i][7]..": Ng��i d�m gi�t ca ca ta, h�m nay ng��i ph�i n�p m�ng!")
							end
						end
					end
				elseif ( SubWorldIdx2ID( nMapIndex ) == 392 ) and ( GetGlbValue(819) < 10 ) then
					SetGlbValue(819,GetGlbValue(819)+1)
					nt_setTask(1215,10)
					local messenger_npcindex = GetNpcParam(Npcindex,NPC_PARAM_ID) --��õ�ǰ����npc�Ĵ������ֵ����Ӧ��������ֵ�ڸ�npc�����ش���
			
					for i=1,getn(templeboss3) do  								  --ȥ����boss���������ɵ�npc�����Ѱ�ҷ��ϸ�boss����������
						if ( messenger_npcindex == templeboss3[i][10]) then   	  --������Ѱ�ҷ���npc�����ı�����ֵ
							Tid = SubWorldID2Idx(templeboss3[i][3]);   			  --����npc
							if (Tid >= 0 ) then
								TabValue4 = templeboss3[i][4] * 32
								TabValue5 = templeboss3[i][5] * 32
								newtasknpcindex = AddNpc(templeboss3[i][1],templeboss3[i][2],Tid,TabValue4,TabValue5,templeboss3[i][6],templeboss3[i][7],templeboss3[i][8]);
								SetNpcScript(newtasknpcindex, templeboss3[i][9]);
								Msg2Player(templeboss3[i][7]..": Ng��i d�m gi�t ca ca ta, h�m nay ng��i ph�i n�p m�ng!")
							end
						end
					end
				end
			end
		end
	end
--------------------------------------------------��boss�����Ļ�������-------------------------------------------------------
	if ( Uworld1213 ~= 0 ) then       --�ж��Ƿ�˫������ʱ��
		if  (  messenger_nowtime - Uworld1213 >= 1200 ) then
			nt_setTask(1213,0)
			Msg2Player("Th�i gian t�ng g�p ��i �i�m kinh nghi�m c�a b�n �� k�t th�c!")
		else
			AddOwnExp(TEMBOSS_EXP)    --����һ���ľ���
		end
	end
	
	
	local Uworld3000 = nt_getTask(3000)
	local Uworld1207 = nt_getTask(1207)
	local Uworld1207 = nt_getTask(1209)
	
	messenger_killnpc_jifen(TEMBOSS_MESSENGEREXP,TEMBOSS_MAPID)
	SetMessengerPlayer(1207,1209,TEMBOSS_EXP,TEMBOSS_MAPID)   --����ɽ����ɱ���������ӵ�ǰ�ؿ�ɱ���������Ӿ���
	SetTask2Team(tbBirthday0905.tbTask.tsk_msg_curtsk,tbBirthday0905.tbTask.tsk_msg_needcount, 7);
end
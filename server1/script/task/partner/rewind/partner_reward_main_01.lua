
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���彭��ͬ������ƪ�ű�ʵ�崦���ļ� - ����֮��
-- Edited by peres
-- 2005/09/09 PM 11:19

-- ֻ��������������
-- �����మ
-- ���ǵ�
-- �����ָ�Ħ������Ƥ���ϵ�����
-- ������������Ⱥ������ӹ�
-- ��������������ı���ͷ���
-- ����˯ʱ������ӳ�������
-- ���ǵã��峿���ѹ�����һ�̣������������
-- �������۾��������͸������һ��һ����������
-- ����������Ϊ�Ҹ�����ʹ

-- ======================================================

-- ͬ��ϵͳ��ͷ�ļ�
IncludeLib("PARTNER");

-- ͬ���������ͷ�ļ�
Include ("\\script\\task\\partner\\task_head.lua");

ID_PARMASTER_TALK_01 = 1256;  -- �Ƿ�����������ľ���Ի��Ŀ���

PARID_REWIND_ITEM_001 = 33;    -- �ػƲ�
PARID_REWIND_ITEM_002 = 34;    -- ��Ҷ
PARID_REWIND_ITEM_003 = 35;    -- ��Կ��
PARID_REWIND_ITEM_004 = 36;    -- Ⱦ�ι�
PARID_REWIND_ITEM_005 = 37;    -- ��Կ��

PARID_REWIND_WAITTIME = 38;   -- 5���ӵĵȴ�ʱ��


rewindProcess_001 = inherit(CProcess, {

	checkCondition = function(self)
		return 1;
	end,
	
	taskEntity = function(self, nCondition)
	
		local strMain = {
			"<npc>���������µ��Ӹ�������һ����ֵ����顣����ǰ��������������һ�����д��࣬�����ϻ�����그�ˣ�����Ŀ�����壬����ȥ��ò�Ƿ����������ǰ�����������ջ�еĸ��ֶ��������չˡ���һ�����꽻�ӵ�ҹ����˺�Ȼ��ɫ���ֵ��ҵ����Ǹ����ӣ�˵����һ�����ڲر�ͼ��Ƭ��Ī�����ܡ�ԭ����λ���˾�Ȼ�ǵ����������ɣ�����������������������Ͻ����ߡ�����ֵ��ǣ��ڶ����糿���ɴ��˺�Ȼ�޼����У���ϵ��������ϴ��ŵ����ֿ�ջ�ڽ����㷢Ӣ������Լ�������ټ�����Ӣ�۽⿪�����������صĲر�ͼ֮������£��Ҿ��ñ���Ҳ���и�Ī�����ı��һ��СС�Ľ������㣬���˽���Ӣ�۸�������֮���ı��������������������ģ��ƺ�ֻ��ʮ���������������е�ʮ�ţ�����ʮ��Ӣ����ȴ��֪���١����������ɵ�����֮�йأ��������ҳ�����������������ԭ���ֵ�һ���ƽ٣�",
			"����ƪ[���û�������������ͬ��]/#rewindProcess_001_01:doTaskEntity()",
			"����ƪ[����Ѿ������������ͬ��]/#rewindProcess_001_02:doTaskEntity()",
			"�Ҷ�����ӣ���Щ������/OnTaskExit"
		}
		
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		end;
		return 0;
	
	end,

});


-- ѡ������֮������ƪ[���û�������������ͬ��]
rewindProcess_001_01 = inherit(CProcess, {

	checkCondition = function(self)
		
		if GetRewindTaskState(PARID_TASK_REWIND_001)==nil then -- û��CALLͬ���������0
			return 0;
		elseif GetMasterTaskState(PARID_TASK_MASTER_001)<=4 then -- û����ɾ���ƪ�������
			return 4;
		elseif CheckRewindState(1)~=1 then -- �����������ж�����
			return 5;
		elseif GetRewindTaskState(PARID_TASK_REWIND_001)>=1 and GetRewindTaskState(PARID_TASK_REWIND_001)<5 then -- �Ѿ���ʼ������ķ���1
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_001)==5 then -- �Ѿ���ɹ�����ķ���2
			return 2;
		elseif GetRewindTaskState(PARID_TASK_REWIND_001)==0 then -- ����û�������������ķ���3
			return 3;
		end;
	end,
	
	taskEntity = function(self, nCondition)
	
		-- ��ʼ����ʱ�ĶԻ�
		local strMain = {
			"<npc>��ɴ��������ֵ��飬������Ӧ��֪��һЩ��Ϣ��",
			"��Ը���������/#rewindProcess_001_Accept:doTaskEntity()",
			"�����������/OnTaskExit"
		}
		
		-- û���������ĶԻ�
		local strMain_01 = {
			"<npc>�㻹û���������ɣ���׽��ʱ��ɣ�",
			"�����Ի�/OnTaskExit",
		}
		
		-- �Ѿ��������ĶԻ�
		local strMain_02 = {
			"<npc>���Ѿ���ɹ���������Ŷ��",
			"�����Ի�/OnTaskExit",		
		}

		if nCondition==1 then
			if GetRewindTaskState(PARID_TASK_REWIND_001)==4 then
				rewindProcess_001_Pay:doTaskEntity();
			else
				SelectDescribe(strMain_01);
			end;
			return 1;
		elseif nCondition==3 or nCondition==2 then
			SelectDescribe(strMain);
			return 1;
		elseif nCondition==4 then
			SelectDescribe({"<npc>�㻹û������������ľ���ƪŶ�����ܽ�����������",
							"�����Ի�/OnTaskExit"});
			return 1;
		elseif nCondition==0 then
			SelectDescribe({"<npc>�㻹û�д�����������ͬ����Ŷ��",
							"�����Ի�/OnTaskExit"});
			return 1;
		elseif nCondition==5 then
			SelectDescribe({"<npc>��������ÿ��ͬ��ÿ��ֻ��������Ŷ��",
							"�����Ի�/OnTaskExit"});
			return 1;
		end;
		
		return 0;
	
	end,

});


-- ����֮������������������������Ϊ 1
rewindProcess_001_Accept = inherit(CProcess, {
	
	-- ������Ϣ�������һ���Ľ���
	taskEntity = function(self, nCondition)
		
		if nCondition==1 then
			SetTask(ID_PARMASTER_TALK_01, 1);  -- ���öԻ���ʱ����
			Msg2Player("�����������֮������������");
			SetRewindTaskState(PARID_TASK_REWIND_001, 1);

			-- ���Ž���
			PayRewindAward(1, 1);

			-- ����������йص�״̬
			SetPartnerTask(PARID_REWIND_ITEM_001, 0);
			SetPartnerTask(PARID_REWIND_ITEM_002, 0);
			SetPartnerTask(PARID_REWIND_ITEM_003, 0);
			SetPartnerTask(PARID_REWIND_ITEM_004, 0);
			SetPartnerTask(PARID_REWIND_ITEM_005, 0);
			
			-- ������������ʼһ���µ���������Ĵ���
			SetRewindStart(1);

			return 1; 
		end;
		return 0;
	end,

});

-- ����֮��������������
rewindProcess_001_Pay = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_001)==4 then
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_001)==nil then
			return 2;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		
		strMain = {
			"<npc>����Ҳ�����������𣿽�������ȥ���ص���Ӣ��������ĸ��ַ׷�������һͬ��ս�����ֵܣ�ȴ���Լ������ˣ���������˵��Щ�ˣ���������Ӧ�õĽ�������Щʱ���������Ұɡ�����Ҫ����һ�¡�",
			"��ȡ����/#rewindProcess_001_PayAward:doTaskEntity()"
		}
		
		if nCondition==1 then 
			SelectDescribe(strMain);
			return 1;
		elseif nCondition==2 then
			SelectDescribe({"<npc>�㻹û�д�����������ͬ����Ŷ��",
							"�����Ի�/OnTaskExit"});
			return 1;
		end;
		return 0;
	end,

});


-- ����֮�����뽱�����������Ϊ 5
rewindProcess_001_PayAward = inherit(CProcess, {

	-- ������Ϣ�����Ľ���
	taskEntity = function(self, nCondition)
		Msg2Player("���Ѿ����������֮������������");
		SetRewindTaskState(PARID_TASK_REWIND_001, 5);
		SetTask(ID_PARMASTER_TALK_01, 0); -- ��������Ի��ı���		
		
		-- ���Ž���
		PayRewindAward(1, 8);
		
		-- ���ý������ɱ�־
		SetRewindFinish(1);
			
		return 1;
	end,
	
});


-- ����֮����������ȡ������
rewindProcess_001_Cancel = inherit(CProcess, {

	-- ����ȡ���������ʾ
	taskEntity = function(self, nCondition)
		Say("��ȷ��Ҫȡ������֮���ľ���������",2,
			"�ǵģ���̫ƣ����/#rewindProcess_001_Cancel_Confirm:doTaskEntity()",
			"�����ٿ���һ��/OnTaskExit");
		return 1;
	end,

});

-- ����֮����������ȡ������ȷ��
rewindProcess_001_Cancel_Confirm = inherit(CProcess, {

	-- ����ȡ���������ʾ
	taskEntity = function(self, nCondition)
		SetTask(ID_PARMASTER_TALK_01, 0); -- ��������Ի��ı���
		Msg2Player("���Ѿ�ȡ��������֮���ľ�������");
		return 1; 
	end,
	
});


-- �뾲��ʦ̫���Ի��������չΪ 2
rewindProcess_001_02 = inherit(CProcess, {

	checkCondition = function(self)
		-- �����չΪ 1�������Ѿ��Ӵ��񴦻����Ϣ������ͨ��
		if GetRewindTaskState(PARID_TASK_REWIND_001)==1 and GetTask(ID_PARMASTER_TALK_01)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		strMain = {
			"<npc>ʩ���������ڻ���������ƶ���������һ�ԣ�������飬�Ǽ��ס�Ҳ��������֮һ����ɽ�������һ��Ѫ��֮���ˡ���������һ�ַǳ���ֵ�ʪ�ȡ��������ϲ�ֻһ�˻����ز�����������ʪ������һ�ִ��ֽ���������ģ��������ڰ�ҹ��ʱ�����ľ����������͵͵��˯����ҧ�˵��Դ�����Ϊͷ���ڱΣ����Կ������ۼ�����ϧ���ǳ��ƻ���ƶ��û�а취׽���������߾������������У��һ���������ָʹ��������Ҫ�ҵ��ܽ�{������}Ѭ������{�ػƲ�}��{��Ҷ}��{Ⱦ�θ�}����Щ���������ڱ����ɽ����������������֣�һ�����ָ��ֽ�ȥ��������ȥ�޻أ���Ը��ȥ��",
			"�ǵģ����Ѿ�׼������/#rewindProcess_001_02_Accept:doTaskEntity()",
			"�����һ���Ҫ׼��һ��/OnTaskExit"
		}
		
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1; 
		end;
		return 0;
	end,

});


-- ����ȥ�����ͼ��ȷ��
rewindProcess_001_02_Accept = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		strMain = {
			"<npc>ɽ������ǿ���Ƽ���������ɽ�����ϲ��еػƲݣ����������ϲ��ŷ�Ҷ������Ҫ��ȡ��ʮ�ꡣȻ��ȥ���Ϸ��ֱ�ɱ������Կ�׵�ɽ����կ����ɽ����կ�����õ�����Կ��Ȼ��ȥ��ͼ���������֮�ţ��ҿ����˴�������ɽ�������жᵽΨһ��һ֧Ⱦ�ιǡ��������ܳɹ����Ƴ�ҩ�ģ���������������Ļ���ƶ�����������ɽ��",
			"����ˣ�����ȥ��/#rewindProcess_001_02_01:doTaskEntity()",
			"����׼��׼��/OnTaskExit"
		}
		SetRewindTaskState(PARID_TASK_REWIND_001, 2);
		SelectDescribe(strMain);
		
		-- ���Ž���
		PayRewindAward(1, 2);
		
		return 1;
	end,

});


-- ��ȥ�������ڵ�ͼ�Ĺ���
rewindProcess_001_02_01 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		NewWorld(514, 1552, 3308);
		SetFightState(1);
		return 1;
	end,

});


-- ɱ������ɽ���Ĵ������
rewindProcess_001_02_02 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_001)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	-- �� 1/2 �ĸ��ʵõ��ػƲݣ�������
	taskEntity = function(self, nCondition)
	
		local nItemNum = GetPartnerTask(PARID_REWIND_ITEM_001);

		if nCondition==1 and nItemNum<50 then
		
			SetPartnerTask(PARID_REWIND_ITEM_001, 
								 nItemNum + 1);
								 
			Msg2Player("��õ���һ��ػƲݣ������ڹ��� "..(nItemNum + 1).." �꣡");
		
			-- ���Ž���
			-- PayRewindAward(1, 3);
			
			AddOwnExp(CountDoubleMode(1000));
			AddPartnerExp(CountDoubleMode(200));
			
			return 1;
		end;
		return 0;
	end

});


-- ɱ�������ӵĴ������
rewindProcess_001_02_03 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_001)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	-- �� 1/2 �ĸ��ʵõ���Ҷ��������
	taskEntity = function(self, nCondition)
	
		local nItemNum = GetPartnerTask(PARID_REWIND_ITEM_002);
	
		if nCondition==1 and nItemNum<50 then
		
			SetPartnerTask(PARID_REWIND_ITEM_002, 
								 nItemNum + 1);
								 
			Msg2Player("��õ���һ���Ҷ�������ڹ��� "..(nItemNum + 1).." ���Ҷ��");

			-- ���Ž���
			-- PayRewindAward(1, 4);

			AddOwnExp(CountDoubleMode(1000));
			AddPartnerExp(CountDoubleMode(200));
						
			return 1;
		end;
		return 0;
	end

});


-- ɱ����կ���õ�һ��Կ��
rewindProcess_001_02_04 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_001)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	-- �õ�һ��Կ��
	taskEntity = function(self, nCondition)

		local nItemNum = GetPartnerTask(PARID_REWIND_ITEM_003);
		
		if nCondition==1 then
		
			if nItemNum>=1 then return 0; end;
			
			SetPartnerTask(PARID_REWIND_ITEM_003, 
								 nItemNum + 1);
								 
			Msg2Player("��õ���һ����������״��Կ�ף�");

			-- ���Ž���
			PayRewindAward(1, 5);

			return 1;
		end;
		return 0;	
	end

});


-- ɱ����կ���õ�һ��Կ��
rewindProcess_001_02_05 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_001)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	-- �õ�һ��Կ��
	taskEntity = function(self, nCondition)

		local nItemNum = GetPartnerTask(PARID_REWIND_ITEM_005);
		
		if nCondition==1 then

			if nItemNum>=1 then return 0; end;
			
			SetPartnerTask(PARID_REWIND_ITEM_005, 
								 nItemNum + 1);
								 
			Msg2Player("��õ���һ����������״��Կ�ף�");
			
			-- ���Ž���
			PayRewindAward(1, 5);
			
			return 1;
		end;
		return 0;
	end

});


-- ɱ��ɽ�����õ�Ⱦ�ι�
rewindProcess_001_02_KillBoss = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_001)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	-- �õ�Ⱦ�ι�
	taskEntity = function(self, nCondition)
	
		local nItemNum = GetPartnerTask(PARID_REWIND_ITEM_004);
		
		if nCondition==1 then
		
			if nItemNum>=1 then return 0; end;

			SetPartnerTask(PARID_REWIND_ITEM_004, 
								 nItemNum + 1);
								 
			Msg2Player("��õ���һ��Ⱦ�ιǣ�");
			
			-- ���Ž���
			PayRewindAward(1, 6);
			
			return 1;
		end;
		return 0;	
	end

});



-- �뿪����һ�ĶԻ�
rewindProcess_001_02_UnLock = inherit(CProcess, {
	checkCondition = function(self)
	
		local nKey_1 = GetPartnerTask(PARID_REWIND_ITEM_003);
		local nKey_2 = GetPartnerTask(PARID_REWIND_ITEM_005);
		
		if nKey_1==nil or nKey_2==nil then return end;
		
		if nKey_1>=1 and nKey_2>=1 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SelectDescribe({"<npc>���������ŵ�Կ�׾�����ʵ����ƾ֤������������ȥ������ս�ɣ�",
							"�ã������ҽ�ȥ��/#rewindProcess_001_02_Inside:doTaskEntity()",
							"����׼��һ��/OnTaskExit"
							});
		else
			SelectDescribe({"<npc>�����������λկ�����õ�����Կ�׺��������Ұɣ�",
							"�����Ի�/OnTaskExit"
							});
		end;
		return 1;
	end,

});


-- ���ͽ�ȥ�Ĺ���
rewindProcess_001_02_Inside = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetPos(1816,3227);
		SetFightState(1);
		return 1;
	end,
});


-- �뿪���˶��ĶԻ�
rewindProcess_001_02_SendMan = inherit(CProcess, {

	checkCondition = function(self)
		return 1;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then	
			SelectDescribe({"<npc>���������ȥ����",
							"�����ҳ�ȥ��/#rewindProcess_001_02_Outside:doTaskEntity()",
							"�ٵȵ�/OnTaskExit",
							});
		end;
		return 1;
	end,

});

-- ���ͳ�ȥ�Ĺ���
rewindProcess_001_02_Outside = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetPos(1794,3193);
		SetFightState(0);
		return 1;
	end,
});


-- �����뾲��ʦ̫���Ի�
rewindProcess_001_02_06 = inherit(CProcess, {
	checkCondition = function(self)
		
		local nTaskState = GetRewindTaskState(PARID_TASK_REWIND_001);
		local nItem_01 = GetPartnerTask(PARID_REWIND_ITEM_001);
		local nItem_02 = GetPartnerTask(PARID_REWIND_ITEM_002);
		local nItem_03 = GetPartnerTask(PARID_REWIND_ITEM_003);
		local nItem_04 = GetPartnerTask(PARID_REWIND_ITEM_004);
		local nItem_05 = GetPartnerTask(PARID_REWIND_ITEM_005);
		
		if nTaskState==2 and nItem_01>=50 and nItem_02>=50 and nItem_04>=1 then
			return 1;
		elseif nTaskState==2 then
			return 2;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		strMain = {
			"<npc>�����ӷ�ʩ������Ѫ��ӯĿ������������ƶ���ֶ����¼���ɱ���������������������������������������������ֶξ�����ˮ�𣬾���ƶ�������˾Ų㰢�ǵ����ɡ�ҩ�Ķ����뱸��ʩ����{����Щʱ������}��ƶ����׼��Ѭ�����ߵ������ˡ�",
			"�����Ի�/#rewindProcess_001_02_07:doTaskEntity()"
		}
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		elseif nCondition==2 then
			rewindProcess_001_02_Accept:doTaskEntity();
			return 1;
		end;
		return 0;
	end

});

-- ��ʼ����ӵı������棬�����չΪ 3
rewindProcess_001_02_07 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SetPartnerTask(PARID_REWIND_WAITTIME, GetGameTime());
		SetRewindTaskState(PARID_TASK_REWIND_001, 3);
		return 1;
	end,

});

-- �����֮������ĶԻ���������������������չΪ 4
rewindProcess_001_02_08 = inherit(CProcess, {

	checkCondition = function(self)
		-- ��Լ���� 5 ���ӣ�����׼ȷ��ϵͳʱ��
		if GetRewindTaskState(PARID_TASK_REWIND_001)==3 and GetGameTime() - GetPartnerTask(PARID_REWIND_WAITTIME) >= 350 then
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_001)==3 then
			return 2;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		strMain = {
			"<color=green>����ʦ̫<color>����Ȼ����Ȼ�������ߣ�ͷ���л������ӡ��ֻ���置�����а�����",
			"�ո�һö����ɫ�ĸ�����ת�Ŵ�������ٶ�֮���ֱ����˼�顣���ھ���ʦ̫�����ѱ���͸�������޷�˵���ˡ����Ȼ�{����}����������ɣ���Щ����������"
		}
		
		if nCondition==1 then
			SetRewindTaskState(PARID_TASK_REWIND_001, 4);
			TalkEx("", strMain);
			
			-- ���Ž���
			PayRewindAward(1, 7);
			
			return 1;
		elseif nCondition==2 then
			SelectDescribe({"<npc>�����������������ֵ�С�ģ�ʩ��Ī���������Ե�Ƭ�̰ɣ�",
							"�����Ի�/OnTaskExit"
							});
			return 1;
		end;
		return 0;
	end,

});




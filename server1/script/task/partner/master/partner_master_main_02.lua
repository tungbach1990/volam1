
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���彭��ͬ�����ű�ʵ�崦���ļ� - ������֮��
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
IncludeLib("PARTNER")

-- ͬ���������ͷ�ļ�
Include ("\\script\\task\\partner\\task_head.lua");

ID_PARTASK_PASSED = 1262;

BIT_PASSED_001 = 1;
BIT_PASSED_002 = 2;
BIT_PASSED_003 = 3;

BIT_PASSED_STATE = 5; -- ��¼�Ƿ����ʹ����ļ��

-- ��ʼ����ʱ�ĶԻ�
taskProcess_002_01 = inherit(CProcess, {

	checkCondition = function(self)
		
		local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		
		-- �����Һ�ͬ��ĵȼ�
		if GetLevel()<80 or PARTNER_GetLevel(partnerindex)<20 then return 4; end;
		
		if GetMasterTaskState(PARID_TASK_MASTER_002)==nil then  -- û�д�ͬ��
			return 0;
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)==0 then -- ��һ�ο�ʼ��
			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)>=1 and GetMasterTaskState(PARID_TASK_MASTER_002)<=5 then -- �Ѿ���ʼ���� 
			return 2;
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)>=6 then -- �Ѿ������
			return 3;
		end;
	end,
	
	taskEntity = function(self, nCondition)

		-- ��ʼ����ʱ�ĶԻ�
		local strMain = {
			"<npc>ǰ������������ʦ̫�ܵ��˾��������ѽ�����������������ץס��������ͷ���л����ǣ�������ô�������ߣ�Ω���置�����˲�������ͷ�����Ż����Ƶ���������Ӧ��ȥ{����}��һ����Ҳ����������֡���˵{������ڵĲ販ʿ}����Щ�����ƶ��ļһ���Ϊ�˽⣬�����������æ��̽���������ڲ����������ǻ��������´��������Լ�Ҫ���С�ġ�",
			"��������/#taskProcess_002_Accept:doTaskEntity()",
			"���ٿ���һ��/OnTaskExit",
		}
		
		local strMain_01 = {
			"<npc>ǰ������������ʦ̫�ܵ��˾��������ѽ�����������������ץס��������ͷ���л����ǣ�������ô�������ߣ�Ω���置�����˲�������ͷ�����Ż����Ƶ���������Ӧ��ȥ{����}��һ����Ҳ����������֡���˵{������ڵĲ販ʿ}����Щ�����ƶ��ļһ���Ϊ�˽⣬�����������æ��̽���������ڲ����������ǻ��������´��������Լ�Ҫ���С�ġ�",
			"���Ѿ����������/#taskProcess_002_Pay:doTaskEntity()",	
			"�һ�û�����/OnTaskExit"		
		}
		
		local strMain_02 = {
			"<npc>������������б��ֺܺã��������ˣ�",
			"�����Ի�/OnTaskExit",
		}
		
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		elseif nCondition==2 then
			SelectDescribe(strMain_01);	
			return 1;
		elseif nCondition==3 then
			SelectDescribe(strMain_02);
			return 1;
		elseif nCondition==4 then
			SelectDescribe({"<npc>���������Ҫ��ĵȼ��� {80 ��}���ϣ��������ͬ��ȼ�Ҫ�� {20 ��}���ϣ�",
							"�����Ի�/OnTaskExit",
							});	
			return 1;
		elseif nCondition==0 then
			SelectDescribe({"<npc>�㻹û���ٻ���ͬ�飬���޷�����ָ������",
							"�����Ի�/OnTaskExit"
							});
			return 1;
		end;
		return 0;
		
	end,

});

-- ��������ʱ�Ĵ��������չΪ 1
taskProcess_002_Accept = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 1);
		Msg2Player("��ӵ��˿�����֮�ص�ͬ���������");
		
		-- ���Ž���
		PayMasterAward(2, 1);
		
		return 1;
	end,

});


-- ������ʱ�Ĵ���
taskProcess_002_Pay = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_002)>=5 then
			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)==nil then
			return 2;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SelectDescribe({
				"<npc>�ţ���Ȼ����������ô��������Ϣ�ɡ���Ϊ��Цͼ����ôЩ���ˣ�����������ЩС���顣Ŷ��Цͼ�����ڴ����������λ�販ʿ����ԭ�����ƹ�һ�������ŷ�ɥ���Ķ��д�������ֿ�������ֹС��ҹ�޵ģ��Ǻǡ�",
				"��ȡ����/#taskProcess_002_PayAward:doTaskEntity()"
			});
		elseif nCondition==2 then
			SelectDescribe({"<npc>�㻹û���ٻ�������������ͬ��Ŷ��",
				"�����Ի�/OnTaskExit"
			});
			return 1;
		else
			SelectDescribe({
				"<npc>�㻹û������Ҹ��������ɣ�",
				"�����Ի�/OnTaskExit"
			});
		end;
		return 1;
	end,

});


-- ��ȡ�������������չΪ 6
taskProcess_002_PayAward = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 6);
		Msg2Player("���Ѿ�����˿�����֮�ص�����");
		
		-- ���Ž���
		PayMasterAward(2, 5);
		
		return 1;
	end;
});


-- ��販ʿ�ĶԻ�
taskProcess_002_02 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_002)==1 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		local strMain = {
			"<npc>��������ү�������𣿶������Ǵ��������У���Щ����ȷʵ�����ߵĴ�ͳ��������ͷ���л����ǵĵ���û����˵�������ǣ��������ڹ�����ֹ���ػ�֮�۰�����һ���л����ƶ�����������ʱ�򣬳������˳����������ĸɺ����Ǵ����˶����˰����꣬���ĸ�ǽ�ж�����������̸��"..
			"����������úܣ�а�úܣ������������Լ����������ʹ�Ҳ������ġ�����Ȼ����ү�ķԸ����Ҳ��ܲ��졣���������˼Ҿȹ���ȫ����������Ҫ�ǰ��ˣ�����������Ҳ�ʹ��ȥ�ˡ��Ұ����û�����⣬����������д��{������}���ֱ��Ǹ��ҵ��޶��������ϸ�ĸ��ֻҪ����ƽ������Ҳ��û��ǣ�ҡ���ֻҪ��{������}��{��վ��Ա}��ͨ�����������񣬷ֱ��{��֮��}��{ɽ����}��{ǧ����}�������ط������ʹ��Ҽ�С���ڵص���ٴ����ٻ������Ҿͺá���ȥ�ɣ��һ���Ҫ��Щ׼����������Щ���ڴ�����µĹ�ϵ�������Ͽ���",
			"�����Ի�/#taskProcess_002_03:doTaskEntity()",
		}
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		end;
		return 0;
	end,
	
});


-- ��販ʿ�Ի���ı������������չΪ 2
taskProcess_002_03 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 2);
		
		-- ���Ž���
		PayMasterAward(2, 2);
	
	end,

});


-- ����ٵĶԻ�
taskProcess_002_04 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_002)==2 then
			return 1;
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)==3 then
			return 2
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)==4 then
			return 3
		elseif GetMasterTaskState(PARID_TASK_MASTER_002)==nil then
			return 4;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
	
		local nPassed_1 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
		local nPassed_2 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
		local nPassed_3 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);
		
		if nCondition==1 then
			SelectDescribe({"<npc>Ŷ��ԭ������������¡���Щ�������ų�͢�ֿ���У������˴�֮�ˡ��ðɣ����̴������ｫ�ŷֱ�ӷ�֮�ɽ�����ǧ������������ͼ�͹�ȥ��",
							"�����Ի�/#taskProcess_002_05:doTaskEntity()"
							});
			return 1;
		elseif nCondition==2 then
		
			if nPassed_1>=1 and nPassed_2>=1 and nPassed_3>=1 then
				SelectDescribe({"<npc>�������Ѿ����販ʿ�����˵������Ŷ��͵��ˣ����ϻ�ȥ�����ɡ����ء�",
								"�����Ի�/#taskProcess_002_10:doTaskEntity()"
								});
			else
				SelectDescribe({"<npc>�㻹û�а����������͵��𣿼��Ͱɣ�",
								"�����Ի�/OnTaskExit"
								});
			end;
			
			return 1;
		elseif nCondition==3 then
			SelectDescribe({"<npc>�������Ѿ����販ʿ�����˵������Ŷ��͵��ˣ����ϻ�ȥ�����ɡ����ء�",
							"�����Ի�/OnTaskExit"
							});
			return 1;
		elseif nCondition==4 then
			SelectDescribe({"<npc>�ƺ��㻹û���ٻ���ͬ��Ŷ��",
							"�����Ի�/OnTaskExit"
							});
			return 1;			
		end;
		return 0;
	end,
		
});

-- ����ٶԻ������������չΪ 3
taskProcess_002_05 = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 3);
		
		-- ����״̬����ʼ�����ʹ�����������		
		SetTask(ID_PARTASK_PASSED, 
				SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_STATE, 1)
				);

		return 1;
	end,
});


-- ����������ٵĶԻ��������ı��������Ϊ��4
taskProcess_002_10 = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 4);
		Msg2Player("���Ѿ�������������񣬿��Ի�ȥ�Ҳ販ʿ�ˣ�");

		-- ���Ž���
		PayMasterAward(2, 3);
		
		-- ����״̬�����������ʹ�����������		
		SetTask(ID_PARTASK_PASSED, 
				SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_STATE, 0)
				);
				
		-- ���֮ǰ������״̬
		SetTask(ID_PARTASK_PASSED, 
				SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001, 0)
				);
		SetTask(ID_PARTASK_PASSED, 
				SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002, 0)
				);
		SetTask(ID_PARTASK_PASSED, 
				SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003, 0)
				);
		return 1;	
	end,
});



-- ��֮����������
taskProcess_002_06 = inherit(CProcess, {

	checkCondition = function(self)
		
		local nState = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_STATE);
		local nBit = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
		
		if nState==1 and nBit==0 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		local nPassed_1 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
		local nPassed_2 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
		local nPassed_3 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);

		if nCondition==1 then
			Msg2Player("���Ѿ�����˲販ʿ������ķ�֮����������");
			
			-- ����λ��Ϊ 1����ʾ�Ѿ����
			SetTask(ID_PARTASK_PASSED, 
					SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001, 1)
					);
			SyncTaskValue(ID_PARTASK_PASSED);

			local nPassed_1 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
			local nPassed_2 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
			local nPassed_3 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);
					
			if nPassed_1>=1 and nPassed_2>=1 and nPassed_3>=1 then
				Msg2Player("<color=yellow>���Ѿ���������е���ʹ�������ٻ���ͬ����������ٽ�����ɣ�<color>");
			end;
			
		end;
	end,

});

-- ɽ������������
taskProcess_002_07 = inherit(CProcess, {

	checkCondition = function(self)
		local nState = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_STATE);
		local nBit = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
		
		if nState==1 and nBit==0 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)

		if nCondition==1 then
			Msg2Player("���Ѿ�����˲販ʿ�������ɽ������������");
			
			-- ����λ��Ϊ 1����ʾ�Ѿ����
			SetTask(ID_PARTASK_PASSED, 
					SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002, 1)
					);
			SyncTaskValue(ID_PARTASK_PASSED);

			local nPassed_1 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
			local nPassed_2 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
			local nPassed_3 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);
			
			if nPassed_1>=1 and nPassed_2>=1 and nPassed_3>=1 then
				Msg2Player("<color=yellow>���Ѿ���������е���ʹ�������ٻ���ͬ����������ٽ�����ɣ�<color>");
			end;
			
		end;
	end,

});


-- ǧ������������
taskProcess_002_08 = inherit(CProcess, {

	checkCondition = function(self)
		
		local nState = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_STATE);
		local nBit = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);
		
		if nState==1 and nBit==0 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
	
		if nCondition==1 then
			Msg2Player("���Ѿ�����˲販ʿ�������ǧ������������");
			
			-- ����λ��Ϊ 1����ʾ�Ѿ����
			SetTask(ID_PARTASK_PASSED, 
					SetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003, 1)
					);
					
			SyncTaskValue(ID_PARTASK_PASSED);

			local nPassed_1 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_001);
			local nPassed_2 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_002);
			local nPassed_3 = GetBit(GetTask(ID_PARTASK_PASSED), BIT_PASSED_003);

			if nPassed_1>=1 and nPassed_2>=1 and nPassed_3>=1 then
				Msg2Player("<color=yellow>���Ѿ���������е���ʹ�������ٻ���ͬ����������ٽ�����ɣ�<color>");
			end;
					
		end;
	end,

});

-- �ص��販ʿ���ĶԻ�
taskProcess_002_11 = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_002)==4 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		local strMain = {
			"<npc>��������������ȿȣ����ֶ����ǳ��ϸ߼������һ����������ǰ����ð��ȥ��̽����������ԭ������ïʢ�������ֶ��ѿݺڽ�����ë����������Ϊ��ǿ��Ҳ�ֲ�ס�߶���������������������֮���Ѿ��������ҵ������Ҵ�һ�����������֪��ǰ���ӴӸ߼������ػ�֮�۵����볯͢�кܴ�Ĺϸ𡣳�͢��Ȼ���Ầ�Լ������ڣ���ô��������ڳ�͢�����������֮�ϲ�Ϳ��Լ��������ˡ�������˭���ߵ�����û�в鵽����������������������������ү���ֶΣ����ܲ�ó���������ߣ����ߣ������Ѿ�֪�������ڲ�̽���£���������������װ��������ˣ�����������ǣ�������Σ�ա�����ҹ����Źر�ǰ������뿪����������ү��һ�оͰ�ȫ�ˡ�",
			"�����Ի�/#taskProcess_002_12:doTaskEntity()",
		}
		if nCondition==1 then
			SelectDescribe(strMain);
			return 1;
		end;
		return 0;
	end,

});


-- ��販ʿ�ĶԻ��������ı��������Ϊ��5
taskProcess_002_12 = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_002, 5);
		Msg2Player("���Ѿ�����˲販ʿ����������Ի�ȥ�������ˣ�");
		
		-- ���Ž���
		PayMasterAward(2, 4);
		
		return 1;	
	end,
});



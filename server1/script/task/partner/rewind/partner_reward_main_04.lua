
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���彭��ͬ�����ű�ʵ�崦���ļ� - ������ʿ
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


PARID_REWIND04_BOSS_01 = 43;  -- ��èè
PARID_REWIND04_BOSS_02 = 44;  -- ����
PARID_REWIND04_BOSS_03 = 45;  -- �幫��
PARID_REWIND04_BOSS_04 = 46;  -- ����

-- ��ʼ����ʱ�ĶԻ�
rewindProcess_004_01 = inherit(CProcess, {

	checkCondition = function(self)
	
		local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�		
		
		-- �����Һ�ͬ��ĵȼ�
		if GetLevel()<100 or PARTNER_GetLevel(partnerindex)<40 then return 4; end;
	
		if GetRewindTaskState(PARID_TASK_REWIND_004)==nil then  -- û�д�ͬ��
			return 0;
		elseif GetMasterTaskState(PARID_TASK_MASTER_004)<=2 then -- û����ɾ���ƪ�������
			return 5;
		elseif CheckRewindState(4)~=1 then -- �����������ж�����
			return 6;
		elseif GetRewindTaskState(PARID_TASK_REWIND_004)==0 then -- ��һ�ο�ʼ��
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_004)>=1 and GetRewindTaskState(PARID_TASK_REWIND_004)<3 then -- �Ѿ���ʼ���� 
			return 2;
		elseif GetRewindTaskState(PARID_TASK_REWIND_004)>=3 then -- �Ѿ������
			return 3;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 or nCondition==3 then
			SelectDescribe({"<npc>{�ٰ�}��{�鱦���˶���}����������һ�����š�����˵�ǿ����������ֱ��ڵı�ʯ��ֵ���ǣ�����������𲻻���ϡ���䱦�����������������ߺ����ؽ��������彳����һ��һ�ĸ��ֵ��ƣ���������һ���ʱ�����ĥ�����Ź�����͸�ı��顣���������飬���Ǳ�һλ����������ȥ�ˣ���˵��������һ���аٻ��ȵĵط����Ǹ��ط�������˵���ģ�����ͽ�������˵���ڽ���ֱ���������������֣���Ȼ�и��˾�ס��ֻ�����������鷢���Ժ��Ǹ��ط����Ե������ˡ����϶�����бؽ������ջ񣬲�����������׼���������˹����ҵ��Ǹ�����һ�����ˡ�",
							"��������/#rewindProcess_004_Accept:doTaskEntity()",
							"���ٿ���һ��/OnTaskExit",
							});
			return 1;
		elseif nCondition==2 then
			SelectDescribe({"<npc>��������Ҹ������������",
							"������ȥ�ٻ��Ȱ�/#rewindProcess_004_GotoWorld:doTaskEntity()",
							"�������/#rewindProcess_004_Finish:doTaskEntity()",
							"�һ�û�����/OnTaskExit"
							});
			return 1;
		elseif nCondition==4 then
			SelectDescribe({"<npc>���������Ҫ��ĵȼ��� {100 ��}���ϣ��������ͬ��ȼ�Ҫ�� {40 ��}���ϣ�",
							"�����Ի�/OnTaskExit",
							});		
			return 1;
		elseif nCondition==5 then
			SelectDescribe({"<npc>�㻹û������������ľ���ƪŶ�����ܽ�����������",
							"�����Ի�/OnTaskExit"});
			return 1;
		elseif nCondition==6 then
			SelectDescribe({"<npc>��������ÿ��ͬ��ÿ��ֻ��������Ŷ��",
							"�����Ի�/OnTaskExit"});
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


-- ���������������Ϊ 1
rewindProcess_004_Accept = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>��������ȥ�ٻ������ҿ�������һ�ǡ�",
						"�ǵģ��鷳����/#rewindProcess_004_GotoWorld:doTaskEntity()",
						"������׼��׼����/OnTaskExit"});
		Msg2Player("��ӵ���������ʿ��ͬ����������");
		SetRewindTaskState(PARID_TASK_REWIND_004, 1);
		
		-- ���Ž���
		PayRewindAward(4, 1);
		
		-- ������������ʼһ���µ���������Ĵ���
		SetRewindStart(4);

		return 1;
	end,
});


-- ���͵��ٻ��ȵĹ���
rewindProcess_004_GotoWorld = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		NewWorld(513,1500,3158);
		SetFightState(1);
	end,
	
});


-- ��������������Ϊ 3
rewindProcess_004_Finish = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_004)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
	
		if nCondition==1 then
			SelectDescribe({"<npc>�����ģ�������õ�������Ӣ���������һ�������Ǳ���Բμ�����Ӣ�ۻᣬ�����ҿ��������֮���ˡ��ȴ�����ô�ã�������ô���˵��������չ���λ�˻�����һ�������������������������Ѫ��̫��̫���ˣ�ϣ����ʱ��һ�������ɣ��ܹ������ɽ����ǹ��⣬������Ҳ������ѰһƬ�ݳ�����������飬������������հװ׵��Ʋʣ��������˴˲��������ھ���Ӣ�ۻỹ��һ��ʱ�䣬����Ի�ȥ����Щ�����ˡ������˼����£�����Ȼ�������㣬���أ�",
							"�����Ի�/OnTaskExit"});
			SetRewindTaskState(PARID_TASK_REWIND_004, 3);
			
			Msg2Player("���Ѿ������������ʿ����������");
			
			-- ���Ž���
			PayRewindAward(4, 7);
			
			-- ���ý������ɱ�־
			SetRewindFinish(4);
			
			-- ����������йص�״̬
			SetPartnerTask(PARID_REWIND04_BOSS_01, 0);
			SetPartnerTask(PARID_REWIND04_BOSS_02, 0);
			SetPartnerTask(PARID_REWIND04_BOSS_03, 0);
			SetPartnerTask(PARID_REWIND04_BOSS_04, 0);
		
			return 1;
		else
			SelectDescribe({"<npc>�ҽ�����������㻹û�����Ŷ�����Ͱɡ�",
							"�����Ի�/OnTaskExit"});
			return 1;
		end;
	end,
});


-- ɱ����èè�Ĵ���
rewindProcess_004_Boss_01 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_004)==1 then
			return 1;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPartnerTask(PARID_REWIND04_BOSS_01, 1);
			Msg2Player("���Ѿ�ɱ������èè��");
			
			-- ���Ž���
			PayRewindAward(4, 2);
			
			return 1;
		end;
	end,
});


-- ɱ�����ɵĴ���
rewindProcess_004_Boss_02 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_004)==1 then
			return 1;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPartnerTask(PARID_REWIND04_BOSS_02, 1);
			Msg2Player("���Ѿ�ɱ�������ɣ�");
			
			-- ���Ž���
			PayRewindAward(4, 3);
			
			return 1;
		end;
	end,
});


-- ɱ���幫�ӵĴ���
rewindProcess_004_Boss_03 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_004)==1 then
			return 1;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPartnerTask(PARID_REWIND04_BOSS_03, 1);
			Msg2Player("���Ѿ�ɱ�����幫�ӣ�");
			
			-- ���Ž���
			PayRewindAward(4, 4);
						
			return 1;
		end;
	end,
});


-- ɱ������Ĵ���
rewindProcess_004_Boss_04 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_004)==1 then
			return 1;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPartnerTask(PARID_REWIND04_BOSS_04, 1);
			Msg2Player("���Ѿ�ɱ�������㣡");
			
			-- ���Ž���
			PayRewindAward(4, 5);
			
			return 1;
		end;
	end,
});


-- ɱ����Х���Ĵ���
rewindProcess_004_Boss_05 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_004)==1 then
			return 1;
		else
			return 0;
		end;
	end,

	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPartnerTask(PARID_REWIND04_BOSS_04, 1);
			Msg2Player("���Ѿ�ɱ������Х����");
			
			-- ���Ž���
			PayRewindAward(4, 8);
			
			return 1;
		end;
	end,
});


-- ����һ�ĶԻ�����������������������Ϊ 2
rewindProcess_004_02 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		
		local nNum_1 = GetPartnerTask(PARID_REWIND04_BOSS_01);
		local nNum_2 = GetPartnerTask(PARID_REWIND04_BOSS_02);
		local nNum_3 = GetPartnerTask(PARID_REWIND04_BOSS_03);
		local nNum_4 = GetPartnerTask(PARID_REWIND04_BOSS_04);
		
		if nNum_1==1 and nNum_2==1 and nNum_3==1 and nNum_4==1 and GetRewindTaskState(PARID_TASK_REWIND_004)==1 then
			SelectDescribe({"<npc>лл�����ҽ����Σ�ա���Ȼ����ү���ˣ���������һ���������и��㡣�������ҵĺ��ѣ������������Ҵ�Ϊ���ܣ��������Ҳ���ˣ�������������֮���ã����Ǹ����鷳�������ȥ�ɡ����ˣ���Ȼ���ǰ���֮�ˣ�������ڻ�������һλ��ʱ�������µĸ��֣������������Ѿá�������˵�ö�����˵�����ᴫһ�ž�������ɡ�",
							"�����Ƚ����ͻ�ȥ��/#rewindProcess_004_02_SendMan:doTaskEntity()",
							"�����Ի�/OnTaskExit"});
			SetRewindTaskState(PARID_TASK_REWIND_004, 2);

			-- ���Ž���
			PayRewindAward(4, 6);
			
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_004)==2 then
			rewindProcess_004_02_SendMan:doTaskEntity();
			return 1;
		else
			SelectDescribe({"<npc>�����������������������ұ��������޷�������ǣ������ǳ���ȥ�ġ�",
							"�����Ի�/OnTaskExit"
							});
			return 1;
		end;
	end,
		
});


rewindProcess_004_02_SendMan = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>��Ҫ�뿪��������",
						"�ǵģ��������߰�/#rewindProcess_004_02_Send:doTaskEntity()",
						"�ٵȵ�/OnTaskExit"
						});
		return 1;
	end,
});



rewindProcess_004_02_Send = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		NewWorld(176,1376,3333);
		SetFightState(0);
	end,
});
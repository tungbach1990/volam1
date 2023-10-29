
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���彭��ͬ�����ű�ʵ�崦���ļ� - �鱦��������ƪ
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

PARID_REWIND_KILLER_01 = 39;  -- һƷ��ǹ��
PARID_REWIND_KILLER_02 = 40;  -- һƷ�ù���
PARID_REWIND_KILLER_03 = 41;  -- һƷ�ô�������
PARID_REWIND_KILLER_04 = 42;  -- ��ʿ

GLBID_MASTER_KILLER_NUM = 830; -- ������ȫ�ֱ�������¼һƷ��ͳ˧��ˢ������


-- ��ʼ����ʱ�ĶԻ�
rewindProcess_003_01 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_003)==nil then  -- û�д�ͬ��
			return 0;
		elseif GetMasterTaskState(PARID_TASK_MASTER_003)<5 then -- û����ɾ���ƪ�������
			return 4;
		elseif CheckRewindState(3)~=1 then -- �����������ж�����
			return 5;
		elseif GetRewindTaskState(PARID_TASK_REWIND_003)==0 then -- ��һ�ο�ʼ��
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_003)>=1 and GetRewindTaskState(PARID_TASK_REWIND_003)<5 then -- �Ѿ���ʼ���� 
			return 2;
		elseif GetRewindTaskState(PARID_TASK_REWIND_003)==5 then -- �Ѿ������
			return 3;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 or nCondition==3 then
			SelectDescribe({"<npc>����ҵ�������������Բ��Щ���ߡ��������ʯȥ�ٰ��ұ���ի��������������ڣ������ĵܵܶ���Ҳ��һ���ġ�",
							"��������/#rewindProcess_003_Accept:doTaskEntity()",
							"���ٿ���һ��/OnTaskExit",
							});
			return 1;
		elseif nCondition==2 then
			SelectDescribe({"<npc>�������ʯȥ�ٰ��ұ���ի��������������ڣ������ĵܵܶ���Ҳ��һ���ġ�",
							"�������/#rewindProcess_003_Finish:doTaskEntity()",
							"�һ�û�����/OnTaskExit",
							});
			return 1;
		elseif nCondition==4 then
			SelectDescribe({"<npc>�㻹û������������ľ���ƪŶ�����ܽ�����������",
							"�����Ի�/OnTaskExit"});
			return 1;
		elseif nCondition==5 then
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
rewindProcess_003_Accept = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SetRewindTaskState(PARID_TASK_REWIND_003, 1);
		Msg2Player("��ӵ����鱦���˵�ͬ����������");
		
		-- ���Ž���
		PayRewindAward(3, 1);
		
		-- ������������ʼһ���µ���������Ĵ���
		SetRewindStart(3);
			
		return 1;
	end,

});


-- ������񣬷��轱�����������Ϊ 5
rewindProcess_003_Finish = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_003)==4 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		
		if nCondition==1 then
			SelectDescribe({"<npc>�ţ����ڽ����齻������������Խ��Խ�������������ҿ��Ŵ������Ҷ������ʱ����úܿ졣��ôЩ���ƴɱ������������һ�������꣬�ٻ�ͷ��ʲô���ǿյġ������ˣ������չ�������ǵģ����Ͱɡ�",
							"�����Ի�/OnTaskExit"
							});
			SetRewindTaskState(PARID_TASK_REWIND_003, 5);
			
			-- ���Ž���
			PayRewindAward(3, 8);		
				
			-- ���ý������ɱ�־
			SetRewindFinish(3);
			
			-- ����������йص�״̬
			SetPartnerTask(PARID_REWIND_KILLER_01, 0);
			SetPartnerTask(PARID_REWIND_KILLER_02, 0);
			SetPartnerTask(PARID_REWIND_KILLER_03, 0);
			SetPartnerTask(PARID_REWIND_KILLER_04, 0);
			
			return 1;
		else
			SelectDescribe({"<npc>�ҽ�����������㻹û�����Ŷ�����Ͱɡ�",
							"�����Ի�/OnTaskExit"
							});
			return 0;			
		end;
	end,	
	
});


-- �붡�ڵĶԻ�
rewindProcess_003_02 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_003)==1 then
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_003)==2 then
			return 2;
		else
			return 0;
		end
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SelectDescribe({"<npc>������飬���������ô����������Ŷ���ǽ��������������Ĳ������������ʵ����ӱֺ���ʮ�������ܹ����۲���ʮ�š����϶��������ֳ����������ù����룬����ޱȡ�����������Ҳ���������˵��ȥ���ɵ��ֱ�������һ�ţ��Ҳ�֪������Ĳ�֪�����ⷽ������飬�ֳ��Ӳ����Ҳ��֡�ԭ���ֳ�����һ�����࣬��ʱ���û����ˡ���ǰ������ϼ���ϴ�������Ϣ���ֳ����˸�������Ʊ����ϼ��ʲôʱ��̫ƽ������͢�����ɨ��ƽ���������Է����ھ�����ǧ�������ӣ������ô�Ǻã�����ô�Ǻð�����ʿԸ��ﶡĳ���æ�����ֳ���ƽ�������������������ȥ����Ȼ���������",
							"�ǵģ���Ը�������ȥ��ϼ�����/#rewindProcess_003_Select01:doTaskEntity()",
							"����򵥣��Ұ��������ǧ����������/#rewindProcess_003_Select02:doTaskEntity()",
							"��������������/OnTaskExit"
							});
			return 1;
		elseif nCondition==2 then
			rewindProcess_003_SendMan:doTaskEntity();
			return 1;
		end;
		return 0;
	end,	
	
	
});


-- ѡ���һ��ѡ��������չ��� 2
rewindProcess_003_Select01 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>������ϼ��������Ҫɱ��{��ʮ��һƷ�õ�ǹ��}��{��ʮ��һƷ�ù���}��{��λһƷ�õĴ�������}�����ܹ����뵽���յ�{Բ��֮��}���Ǹ��ط������������վ��׵ĸ��֣�����Ҫ�ҳ�������������{ɱ����������}��ƾ�����ǵ��׼����ſ��Դ������ֳ��ӳ������ҵ��ֳ�������������Բ��֮�����һ��Сľ���",
						"��֪����/#rewindProcess_003_SendMan:doTaskEntity()"
						});
		SetRewindTaskState(PARID_TASK_REWIND_003, 2);
		
		-- ���Ž���
		PayRewindAward(3, 2);
		
		return 1;
	end,

});

-- ����ȥ�����ͼ�Ĺ���
rewindProcess_003_SendMan = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>������Ҫȥ��ϼ����ȥ֮ǰ��Ҫ��׼��Щ�����Ķ���Ŷ��",
						"�ǵģ������ҹ�ȥ��/#rewindProcess_003_Send:doTaskEntity()",
						"����׼��һ��/OnTaskExit",
						});
		return 1;
	end,
});


rewindProcess_003_Send = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		NewWorld(515,1639,3162);
		SetFightState(1);
		return 1;
	end,
});


-- ѡ��ڶ���ѡ��� 3000W ������
rewindProcess_003_Select02 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SelectDescribe({"<npc>��Ҫ�����ǳ���ǧ���������������ͽ���յ���ô���Ǯ����������������Ҳ�����ٲ������ֳ��ˡ�",
						"�ǵģ����С��˼�����ȥ��/#rewindProcess_003_Select02_01:doTaskEntity()",
						"���ٿ��ǿ���/OnTaskExit"
						});
		return 1;
	end,
	
});


-- ѡ��Ǯ�����Ƿ���㹻��Ǯ������ɹ��۳��Ļ�ֱ�ӽ����������Ϊ 4
rewindProcess_003_Select02_01 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		if Pay(30000000)==1 then
			SelectDescribe({"<npc>��ʿ����ʿ����лл�㣬��л�ˡ�",
							"�����Ի�/OnTaskExit"
							});
			SetRewindTaskState(PARID_TASK_REWIND_003, 4);
		else
			SelectDescribe({"<npc>��ʿ���������һʱ����ò�����ǧ�������ӵĻ��ǻ��ǲ����鷳���ˣ��һ����������˰ɣ�",
							"�����Ի�/OnTaskExit"
							});	
		end;
		return 1;
	end;
});


-- ɱ��һƷ��ǹ��ʱ�Ĵ���
rewindProcess_003_Kill_01 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_REWIND_KILLER_01);
		
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 and nNum<50 then
		
			Msg2Player("���Ѿ�ɱ����һ��һƷ��ǹ�������ܹ�ɱ����"..(nNum+1).."����");
			SetPartnerTask(PARID_REWIND_KILLER_01, nNum+1);
			
			if nNum+1>= 50 then
				Msg2Player("���Ѿ�ɱ�����㹻���һƷ��ǹ����");
			end;

			-- ���Ž���
			-- PayRewindAward(3, 3);
			
			AddOwnExp(CountDoubleMode(2000));
			AddPartnerExp(CountDoubleMode(500));
					
			return 1;
		end;
		return 0;
	end,

});


-- ɱ��һƷ�ù���ʱ�Ĵ���
rewindProcess_003_Kill_02 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_REWIND_KILLER_02);
		
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 and nNum<30 then
		
			Msg2Player("���Ѿ�ɱ����һ��һƷ�ù��������ܹ�ɱ����"..(nNum+1).."����");
			SetPartnerTask(PARID_REWIND_KILLER_02, nNum+1);
			
			if nNum+1>= 30 then
				Msg2Player("���Ѿ�ɱ�����㹻���һƷ�ù�����");
			end;

			-- ���Ž���
			-- PayRewindAward(3, 4);
			
			AddOwnExp(CountDoubleMode(2000));
			AddPartnerExp(CountDoubleMode(500));
			
			return 1;
		end;
		return 0;
	end,

});



-- ɱ��һƷ�ô�������ʱ�Ĵ���
rewindProcess_003_Kill_03 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_REWIND_KILLER_03);
		
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 and nNum<3 then
		
			Msg2Player("���Ѿ�ɱ����һ��һƷ�ô������죬���ܹ�ɱ����"..(nNum+1).."����");
			SetPartnerTask(PARID_REWIND_KILLER_03, nNum+1);
			
			if nNum+1>= 3 then
				Msg2Player("���Ѿ�ɱ�����㹻���һƷ�ô������죡");
			end;

			-- ���Ž���
			-- PayRewindAward(3, 5);
			
			AddOwnExp(CountDoubleMode(10000));
			AddPartnerExp(CountDoubleMode(2000));			
			
			return 1;
		end;
		return 0;
	end,

});



-- ɱ��������ʿ�Ĵ���
rewindProcess_003_Kill_04 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_REWIND_KILLER_04);
		
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 and nNum<2 then
		
			Msg2Player("���Ѿ�ɱ����һ��һƷ��ͳ˧�����ܹ�ɱ����"..(nNum+1).."����");
			SetPartnerTask(PARID_REWIND_KILLER_04, nNum+1);
			
			if nNum+1>= 2 then
				Msg2Player("���Ѿ�ɱ�����㹻���һƷ��ͳ˧��");
			end;

			-- ���Ž���
			-- PayRewindAward(3, 6);

			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(2000));
					
			return 1;
		end;
		return 0;
	end,

});


-- ���ʯ���Ĺ���
rewindProcess_003_Call = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
	
		local killzxboss ={
			{1078,95,515,1729,2845,1,"Ӱɷ",1,"\\script\\task\\partner\\npc\\master_fight_03_004.lua","Ӱɷ"},
			{1078,95,515,1729,2845,1,"����",1,"\\script\\task\\partner\\npc\\master_fight_03_004.lua","����"},
			{1078,95,515,1729,2845,1,"ǹѻ",1,"\\script\\task\\partner\\npc\\master_fight_03_004.lua","ǹѻ"},
			{1078,95,515,1729,2845,1,"����",1,"\\script\\task\\partner\\npc\\master_fight_03_004.lua","����"},
		}
		
		if nCondition==1 then
		
			local i = random(1,4);
			local Tid = SubWorldID2Idx(killzxboss[i][3]);
			
			-- ���ˢ����һƷ��ͳ˧���� 6 �����򲻻���ˢ��
			if GetGlbValue(GLBID_MASTER_KILLER_NUM)>=6 then return end;
			
			if (Tid >= 0 ) then
				TabValue4 = killzxboss[i][4] * 32;
				TabValue5 = killzxboss[i][5] * 32;
				local Partner_npcindex = AddNpc(killzxboss[i][1],killzxboss[i][2],Tid,TabValue4,TabValue5,killzxboss[i][6],killzxboss[i][7],killzxboss[i][8]);
				SetNpcScript(Partner_npcindex, killzxboss[i][9]);
				
				SetGlbValue(GLBID_MASTER_KILLER_NUM, GetGlbValue(GLBID_MASTER_KILLER_NUM) + 1);
				
			end

			Msg2Player("��ϼ��Ӫկ�е�ͳ˧"..killzxboss[i][10].."�������㼤ŭ�ˣ����Ѿ����֡�");
			return 1;
		end;
		return 0;
	end,

});


-- �붡���ĶԻ�
rewindProcess_003_03 = inherit(CProcess, {

	checkCondition = function(self)
	
		local nNum_1 = GetPartnerTask(PARID_REWIND_KILLER_01);
		local nNum_2 = GetPartnerTask(PARID_REWIND_KILLER_02);
		local nNum_3 = GetPartnerTask(PARID_REWIND_KILLER_03);
		local nNum_4 = GetPartnerTask(PARID_REWIND_KILLER_04);
		
		if GetRewindTaskState(PARID_TASK_REWIND_003)==2 and nNum_1>=50 and nNum_2>=30 and nNum_3>=3 and nNum_4>=2 then
			return 1;
		elseif GetRewindTaskState(PARID_TASK_REWIND_003)==3 then
			return 2;
		else
			return 0;
		end
	end,
	
	taskEntity = function(self, nCondition)
	
		if nCondition==1 or nCondition==2 then
			SelectDescribe({"<npc>л��ʿ����֮����",
							"�뿪��ϼ��/#rewindProcess_003_03_Send:doTaskEntity()",
							"�����Ի�/OnTaskExit"});
			SetRewindTaskState(PARID_TASK_REWIND_003, 3);
			return 1;
		else
			SelectDescribe({"<npc>������Щ��ͽ�������׼���֮������ʿ��Ҫ���ң��Լ����뿪�ɡ�",
							"�뿪��ϼ��/#rewindProcess_003_03_Send:doTaskEntity()",
							"�����Ի�/OnTaskExit"});
			return 0;
		end;
		return 0;
		
	end,

});


rewindProcess_003_03_Send = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		NewWorld(176,1376,3333);
		SetFightState(0);
	end,
});


-- �ٴλ����붡�ڵĶԻ�
rewindProcess_003_04 = inherit(CProcess, {

	checkCondition = function(self)
		if GetRewindTaskState(PARID_TASK_REWIND_003)==3 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SelectDescribe({"<npc>��л�Ļ�˵�ٶ�Ҳû���á����ܵܽ���������һ�����������𡣶��������£����ö�ã���ĳһ������������ȥ������������������",
							"�����Ի�/OnTaskExit"
							});
			SetRewindTaskState(PARID_TASK_REWIND_003, 4);
			return 1;
		end;
		return 0;
	end,
	
});

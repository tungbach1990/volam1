
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

PARID_MASTER05_TIMES = 68;  -- ���ÿ����ɵ������������

-- ����������������
ARY_AWARD_BOOKS = {
	
	-- ��ϵ
	[0] = {{839, "�������쾢", "��ϵͬ�������ķ������������˵��ж�ʱ��"}, 
		   {840, "����", "��ϵͬ�������ķ������������˵Ķ���"}},
	
	-- ľϵ
	[1] = {{841, "��������", "ľϵͬ�������ķ������������˵��׷�"}, 
		   {842, "ʴ��Ѫ��", "ľϵͬ�������ķ�����ʹ���˾����ѣ��״̬�ָ�"}},

	-- ˮϵ
	[2] = {{843, "��ת�ľ�", "ˮϵͬ�������ķ�����ʹ�����ƶ��ٶȸ���"}, 
		   {844, "��������", "ˮϵͬ�������ķ������������˵Ļ��"}},
	
	-- ��ϵ
	[3] = {{845, "�������", "��ϵͬ�������ķ������������˵��շ�"}, 
		   {846, "�������", "��ϵͬ�������ķ�����ʹ�����ƶ��ٶȸ���"}},

	-- ��ϵ
	[4] = {{847, "�����޼�", "��ϵͬ�������ķ�����ʹ���˾���ӳٻ�״̬�ָ�"}, 
		   {848, "�����ả", "��ϵͬ�������ķ������������˵ı���"}},

}

-- ����ٻ���ʱ���ж�
taskProcess_005_01 = inherit(CProcess, {

	checkCondition = function(self)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count();
	
		-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� 0
		if NpcCount==0 or partnerstate~=1 then return 0; end;
		
		-- �ж��ĸ����������Ƿ��Ѿ����
		local nState_1 = GetMasterTaskState(PARID_TASK_MASTER_001);
		local nState_2 = GetMasterTaskState(PARID_TASK_MASTER_002);
		local nState_3 = GetMasterTaskState(PARID_TASK_MASTER_003);
		local nState_4 = GetMasterTaskState(PARID_TASK_MASTER_004);
		
		if nState_1>=5 and nState_2>=6 and nState_3>=5 and nState_4>=3 then
			return 1;
		else
			return 2;
		end;
		
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SetPos(1535, 3021); -- ������һ��
			SetFightState(0);
			return 1;
		elseif nCondition==2 or nCondition==0 then
			Say("ǰ���������ƣ������������ƺ����������ڿ���ȥ�ĵط���",0);
			SetPos(1516, 3069); -- �����ڶ���
			SetFightState(1);
			return 0;
		end;
	end,

});


-- �ȵ���ȥʱ�ĵ�Ĵ���
taskProcess_005_Outside = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		SetPos(1516, 3069); -- �����ڶ���
		SetFightState(1);
		return 1;
	end,
});

-- �뽣�ʶԻ�
taskProcess_005_02 = inherit(CProcess, {

	checkCondition = function(self)
		local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		local NpcCount = PARTNER_Count();

			-- �����Һ�ͬ��ĵȼ�
			if GetLevel()<90 or PARTNER_GetLevel(partnerindex)<80 then return 4; end;
		
			-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� 0
			if NpcCount==0 or partnerstate~=1 then return 0; end;
			
			-- �ж��ĸ����������Ƿ��Ѿ����
			local nState_1 = GetMasterTaskState(PARID_TASK_MASTER_001);
			local nState_2 = GetMasterTaskState(PARID_TASK_MASTER_002);
			local nState_3 = GetMasterTaskState(PARID_TASK_MASTER_003);
			local nState_4 = GetMasterTaskState(PARID_TASK_MASTER_004);
			
			if nState_1==5 and nState_2==6 and nState_3==5 and nState_4==3 and GetMasterTaskState(PARID_TASK_MASTER_005)==0 then
				return 1;
			elseif GetMasterTaskState(PARID_TASK_MASTER_005)==1 then -- �Ѿ���������
				return 2;
			else
				return 3;
			end;
	end,
	
	taskEntity = function(self, nCondition)
		if nCondition==1 then
			SelectDescribe({"<npc>������ô�ҵ��������ģ�һ�뽭�������˳������������𣿳�ĳ�Ⱳ��һ�е�һ�ж������������ȥ�ˣ����������𣿺ðɣ�ֻҪ�㲻˵���ҵĲ���֮�����ұ㴫����Сͬ��һʽ��ѧ��Σ�����Ҫѧ��ĳ���书��û��һ���õĻ�����ֻ���߻���ħ���Էٶ����������һ��Ҫ��Сͬ��ѧ�����ȴ��������������{ʮ����}��{ͬ����������}�ɡ��ǵã�ÿ�յ����񶼱���ȫ����ɣ�����͵����������֮���������ң��ұ㽫�����������ڡ�",
							"��������/#taskProcess_005_03:doTaskEntity()"
							});
		elseif nCondition==2 then
			SelectDescribe({"<npc>���Ѿ������ʮ�����ͬ��������������",
							"���Ѿ������/#taskProcess_005_Finish:doTaskEntity()",
							"��ʱ��û��/OnTaskExit"});
		elseif nCondition==4 then
			SelectDescribe({"<npc>��ס�������ͬ�鵽�� <color=yellow>80<color> ��ʱ��������ң��ұ㽫�����������ڡ�����͵����",
							"�����Ի�/OnTaskExit"
							});	
		else
			SelectDescribe({"<npc>���������¥�ϣ���������ʡ�׳����������У������Ƶͣ���������硣��������ɮ®�£���������Ҳ��������������飬һ�ν�ǰ��ε�������",
							"�����Ի�/OnTaskExit"
							});	
		end;
		return 1;
	end,

});


-- �������������չΪ 1
taskProcess_005_03 = inherit(CProcess, {

	taskEntity = function(self, nCondition)
		SetMasterTaskState(PARID_TASK_MASTER_005, 1);
		Msg2Player("��������Ҫ�������ͬ����� 15 �յ���������");
		return 1;
	end,
	
});


-- �������Ĺ���
taskProcess_005_Finish = inherit(CProcess, {
	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_MASTER05_TIMES);
		if nNum>=15 then
			SelectDescribe({"<npc>�ܺã����Ѿ������ʮ�����ͬ�����������Ǹ���Ľ�����",
							"��ȡ����/#taskProcess_005_AwardSelect:doTaskEntity()"
							});
			return 1;
		else
			SelectDescribe({"<npc>�㻹û�����ʮ�����ͬ����������ɣ���",
							"�����Ի�/OnTaskExit"
							});
			return 1;
		end;
		return 0;
	end,
});


-- ��ȡ��������Ľ����������������Ϊ 2
taskProcess_005_AwardSelect = inherit(CProcess, {
	taskEntity = function(self, nCondition)
	
		local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
		local NpcCount = PARTNER_Count();
		local nSeries = 0;
		
		-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� nil
		if NpcCount==0 or partnerstate~=1 then
			SelectDescribe({"<npc>�㻹û���ٳ�ͬ����Ŷ��",
							"�����Ի�/OnTaskExit"
							});	
			return 0;
		end;
		
		nSeries = PARTNER_GetSeries(partnerindex);

		SelectDescribe({"<npc>�������������������ʺ������ڵ�ͬ�飬����Ҫ��ȡ�ĸ������齱���أ�<enter><enter><color=green>"..
						ARY_AWARD_BOOKS[nSeries][1][2].."<color>��"..ARY_AWARD_BOOKS[nSeries][1][3].."<enter><color=green>"..
						ARY_AWARD_BOOKS[nSeries][2][2].."<color>��"..ARY_AWARD_BOOKS[nSeries][2][3].."<enter>",
						"��ѡ"..ARY_AWARD_BOOKS[nSeries][1][2].."/#taskProcess_005_AwardPayBook("..nSeries..", 1)",
						"��ѡ"..ARY_AWARD_BOOKS[nSeries][2][2].."/#taskProcess_005_AwardPayBook("..nSeries..", 2)",
						});	

		return 1;
	end,
});


-- ÿ����ɺ��ۼӵĹ���
taskProcess_005_AddTimes = inherit(CProcess, {

	checkCondition = function(self)
		if GetMasterTaskState(PARID_TASK_MASTER_005)==1 then
			return 1;
		else
			return 0;
		end;
	end,
	
	taskEntity = function(self, nCondition)
		local nNum = GetPartnerTask(PARID_MASTER05_TIMES);
		if nCondition==1 then
			if nNum<15 then
				SetPartnerTask(PARID_MASTER05_TIMES, nNum + 1);
				return 1;
			elseif nNum==15 then
				Msg2Player("���Ѿ������ʮ�����ͬ���������������ڿ��Իذٻ���ȥ�ҽ����ˣ�");
				return 1;
			end;
		end;
		return 0;
	end,

});


-- ��ͬ�鷢������Ĺ��̣������չΪ 2
function taskProcess_005_AwardPayBook(nSeries, nBook)

	AddItem(6, 1, ARY_AWARD_BOOKS[nSeries][nBook][1], 1, 0, 0);
	
	SetMasterTaskState(PARID_TASK_MASTER_005, 2);
	PayMasterAward(5, 1);

end;


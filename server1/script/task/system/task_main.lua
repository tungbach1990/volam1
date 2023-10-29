
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ����ϵͳ�ص����������ļ�
-- Edited by peres
-- 2005/07/04 PM 19:59

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ��Ʒ��֧��
IncludeLib("ITEM");

-- �������ݶ���ͷ�ļ�
Include("\\script\\task\\system\\task_head.lua");

-- ���� DEBUG ��������ļ�
Include("\\script\\task\\system\\task_debug.lua");

-- ����Ի��ַ������ļ�
Include("\\script\\task\\system\\task_string.lua");

Include([[\script\tong\tong_award_head.lua]]);-- by־ɽ�������Ŀ�깱�׶�
-- ����ʼһ��������
function ApplyTask(taskname)

	-- ��������Ƿ����㿪ʼ����
	local result = OnCheckTaskStart(taskname);
	if (result == 1) then
		OnTaskSay(taskname, 0);
		return 1;
	end
	return 0;
end

-- ��������Ƿ���Կ�ʼ�Ļص�����
function OnCheckTaskStart(taskName)
	
	local nRow, nCol = TaskConditionMatrix(taskName);
	local strType, strDesc = "","";
	local nCheck = 0;
	local i,j = 0,0;
	
	local nLevel = 0; -- �ȼ��жϵ�������ȡ
	
	CDebug:MessageOut("B�t ��u xem"..taskName.." �i�u ki�n");
		
		-- ��������������Ҫ��������ֱ�ӿ�ʼ
		if nRow==0 or nRow==nil then return 1; end;
	
		-- ��ʼѭ��������������������
		for i=1, nRow do
		
			strType = TaskCondition(taskName, i, Condition.TaskType_Row);
			strDesc = TaskCondition(taskName, i, Condition.TaskDesc_Row);
			
			-- ����ȼ����ڵ������ж�
			if strType==Condition.LevelMore then
				nLevel = tonumber(strDesc);
				if GetLevel()>nLevel then
					CDebug:MessageOut(taskName.." nhi�m v� n�y c�n ��ng c�p l�n, th�ng qua");
					nCheck = nCheck + 1;
				end;
			end;
			
			-- ����ȼ�С�ڵ������ж�
			if strType==Condition.LevelLess then
				nLevel = tonumber(strDesc);
				if GetLevel()<nLevel then
					CDebug:MessageOut(taskName.." nhi�m v� n�y c�n ��ng c�p nh�, th�ng qua");
					nCheck = nCheck + 1;
				end;
			end;
	
			-- ����ȼ����ڵ������ж�
			if strType==Condition.LevelEqual then
				nLevel = tonumber(strDesc);
				if GetLevel()==nLevel then
					CDebug:MessageOut(taskName.." nhi�m v� n�y c�n ��ng c�p, th�ng qua");
					nCheck = nCheck + 1;
				end;
			end;
			
			-- �����Ƿ��Ѿ���ʼ�������ж�
			if strType==Condition.TaskStart then
				if GetTaskStatus(strDesc)==1 then
					CDebug:MessageOut(taskName.." nhi�m v� n�y c�n c� �i�u ki�n"..strDesc.."B�t ��u, th�ng qua");
					nCheck = nCheck + 1;
				end;
			end;
	
			-- �����Ƿ��Ѿ������������ж�
			if strType==Condition.TaskEnd then
				if GetTaskStatus(strDesc)==3 then
					CDebug:MessageOut(taskName.." nhi�m v� n�y c�n c� �i�u ki�n"..strDesc.."K�t th�c, th�ng qua");
					nCheck = nCheck + 1;
				end;
			end;
			
			--�����Ƿ�����ظ���ʼ
			if strType==Condition.CanRestart then
				if tonumber(strDesc)==1 then
					CDebug:MessageOut(taskName.." �i�u ki�n b�t ��u c�a nhi�m v� l� c� th� b�t ��u l�i, th�ng qua");
					SetTaskStatus(taskName, 0);
					CloseTask(taskName);
					nCheck = nCheck + 1;
				end;
			end;
			
			-- ���ʲô������
			if strType=="" then
				CDebug:MessageOut(taskName.." nhi�m v� n�y ���c mi�n v�t ph�m, th�ng qua.");
				nCheck = nCheck + 1;
			end;
	
		end;
		
		-- ��������Ѿ���ʼ�ˣ������ܷ�����ʼ
		if GetTaskStatus(taskName)~=0 then
			CDebug:MessageOut(taskName.." nhi�m v� n�y �� b�t ��u, kh�ng th� quay l�i n�a");
			return 0;
		end;
		
		-- ���ȫ���������ϣ��򷵻� 1
		if nCheck==nRow then
			CDebug:MessageOut(taskName.." nhi�m v� n�y to�n b� ���c th�ng qua");
			WriteTaskLog(taskName.." �i�u ki�n �� ��p �ng, c� th� b�t ��u nhi�m v�.");
			return 1;
		else
			return nil;
		end;

end;


-- ����ʼʱ��ϸ�ڴ���
function OnTaskStart(taskName)

	local nRow, nCol = TaskEntityMatrix(taskName);
	local nOldRow, nOldCol = 0, 0;  -- ��һ����������ά��
	
	local szOldTaskName = "";  -- ��һ��������������
	
	local strType = ""
	local nKillEvent = 0;
	local nEventResult = 0;
	local i=0;
	
	local nDelItemResult = 0;  -- ɾ��������������Ʒ�ķ���ֵ
	
	local nEvent = GetTaskEventID(taskName); -- �ж�����һ���¼��Ŀ�ʼ
	
		-- ������������Ŀ�ʼ
		if nEvent==3 then

			-- �����ͨ�������������������
			if GetTask(ID_RANDOMTASKTEMP)~=0 then
				
				nDelItemResult = RemoveItemByIndex(GetTask(ID_RANDOMTASKTEMP));

				-- ����ʱ��������
				SetTask(ID_RANDOMTASKTEMP, 0);
								
				-- �쳣����ɾ�����ɹ�
				if nDelItemResult~=1 then
					SetTaskStatus(taskName, 0);
					CloseTask(taskName);
					return 0;
				end;
				
			end;

			szOldTaskName = TaskName(GetTask(ID_RANDOMTASK));
	
			-- ����µ����������ɵĲ�ͬ����������ڽ��е��������
			if szOldTaskName~=taskName then
				SetTaskStatus( szOldTaskName, 0 );
				CloseTask( szOldTaskName );
			end;
			
			-- ���֮ǰ��ά��
			nOldRow, nOldCol = TaskEntityMatrix(szOldTaskName);
			
			-- �����ǰ���ڽ��е�������ɱ�ּ���������ռ�����
			for i=1, nRow do
				nKillEvent = TaskEntity(szOldTaskName, i, Entity.KillNpcName_Row);
				if nKillEvent~=nil or nKillEvent~="" then
					RemovePlayerEvent(tonumber(nKillEvent));
				end;
			end;
		
			-- ����ǰ���ڽ��е�����ID����
			SetTask(ID_RANDOMTASK, GetTask(ID_RANDOMTASK_WAIT)); 
			
			-- �������������Ϊ�Ѿ���������
			setRandomTaskState(2);
			
			-- ͬ���������
			SyncTaskValue(ID_RANDOMTASK);
			
			-- д�����������ɵ�ʱ��ʹ���
			writeRandomTaskEnable();

		end;
	
		-- ����Ǿ�������Ŀ�ʼ��ɾ��������Ʒ
		if nEvent==4 then
			
			nDelItemResult = RemoveItemByIndex(GetTask(ID_RANDOMBOOKTEMP));
			
			-- �쳣����ɾ�����ɹ�
			if nDelItemResult~=1 then
				SetTaskStatus(taskName, 0);
				CloseTask(taskName);
				return 0;
			end;
			
			SetTask(ID_RANDOMBOOKTEMP, 0);
			
			-- ����ǰ���ڽ��е��������ID����
			SetTask(ID_RANDOMBOOK, TaskNo(taskName));
			
			-- ͬ���������
			SyncTaskValue(ID_RANDOMBOOK);

			-- д��ÿ�쿪����ʱ�������
			writeTaskBookTimes();
			
		end;
	
		for i=1, nRow do
			
			strType = TaskEntity(taskName, i, Entity.TaskType_Row);
			nKillEvent = TaskEntity(taskName, i, Entity.KillNpcName_Row);
			nNpcItemRate = TaskEntity(taskName, i, Entity.DropItemRate_Row);
			
			-- ������ռ���Ʒ������Ԥ��ռ��һ����ʱ����
			if strType==Entity.Collect then
				CDebug:MessageOut(taskName.." nhi�m v� n�y c�n ki�m lo�i v�t ph�m, ph�i giao n�p k�p l�c");	
				SetTmpValue(taskName, TmpType.Collect, 0);
			end;
			
			-- ������ռ��ƽ�װ��������Ԥ��ռ��һ����ʱ����
			if strType==Entity.CollectGoldItem then
				CDebug:MessageOut(taskName.." nhi�m v� n�y c�n ki�m trang b� ho�ng kim, ph�i giao n�p k�p l�c");
				SetTmpValue(taskName, TmpType.Collect, 0);
			end;
			
			-- ������ռ����������Ʒ������Ԥ��ռ��һ����ʱ��������������Ϊ�������ı��
			if strType==Entity.CollectNpcItem then
				CDebug:MessageOut(taskName.." Nhi�m v� y�u c�u gi�t qu�i thu th�p v�t ph�m, c�n s� d�ng bi�n s� t�m th�i");
				SetTmpValue(taskName, TmpType.ItemNpc, tonumber(nKillEvent));
				
				CDebug:MessageOut(taskName.."Nhi�m v� y�u c�u gi�t qu�i thu th�p v�t ph�m, thi�t l�p x�c su�t v�t ph�m:"..nNpcItemRate);
				SetTmpValue(taskName, TmpType.ItemRate, tonumber(nNpcItemRate));
				
				nEventResult = AddPlayerEvent(tonumber(nKillEvent));
				
				if nEventResult==0 then
					CDebug:MessageOut(taskName.."Kh�i ��ng b� ��m s� qu�i b� gi�t ph�t sinh l�i, id l�:"..nKillEvent);
				end;
				
			end;
			
			-- �����ɱ�ּ����Ļ�����һ������������Ҳռ��һ����ʱ����
			if nKillEvent~="" and strType==Entity.KillNpc then
				CDebug:MessageOut(taskName.." c�n m� ch�c n�ng s�t qu�i. S� hi�u l� "..nKillEvent);
				SetTmpValue(taskName, TmpType.KillNpc, 0);
				AddPlayerEvent(tonumber(nKillEvent));
			end;
			
			-- ������� NPC �Ի��Ļ���ռ��һ����ʱ����
			if strType==Entity.TalkNpc then
				CDebug:MessageOut(taskName.." nhi�m v� n�y c�n ��i tho�i v�i NPC, ph�i ti�n h�nh k�p th�i.");
				SetTmpValue(taskName, TmpType.TalkNpc, 0);
			end;
			
		end;
		
		-- �������ʼ��ĶԻ���Ϊ�յĻ���˵һ�λ�
		if TaskTalk(taskName, 1, 2)~="" then
			CreateTaskSay({TaskTalk(taskName, 1, 2),
						   "K�t th�c ��i tho�i/OnTaskExit"}
						  );
		end;
		
		-- ��ʾ��������Ѿ���ʼ
		Msg2Player("B�n ti�p nh�n<color=yellow>"..GetTaskText(taskName).."<color>");

end;


--ȡ��ԭ������ĺ���
function delorgtask(taskName)
	local nRow, nCol = TaskEntityMatrix(taskName);
	szOldTaskName = TaskName(GetTask(ID_RANDOMTASK));
	-- ������ڽ��е��������
	SetTaskStatus( szOldTaskName, 0 );
	CloseTask( szOldTaskName );
	-- ���֮ǰ��ά��
	nOldRow, nOldCol = TaskEntityMatrix(szOldTaskName);
	-- �����ǰ���ڽ��е�������ɱ�ּ���������ռ�����
	for i=1, nRow do
		nKillEvent = TaskEntity(szOldTaskName, i, Entity.KillNpcName_Row);
		if nKillEvent~=nil or nKillEvent~="" then
			RemovePlayerEvent(tonumber(nKillEvent));
		end;
	end;
end;

-- ����ǰ���ڽ��е�����ID����
function setnewtask()
	SetTask(ID_RANDOMTASK, GetTask(ID_RANDOMTASK_WAIT)); 
	
	setRandomTaskState(2);	-- �������������Ϊ�Ѿ���������
	SyncTaskValue(ID_RANDOMTASK);	-- ͬ���������
	writeRandomTaskEnable();	-- д�����������ɵ�ʱ��ʹ���
end;

-- ��������Ƿ���ɵĻص�����
function OnCheckTaskFinish(taskName, nType)

	local nRow, nCol = TaskEntityMatrix(taskName);
	local i=0;
	
	local strType = "";
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive = 0,0,0,0,0;
	local nQuality, nGoodsNum, nDelGoods = 0,0,0;
	local nMoney = 0;
	local strKillNpcName = "";
	local strTalkNpcName = "";
	local strTalkNpcMap = "";
	
	local nRightCheck = GetTaskFinishConditionNum(taskName);  -- �����������Ҫ��ɵ�������
	local nCheck = 0;
	
		CDebug:MessageOut(taskName.." C� s� �i�u ki�n nhi�m v� c�n ��t ��n l�:"..nRightCheck);
	
		-- ����ǶԻ������������
		if nType==1 and CheckTalkCanFinish(taskName)==1 then
			CDebug:MessageOut(taskName.." nhi�m v� ��t ��n m�c ti�u");
			SetTmpValue(taskName, TmpType.TalkNpc, 1);
		end;
		
		-- �����ɱ�ּ����������
		if nType==2 then
			if GetTmpValue(taskName, TmpType.ItemNpc)~=0 and GetTmpValue(taskName, TmpType.ItemNpc)~=nil then
				-- �������ɱ�ֵ�������񴥷��������ѡ����Ʒ
				SelectCollectItemTask(taskName);
			else
				CDebug:MessageOut(taskName.." nhi�m v� gi�t qu�i ��t ��n m�c ti�u");
				Msg2Player(GetTaskText(taskName).."�i�u ki�n gi�t qu�i �� ��t ���c");
				SetTmpValue(taskName, TmpType.KillNpc, 1);
			end;
		end;
		
		for i=1, nRow do
			
			strType = TaskEntity(taskName, i, Entity.TaskType_Row);
			
			-- ������ռ���Ʒ������
			if strType==Entity.Collect or strType==Entity.CollectGoldItem then
				if GetTmpValue(taskName, TmpType.Collect)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
			-- �����ɱ�ּ���������
			if strType==Entity.KillNpc then
				if GetTmpValue(taskName, TmpType.KillNpc)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
			-- ������� NPC �Ի�������
			if strType==Entity.TalkNpc then
				if GetTmpValue(taskName, TmpType.TalkNpc)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
		end;
		
		-- ���ȫ���������ϣ��򷵻� 1
		if nCheck==nRightCheck then
			CDebug:MessageOut(taskName.." M�c ti�u t�t c� nhi�m v� �� ��t ���c!");
			return 1;
		else
			return nil;
		end;
	
end;


-- ����Ի������
function OnTaskSay(taskName, nState)

	if nState==0 or nState>=2 then
		OnTaskSay_Call(taskName, nState);
		return
	end;
	
	if CreateTalkTask()~=1 then
		OnTaskSay_Call(taskName, nState);
	end;
	
end;


-- ����Ի�ʱ�Ļص�����
function OnTaskSay_Call(taskName, nState)
	local entityRow, entityCol = TaskEntityMatrix(taskName);
	local nRow, nCol = TaskTalkMatrix(taskName);
	local strInfo = ""; -- ����˵���ֶ�
	
	local nIsGoods = 0; -- �Ƿ���Ҫ�ύ��Ʒ
	local i=0;
	
	local aryTaskSay = {};
	local strTalk = "";
	
		-- �ж������Ƿ�����Ҫ�ύ����Ʒ
		for i=1, entityRow do
			
			strType = TaskEntity(taskName, i, Entity.TaskType_Row);
			
			if strType==Entity.Collect or strType==Entity.CollectGoldItem then
				nIsGoods = 1;
			end;
			
		end;
	
		-- ����ʼʱ�ĶԻ�����
		if nState==0 then
		
			CDebug:MessageOut(taskName.." ��i tho�i khi nhi�m v� b�t ��u");
			
			strInfo = TaskTalk(taskName, 1, 6);
			strTalk = TaskTalk(taskName, 1, 1);
			
			-- �������ʼ�Ի�û�еĻ�ֱ�ӿ�ʼ
			if strTalk=="" then
				CreateTaskSay({TaskTalk(taskName, 1, 2),
							  "��ng/OnTaskExit"}
					          );
				SelectTaskStart(TaskNo(taskName));
				return
			end;
			
			if strInfo=="" then
				CreateTaskSay({strTalk,
							  "Ti�p nh�n nhi�m v� /#SelectTaskStart("..TaskNo(taskName)..")",
							  "Kh�ng ti�p nh�n/#OnTaskExit("..TaskNo(taskName)..")"}
							  );
			else
				CreateTaskSay({strTalk,
								"Ti�p nh�n nhi�m v� /#SelectTaskStart("..TaskNo(taskName)..")",
								"Xem thuy�t minh nhi�m v� /#ShowTaskInfo("..TaskNo(taskName)..")",
								"Kh�ng ti�p nh�n/#OnTaskExit("..TaskNo(taskName)..")"}
								);
			end;
			return
		end;
	
		-- ��������ύʱ�ĶԻ�����
		if nState==1 then
			
			CDebug:MessageOut(taskName.." ��i tho�i khi ti�n h�nh nhi�m v� ");
			
			if nIsGoods==0 then
				strTalk = TaskTalk(taskName, 1, 3);
				if strTalk ~="" then
					
					aryTaskSay = {strTalk,
								   "Ho�n th�nh nhi�m v� /#SelectTaskFinish("..TaskNo(taskName)..")",
								   "V�n ch�a ho�n th�nh/OnTaskExit"};
								   
					if CheckTaskCanCancel(taskName)==1 then
						tinsert(aryTaskSay, getn(aryTaskSay), "H�y b� nhi�m v�/#CancelTaskConfirm("..TaskNo(taskName)..")");
					end;
					
					CreateTaskSay(aryTaskSay);
					
				else
					SelectTaskFinish(TaskNo(taskName));
				end;
				return
			else
				strTalk = TaskTalk(taskName, 1, 3);
				if strTalk ~="" then
					CDebug:MessageOut(taskName.." C�n ph�i giao v�t ph�m �� ho�n th�nh nhi�m v�! Nh�p v�o giao di�n 'giao n�p'");
					-- ������Ŵ�������ʱ������
					SetTaskTemp(TASK_TEMP_ID, TaskNo(taskName));
					
					aryTaskSay = {strTalk,
								  "Ho�n th�nh nhi�m v� /OnShowGiveUI",
								  "V�n ch�a ho�n th�nh/OnTaskExit"};

					if CheckTaskCanCancel(taskName)==1 then
						tinsert(aryTaskSay, getn(aryTaskSay), "H�y b� nhi�m v�/#CancelTaskConfirm("..TaskNo(taskName)..")");
					end;			
					
					CreateTaskSay(aryTaskSay);

				end;
				return
			end;
			
		end;
		
		-- ���񷢽�ʱ�ĶԻ�����
		if nState==2 then
			CDebug:MessageOut(taskName.." ��i tho�i khi nh�n ph�n th��ng trong nhi�m v� ");
			strTalk = TaskTalk(taskName, 1, 4);
			if strTalk ~="" then
				CreateTaskSay({strTalk,
							   "Nh�n l�nh ph�n th��ng/#SelectTaskAward("..TaskNo(taskName)..")",
							   "T�m th�i ch�a l�y/OnTaskWait"}
							  );			
			else
				SelectTaskAward(TaskNo(taskName));
			end;
		end;
		
		-- �����Ѿ���ɣ��������� NPC �������Ի�
		if nState==3 then
			NpcDialog();
			return
		end;
end;


function OnShowGiveUI()
	GiveItemUI("Giao v�t ph�m","H�y �� nh�ng v�t ph�m c�n thi�t v�o","OnCheckGoods","OnTaskWait");
end;


function OnCheckGoods(nCount)

	-- ��ȡ��ʱ���������������
	local taskName = TaskName(GetTaskTemp(TASK_TEMP_ID));
	
	-- ��ȡ���������������
	local nRow, nCol = TaskEntityMatrix(taskName);
	
	-- ������������Ӧ����������
	local strType = "";
	
	-- ��������Ҫ��Ʒ�� MAP
	local aryNeed = {};
	
	-- ����Ҫɾ����Ʒ������
	local aryDelItem = {};
	
	-- ��������Ҫ����Ʒ����
	local nNeed = GetTaskCollectNum(taskName);
	
	-- ������Ҫ����Ʒ���
	local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	
	-- ��Ҵ���������Ʒ���
	local nGenre, nDetail, nParticular, nLevel, nGoodsFive, nQuality, nLuck, nIndex = 0,0,0,0,0,0,0,0;
	
	local tmpNeedKey, tmpNeedLevel, tmpNeedFive = "", 0, 0;
	local tmpGetKey, tmpGetLevel, tmpGetFive = "", 0, 0;
	
	-- ��ʵ����Ʒ����
	local nRealCount, nCheckCount = 0, 0;
	
	-- �����Ʒ��Ҫ��¼������ӣ����¼���
	local nRandomSeedRecord = 0;
	
	local nRandomSeed = 0;
	
	local i,j,k=0,0,0;
	
	for i=1, nCount do
		local nItemIndex	= GetGiveItemUnit(i)
		nRealCount = nRealCount + GetItemStackCount(nItemIndex);
	end;
	
	-- �����Ʒ������Ҫ�ҵ�����������ֱ�ӷ���
	if nRealCount ~= nNeed then
		CDebug:MessageOut(taskName.."S� v�t ph�m c�n:"..nNeed.." ��t v�o"..nRealCount.." ��t v�o kh�ng ph� h�p!");
		SelectTaskFinish(TaskNo(taskName));
		Say("S� l��ng v�t ph�m b�n �� v�o kh�ng ch�nh x�c!", 0);
		return
	end;
	
	-- ������������Ҫ��Ʒ�� MAP
	for i=1, nRow do
		
		w_Genre      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Genre_Row));
		w_Detail     = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Detail_Row));
		w_Particular = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Particular_Row));
		w_Level      = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Level_Row));
		w_GoodsFive  = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_GoodsFive_Row));
		w_GoodsNum   = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_GoodsNum_Row));
		w_DelGoods   = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_DelGoods_Row));
		
		w_Quality    = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_Quality_Row));
		
		nRandomSeedRecord = TranItemNumber(TaskEntity(taskName, i, Entity.Goods_RecordSeed_Row));
		
		if w_Quality==-1 then w_Quality=0; end;
		
		if w_Quality>0 then
			w_Genre = 0;w_Detail = 0;w_Particular = 0;
		end;
	
		strType = TaskEntity(taskName, i, Entity.TaskType_Row);
		
		if strType==Entity.Collect or strType==Entity.CollectGoldItem then
			tmpNeedKey = tostring(w_Quality)..","..
						 tostring(w_Genre)..","..
						 tostring(w_Detail)..","..
						 tostring(w_Particular);
			
			-- ���û����� MAP KEY ���ʼ��
			if aryNeed[tmpNeedKey] then
				tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
			else
				aryNeed[tmpNeedKey]={};
				tinsert(aryNeed[tmpNeedKey], {w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, nRandomSeedRecord});
			end;

			-- CDebug:MessageOut("���ɵ�������Ʒ���飺["..tmpNeedKey.."]��"..w_Level..","..w_GoodsFive..","..w_GoodsNum..","..w_DelGoods);
		end;
		
	end;
	
	
	for i=1, nCount do
		
		nIndex = GetGiveItemUnit(i);
		
		tmpGetKey, tmpLevel, tmpFive = TranKey(nIndex);
		
		nCheckCount = GetItemStackCount(nIndex);
		
		local bCorrect = 0;
		if aryNeed[tmpGetKey] then
			for j=1, getn(aryNeed[tmpGetKey]) do
			
				-- ���������Ʒ����Ҫ�ж����л��ߵȼ���
				if aryNeed[tmpGetKey][j][1]==-1 then tmpLevel=-1; end;
				if aryNeed[tmpGetKey][j][2]==-1 then tmpFive=-1; end;
				
				-- ������Ӧ�� KEY �����к͵ȼ������ϵĻ�
				if aryNeed[tmpGetKey][j][1]==tmpLevel and aryNeed[tmpGetKey][j][2]==tmpFive then
					
					-- ���������������Ʒ��Ҫ��¼������ӣ����¼
					-- ��¼�ĸ�ʽΪ��[������][����������][����������]
					if aryNeed[tmpGetKey][j][5]~=-1 then
						nRandomSeed = ITEM_GetItemRandSeed(nIndex);
						SetTmpValue(taskName, 
									TmpType.ItemSeed..aryNeed[tmpGetKey][j][5], 
									nRandomSeed);
						CDebug:MessageOut(taskName.." v�t ph�m"..tmpGetKey.." S� ng�u nhi�n c�n ghi l�i:"..nRandomSeed);
					end;
					
					aryNeed[tmpGetKey][j][3] = aryNeed[tmpGetKey][j][3] - nCheckCount;
					bCorrect = 1;
					break;
				end;
			end;
		end;
		
		if (bCorrect == 1) then
			tinsert(aryDelItem, nIndex);
		else
			
			-- ��շ�������������
			aryDelItem = {};
			
			Say("V�t ph�m b�n �� v�o kh�ng ch�nh x�c!", 0);
			return
		end;
		
	end;
	
	-- ����ǲ������е���Ʒ����ȷ
	for i,j in aryNeed do
		for k=1, getn(j) do
			if j[k][3]~=0 then
				Say("V�t ph�m b�n �� v�o kh�ng ch�nh x�c!", 0);
				return
			end;
		end;
	end;
		
	-- ��¼һ���ж��ٸ���Ʒ��Ҫɾ��
	SetTaskTemp(TASK_CHECKITEM_NUM, getn(aryDelItem));
	
	CDebug:MessageOut("Li�t k� nh�ng v�t ph�m c�n lo�i b�:"..getn(aryDelItem));
	
	for i=1, getn(aryDelItem) do
		SetTaskTemp(TASK_CHECKITEM_START + i - 1, aryDelItem[i]);
		CDebug:MessageOut("C�n ph�i lo�i b�:"..aryDelItem[i]);
	end;

	SetTmpValue(taskName, TmpType.Collect, 1);
	SelectTaskFinish(TaskNo(taskName));
	
	return

end;


-- ���������Ƿ�Ϊ��Ӧ����ĶԻ���
function OnTaskNpcTalk(npcName, npcMap, taskName)

	local nRow, nCol = TaskEntityMatrix(taskName);
	
	local strTalkNpcName = "";
	local strTalkNpcMap = "";
	
	local i=0;
	
	CDebug:MessageOut("Ph�n �o�n"..npcMap.." trong b�n ��"..npcName.." c� ph�i do"..taskName.." ��i tho�i v�i nh�n v�t trong nhi�m v� ");
	
		for i=1, nRow do
		
			strTalkNpcName = TaskEntity(taskName, i, Entity.TalkNpcName_Row);
			strTalkNpcMap = TaskEntity(taskName, i, Entity.TalkNpcMap_Row);
			
			CDebug:MessageOut(taskName.." Nh�n v�t y�u c�u:"..strTalkNpcName.." B�n �� khu v�c y�u c�u:"..strTalkNpcMap);
			
			if strTalkNpcName==npcName and strTalkNpcMap==npcMap then
				return 1;
			end;
			
		end;
		
		return nil;
	
end;

-- �������ʱ�Ĵ���
function OnTaskFinish(taskName)
	local nEvent = GetTaskEventID(taskName); -- �ж�����һ���¼��Ŀ�ʼ

	-- ��ȡɱ�ֵ�����Ʒ��ɱ���¼�
	local nKillEventID = tonumber(GetTmpValue(taskName, TmpType.ItemNpc));

	-- ����������Ŀ�ʼ
	if (nEvent==3) then
		tongaward_randomevent();--by־ɽ�������Ŀ��
	end;
	
	local nItem = GetTaskTemp(TASK_CHECKITEM_NUM);
	local nResult = 0;  -- �Ƿ�ɾ����Ʒ��ȷ
	local i=0;
		
		CDebug:MessageOut(taskName.."Lo�i b� v�t ph�m khi k�t th�c nhi�m v�, g�m:"..nItem.."c�i");
		
		-- ���һ����ƷҲ����Ҫɾ������ֱ�ӷ���
		if nItem==0 then return end;
	
		-- ɾ����������Ҫ����Ʒ
		for i=1, nItem do
			nResult = RemoveItemByIndex(GetTaskTemp(TASK_CHECKITEM_START + i - 1));
			
			-- �쳣���������ɾ�����ɹ�����ֱ�ӽ������ɻ�û���
			if nResult~=1 then
				SetTaskStatus(taskName, 1);
				return
			end;
			
		end;
		
		-- ��������Ʒ��������ʱ����������
		SetTaskTemp(TASK_CHECKITEM_NUM, 0);
		
		-- �����ɱ�ּ���������ɾ��
		if nKillEventID~=0 then
			RemovePlayerEvent(nKillEventID);
		end;
		
		return
	
end;


-- ���񷢽�����
function OnAward(taskName)
	
	-- ��������������Ѿ�������Ļ���ֱ�������˹��̣���ֹˢ����
	if GetTaskStatus(taskName)==3 then
		return
	end;

	local nResult = PayAwardMain(taskName);
		return nResult;

end;


-- ʲô�������Ŀպ���
function OnTaskWait()
	return
end;


-- ѡ���˳���Ĵ���
function OnTaskExit(taskID)
	
local nTaskID_Now = GetTask(ID_RANDOMTASK);

local nEvent = 0; -- �ж�����һ���¼���ȡ������
	
	-- ����������� taskID �ǿ�ֵ�����ʾ�ǲ���Ҫ���⴦����������
	if taskID==nil or taskID==0 then return end;
	
	nEvent = GetTaskEventID(TaskName(taskID));
	
	-- ������������ĵ���
	if nEvent==3 then
		
		setRandomTaskState(2);
	
		-- ���Ŀǰ���ڽ��е��������
		SetTaskStatus(TaskName(nTaskID_Now), 0);
		CloseTask( TaskName(nTaskID_Now) );
		
		--[DinhHQ]
		--20110401: Fix bug l�nh b�i bang h�i
		local nItemIdx = GetTask(ID_RANDOMTASKTEMP)
		if nItemIdx ~= 0 then
			local nG, nD, nP = GetItemProp(nItemIdx)
			if ((nG == 6 and nD == 2 and nP == 1020) or (nG == 6 and nD == 1 and nP == 30106) or (nG == 6 and nD == 1 and nP == 30107) or (nG == 6 and nD == 1 and nP == 30108)) and (GetTask(2589) >= 0) then				
				SetTask(2589, GetTask(2589) - 1);
			end	
		end
		
		Msg2Player("<color=yellow>�� l�a ch�n kh�ng ti�p nh�n nhi�m v�.<color>");
		return
	end;
	
	-- ����Ǿ�������ĵ���
	if nEvent==4 then
		return
	end;

end;

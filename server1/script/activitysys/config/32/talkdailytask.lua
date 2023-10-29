Include("\\script\\activitysys\\config\\32\\dailytask.lua")

tbTalkDailyTask = tbDailyTask:new()

tbTalkDailyTask.TSK_DAILY_TASK_COMPLETE_STATE = TSK_DAILY_TASK_COMPLETE_COUNT;
tbTalkDailyTask.nStateBit = 3;
tbTalkDailyTask.szConfigPath = {"\\settings\\task\\dailytask\\talk.txt" ,"\\settings\\task\\dailytask\\talk_pos.txt"};
tbTalkDailyTask.szTaskName = "Nhi�m v� ��i tho�i ";
tbTalkDailyTask.tbNpcPos = {}
tbTalkDailyTask.TSK_TALK_TASK_ID = TSK_TALK_TASK_ID;
tbTalkDailyTask.TSK_TALK_TASK_STATE = TSK_TALK_TASK_STATE;

function tbTalkDailyTask:Init()
	local nRet = self:_init();
	if not nRet then
		return nil;
	end
	
	return nRet;
end

function tbTalkDailyTask:AddTalkNpc(nMapTemplate, nMapId)
	if (self.tbNpcPos[nMapTemplate] ~= nil) then
		local nRandIdx = random(1,getn(self.tbNpcPos[nMapTemplate]));
		local tbPos = self.tbNpcPos[nMapTemplate][nRandIdx];
		if (tbPos ~= nil) then
			local nNpcIdx = AddNpc(tbPos.nNpcRes, 1, SubWorldID2Idx(nMapId), tbPos.nX * 32, tbPos.nY * 32, 0, tbPos.szNpcName);
			if (nNpcIdx ~= nil and nNpcIdx > 0) then
				SetNpcScript(nNpcIdx, tbPos.szNpcScript);
				--SetNpcParam(nNpcIdx, 1, tbPos.nTaskId);
			end
		end
	end

end

function tbTalkDailyTask:LoadDataFromConfig()
	local nTotalRow = TabFile_GetRowCount(self.szConfigPath[1])
	self.tbTaskList = {}
	for nRow = 2, nTotalRow do
		local tbTask = {}
		tbTask.nTaskId = tonumber(TabFile_GetCell(self.szConfigPath[1], nRow, "TaskId"));
		tbTask.szTaskName = TabFile_GetCell(self.szConfigPath[1], nRow, "TaskName");
		tbTask.szMapName = TabFile_GetCell(self.szConfigPath[1], nRow, "MapName");
		tbTask.szNpcName = TabFile_GetCell(self.szConfigPath[1], nRow, "NpcName");
		tbTask.nSex = tonumber(TabFile_GetCell(self.szConfigPath[1], nRow, "NpcGender"));
		tinsert(self.tbTaskList, tbTask)
	end
	
	nTotalRow = TabFile_GetRowCount(self.szConfigPath[2])
	self.tbNpcPos = {}
	for nRow = 2, nTotalRow do
		local tbPos = {}	
		tbPos.nMapId = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "MapId"));
		tbPos.nX = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "X"));
		tbPos.nY = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "Y"));
		tbPos.nNpcRes = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "NpcRes"));
		tbPos.szNpcName = TabFile_GetCell(self.szConfigPath[2], nRow, "NpcName");
		tbPos.szNpcScript = TabFile_GetCell(self.szConfigPath[2], nRow, "NpcScript");
		tbPos.nTaskId = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "TaskId"));
		if not self.tbNpcPos[tbPos.nMapId] then
			self.tbNpcPos[tbPos.nMapId] = {}
		end
		
		tinsert(self.tbNpcPos[tbPos.nMapId], tbPos)
	end
	return 1;
end

function tbTalkDailyTask:CheckCanAccept()
	if (self:_CheckCanAccept() ~= 1) then
		Talk(1,"",format("�ng ta �� no�n ���c th� c�a ta r�i, �a t� %s ng��i gi�p ��.",GetSex() == 1 and "Ch� " or "Ca Ca"))
		return nil;
	end
	return 1;
end

function tbTalkDailyTask:AcceptTask()
	if (self:CheckCanAccept() ~= 1) then
		return nil;
	end
	
	if (self:IsHaveTask() == 1) then
		local tbTask = self:GetTaskData(GetTask(self.TSK_TALK_TASK_ID));
		if (tbTask ~= nil) then
			Talk(1,"",format("V� n�y %s, Ng��i gi�p ta mang th� g�i cho<color=yellow>%s<color> ch�a? Ng��i nhanh ch�ng �i<color=red>%s<color>t�m%s�i, b�c th� n�y c�a ta r�t g�p ��y.", GetSex() == 1 and "Ch� " or "Ca Ca", tbTask.szNpcName, tbTask.szMapName, tbTask.nSex == 1 and "C� " or "Anh "));
		end
		return nil;
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1) then
		return nil;
	end
	
	local nTaskCount = getn(self.tbTaskList)
	
	local nId = random(1,nTaskCount)
	local tbTask = self.tbTaskList[nId]
	if tbTask == nil then
		return nil;
	end
	
	SetTask(self.TSK_TALK_TASK_ID, nId);
	SetTask(self.TSK_TALK_TASK_STATE, 0);
	
	Talk(1,"",format("V� n�y %s, ng��i c� quen<color=yellow>%s<color> c�a <color=red>%s<color> kh�ng? �� l�u l�m r�i ta ch�a g�p %s r�i, ng��i c� th� gi�p ta mang th� �i kh�ng? %s�ang �<color=red>%s<color>.", GetSex() == 1 and "Ch� " or "Ca Ca", tbTask.szMapName, tbTask.szNpcName, tbTask.nSex == 1 and "C� " or "Anh ", tbTask.nSex == 1 and "C� " or "Anh ", tbTask.szMapName));

	tbAwardTemplet:GiveAwardByList({szName="Th� c�a Long Nhi",tbProp={6,1,2571,1,0,0}}, "Ti�p nh�n nhi�m v� ��i tho�i nh�n ���c th� c�a Long Nhi");

	WriteLog(format("[%s]\t%s\t%s\t%s","Nhi�m v� h�ng ng�y",GetName(), GetAccount(),format("Nh�n nhi�m v� ��i tho�i: ��i tho�i v�i%s",tbTask.szNpcName)))

	return 1;
end

function tbTalkDailyTask:IsHaveTask()
	if GetTask(self.TSK_TALK_TASK_ID) <= 0 then
		return nil;
	else
		return 1;
	end
end

function tbTalkDailyTask:CancelTask()
	SetTask(self.TSK_TALK_TASK_ID, 0)
	SetTask(self.TSK_TALK_TASK_STATE, 0)
	return 1;
end

function tbTalkDailyTask:CheckCompleteTask()
	local nTskId = GetTask(self.TSK_TALK_TASK_ID);
	local nState = GetTask(self.TSK_TALK_TASK_STATE);
	local tbTask = self:GetTaskData(nTskId);
	
	if (self:IsHaveTask() ~= 1 or tbTask == nil) then
		Talk(1,"",format("V� n�y %s, t�m ta c� chuy�n g� kh�ng?", GetSex() == 1 and "Ch� " or "Ca Ca"));
		return nil;
	end
	
	if (nState ~= 1) then
		Talk(1,"",format("V� n�y %s,ng��i v�n ch�a gi�p ta mang th� cho<color=yellow>%s<color>. Ng��i nhanh nhanh �i<color=red>%s<color> t�m%s �i, b�c th� n�y c�a ta r�t g�p", GetSex() == 1 and "Ch� " or "Ca Ca", tbTask.szNpcName, tbTask.szMapName, tbTask.nSex == 1 and "C� " or "Anh "));
		return nil;
	end
	
	return 1;
end

function tbTalkDailyTask:CompleteTask()
	if (self:CheckCompleteTask() ~= 1) then
		return nil;
	end
	
	local tbTask = self:GetTaskData(GetTask(self.TSK_TALK_TASK_ID));
	
	SetTask(self.TSK_TALK_TASK_ID, 0)
	SetTask(self.TSK_TALK_TASK_STATE, 0)
	self:_CompleteTask();
	
	WriteLog(format("[%s]\t%s\t%s\t%s","Nhi�m v� h�ng ng�y",GetName(), GetAccount(),format("Nh�n nhi�m v� ��i tho�i: ��i tho�i v�i%s",tbTask.szNpcName)))
	AddStatData("richangrenwu_songxincishu")
	return 1;
end

function tbTalkDailyTask:TalkToNpc()
	local szNpc = GetNpcName(GetLastDiagNpc());
	local nTskId = GetTask(self.TSK_TALK_TASK_ID);
	local nState = GetTask(self.TSK_TALK_TASK_STATE);
	local tbTask = self:GetTaskData(nTskId);
	
	if (tbTask == nil or tbTask.szNpcName ~= szNpc or nState == 1) then
		Talk(1,"",format("��i hi�p ng��i c� nh�m ng��i kh�ng."));
		return nil;
	end
	
	if (PlayerFunLib:CheckItemInBag({tbProp={6,1,2571,-1,-1,0}}, 1, "��i hi�p th� c�a ng��i ��u?") ~= 1) then
		return nil;
	end
	
	PlayerFunLib:ConsumeEquiproomItem({tbProp={6,1,2571,-1,-1,0}}, 1)

	SetTask(self.TSK_TALK_TASK_STATE, 1);
	
	Talk(1,"",format("�a t� ��i hi�p."));
	return 1;
end


-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

Include("\\script\\task\\system\\task_main.lua");

TASKSTAT_START 	= 1
TASKSTAT_FINISH = 2
TASKSTAT_AWARD	= 3

-- ȷ������ʼ�Ļص�����
function OnMenuTaskStart(taskid)
	local taskname = TaskName(taskid);
	if (taskname ~= nil and OnCheckTaskStart(taskname) == 1) then
		-- ��������ʼ
		if (StartTask(taskname) == 1) then
			SetTaskStatus(taskname, TASKSTAT_START);
			OnTaskStart(taskname);
		end
	end
end

-- �������
function FinishTask(taskname)
	-- CloseTask(taskname);
	OnTaskFinish(taskname);
	SetTaskStatus(taskname, TASKSTAT_FINISH);
	OnTaskSay(taskname, TASKSTAT_FINISH);
end

-- ȷ��������ɵĻص�����
function OnMenuTaskFinish(taskid)
	local taskname = TaskName(taskid);
	if (taskname ~= nil and OnCheckTaskFinish(taskname, 1) == 1) then
		-- �����������
		FinishTask(taskname);
	end
end

-- ȷ�������콱�Ļص�����
function OnMenuTaskAward(taskid)
	local taskname = TaskName(taskid);
	if (taskname ~= nil and OnAward(taskname) == 1) then
		CloseTask(taskname);
		SetTaskStatus(taskname, TASKSTAT_AWARD);
	end
end

-- ɱ���¼�
function OnEventKillNpc(player_index, taskno, mapid, npctemp, npccount, npcpower, npclevel)
	local taskname = TaskName(taskno);
	if (taskname ~= nil and OnCheckTaskFinish(taskname, 2) == 1) then
		-- �����������
		FinishTask(taskname);
	end
end

-- ��������NPC���Ի�
function OnEventTalkNpc(npc_index)
	-- ��ȡ��һ������
	local taskname = FirstTask();
	if (taskname == nil) then
		return 0;
	end

	-- NPC����
	local npcname = GetNpcName(npc_index);
	
	if (npcname == nil) then
		return 0;
	end
	
	-- ̨�����Ҫת������ NPC NAME
	npcname = NpcName2Replace(npcname);

	-- ��ͼ����
	local x, y, subworld = GetNpcPos(npc_index);
	local mapname = SubWorldName(subworld);
	if (mapname == nil) then
		return 0;
	end

	-- ����ÿһ������
	while (taskname ~= nil) do
		if (TalkWithNpc(taskname, npcname, mapname) == 1) then
			return 1;
		else
			taskname = NextTask();
		end
	end
	return 0;
end

-- ������NPC�Ի�
function TalkWithNpc(taskname, npcname, mapname)
	if (OnTaskNpcTalk(npcname, mapname, taskname) ~= 1) then
		return 0;
	end
	local status = GetTaskStatus(taskname);
	local result = 1;
	if (status ~= nil) then
		OnTaskSay(taskname, status);
	else
		result = 0;
		print(format("Task[%s]'s status is nil!!!", taskname));
	end
	return result;
end

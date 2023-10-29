-- �ļ�������findnpctask.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-01-19 14:54:47
--�ҵ�npc�Ի��Ľű�
Include("\\script\\event\\springfestival08\\allbrother\\taskhead.lua")
function allbrother_0801_FindNpcTaskDialog(nTaskId)
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	if nTaskState == 0 then
		Say("B�n d��ng nh� v�n ch�a ti�p nh�n nhi�m v� c�a B�c ��u M�n.", 0)
	end
	if nTaskState > 1073741824 then
		Say("H�y mau ��n g�p B�c ��u L�o Nh�n ph�c m�nh.", 0)
	end
	if nTaskId == nTaskState then
		allbrother_0801_CompleteTask()
	end
end

function allbrother_0801_CheckIsDialog(nTaskId)
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nDate			= tonumber(GetLocalDate("%y%m%d"))
	if allbrother_0801_IsAct() ~= 1 then
		return 0;
	end
	if nTaskState == 0 then
		return 0;
	end
	if nTaskId ~= nTaskState then
		return 0
	end
	return 1;
end


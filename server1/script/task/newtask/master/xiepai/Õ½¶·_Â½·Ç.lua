
-- а��������ص�ս������½�ǽű�
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function OnDeath()
	SetMemberTask(1003,330,340,task_level50_09);
end

-- а��������ص�ս������ͽ�����˽ű�
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function OnDeath()
	SetMemberTask(1003,350,360,task_level50_12);
end
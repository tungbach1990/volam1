
-- а��������ص�ս������Ф�޳��ű�
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function OnDeath()
	SetMemberTask(1003,210,220,task_level40_05);
end
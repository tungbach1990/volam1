
-- 路人蔡公公脚本
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

local myTaskValue = GetTask(1003)

	if (myTaskValue==10) or (myTaskValue==20) then
		task_level20_02(); -- 与蔡公公对话
		return
	elseif (myTaskValue==40) then -- 已经杀死小太监
		task_level20_05();
		return
	end
	
	Say("H玬 trc ho祅g thng 甶 s╪, nh譶 th蕐 1 thi誹 n� ngo礽 th玭, v� t﹎ th莕 m� m蒼� ",0);

end

-- ·�˲̹����ű�
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

local myTaskValue = GetTask(1003)

	if (myTaskValue==10) or (myTaskValue==20) then
		task_level20_02(); -- ��̹����Ի�
		return
	elseif (myTaskValue==40) then -- �Ѿ�ɱ��С̫��
		task_level20_05();
		return
	end
	
	Say("H�m tr��c ho�ng th��ng �i s�n, nh�n th�y 1 thi�u n� ngo�i th�n, v� t�m th�n m� m�n� ",0);

end
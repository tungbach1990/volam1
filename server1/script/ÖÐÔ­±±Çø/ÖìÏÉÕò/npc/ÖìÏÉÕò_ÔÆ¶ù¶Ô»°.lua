
-- �������ƶ��ű�
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()


	if (myTaskValue == 10) then -- а��������ʽ����
		task_level20_00();
		return
	elseif (myTaskValue == 20) then
		Say("C�n ch�a chiu �i? Th�i C�ng c�ng � c�nh th�nh m�n ho�ng cung � L�m An.",0);
		return
	elseif (myTaskValue == 50) then -- ���꾩�Ĳ̹����Ի��������õ�������֬��
		task_level30_01();
		return
	elseif (myTaskValue == 130) or (myTaskValue == 120) then -- �ص����������ƶ��ĶԻ�
		task_level30_07();
		return
	end

	
	Say("Nh�n n��c ch�y d��i c�u khi�n ta c� th�y l�ng m�nh b�ng khu�ng! Gi� nh� hi�n gi� l� th�i b�nh th� hay bi�t m�y!",0);

end
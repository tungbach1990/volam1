--��ԭ���� �꾩�� ·��18�������Ի�

-- �޸ĺ���а��������ص��꾩�������ű�
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main(sel)

-- ������ϵͳ��а��������صĽű� --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==310) then
		task_level50_05();
		return
	elseif (myTaskValue==329) then
		task_level50_06();
		return
	elseif (myTaskValue==330) then -- ����õ���������ƿ�������������ĶԻ�
		Say("N�u nh� ng��i c� th� t�m gi�p ta b�nh hoa �� th� xem nh� ng��i l� �n nh�n c�a c� gia t�c ta!",0);
		return
	elseif (myTaskValue==340) then
		task_level50_10();
		return
	end

	
-- ������ϵͳ��а��������صĽű� --

Say("To�n l� h�ng s�nh s� h�o h�ng ��y! Kim c� ��u c�! Kh�ch quan! Chj�n 1 c�i �i!",0)

end;


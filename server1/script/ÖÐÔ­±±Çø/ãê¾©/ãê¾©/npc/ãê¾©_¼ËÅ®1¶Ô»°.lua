--��ԭ���� �꾩�� ��Ů1�Ի�

-- �޸ĺ���а��������ص��꾩����ű�
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main(sel)

-- ������ϵͳ��а��������صĽű� --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==300) then -- ���꾩������ĶԻ�
		task_level50_03();
		return
	end

	
-- ������ϵͳ��а��������صĽű� --

if ( GetSex() == 0 ) then      -- ����Ա�Ϊ��
Say("C�ng t�! ���ng xa m�i m�t! V�o u�ng v�i ti�u n� 1 ly r��u �i!",0)
else			       -- ����Ա�ΪŮ
Say("Xem d�ng c�ng t� phong tr�n thanh nh�! Cho ph�p ti�u n� ng�i c�nh nh�!", 0)
end;

end;



--�������� ���踮 ·��8��ţ�Ի�

Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 ~= 0 ) then
		branch_aniu()
	else
		Say("Ng��i ta n�i N� Oa ��p nh�t, c�ng kh�ng bi�t l� th�t hay gi� n�a!",0)
	end
end;
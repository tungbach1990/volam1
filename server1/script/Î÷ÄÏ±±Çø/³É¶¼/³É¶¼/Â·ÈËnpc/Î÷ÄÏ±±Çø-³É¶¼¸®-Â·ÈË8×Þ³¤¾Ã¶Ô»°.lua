--���ϱ��� �ɶ��� ·��8�޳��öԻ�
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 ~= 0 ) then
		branch_zouchangjiu()
	else
		Say("T� l�u �� nghe danh Xuy�n Mu�i T� l� c� n��ng v�a ��p l�i v�a c� t�i, h�m nay ���c di�n ki�n qu� l� l�i ��n kh�ng sai. N�u nh� m� ta ch�a c� n��ng t� th�...",0)
	end
end;


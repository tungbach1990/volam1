--��ԭ���� ���ݸ� �ο�1�Ի�
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 ~= 0 ) then
		branch_shenfeng()
	else
		Say("�� M�c nh� ���ng c� c�u th� 'Th�p Ni�n Nh�t Gi�c D��ng Ch�u M�ng, Doanh ��c Thanh L�u B�c H�nh Danh', h� t�t ph�i ch�m gi�t l�n nhau ch�?",0)
	end
end;



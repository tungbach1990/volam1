--��ԭ���� ����� ����ϰ�Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(204) == 1 then
		allbrother_0801_FindNpcTaskDialog(204)
		return 0;
	end

Say("U�ng tr� l�m cho th�n th� kho� m�nh, kh�ch quan mu�n u�ng 1 ly kh�ng?",0)

end;

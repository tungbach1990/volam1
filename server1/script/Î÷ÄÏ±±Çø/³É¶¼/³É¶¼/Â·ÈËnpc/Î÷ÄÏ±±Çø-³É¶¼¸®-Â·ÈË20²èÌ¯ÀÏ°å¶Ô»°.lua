--���ϱ��� �ɶ��� ·��20��̯�ϰ�Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(185) == 1 then
		allbrother_0801_FindNpcTaskDialog(185)
		return 0;
	end
Say("Mu�n u�ng tr� g�? M�t �m tr� Mao Ti�m nh�?",0)

end;

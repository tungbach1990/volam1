--��ԭ���� ������ ·��9�������Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

function main(sel)
	if allbrother_0801_CheckIsDialog(184) == 1 then
		allbrother_0801_FindNpcTaskDialog(184)
		return 0;
	end
i = random(0,1)

if (i == 0) then
Say("Nh� ��ng t�u qu� kh� kh�n! ��i l�t n�a ta s� cho b� m�t bao g�o, nhanh l�n!",0)
return
end;

if (i == 1) then
Say("M�i ng��i ��u l� t�nh l�ng ngh�a x�m, gi�p �� nhau l� chuy�n ph�i l�m!",0)
end;

end;


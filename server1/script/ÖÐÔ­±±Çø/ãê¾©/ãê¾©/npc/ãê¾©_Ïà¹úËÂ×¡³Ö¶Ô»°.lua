--��ԭ���� �꾩�� �����ס�ֶԻ�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	
	if allbrother_0801_CheckIsDialog(190) == 1 then
		allbrother_0801_FindNpcTaskDialog(190)
		return 0;
	end
Say("Ng��i ��i l� ra ph�i t� ��i giai kh�ng, kh�ng m�ng chuy�n n��c, nh�ng nh�n giang s�n suy t�n, sinh linh �� th�n, ng��i ��i sao m� kh� th�?", 0);
end;



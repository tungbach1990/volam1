--������ ������ ·��7����Ϊ�Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(200) == 1 then
		allbrother_0801_FindNpcTaskDialog(200)
		return 0;
	end

i = random(0,2)

if (i == 0) then
Say("Ba L�ng huy�n c�a ch�ng ta l� m�t v�ng ��t nh�, nh�ng cu�c s�ng c�a m�i ng��i r�t an b�nh. ",0)
return
end;

if (i == 1) then
Say("Thi�n V��ng Bang ch�nh l� c�u c�nh c�a ch�ng ta, n�u kh�ng c� h� th� thi�n h�nh ��o, ch�ng ta h�n �� b� b�n tham quan nh�ng nhi�u r�i!",0)
return
end;

if (i == 2) then
Say("Trong m�t c�a b�ch t�nh, Thi�n V��ng Bang ��u l� nh�ng v� anh h�ng h�o h�n! Thanh thi�u ni�n trong huy�n ��u mong mu�n gia nh�p Thi�n V��ng bang!",0)
end;

end;


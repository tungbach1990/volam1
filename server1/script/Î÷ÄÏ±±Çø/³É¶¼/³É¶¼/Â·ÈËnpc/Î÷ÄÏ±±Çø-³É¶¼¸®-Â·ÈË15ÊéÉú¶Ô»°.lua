--���ϱ��� �ɶ��� ·��15�����Ի�
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(186) == 1 then
		allbrother_0801_FindNpcTaskDialog(186)
		return 0;
	end
i = random(0,1)

if (i == 0) then
Talk(2, "", "Ng��i kh�ng bi�t h�? ��y ch�nh l� V�ng Giang l�u �� k� ni�m m�t ��i t�i n� Huy�t ��o m� x�y n�n, truy�n thuy�t k� r�ng �� c� t�ng l�y n��c gi�ng � ��y, t� tay �� th�, �� l�u l�i nh�ng c�u th� bu�n l�m ��ng l�ng ng��i.", "Huy�t ��o l�c s�ng r�t y�u th�ch tr�c, n�n quanh ��y m�i ng��i tr�ng r�t nhi�u tr�c, ph��ng v� th�m th�m, long ng�m t� t�, t� qu� th��ng th�y,t �nh h�ng v� c�ng, th��ng d��ng k� gi�n, khi�n nhi�u ng��i truy�n t�ng.")
return
end;

if (i == 1) then
Say("L�n V�ng Giang L�u m� nh�n ra xa, dung th�nh t� m�o, c�m giang xu�n s�c, thu v�o t�m m�t, khi�n cho l�ng ng��i tho� th�ch.",0)
end;

end;

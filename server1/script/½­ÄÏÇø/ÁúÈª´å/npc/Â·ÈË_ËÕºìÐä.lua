-- ��Ȫ�塡·�ˡ��պ���
-- by��Dan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(203) == 1 then
		allbrother_0801_FindNpcTaskDialog(203)
		return 0;
	end
	Talk(1,"","Ta l�c nh� th�n th� g�y y�ucha ta m�i v� s� v� d�y v� cho ta. B�y gi� ta �� h�c th�nh v� c�ng, kh�ng c�n s� b� ai khinh r� n�a")
end;

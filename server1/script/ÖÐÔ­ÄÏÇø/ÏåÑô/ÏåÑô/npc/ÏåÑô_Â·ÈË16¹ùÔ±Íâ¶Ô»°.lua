--��ԭ���� ������ ·��16��Ա��Ի�
-- edit by С�˶��

Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(183) == 1 then
		allbrother_0801_FindNpcTaskDialog(183)
		return 0;
	end
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,2)
		Describe("Qu�ch vi�n ngo�i: Trung thu �� ��n, ch� c�n thu th�p �� 6 <color=red>m�nh tranh Ti�n V�<color> �� h�p th�nh 1 b�c tranh ho�n ch�nh mang ��n cho ta, ta s� t�ng l�i ��i hi�p 1 b�nh <color=red>Ph�ng Nguy�t Qu� Dung<color>.",2,"��i b�nh Ph�ng Nguy�t Qu� Dung/makeItemUI","Nh�n ti�n gh� qua th�i/NoChoice")
	else
		Describe("Ta �� �em to�n b� gia s�n quy�n g�p cho tri�u ��nh. N��c nh� g�p n�n, m�i ng��i d�n �� c� tr�ch nhi�m. Ta ch� g�p ch�c s�c m�n n�y m� c� x� g�! So v�i c�c chi�n s� ng� xu�ng tr�n sa tr��ng, ch�t ��ng g�p nh� nh�t n�y n�o c� ��ng chi!",1,"Bi�t r�i/NoChoice")
	end
end;

--��ԭ���� ���ݸ� ·��6��һ���Ի�

Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(194) == 1 then
		allbrother_0801_FindNpcTaskDialog(194)
		return 0;
	end
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_jiangyixiao()
	else
		i = random(0,1)

			if (i == 0) then
			Say("Kh�ng c� c� g�i n�o s�nh b�ng c� �y, trong m�t ta, ch� c� m�t m�nh n�ng. Nh�ng v� sao th� ta kh�ng gi�i th�ch ���c?",0)
			return
			end;
			
			if (i == 1) then
			Say("Ta tuy ngh�o, nh�ng ta ��i v�i Hi�u Ch�n l� th�t l�ng!",0)
			end;
			
			
	end
end


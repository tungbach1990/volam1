--�������� ���踮 �ھ��ϰ�Ի�
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(188) == 1 then
		allbrother_0801_FindNpcTaskDialog(188)
		return 0;
	end
	
	Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 ~= 0 ) then
		branch_shuangying()
	else
		i = random(0,1)
		if (i == 0) then
		Say("Song �ng ti�u c�c ch�ng ta � T�y B�c, b�n b� t�t x�u ��u c�. V� v�y c�ng vi�c b�o Ti�u kh�ng th�t tho�t, c�ng nh� v�o s� n� m�t c�a b�n b� tr�n giang h� ",0)
		else
		Say("Ch�ng ta l� nh�ng ng��i b�o Ti�u, ngo�i kh� n�ng c�n ph�i d�a v�o hai ch� 'giao t�nh' v�i b�ng h�u tr�n giang h�. C� l�c c�n hi�u qu� h�n r�t nhi�u", 0)
		end;
	end
end
		
		
----���ϱ��� ����� ·��2����̫�Ի�

Include("\\script\\task\\newtask\\branch\\zhengpai\\branch_zhengpaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
	Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 ~= 0 ) then
		branch_wulaotai()
	else
		Say("Tuy ta kh�ng c� con trai, nh�ng �� c� m�t ��a con g�i ngoan hi�n hi�u thu�n, ng��i ta ��u n�i b� nh� ta c� ph�c!",0)
	end
end;
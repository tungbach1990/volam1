--��ԭ���� ���ݸ� ·��17������Ի�
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(sel)
	Uworld1054 = nt_getTask(1054)
	if ( Uworld1054 ~= 0 ) then
		branch_leqingqiu()
	else
		Say("Ta ch�ng c� b�n l�nh g�, ch� bi�t d�a v�o t�i v� tranh m� s�ng qua ng�y", 0);
	end
end;





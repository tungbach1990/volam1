--��ԭ���� ������ �ӻ����ϰ�Ի�
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("Ch� c�n kh�ch gia mu�n, � ��y kh�ng th� g� l� kh�ng c�.",getn(buttons), buttons);
end;


function yes()
Sale(87);   			--�������׿�
end;


function no()
end;
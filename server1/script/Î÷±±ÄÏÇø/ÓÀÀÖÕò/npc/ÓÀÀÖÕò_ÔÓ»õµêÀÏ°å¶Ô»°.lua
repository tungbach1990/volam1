--�������� ������ �ӻ����ϰ�Ի�
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("kh�ch quan mu�n c�n mua g�? Th� g� c�ng c�!",getn(buttons), buttons);
end;


function yes()
Sale(84);   			--�������׿�
end;


function no()
end;
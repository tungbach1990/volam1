--���ϱ��� ����� �ӻ����ϰ�Ի�
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("H�ng ch�t ��y trong ti�u �i�m, Kh�ch quan mu�n mua g� n�o? H�y v�o xem th� �i!",getn(buttons), buttons);
end;


function yes()
Sale(23);   			--�������׿�
end;


function no()
end;







--��ԭ���� ����� �ӻ����ϰ�Ի�
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("H�ng h�a m�i mi�n ti�m ta ��u c�!",getn(buttons), buttons);
end;


function yes()
Sale(90);   			--�������׿�
end;


function no()
end;
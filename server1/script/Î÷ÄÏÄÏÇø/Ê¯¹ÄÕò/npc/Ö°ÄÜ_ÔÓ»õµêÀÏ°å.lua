-- ʯ���� ְ�� �ӻ����ϰ�
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("Kh�ch quan mu�n mua g�? Mu�n g� c�ng c�! ",getn(buttons), buttons);
end;

function yes()
	Sale(26)			-- ��ʱʹ�ã�������������
end;

function no()
end;

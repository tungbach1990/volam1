--������ ְ�� �ӻ����ϰ�
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");
function main(sel)
	local buttons = store_sel_village_extend()
		Say("B�n ti�m tuy nh� nh�ng th� g� c�ng c�. Kh�ch quan mu�n mua g�?",getn(buttons), buttons)
end;

function yes()
	Sale(26)
end;

function no()
end;

--��ԭ���� ������ ҩ���ϰ�Ի�
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
Say("Kh�ch quan mu�n mua g�?", 3, "Giao d�ch/yes","Ta ��n nh�n nhi�m v� S� nh�p/yboss", "Kh�ng giao d�ch/no");
end;


function yes()
Sale(88);  		--�������׿�
end;


function no()
end;


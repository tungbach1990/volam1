-- ʯ���� ְ�� ҩ���ϰ�
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
		Say("Th�ch C� Tr�n t� truy�n, b�o ��m tr� b� b�nh, Kh�ch quan mu�n mua g�?", 3, "Giao d�ch/yes","Ta ��n nh�n nhi�m v� S� nh�p/yboss", "Kh�ng giao d�ch/no")
end;

function yes()
	Sale(27);  			--�������׿�
end;

function no()
end;

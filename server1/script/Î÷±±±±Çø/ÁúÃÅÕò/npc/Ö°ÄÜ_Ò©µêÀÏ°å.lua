-- ������ ְ�� ҩ���ϰ�
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main()
		Say("�� ��n Long M�n tr�n n�y th� n�n mua �t th��ng d��c �� ph�ng tr�i gi� tr� tr�i!", 3, "Giao d�ch/yes","Ta ��n nh�n nhi�m v� S� nh�p/yboss", "Kh�ng giao d�ch/no")
end;

function yes()
	Sale(27);  			--�������׿�
end;

function no()
end;

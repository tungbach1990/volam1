--�������� ������ ҩ���ϰ�Ի�
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")


function main(sel)
		Say("H�nh t�u giang h�, chu�n b� tr��c �t th��ng d��c ph�ng th�n s� kh�ng th�a ��u!", 3, "Giao d�ch/yes","Ta ��n nh�n nhi�m v� S� nh�p/yboss", "Kh�ng giao d�ch/no");
end;


function yes()
Sale(85);  		--�������׿�
end;


function no()
end;



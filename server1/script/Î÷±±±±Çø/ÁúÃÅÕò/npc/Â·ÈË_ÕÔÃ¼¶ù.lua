--������ ·�� ��ü�� ���������ӿ���
-- By: Dan_Deng(2003-09-04)

function main(sel)
	UTask_world26 = GetTask(26)
	if (UTask_world26 == 3) then		-- ������
		Talk(8,"W26_step2","Mi Nhi c� n��ng! C� ng��i nh� ta b�o tin cho c� ","Tin g� v�y?","Ti�u D�ch �nh �� ch�t.","C�i g�?","Ti�u D�ch �nh �� ch�t r�i.","Kh�ng th� n�o...Ng��i g�t ta! Ta kh�ng tin!"," (R�t cu�c l� th� n�o?) "," L� ai n�i v�i ng��i?")
	else				-- ������Ի�
		Talk(1,"","Ta ng�y th�ng � ��y ch� mong, cu�i c�ng th� ��i ��n khi n�o ��y?")
	end
end;

function W26_step2()
	Talk(1,"","Ta �ta kh�ng th� n�i ���c! C�o t�!")
	SetTask(26,6)
	AddNote("Mang tin n�y n�i v�i Tri�u Mi Nhi, kh�ng ng� ph�n �ng c�a n�ng ta m�nh m� nh� v�y. Hay l� ta quay l�i h�i l�o �n m�y. ")
	Msg2Player("Mang tin n�y n�i v�i Tri�u Mi Nhi, kh�ng ng� ph�n �ng c�a n�ng ta m�nh m� nh� v�y. Hay l� ta quay l�i h�i l�o �n m�y. ")
end;

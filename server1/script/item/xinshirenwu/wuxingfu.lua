function GetDesc(nItem)
	return ""
end

function main(nItem)
	Say("M� Ng� H�nh Ph� s� nh�n ���c 4 t�m ph� l�m gi�m n�ng l�c ph�ng ng� <color=red> B�o Kh� Th� H� Gi� <color> Thi�n B�o Kh�", 6, 
		"Nh�n ���c 4 Tri�t Kim Ph�/get_chejinfu",
		"Nh�n ���c 4 Tri�t M�c Ph�/get_chemufu", 
		"Nh�n ���c 4 Tri�t Th�y Ph�/get_cheshuifu", 
		"Nh�n ���c 4 Tri�t H�a Ph�/get_chehuofu", 
		"Nh�n ���c 4 Tri�t Th� Ph�/get_chetufu", 
		"�� ta suy ngh� tr��c ��/no");
	return 1	
end

function get_chejinfu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>Xin h�y s�p x�p l�i h�nh trang �t nh�t c�n tr�ng 1 � r�i h�y s� d�ng Ng� H�nh Ph�")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] s� d�ng Ng� H�nh Ph� nh�n ���c 4 Tri�t Kim Ph�",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--�۳����з�
	for i = 1, 4 do
		AddItem(6,1,2807,0,0,0)
	end;
end

function get_chemufu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>Xin h�y s�p x�p l�i h�nh trang �t nh�t c�n tr�ng 1 � r�i h�y s� d�ng Ng� H�nh Ph�")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] s� d�ng Ng� H�nh Ph� nh�n ���c 4 Tri�t M�c Ph�",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--�۳����з�
	for i = 1, 4 do
		AddItem(6,1,2808,0,0,0)
	end;
end

function get_cheshuifu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>Xin h�y s�p x�p l�i h�nh trang �t nh�t c�n tr�ng 1 � r�i h�y s� d�ng Ng� H�nh Ph�")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] s� d�ng Ng� H�nh Ph� nh�n ���c 4 Tri�t Th�y Ph�",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--�۳����з�
	for i = 1, 4 do
		AddItem(6,1,2809,0,0,0)
	end;
end

function get_chehuofu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>Xin h�y s�p x�p l�i h�nh trang �t nh�t c�n tr�ng 1 � r�i h�y s� d�ng Ng� H�nh Ph�")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] s� d�ng Ng� H�nh Ph� nh�n ���c 4 Tri�t H�a Ph�",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--�۳����з�
	for i = 1, 4 do
		AddItem(6,1,2810,0,0,0)
	end;
end

function get_chetufu()
	if (CalcFreeItemCellCount() < 1) then
		Talk(1, "", "<#>Xin h�y s�p x�p l�i h�nh trang �t nh�t c�n tr�ng 1 � r�i h�y s� d�ng Ng� H�nh Ph�")
		return 1
	end
	WriteLog(format("Account:%s[Name:%s] s� d�ng Ng� H�nh Ph� nh�n ���c 4 Tri�t Th� Ph�",
				GetAccount(),
				GetName())
			);
	ConsumeEquiproomItem(1, 6, 1, 2806, -1);--�۳����з�
	for i = 1, 4 do
		AddItem(6,1,2811,0,0,0)
	end;
end

function no()
end

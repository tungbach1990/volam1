--���ϱ��� �ɶ��� ҩ���ϰ�Ի�

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main(sel)
	Say("L�c ta c�n tr�, mu�n l�m m�t danh y gi�ng nh� Hoa ��, sau n�y l�p gia th�t sinh con �� c�i, v� nu�i m�y mi�ng �n m� ch� c� th� m� c�i ti�m thu�c n�y th�i. Chao!Con ng��i c�a ta, nhi�u chuy�n n�y gi� m� v�n ch�a h�i kh�ch quan c�n mua thu�c g�?",
		3,
		"Giao d�ch/yes",
		--"Ta mu�n ch� t�o H�n Nguy�n Linh L�/refine",
		"Kh�ng giao d�ch/Cancel")
end

function yes()
	Sale(15) 		--�������׿�
end

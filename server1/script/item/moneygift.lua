function main(nItemIndex)
	Say("Qu�c Kh�nh vui v�!B�n c� th� �em qu� Qu�c Kh�nh ��n c�c th�nh th� g�p l� quan �� ��i ng�n l��ng. Y�u c�u ��ng c�p tr�n 50, m�i t�i kho�n ch� ���c 3 nh�n v�t tham gia.", 2,
	"H�y b� v�t ph�m n�y./#del_moneygift("..nItemIndex..")",
	"H�y b� /OnCancel");
	return 1;
end;

function OnCancel()
end;

function del_moneygift(nItemIndex)
	RemoveItemByIndex(nItemIndex);
end;
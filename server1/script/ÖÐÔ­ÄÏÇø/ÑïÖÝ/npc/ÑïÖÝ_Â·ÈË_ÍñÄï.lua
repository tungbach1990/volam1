--��ԭ���� ���ݸ� ����

function main(sel)
	Say("B�n l� ph�c t�t n�m kh�, thi�p ch�c t�t ��y!",2,"Ta ch�n xem. /yes","Kh�ng mua/no")
end;

function yes()
	Say("Trang ph�c nam ��n xu�n, trang ph�c n� m�ng tu�i, ��ng gi� l� 88888 l��ng!",3,"Nh�n �o m�i /male","�o m�ng tu�i /female","Kh�ng mua/no")
end;

function no()
	Say("Kh�ng mua c�ng kh�ng sao! Ch�c kh�ch quan n�m m�i vui v�!",0)
end;

function male()
	if(GetCash()>=88888)then
		AddItem(0,2,28,7,0,0,0)
		Pay(88888)
	else
		Say("Ti�n c�a kh�ch quan kh�ng ��, l�y �� ti�n r�i h�y ��n mua!",0)
	end
end;

function female()
	if(GetCash()>=88888)then
		AddItem(0,2,28,8,0,0)
		Pay(88888)
	else
		Say("Ti�n c�a kh�ch quan kh�ng ��, l�y �� ti�n r�i h�y ��n mua!",0)
	end
end;

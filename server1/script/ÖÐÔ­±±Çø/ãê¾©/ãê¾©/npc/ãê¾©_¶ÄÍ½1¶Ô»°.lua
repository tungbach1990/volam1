--description: ��ԭ���� �꾩�� ��ͽ1�Ի� ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) and (HaveItem(129) == 0) then
		Talk(8, "select", "H�m tay ta th�t l� xui x�o! ��t v�n n�o thua v�n ��! B�y gi� b�n ng��i ch� c�n c�y ki�m c�n n�y th�i!", "�o�n Ki�m! L�o huynh! C�y ki�m n�y huynh c� b�n kh�ng?", "B�n! B�n ch�! Ng�oi th�t c� m�t tinh t��ng ��! Nhi�u ng��i h�i r�i m� ta ch�a b�n, v� h� kh�ng bi�t nh�n!", "C�n bao nhi�u ti�n?", "Kh�ng m�c! Ch� c�n 500 l��ng!", "C� ��ng gi� v�y kh�ng?", "Ng��i xem ta �� t� t�i th� n�y r�i! Th�i th� xem nh� ng��i gi�p �� k� kh�n kh� v�y!", "Th�i c�ng ���c! (D� sao ta c�ng �ang c�n n�) ")
	elseif (UTask_tr > 60*256+20) then 
		Talk(1,"","Ta kh�ng c�n th� g� ��ng gi� �� b�n n�a!")
	else
		Talk(1,"","M�y ng�y nay ta kh�ng c� g� v�o b�ng! L�n n�y v� th� n�o c�ng b� con s� t� � nh� x� x�c!")
	end
end;

function select()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(129)
		Msg2Player("L�y ���c �o�n ki�m Chuy�n H�n ")
		AddNote("�i ��n s�ng b�c � Bi�n Kinh, mua m�t thanh �o�n ki�m m�t 500 l��ng ")
	else
		Talk(1,"","Ch� l� ng��i c�ng ngh�o m�t gi�ng ta v�y sao?")
	end
end;

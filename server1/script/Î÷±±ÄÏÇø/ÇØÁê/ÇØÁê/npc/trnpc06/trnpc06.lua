--description: ����ũ������30������
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if ((UTask_tr == 30*256+20) and (HaveItem(62) == 0)) then			-- ����״̬�Ի�
		Talk(3, "select", "H�m qua ta l�m v��n, nh�t ���c m�t vi�n ng�c m�u, ph�t ra �nh s�ng tr�ng r�t l� l�. Nh�ng ch�ng th� �n ch�ng th� m�c,v�y d�ng v�o vi�c g�? Th�ng tr��c V��ng Th�t c�ng th�n c�ng ��o ���c m�t t�i b�c, nh� �� s� �� th� kh�ng bi�t? H� th� ��o ���c t�i b�c c�n ta th� ��o ���c m�t c�c ��, th�t xui x�o!", " (Ch�ng l� l� l� V�n M�ng T�?!) ��i th�c! Ta mu�n mua vi�n �� n�y! Th�c b�n kh�ng?", "Ta kh�ng nghe l�m ch�, th�t s� ng��i mu�n mua �? (G�p may r�i, ��ng l� m�t th�ng ng�c!) . ���c ���c! Ch� c�n ng��i ��a ta 100 l��ng th� vi�n �� n�y l� c�a ng��i")
	elseif (UTask_tr >=30*256+20) then								--ִ����30������
		Talk(1,"","Ng��i c�n mu�n mua n�a kh�ng? L�n sau ta ��o ���c s� b�n r� h�n cho!")
	else						-- ȱʡ�Ի�
		Talk(1,"","C� ��i l�m ru�ng, bi�t ��n khi n�o m�i ��o ���c ch�u b�u �� ph�t t�i ��y!")
	end
end;

function select()
	if (GetCash() >= 100) then
		Pay(100)
		AddEventItem(62)
		Msg2Player("���c B�o Th�ch V�n M�ng T� ")
		AddNote("Trong khu r�ng ngo�i T�n L�ng ��a, g�p m�t ng��i n�ng d�n, mua ���c B�o Th�ch V�n M�ng T�. ")
	else
		Talk(1,"","Khi n�o �� ti�n, l�i ��n t�m ta nh�!")
	end
end;

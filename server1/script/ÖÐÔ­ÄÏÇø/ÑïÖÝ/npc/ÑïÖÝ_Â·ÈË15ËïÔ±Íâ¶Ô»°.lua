-- ���� ·��NPC ��Ա�⣨��������
-- by��Dan_Deng(2003-07-28)

function main()
	Uworld30 = GetByte(GetTask(30),2)
	if ((Uworld30 == 10) and (HaveItem(75) == 0)) then		--���������в���û�и���Ʒ
		Say("Ph�i khen th� n�o ��y?",4,"B�n b� /prise_1","T�i ph�c /prise_2","Con ch�u. /prise_3","R�i kh�i/prise_exit")
	else					--����ͨ�Ի��и�һ���������ʾ��
		if (random(0,1) == 0) then
			Talk(1,"","B�n c�ng kh� �� su�t ng�y c� ��n qu�y r�i! H�m! M�t ch�t ta c�ng kh�ng cho!")
		else
			Talk(1,"","Ta n�m nay �� g�n 50 tu�i r�i, m�t ��a con trai c�ng kh�ng c�. Sau n�y bao nhi�u s�n nghi�p n�y ta kh�ng bi�t ph�i nh��ng l�i cho ai ��y!")
		end
	end
end;

function prise_1()
	Talk(2,"","V� l�o gia n�y, v�a nh�n �� bi�t ngay l� ng��i h�o hi�p th��ng ng��i. B�ng h�u n�i n�o c�ng c�. Th�t ��ng l� M�nh Th��ng Qu�n th� hai v�y"," M�nh Th��ng Qu�n l� c�i th� g�? H�n c� ���c bao nhi�u ti�n? C�i ��m b�n c�ng n�y su�t ng�y c� ��n ��y �� v�i xin! Ch�c ng��i c�ng v�y th�i! �i! �i! �i!")
end;

function prise_2()
	Talk(2,"","V� l�o gia n�y gi�u c� nh�t v�ng, danh ti�ng kh�p n�i. ��n Ho�ng Th��ng c�ng kh� m� b� ���c v�i s� ph� qu� c�a ng�i! Ta ch�c �ng ti�n v� ng�y c�ng nhi�u,phi�n ph�c ng�y c�ng �t!"," H�m!C�i t�n ti�u qu� n�y mi�ng l��i c�a h�n m�i ng�t l�m sao! ���c! Xem nh� h�m nay ta m� l�ng m�t l�n v�y. Mi�ng 'b�n ch�' n�y ta t�ng cho ng��i!")
	AddEventItem(75)
	Msg2Player("T�n Vi�n Ngo�i t�ng b�n B�n ch� ")
	AddNote("T�n Vi�n Ngo�i t�ng b�n B�n ch� ")
end;

function prise_3()
	Talk(2,"","V� l�o gia n�y th�t c� ph�c t��ng. Trong nh� nh�t ��nh l� c� nhi�u 'ki�u th� m� thi�p ' v� qu� t� ��y nh� ph�i kh�ng?","H�m! Kh�ng n�i th� th�i! N�i ra l�i c�n bu�n! Ta n�m nay �� g�n 50 tu�i, m�t ��a con trai c�ng kh�ng c�, bao nhi�u s�n nghi�p ng�y sau kh�ngbi�t �� l�i cho ai?")
end;

function prise_exit()
end;

--description: ��ԭ���� �꾩�� ·��3С���Ի� ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),3)
		if (UTask_trsub60 == 2) then 
			Talk(2, "", "Ti�u H�i ngoan! Mau v� nh� �i, m� ng��i �ang lo l�ng cho ng��i ��y! ", "�! Ng��i n�i v�i m� ta, ta ch�i th�m m�t ch�t n�a r�i v�! N�i b� �y ��ng c� lo l�ng!")
			SetTask(28, SetByte(GetTask(28),3,4))
			AddNote("T�m ���c Ti�u H�i trong Qu�ng tr��ng trong th�nh. Khuy�n c�u ta �i v� nh� ")
			Msg2Player("T�m ���c Ti�u H�i trong Qu�ng tr��ng trong th�nh. Khuy�n c�u ta �i v� nh� ")
		elseif (UTask_trsub60 >= 4) then 
			Talk(1,"","Ta ch�i th�m ch�t n�a, r�i s� v� nhanh th�i!")
		end
	else
		Talk(1,""," Ch�u th�ch �n nh�t l� k�o h� l� b�n � ti�m c�a ���ng l�o, nh�ng m� m� ta kh�ng cho ta mua. B�o r�ng n�u �n nhi�u s� b� �au b�ng.")
	end
end;

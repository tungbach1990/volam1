--���ϱ��� �ɶ��� ·��22����ĶԻ�
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function main(sel)
	UTask_tm = GetTask(2);
	if (UTask_tm == 10*256+20) or (UTask_tm == 10*256+30) then						--����ʮ�����������
		Talk(5, "", "Th�t l� t�c ch�t! Th�t l� l�ng d� th�m ��c!", "V� c� n��ng n�y c� chuy�n g� v�y?", "V�a r�i � tr�n ���ng c� ng��i c�m m�t t�i �� n�i l� Thi�n y V� Ph�ng Ch�m v� c�ng hi�m, ta ngh� ���ng nhi�n r�i. K�t qu� ph�i t�n 10 l��ng b�c m�i mua ���c. V� ��n m� ra xem, � trong bao l� nh�ng c�y kim nh� x�u �en th�i �en thui, kh�ng d�ng �� th�u ���c. Ng��i n�i xem c� ��ng gi�n kh�ng?", " (Ch�nh l� Ma V� Ch�m m� ta mu�n t�m, may m� ng��i l�y ���c) . C� n��ng kh�ng d�ng ���c, chi b�ng nh��ng l�i cho ta!", "Ch�m n�y ta ph�i t�n 10 l��ng b�c m�i mua ���c, l�m sao m� tu� ti�n cho ng��i ���c! N�u ng��i mu�n ��i th� ph�i l�y nh�n m� n�o ��n ��i l�y ch�m.")
		SetTask(2, 10*256+40)
		Msg2Note("T�n Uy�n y�u c�u b�n d�ng chi�c nh�n M� N�o ��n ��i Ma V� Ch�m ")
		AddNote("T�m ���c T�n Uy�n (394, 323) , bi�t ���c t�ng t�ch c�a Ma V� Ch�m, nh�ng c�n ph�i d�ng nh�n M� n�o ��i. ")
	elseif ((UTask_tm == 10*256+40) and ( HaveItem(165) == 1)) then				--����觽�ָ
		Talk(1,"","A! Nh�n m� n�o ��p qu�! Bao kim th�u n�y ng��i c�m �i.")
		DelItem(165)
		AddEventItem(36)
		Msg2Player("T�m ���c Ma V� Ch�m. ")
		SetTask(2, 10*256+80)
		AddNote("�em nh�n M� n�o t�ng cho T�n Uy�n s� ���c Ma V� Ch�m ")
	elseif ((UTask_tm == 10*256+80) and (HaveItem(36) == 0)) then		-- ���߶���
		AddEventItem(36)
		Talk(1,"","Ng��i kia! Ng��i ��nh r�i bao kim n�y! G�i ng��i c�ng kh�ng quan t�m! Tr� l�i cho ng��i ��y! L�n n�y ��ng l�m r�i n�a!")
	else
		Talk(1,"","L�c Ph�ch T� ��: �,ng��imu�n xem b�o b�i c�a ta h�? Ta nh�n ng��ith� bi�t ng��il� ng��i kh�ng bi�t xem h�ng ho�.")
	end
end;

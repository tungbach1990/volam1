--description: �������渾��ɩ
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(205) == 1 then
		allbrother_0801_FindNpcTaskDialog(205)
		return 0;
	end
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then 		--40������
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 3) then		-- ����������
			Talk(1,"","Ch�ng ta �� ra s�ng b�t c� r�i, g�n s�p tr� v�. �ng ta th�ch �n canh Ng�n Nh� Li�n T� nh�t. Nh�ng kh�ng may l� h�t sen trong ng�y ta �� d�ng h�t c� r�i, ta �ang b�n gi�t ��, ng��ic� th� �i ��n ti�m t�p ho� � Ba L�ng huy�n mua v� m�t �t h�t sen kh�ng ���c kh�ng?")
			SetTask(14, 5)
			AddNote("T�i Thu� Tr�i � ��o Thi�n V��ng g�p ���c ng� ph� H� T�u gi�p b� ta ��n ti�m t�p ho� � Ba L�ng huy�n, mua v� m�t �t Li�n T� ")
			Msg2Player("T�i Thu� Tr�i � ��o Thi�n V��ng g�p ���c ng� ph� H� T�u gi�p b� ta ��n ti�m t�p ho� � Ba L�ng huy�n, mua v� m�t �t Li�n T� ")
		elseif (UTask_tw40sub == 5) then
			if (HaveItem(148) == 1) then		-- ���������
				Talk(1,"","C�m �n ng��i�� mua gi�p ta mua h�t sen v�, 3 qua tr�ng g� n�y t�ng xin t�ng ng��i")
				DelItem(148)
				AddEventItem(149)
				Msg2Player("Nh�n ���c 3 qu� tr�ng ")
				SetTask(14, 7)
				AddNote("Mang Li�n T� giao cho H� t�u, nh�n ���c 3 qu� tr�ng ")
			else
				Talk(1,"","H�t sen c� b�n t�i ti�m t�p ho� � Ba L�ng huy�n")
			end
		elseif (UTask_tw40sub == 7) then
			if (HaveItem(149) == 0) then
				AddEventItem(149)
				Talk(2,"","H� t�u! Ta kh�ng c�n th�n �� ��nh r�i m�t nh�ng qu� tr�ng c�a t�u r�i, t�u c� th� cho ta l�i m�y qu� n�a ���c kh�ng?","Xem th�y ng��i r�t lo l�ng, � ��y c�n c� 3 qu� tr�ng, ta t�ng ng��i!")
			else
				Talk(1,"","Canh Ng�n Nh� Li�n T� n�u g�n xong r�i, sao v�n ch�a th�y l�o ta v� ch�?")
			end
		elseif (UTask_tw40sub == 0) then
			Talk(1,"","Ai c� th� gi�p ta �i mua h�t sen v� th� t�t qu� ")
		else
			Talk(1,"","Ch�ng ta sao b�y gi� v�n ch�a v� n�a?")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","Ch�ng ta l� m�t ng��i ch�t ph�c, ��n b�y gi� v�n c�n l� m�t ph� ��o l�nh. Kh�ng bi�t khi n�o m�i c� th� n� m�y n� m�t!")
		else
			Talk(1,"","Trong c�c h� ph�p c�a b�n bang, L� l�o h� ph�p ��i v�i c�c thu�c h� l� �� l��ng nh�t, H� h� ph�p l� �t n�i nh�t, V��ng ti�n s� l� ng��i b�c tr�c nh�t, D��ng H�u s� l� ng��i th�ng minh s�ng su�t nh�t,")
		end
	end
end;

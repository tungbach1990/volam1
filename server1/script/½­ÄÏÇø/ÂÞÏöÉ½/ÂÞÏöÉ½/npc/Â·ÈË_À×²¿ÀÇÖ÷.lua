-- ������ ����ɽ ·��_�ײ�����.lua ������ɻ�������
-- By: Dan_Deng(2004-05-28)

function main(sel)
	Uworld43 = GetTask(43)
	if (Uworld43 == 10) then
		Talk(6,"U43_10","Lang Ch�! Ch�c ng��i c� bi�t chuy�n m�t thanh ni�n tr�n n�i, tr�n tay th��ng c�m phi�n qu�t, th�ch ng�m th� nh�ng l�i l�m t�c ","�� ng�c! L�m g� c�!","Ta k�nh ng��i v�n c� ti�ng trong v� l�m. N�i chuy�n ��ng th� l� ","��ng c� h� d�a ta! Khi ta l�n l�c trong giang h� th� ng��i c�n ch�a sinh ra","Ta bi�t r�ng t�n �� g�n ��y th��ng hay giao du v�i Th�i Hoa t�c, gian d�m ph� n�! Ng��i t�t nh�t n�n n�i ra ch� tr� �n c�a h�n, n�u kh�ng c�ng s� b� li�n l�y","C� cho l� ng��i �� bi�t h�t s� t�nh �i! R�i sao h�? ��nh th�ng ���c ta r�i m�i n�i!Ha! Ha! Ha! Ha! Ha!")
	elseif (Uworld43 == 30) then						-- ������ǣ�����Կ��
		Talk(4,"U43_30","Xin th� l�i! T�i h� c�n ch�a xu�ng Di�m La nh�ng m� ��m thu�c h� c�a ng�i th� ��u xu�ng s�ng N�i H� h�t r�i","H�m! Ti�u t� mu�n l�m anh h�ng? Anh h�ng kh�ng ph�i ai mu�n l� ���c ��u!","��ng n�i nh�m n�a! N�u kh�ng th� ng��i c�ng s� c�ng �i h�p m�t v�i ��m �� t� kia","Ti�u t�! Xem nh� ng�oi c� b�n l�nh! N�u nh� ta giao ch�a kh�a n�y cho ng��i th� ng��i c� tha m�ng cho ta kh�ng?")
	elseif (Uworld43 >= 40) and (Uworld43 < 100) and (HaveItem(381) == 0) then				-- ��֮�����һ������Կ�׶�ʧ
		AddEventItem(381)
		Msg2Player("Ti�p t�c nh�n ���c L�i th��c ")
		Talk(1,"","H�ng ti�u t�t nh� ng��i th� xem c� th� l�m ���c c�i g�. Ch�a kh�a �ang � ��y, n�u nh� ng��i c� th� ti�p ���c ta 3 chi�u, th� s� giao cho ng��i")
	elseif (Uworld43 >= 40) and (Uworld43 < 255) and (HaveItem(381) == 1) then
		Talk(1,"","Ng��i �� c� ���c ch�a kh�a r�i. C�n mu�n h�i ta g� n�a?")
	elseif (Uworld43 == 20) then		-- �Ի���ɣ������δ���
		Talk(1,"","Ngu ng�c! N�u ng��i th�ng ���c ��m th� h� c�a ta th� m�i c� t� c�ch ��u v�i ta")
	elseif (Uworld43 >= 255) then
		Talk(1,"","Ng��i�Ng��i th�t s� �� gi�t thi�u ch�?")
	else
		Talk(1,"","��ng c� l�m nh�m n�a! Ch�a th�y b� d�ng n�y bao gi� sao?")
	end
end;

function U43_10()
	SetTask(43,20)
	Msg2Player("Ng��i �� c� ���c ch�a kh�a r�i. C�n mu�n h�i ta g� n�a? ")
end

function U43_30()
	SetTask(43,40)
	AddEventItem(381)
	Msg2Player("�� l�y ���c L�i th��c, tr� v� L�m An giao cho C�ng Sai ��i ca, b�n b�n k� ho�ch ti�p theo ")
end

--description: ��ԭ���� �꾩�� ·��13�ŹѸ��Ի� ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
--	UTask_tr = GetTask(4)		--û��Ҫ��������״̬
--	if (UTask_tr == 62) then
	UTask_trsub60 = GetByte(GetTask(28),1)
	if (UTask_trsub60 == 1) and (HaveItem(63) == 1) then
		Talk(2, "", " ��y l� Ng�n tr�m c�a Kh�c Th� r�n trong th�nh nh� ta ��a cho c�, �ng ta c� t�nh � v�i c�, ch� l� kh�ng �� d�ng c�m �� t� b�y, kh�ng bi�t c�.....", "Th�t ra, ta �� c� c�m t�nh v�i huynh �y, nh�ng l� m�t qu� ph�, l�m sao m� mi�ng ���c ch�? T�i H��ng Nang n�y t� tay ta l�m, phi�n ng��i ��a cho �ng ta, ch�nh l� t�n v�t n�y!")
		DelItem(63)
		AddEventItem(64)
		SetTask(28, SetByte(GetTask(28),1,2))
		AddNote("�o�n ��ng t�t c� nh�ng c�u �� c�a t�n t� t�i, ���c t�ng cho c�y �ao�o�n th�y ")
		Msg2Player("Nh�n ���c m�t t�i h��ng ")
	elseif (UTask_trsub60 == 2) and (HaveItem(64) == 0) then
		AddEventItem(64)
		Talk(1,"","Ng��i ��! T�i sao t�i h��ng kh�ng l�y v� ng��i c�ng kh�ng th�y?")
	elseif (UTask_trsub60 >= 2) then 
		Talk(1,"","�a t� ng��i �� se duy�n gi�a ta v� l�o Kh�c! N�u kh�ng ta ch�c ph�i s�ng c� ��n t�i ch�t! ")
	else
		if (random(0,1) == 0) then
			Talk(1,"","N�m tr��c, ch�ng ta b� b�nh �� ch�t, ta s�ng c� ��c m�t m�nh ��n nay!")
		else
			Talk(1,"","Ph�a B�c th�nh c� Ph��ng l�o th�i b� m�t ch�ng, s�ng c� ��c �� 30 n�m r�i! Th�t l� ��ng th��ng!")
		end
	end
end;

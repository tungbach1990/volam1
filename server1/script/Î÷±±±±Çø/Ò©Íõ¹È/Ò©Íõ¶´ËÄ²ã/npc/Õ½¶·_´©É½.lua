-- �������� ҩ���� ҩ�����Ĳ� ս��_��ɽ.lua  ��С��ʧ������
-- By: Dan_Deng(2004-05-27)

function OnDeath(sel)
	Uworld42 = GetTask(42)
	if (Uworld42 >= 20) and (Uworld42 < 29) then
		SetTask(42,Uworld42 + 1)
		Msg2Player("Gi�t ch�t 1 t�n Xuy�n s�n. ")
	elseif (Uworld42 == 30) or (Uworld42 == 29) then
		SetTask(42,30)
		Msg2Player("�� gi�t ch�t 10 t�n Xuy�n s�n, c� th� b�o cho l�o ��o nh�n qu�. ")
	end
end

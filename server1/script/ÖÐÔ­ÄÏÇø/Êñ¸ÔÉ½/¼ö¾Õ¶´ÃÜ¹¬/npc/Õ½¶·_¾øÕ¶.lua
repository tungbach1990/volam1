-- ս��_��ն.lua  ����������ϴ��ԩ����
-- By: Dan_Deng(2004-04-15)

function OnDeath()
	Uworld51 = GetTask(51)
	if (Uworld51 == 60) then		-- �����У��Ǵ�ĵ�һ��СBOSS
		SetTask(51,62)
		Talk(1,"","Huynh �� Tuy�t S�t s� b�o th� cho ta")
	elseif (HaveItem(377) == 0) and ((Uworld51 == 61) or (Uworld51 == 70) or (Uworld51 == 80)) then		-- �����У����Ե�����
		Talk(1,"","��ng gh�t! ")
		SetTask(51,70)
		AddEventItem(377)			-- "��������"
		Msg2Player("B�n gi�t ch�t Kim qu�c th�ch kh�ch, ph�t hi�n trong ng��i h�n quy�n ���ng m�n m�t c�p ")
	end
end

-- ս��_�Ʋ�Ⱦ.lua
-- by: Dan_Deng(2004-04-12)

function OnDeath()
	Uworld123 = GetTask(123)
	if (Uworld123 == 40) then
		SetTask(123,50)
		SetFightState(0)
		Talk(1,"","T�i sao ta l�i c� th� thua cu�c?!")
		Msg2Player("B�n �� ��nh b�i ���ng B�t Nhi�m, c�n kh�ng mau an �i h�n m�t t�? ")
		NewWorld(36, 1592, 3193)		-- �ͻؼ�����
	end
end

function OnDeath()
	Uworld130 = GetTask(130)
	if (Uworld130 == 30) then
		SetTask(130,33)
		Msg2Player("��nh b�i Thi�u Ng�c Phi ")
	elseif (Uworld130 == 36) then
		SetTask(130,40)
		AddNote("Chi�n th�ng Ng�, Thi�u 2 ng��i, quay v� Th�n T�c L�o Nh�n ")
		Talk(3,"Uworld130_good","T�i h� kh�ng c� � l�m t�n th��ng 2 v�, t� gi� v� sau ��ng l�m nh�ng chuy�n d�i d�t nh� th� n�a.","Ng� T� Ch�n:��","D�! D�! ��i hi�p an t�m, ch�ng ta s� kh�ng d�m n�a!")
	end
end

function Uworld130_good()
	Msg2Player("Chi�n th�ng Ng�, Thi�u 2 ng��i, quay v� Th�n T�c L�o Nh�n ")
	SetFightState(0)
	NewWorld(131,1530,3228)			-- �Զ��͵�̾Ϣ���˴�
end

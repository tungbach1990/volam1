--  ��������\��������\npc\ս��_uworld127_���
--  ����90��������
--  by xiaoyang(2004\4\12)


function OnDeath()
	Uworld127 = GetTask(127)
	if ((Uworld127 == 20) or (Uworld127 ==30)) and (HaveItem(369) == 0) and (random(0,99) < 66) then
		AddEventItem(369)
		Msg2Player("B�n �� b�t ���c t�m ph� �i�u th�n ng�n n�m ")
		AddNote("B�t ���c t�m linh �i�u c� th� quay v� ph� c�ng ch�a ph�c m�nh. ")
		SetTask(127,30)
	end
end

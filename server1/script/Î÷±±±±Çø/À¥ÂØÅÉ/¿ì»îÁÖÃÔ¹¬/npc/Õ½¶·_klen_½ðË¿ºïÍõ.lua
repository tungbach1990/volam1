-- �����������Թ� ս��NPC ��˿���� ��������
-- by��Dan_Deng(2003-07-30)

function OnDeath()
	Uworld31 = GetByte(GetTask(31),2)
	if (Uworld31 == 10) then
		if (HaveItem(8) == 0) and (HaveItem(117) == 1) then
			DelItem(117)
			AddEventItem(8)
			Msg2Player("Kim T� H�u b�u ch�t s�n L� H�ng kh�ng bu�ng, b�n th�a c� b�t l�y Kim T� H�u. ")
			AddNote("B�t ���c Kim T� H�u. ")
		else
			Msg2Player("Kim T� H�u th�a l�c b�n nh�t th�i l� ��nh l�n m�t. ")
		end
	end
end;

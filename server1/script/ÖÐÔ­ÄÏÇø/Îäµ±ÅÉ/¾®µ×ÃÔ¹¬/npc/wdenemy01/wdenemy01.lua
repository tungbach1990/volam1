--description: �䵱ɽ �����Թ����ˡ��䵱��������
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_world31 = GetByte(GetTask(31),1)
	if (UTask_world31 == 5) and (HaveItem(65) == 0) and (random(0,99) < 66) then
		AddEventItem(65)
		Msg2Player("T�m th�y th�ng g�. ")
--		SetTask(5, 8)
		AddNote("T�m th�y th�ng g� d��i ��y gi�ng. ")
	end
end;	

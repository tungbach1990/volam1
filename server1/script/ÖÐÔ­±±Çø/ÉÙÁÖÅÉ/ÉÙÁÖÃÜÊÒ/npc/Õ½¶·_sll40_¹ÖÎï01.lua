-- ���ֺ�ɽ���� ս��NPC ??01������40������
-- by��Dan_Deng(2003-08-04)

function OnDeath()
	UTask_sl = GetTask(7)
	UTask_sl40tmp = GetTaskTemp(44)
	if (UTask_sl == 40*256+10) and (random(1,99) < 33) then
		SetTask(7,40*256+20)
		AddNote("L�y ���c kh�u quy�t: �n Ma Ni B�t M� H�ng. ")
		Msg2Player("L�y ���c kh�u quy�t: �n Ma Ni B�t M� H�ng. ")
	end
end;

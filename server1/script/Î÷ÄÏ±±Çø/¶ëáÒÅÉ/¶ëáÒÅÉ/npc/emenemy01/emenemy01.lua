--description: �����������µ���
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 70) and (HaveItem(17) == 0) and (random(0,100) < 40) then			--û�а�������ʱ��40%����
		AddEventItem(17)
		Msg2Player("Nh�n ���c B�ch Ng�c Nh� �. ")
		AddNote("��nh b�i To�n Thi�n Ph�, nh�n ���c B�ch Ng�c Nh� �. ")
	end
end;

--description: ������ �����º�Ժ�ص�����
--author: yuanlan	
--date: 2003/3/6
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1);
	if (UTask_em == 50*256+60) and (HaveItem(23) == 1) and (random(0,99) < 30) then							--�ȳ��Ⱥ����ɵĸ�����30%
		Msg2Player("��nh b�i t�n Ph�n T�ng ��u m�c, c�u tho�t ph��ng tr��ng T� H�i, giao Kim tuy�n t� t��ng Kim Cang kinh cho �ng ta. ")
		DelItem(23)
		SetTask(1, 50*256+80)
		AddNote("��nh b�i t�n Ph�n T�ng ��u m�c, c�u tho�t ph��ng tr��ng T� H�i, giao Kim tuy�n t� t��ng Kim Cang kinh cho �ng ta. ")
	end
end;	

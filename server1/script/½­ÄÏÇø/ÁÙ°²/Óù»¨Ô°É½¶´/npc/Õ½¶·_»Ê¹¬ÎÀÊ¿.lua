--�ٰ��ʹ��ص� ս��NPC �ʹ���ʿ��ؤ��50������
-- by��Dan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 50*256+40) and (random(0,99) < 20) then				--10%���ʣ���Ϊ20���Ӵ�һ��2004-01-13��
		SetTask(8,50*256+50)
		AddNote("��nh ng� t�n v� s� c�a Ho�ng cung �ang b�o v� T�o c�ng c�ng. ")
		Msg2Player("��nh ng� t�n v� s� c�a Ho�ng cung �ang b�o v� T�o c�ng c�ng. ")
	end
end;

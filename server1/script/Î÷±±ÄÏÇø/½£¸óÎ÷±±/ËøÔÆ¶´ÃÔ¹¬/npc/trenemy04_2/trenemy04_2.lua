--description: ����������ƶ�����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4);
	if (UTask_tr == 40*256+20) and (HaveItem(159) == 0) then					--ȡ����������Ʒ���޵��жϣ��Ա���������
		AddEventItem(159)
		Msg2Player("B�t d� d�ng t�n h� Li�u, tr�n ng��i h�n t�m ���c m�t b�c m�t th� vi�t g�i tri�u ��nh nh� T�ng. ")
--		SetTask(4, 45)
		AddNote("B�t ���c t�n h� Li�u t�i Ki�m C�c ��c ��o, To� V�n ��ng, l�y ���c m�t b�c m�t th� g�i cho T�ng qu�c. ")
	end
end;

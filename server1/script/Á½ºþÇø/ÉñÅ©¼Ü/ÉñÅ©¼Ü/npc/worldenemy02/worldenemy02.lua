--description: ��ũ�ܵر��Ҷ�� ��������
--author: yuanlan	
--date: 2003/4/30
-- Update: Dan_Deng(2003-09-16)��ʱ���������Ժ���д

function OnDeath()
	UTask_world03 = GetTask(15);
	if (1 == 0) and (UTask_world03 == 1) and (GetTaskTemp(13) < 10) then		--����ʮֻ���ټ���
		UTask_world03 = UTask_world03 + 1	
		SetTaskTemp(13, UTask_world03)
	end
end

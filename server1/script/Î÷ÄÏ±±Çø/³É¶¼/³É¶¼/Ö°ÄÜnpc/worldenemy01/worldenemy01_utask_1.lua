--description: �ɶ�Ұ��Ұ�� ��������ս������
--author: yuanlan	
--date: 2003/4/1



function worldenemy01_UTask_1()

Task0009 = GetTaskTemp(9)

if (Task0009 < 10) then		--����ʮֻ���ټ���
	Task0009 = Task0009 + 1	
	SetTaskTemp(9, Task0009)
end;
	
end;	

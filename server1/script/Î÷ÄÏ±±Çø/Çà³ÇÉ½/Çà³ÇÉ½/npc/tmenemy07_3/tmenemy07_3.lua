--description: ����40������ ���ɽ������ɫ������������3��
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if (UTask_tm == 40*256+20) then
		SetTaskTemp(4,SetBit(GetTaskTemp(4),3,1))		-- ֻҪ�������У���ǿ��������ʱ������3λ
	end
end;

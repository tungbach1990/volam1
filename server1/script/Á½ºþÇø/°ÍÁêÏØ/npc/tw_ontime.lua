--������ ����������������Ƽ�ʱ�ű�
-- Update: Dan_Deng(2003-08-16)

function OnTimer()
	StopTimer()						--������ʱ
	Msg2Player("Gi� n�u r��u �� ��n! ")
	SetTask(38,SetByte(GetTask(38),1,80))
end;

--description: ����30������ ���ɽ���ƶ�����
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+30) and (HaveItem(98) == 1) then					--�õ�Կ��һ
		DelItem(98)
		AddEventItem(42) 
		Msg2Player("L�y ���c H�a Kh� Ph� ")
		SetTask(2, 30*256+50)
		AddNote("M� r��ng l�y ���c Ho� Kh� Ph� ")
	elseif (UTask_tm >= 30*256+50) and (UTask_tm <= 30*256+60) and (HaveItem(42) == 0) then			-- ���߶���
		AddEventItem(42) 
		Talk(1,"","H�a ra 'H�a Kh� Ph�' ng��i �� b� qu�n trong r��ng b�u!")
	elseif (UTask_tm > 30*256+30) then 
		Talk(1,"","B�o r��ng �� r�ng")
	else
		Talk(1,"","Kh�ng c� ch�a kh�a, kh�ng m� ���c r��ng b�u!.")
	end
end;

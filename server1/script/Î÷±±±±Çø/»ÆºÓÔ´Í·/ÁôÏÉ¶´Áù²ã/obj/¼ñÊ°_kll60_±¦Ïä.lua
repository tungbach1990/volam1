-- �ƺ�Դͷ�Թ� ���� ���س�ʦ����
-- by��Dan_Deng(2003-07-31)

function main()
	UTask_kl = GetTask(9)
	if (UTask_kl == 60*256+20) then
		if ((HaveItem(11) == 1) and (HaveItem(12) == 1) and (HaveItem(13) == 1) and (HaveItem(14) == 1) and (HaveItem(15) == 1)) then
			DelItem(11)
			DelItem(12)
			DelItem(13)
			DelItem(14)
			DelItem(15)
			AddEventItem(16)
			AddNote("Ph�i l�y Ng� S�c Th�ch ")
			Msg2Player("B�n d�ng 5 chi�c ch�a kh�a treo ph�a tr�n �� m� r��ng l�y Ng� S�c Th�ch ")
		else
			Talk("Kh�ng c� 5 chi�c ch�a kh�a kia, b�n kh�ng th� m� ���c r��ng �� l�y �� ")
		end
	else
		Talk(1,"","B�o r��ng n�y �� kh�a r�i")
	end
end;

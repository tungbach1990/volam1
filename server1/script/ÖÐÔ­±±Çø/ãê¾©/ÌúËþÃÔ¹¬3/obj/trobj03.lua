--description: �꾩���������㱦�� ���̽�50������
--author: yuanlan
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4)
	UTask_trsub01 = GetTask(21)
	if (UTask_tr == 50*256+20) and (HaveItem(162) == 1) then
		DelItem(162)
		if (GetBit(UTask_trsub01,3) == 0) then
			UTask_trsub01 = SetBit(UTask_trsub01,3,1)
			SetTask(21, UTask_trsub01)
			AddNote("M� ���c c� quan th� ba ")
			Msg2Player("M� ���c B�o r��ng � t�ng th� ba. M� ���c c� quan th� ba ")
			if (UTask_trsub01 == 7) then 			-- bin: 100 + 010 + 001
				Talk(1,"","B�n �� ph� ���c c� quan t�ng 3, c�u ���c Ph�ng H�p Nh�.")
				Msg2Player("B�n �� ph� ���c c� quan t�ng 3, c�u ���c Ph�ng H�p Nh�.")
				SetTask(4, 50*256+50)
				AddNote("C� ba c� quan ��u �� m�, c�u ���c Ph�ng H�p Nh� ")
			end
		else
			Talk(1,"","C� quan �� m� ra")
		end
	elseif (UTask_tr == 50*256+20) and (GetBit(UTask_trsub01,3) == 1) then
		Talk(1,"","C� quan �� m� ra")
	elseif (UTask_tr == 50*256+50) then
		Talk(1,"","C� quan �� m� ra")
	else	 
		Talk(1,"","Kh�ng c� ch�a kh�a th� kh�ng th� m� ���c c� quan n�y ")
	end
end;

--description: �����񺣵ڶ��ص���
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	UTask_tmtmp = GetTaskTemp(48)
	if (Uworld37 == 20) and (random(0,99) < 50) then		-- ������ʱ��50%���ʳ�����һ��ھ�������䣩
		if (UTask_tmtmp == 0) then
			Talk(1,"","2 4 l� tay")
			Msg2Player("C� ���c kh�u quy�t  Nh� T� Vi Ki�n ")
			SetTaskTemp(48,1)
		elseif (UTask_tmtmp == 1) then 
			Talk(1,"","68 l� ch�n")
			Msg2Player("C� ���c kh�u quy�t  B�t Huy�t V� T�c ")
			SetTaskTemp(48,2)
		elseif (UTask_tmtmp == 2) then 
			Talk(1,"","tr�i 3 ph�i 7")
			Msg2Player("C� ���c kh�u quy�t  T� Tam H�u Th�t ")
			SetTaskTemp(48,3)
		elseif (UTask_tmtmp == 3) then 
			Talk(1,"","��i C�u L� nh�t ")
			Msg2Player("C� ���c kh�u quy�t  ��i C�u L� Nh�t ")
			SetTaskTemp(48,4)
		elseif (UTask_tmtmp == 4) then 
			Talk(1,"","Ng� c� trung ��ng")
			Msg2Player("C� ���c kh�u quy�t Ng� C� Trung ��ng ")
			SetTaskTemp(48,5)
		else
			if (random(1,99) < 40) then		-- ������ʾһ�οھ���Ȼ��͸�λ��ʱ�������ٿ�Ҫ����������
				SetTaskTemp(48,0)
				Msg2Player("Kh�u quy�t ho�n ch�nh l�: Nh� T� Vi Ki�n, B�t Huy�t V� T�c, T� Tam H�u Th�t, Ng� C� Trung ��ng ")
			end
		end
	end
end

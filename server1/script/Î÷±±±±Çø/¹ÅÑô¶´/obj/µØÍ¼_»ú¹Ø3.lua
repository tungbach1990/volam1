-- ������-������-����3(�������񡰾�С�ꡱ)
-- by��Dan_Deng(2004-03-03)

function main(sel)
	Uworld41 = GetTask(41)
	if (GetByte(Uworld41,1) == 30) and (HaveItem(352) == 1) then		-- �����У��С�����Կ�ס�����δ�ȳ�
		if (GetBit(Uworld41,11) == 0) then				-- ���ص�ǰΪ�ر�
			Say("Hi�n gi� c� quan �� b� kh�a, b�n c� mu�n m� n� ra kh�ng?",2,"M� ra /Turn_On","C� ti�p t�c ��ng c�a /Turn_Off")
		else
			Say("Hi�n gi� c� quan �� m�, b�n c� mu�n ��ng n� l�i kh�ng?",2,"Ti�p t�c m� c�a /Turn_On","��ng/Turn_Off")
		end
	end
end

function Turn_On()
--	Talk(1,"","���ش��ˡ�")
	Msg2Player("C� quan �� m� ra")
	Cur_Switchs = SetBit(GetTask(41),11,1)
	SetTask(41,Cur_Switchs)
	Check_Switch()
end

function Turn_Off()
--	Talk(1,"","���عر��ˡ�")
	Msg2Player("C� quan �� kh�a l�i")
	Cur_Switchs = SetBit(GetTask(41),11,0)
	SetTask(41,Cur_Switchs)
	Check_Switch()
end

function Check_Switch()
	Cur_Switchs = GetByte(GetTask(41),2)
	Set_Switchs = GetByte(GetTask(41),3)
	if (Cur_Switchs == Set_Switchs) then			-- �ܹ�һ�£��ȳ�С��
		Uworld41 = SetByte(GetTask(41),1,100)
		SetTask(41,Uworld41)
		DelItem(352)						-- �ɹ�����ɾ��Կ��
		Talk(1,"","M� ���c c� quan! C�u th�nh c�ng Ti�u Quy�n")
		Msg2Player("B�n m� ���c c� quan, c�u th�nh c�ng Ti�u Quy�n ")
	else
		Msg2Player("Nh�ng khi b�n tr� l�i H�c lao ��y c�nh c�a th� n� v�n kh�ng h� ��ng ��y ")
	end
end

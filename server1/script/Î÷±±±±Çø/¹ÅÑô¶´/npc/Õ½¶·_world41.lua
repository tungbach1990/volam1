-- ������-������-���������Է�(�������񡰾�С�ꡱ)
-- by��Dan_Deng(2004-03-03)

function OnDeath()
	Uworld41 = GetByte(GetTask(41),1)
	if (Uworld41 >= 10) and (Uworld41 < 100) and (HaveItem(352) == 0) and (random(0,99) < 50) then		-- �����в���û��Կ�ף�50%����
		if (Uworld41 == 10) then		-- ��һ�δ�ʱ�Ӿ���Ի�,��������ֵ
			if (GetSex() == 0) then		-- �Ի���Ů��ͬ
				Talk(1,"","Anh h�ng xin tha m�ng! H�m qua b�t Ti�u Quy�n giam trong H�c lao nh�ng c� ta kh�ng b� t�n h�i g�! ��y l� ch�a kh�a. Xin anh h�ng tha cho m�ng s�ng!")
			else
				Talk(1,"","N� hi�p xin tha m�ng! H�m qua b�t Ti�u Quy�n giam trong H�c lao nh�ng c� ta kh�ng b� t�n h�i g�! ��y l� ch�a kh�a. Xin n� hi�p tha cho m�ng s�ng!")
			end
			Uworld41 = SetByte(GetTask(41),1,30)
			SetTask(41,Uworld41)
			AddNote("��nh b�i ���c ��u l�nh Y�u �ao Tri�u ph��ng. L�y ���c ch�a kh�a �� m� H�c lao c�u Ti�u Quy�n ")
		end
		AddEventItem(352)			-- ����Կ��
		Msg2Player("L�y ���c ch�a kh�a C� quan ")
	end
end;

-- ��ԭ���� ���ݸ� ҩ���ϰ�Ի����嶾40������
-- Update��Dan_Deng �����嶾����2003-10-12��

-- ���ƻ�Ԫ��¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main()
	UTask_wu = GetTask(10)
	if (UTask_wu == 40*256+10) and (HaveItem(142) == 0) then 		--������
		Say("Gi� d��c li�u qu� X� H��ng h�m nay l� 500 l��ng th�i!",
			4,
			"Mua ���c X� h��ng/L40_buy_yes",
			"Giao d�ch/yes",
			--"Ta mu�n ch� t�o H�n Nguy�n Linh L�/refine",
			"Kh�ng giao d�ch/no")
	else
		Say("Ch� t�i ��y d��c li�u g� c�ng c�, c� b�nh th� kh�i b�nh, kh�ng b�nh kh�e ng��i, b�n thu�c ��ng gi� kh�ng l�a g�t, ng�i mua m�t �t ch�?",
			3,
			"Giao d�ch/yes",
			--"Ta mu�n ch� t�o H�n Nguy�n Linh L�/refine",
			"Kh�ng giao d�ch/no")
	end
end;

function L40_buy_yes()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(142)
		AddNote("Mua ���c X� h��ng.")
		Msg2Player("Mua ���c X� h��ng.")
	else
		Talk(1,"","Gi� v�y c�ng mua kh�ng n�i, �i ra cho ta l�m �n!")
	end
end;

function yes()
Sale(96);  			--�������׿�
end;

function no()
end;

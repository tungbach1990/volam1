--��ԭ���� ������to��������
--Trap ID����ԭ���� 67
-- by��Dan_Deng(2003-08-04)

function main(sel)
	UTask_sl = GetTask(7)
	if (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 40*256+10) then
			SetTaskTemp(43,0)		-- ��ʱ�����ݶ�Ϊ43��Ҫ���������ԣ���ʱ����ֵΪ3�����ɽ������ҡ�
			Talk(1,"L40_sele1_1","Tr��c Th�ch m�n c� kh�c m�y h�ng ch�: Mu�n v�o m�t th�t, ph�i tr� l�i 3 c�u h�i d��i ��y!")
		elseif (UTask_sl >= 40*256+10) then
			NewWorld(113, 1675, 3361)
		else
			Msg2Player("C�m ��a c�a b�n ph�i, kh�ng ���c v�o! ")
		end
	else
		Msg2Player("N�i ��y l� c�m ��a c�a b�n ph�i, ng��i ngo�i kh�ng ���c v�o! ")
	end
--	AddTermini(47)		--����ʲô������
end;

function L40_sele1_1()
	Say("C�u th� nh�t: N�m x�a ���ng Huy�n Trang mang t� Thi�n Tr�c b� kinh l�: ",2,"��i Th�a Ph�t Kinh /L40_S1_correct1","Ti�u Th�a Ph�t Kinh /L40_sele1_2")
end;

function L40_S1_correct1()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1������ȫ�Է��ɽ���
	L40_sele1_2()
end;

function L40_sele1_2()
	Say("C�u th� 2: X� L� c�a Ph�t t� l�:",2,"Sau khi Ph�t T� v� c�i Ni�t B�n t� ��ng h�a th�nh /L40_sele1_3","Do ch�nh th�n Ph�t T� thi�u ch�y m� th�nh /L40_S1_correct2")
end;

function L40_S1_correct2()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1������ȫ�Է��ɽ���
	L40_sele1_3()
end;

function L40_sele1_3()
	Say("C�u th� 3: Ph�t ph�p c�a b�n t� l� thu�c:",3,"Thi�n T�ng /L40_S1_correct3","M�t T�ng /L40_sele1_result","Lu�t T�ng /L40_sele1_result")
end;

function L40_S1_correct3()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1������ȫ�Է��ɽ���
	L40_sele1_result()
end;

function L40_sele1_result()
	if (GetTaskTemp(43) >= 3) then
		SetTaskTemp(43,0)				--ÿ�ν���Ҫ�ش���ŵĿھ�
		Talk(1,"","Tr� l�i ��ng 3 ��p �n, th�ch m�n l�p t�c chuy�n ��ng m� ra 1 l�i �i")
		NewWorld(113, 1675, 3361);
	else
		SetTaskTemp(43,0)				--ÿ�ν���Ҫ�ش���ŵĿھ�
		Talk(1,"","Tr� l�i ��ng 3 ��p �n, nh�ng h�u nh� th�ch m�n v�n tr� tr� ")
--		SetPos()		--������Ƴ�trap��
	end
end;

-- ϴ���Ե��õ��ɺ챦ʯ������ϴ������Ե�
-- By Asmik(2004-02-26)

function main()
	Say("L�a ch�n lo�i �i�m mu�n t�y:",5,"S�c m�nh/tune_str","Th�n ph�p/tune_dex","Vi�c n�y. ta c�n ph�i v� suy ngh� l�i /tune_vit","N�i c�ng/tune_eng","V�n ch�a ngh� ra /no")
end


function tune_str()
	base_str = {35,20,25,30,20}			-- �������������������ϴǱ��ʱ��������ڴ�ֵ
	i = GetSeries() + 1
	if (GetStrg(1) < base_str[i] + 5) then		-- ϴ����������������������������ϴ
		Say("S�c m�nh c�a b�n �� ��t m�c t�i �a!",1,"ta �ang suy ngh� /no")
	else											-- ��ʼϴǱ�ܣ���ɺ��Զ�������
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddStrg(-5)
--		AddProp(5)				-- AddStrg()�����Ѿ�����δ����Ǳ��
	end
end

function tune_dex()
	base_dex = {25,35,25,20,15}
	i = GetSeries() + 1
	if (GetDex(1) < base_dex[i] + 5) then		-- ϴ������������������������ϴ
		Say("S�c m�nh c�a b�n �� ��t m�c t�i �a!",1,"ta �ang suy ngh� /no")
	else											-- ��ʼϴǱ�ܣ���ɺ��Զ�������
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddDex(-5)
--		AddProp(5)				-- AddStrg()�����Ѿ�����δ����Ǳ��
	end
end

function tune_vit()
	base_vit = {25,20,25,30,25}
	i = GetSeries() + 1
	if (GetVit(1) < base_vit[i] + 5) then		-- ϴ����⹦�����������������ϴ
		Say("S�c m�nh c�a b�n �� ��t m�c t�i �a!",1,"ta �ang suy ngh� /no")
	else											-- ��ʼϴǱ�ܣ���ɺ��Զ�������
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddVit(-5)
--		AddProp(5)				-- AddStrg()�����Ѿ�����δ����Ǳ��
	end
end

function tune_eng()
	base_eng = {15,25,25,20,40}
	i = GetSeries() + 1
	if (GetEng(1) < base_eng[i] + 5) then		-- ϴ����ڹ������������������ϴ
		Say("S�c m�nh c�a b�n �� ��t m�c t�i �a!",1,"ta �ang suy ngh� /no")
	else											-- ��ʼϴǱ�ܣ���ɺ��Զ�������
		Pay(GetTaskTemp(8))
		SetTask(92,GetTask(92)+1)
		AddEng(-5)
--		AddProp(5)				-- AddStrg()�����Ѿ�����δ����Ǳ��
	end
end

function no()
	AddItem(6, 1, 21, 1, 0, 0, 0)
end
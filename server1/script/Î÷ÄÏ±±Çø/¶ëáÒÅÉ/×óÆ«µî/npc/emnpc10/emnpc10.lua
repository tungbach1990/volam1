--description: �������մ�ܰ 
--author: yuanlan	
--date: 2003/3/5
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Dan_Deng(2003-08-12)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if ((UTask_em == 40*256) and (GetLevel() >= 40) and (GetFaction() == "emei")) then
			Talk(2, "L40_get","Trong v� s� t� mu�i, t�nh c�m c�a ta v�i T�n s� t� r�t th�n thi�t. T� �y s�p m�ng sinh nh�t. Ta mu�n t�ng t� �y 1 m�n qu�. T�n s� t� tinh th�ng �m lu�t, t� lu�n mu�n c� ���c kh�c nh�c tuy�t ph�m <color=Red>'B�ch �i�u Tri�u Ph�ng'<color>.","Ta t�m ki�m kh�p n�i m�i bi�t � <color=Red>Thanh Th�nh s�n<color> c� v� <color=Red>Cao Nh�n<color> �n c� �ang c�t gi� quy�n kh�c ph� n�y, nh�ng m�i kh�ng t�m ���c �ng ta. Sinh nh�t T�n s� T� �� g�n k�, ph�i l�m sao ��y?")
		elseif ((UTask_em == 40*256+80) and (HaveItem(22) == 1)) then					--�õ����񳯷�����
			L40_prise()
		elseif (UTask_em >= 50*256) and (GetFaction() == "emei") then   							--�Ѿ����40��������δ��ʦ
			Talk(1,"","T�n s� t� nh�n th�y kh�c ph� vui m�ng kh�n xi�t, ��u do c�ng c�a mu�i!")
		else
			Talk(1,"","G�n ��y giang h� kh�ng y�n, d��ng nh� l�i c� chuy�n ��i s�!")
		end
	elseif (UTask_em >= 70*256) then										--�Ѿ���ʦ
		Talk(1,"","Ti�u s� mu�i, sau n�y h�nh hi�p giang h� g�p kh� kh�n g� h�y quay v� t�m ta!")
	else
		Talk(1,"","�u D��ng c�ng s�ng t�c kh�c '�i�p Luy�n Hoa' c� c�u '��nh Vi�n th�m th�m th�m c� h�a', c�ng phu d�ng ch� c�a c�u n�y, th�t khi�n ng��i ��i th�n ph�c!")
	end
end;

function L40_get()
	Say("Mu�i c� b�ng l�ng gi�p ta t�m v� cao nh�n �� kh�ng?", 2, "��ng �!/L40_get_yes", "Kh�ng c�n th�i gian n�a /L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","T�t l�m! V� <color=Red>Cao nh�n<color> �� �ang �n c� trong <color=Red>Th�n Ti�n ��ng<color> � Thanh Th�nh s�n.")
	SetTask(1, 40*256+10)
	AddNote("B�n T� Thi�n �i�n Nga Mi ph�i g�p T� T� Hinh nhi�m v� ti�p theo Kh�c Ph�, t�m g�p  B�ch �i�u Tri�u Ph�ng. ")
	Msg2Player("Ti�p nh�n nhi�m vu, t�m B�ch �i�u Tri�u Ph�ng kh�c ph� ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","Kh�c ph� 'B�ch �i�u Tri�u Ph�ng'! T�t l�m! T�n s� t� th�y ���c nh�t ��nh r�t vui, c�m �n ti�u s� mu�i! ")
	DelItem(22)
	SetRank(17)
	SetTask(1, 50*256)
--	AddMagic(86)
	add_em(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! �� tr� th�nh Thanh Li�n Ti�n T�. H�c ���c L�u Thu�. ")
	AddNote("V� Nga Mi, giao B�ch �i�u Tri�u Ph�ng kh�c ph� cho T� T� Hinh, ho�n th�nh nhi�m v�. Th�ng ch�c th�nh Thanh Li�n Ti�n T�. ")
end;

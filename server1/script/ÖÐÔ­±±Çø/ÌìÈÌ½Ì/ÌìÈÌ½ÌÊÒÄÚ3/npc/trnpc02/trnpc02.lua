--description: ���̻̽�������
--author: yuanlan	
--date: 2003/5/18
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4);
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 10*256) and (GetLevel() >= 10) then
			Say("T�i t�ng hai c�a b�n gi�o, � <color=Red>Th�t S�t ��ng<color> c� giam <color=Red>b�y t�n t� t�<color>, b�n ch�ng ��u l� nh�ng k� ph�n b�i b�n gi�o, n�u ng��i c� th� ��nh b�i ba t�n trong s� b�n ch�ng, l�y ���c <color=Red>m�nh Th�t S�t l�nh b�i<color>, l� c� th� th�ng l�n c�p V� �nh S�t Th� c�a b�n gi�o, ng��i c� mu�n v�o trong Th�t S�t ��ng kh�ng?", 2, "X�ng v�o Th�t S�t ��ng /L10_get_yes", "T�m th�i ch�a v�o /L10_get_no")
--		elseif (UTask_tr == 10*256+50) and (HaveItem(51) == 1) and  HaveItem(52) == 1 and HaveItem(53) == 1 and HaveItem(54) == 1 and HaveItem(55) == 1 and HaveItem(56) == 1 and (HaveItem(57) == 1) then
		elseif (UTask_tr == 10*256+50) then		-- �޸��������������2003-09-27��
			i = check_token()
			if (i >= 3) then
				Talk(1,"L10_prise","R�t t�t! v�o Th�t S�t ��ng h� �� s� ng��i m�i c� th� tr� ra, ng��c l�i ng��i c� chuy�n g� th� t� m�nh x� l�!")
			else
				Talk(1,"","Th� n�o? M�t cu�c kh�o nghi�m nh� nh� th� m� ng��i c�ng l�m kh�ng xong �?")
			end
		elseif (UTask_tr < 20*256) then								--��δ��10������
			Talk(1,"","��ng ngh� gia nh�p b�n gi�o s� �n kh�ng ng�i r�i, b�n gi�o kh�ng ch�a ch�p nh�ng ng��i th�a th�i ��u!")
		else
			Talk(1,"","Ng��i m�i gia nh�p b�n gi�o, ng��i m�nh c�n c� ng��i m�nh h�n, ng��i ph�i c�n th�n ��y!")
		end
	else
		Talk(1,"","Ch� c� k� m�nh m�i c� th� sinh t�n tr�n th� gian, k� m�nh th�ng k� y�u, nh�ng ng��i tu luy�n ch�a t�i th� s� b� k� kh�c ti�u di�t, �u c�ng l� do t� chu�c l�y, ��ng n�n o�n tr�ch ng��i kh�c.")
	end
end;

function L10_get_yes()
	Talk(1,"","<color=Red>Th�t S�t l�nh b�i<color> c� t�t c� b�y m�nh, ph�n ra tr�n ng��i <color=Red>b�y t�n t� t�<color>, ng��i ch� c�n l�y 3 m�nh l� ���c.")
	SetTask(4, 10*256+50)
	AddNote("Nh�n nhi�m v� Th�t S�t ��ng c�a V�o Th�t S�t ��ng l�y ba m�nh Th�t S�t l�nh b�i. ")
	Msg2Player("Nh�n nhi�m v� Th�t S�t ��ng c�a V�o Th�t S�t ��ng l�y ba m�nh Th�t S�t l�nh b�i. ")
end;

function L10_get_no()
	Talk(1,"","Khi �� l�m xong r�i h�y quay l�i t�m ta!")
end;

function L10_prise()
	SetTask(4, 20*256)
	SetRank(56)
--	AddMagic(132)
--	AddMagic(131)
--	AddMagic(136)
	add_tr(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("B�n ���c phong l� V� �nh S�t Th�! H�c ���c Thi�n Nh�n M�u Ph�p, Thi�n Nh�n �ao ph�p, H�a Ph�n Li�n Hoa. ")
	AddNote("��a c�c m�nh Th�t S�t l�nh b�i cho ���ng ch� Ng�t Ng�o, ho�n th�nh nhi�m v� Th�t S�t ��ng, th�ng c�p V� �nh S�t Th�. ")
end;

function check_token()
	i = 0
	if (HaveItem(51) == 1) then
		i = i + 1
		DelItem(51)
	end
	if (HaveItem(52) == 1) then
		i = i + 1
		DelItem(52)
	end
	if (HaveItem(53) == 1) then
		i = i + 1
		DelItem(53)
	end
	if (HaveItem(54) == 1) then
		i = i + 1
		DelItem(54)
	end
	if (HaveItem(55) == 1) then
		i = i + 1
		DelItem(55)
	end
	if (HaveItem(56) == 1) then
		i = i + 1
		DelItem(56)
	end
	if (HaveItem(57) == 1) then
		i = i + 1
		DelItem(57)
	end
	return i
end;

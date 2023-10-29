-- ������ ����ٻ 20������40������
-- by��Dan_Deng(2003-07-26)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_cy = GetTask(6)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") then		-- ��������Լ����ɶԻ�
		if (UTask_cy >= 20*256+10) and (UTask_cy < 30*256) then		--20�����������
			if (GetTimerId() == 8) then
				StopTimer()								--�ⶾ��
				Msg2Player("��c m� b�n tr�ng v�n ch�a gi�i ")
				Talk(1,"L20_check","S� mu�i mau qua ��y, ta gi�p mu�i gi�i ��c.")
			else
				L20_check()
			end
		elseif (UTask_cy == 20*256) and (GetLevel() >= 20) then		--20������
			Say("B�n m�n nu�i r�t nhi�u ong v�ng, m�t s� ong v�ng n�y ph�i �n m�t lo�i m�t hoa, m�t hoa c�a hoa ��i M�n �� La. G�n ��y m�t hoa �� h�t, ng��i c� th� gi�p ta �i l�y 10 b�ng hoa v� ���c kh�ng? ",2,"���c!/L20_get_yes","�� t� c�ng phu c�n k�m, e r�ng kh� l�m n�n chuy�n /L20_get_no")
		elseif (UTask_cy == 40*256+30) then							--40���������
			L40_prise()
		elseif ((UTask_cy == 40*256) and (GetLevel() >= 40)) then		--40����������
			Say("Nghe n�i � th�nh ��i L� c� m�t t�n �c b�, chuy�n �i c��ng hi�p d�n n�, kh�ng bi�t �� h�i bi�t bao nhi�u thi�u n�, ng��i c� b�ng l�ng gi�p ta �i ti�u di�t t�n ��n m�t n�y kh�ng?",2,"L�n n�y ta s� v� d�n tr� h�i /L40_get_yes","�� t� v� c�ng y�u k�m, s� kh�ng l�m n�i chuy�n n�y /L40_get_no")
		elseif (UTask_cy > 40*256) and (UTask_cy < 50*256) then		--40�����������
			Talk(1,"","D��i tay h�n c� nhi�u thu�c h�, s� mu�i h�y c�n th�n!")
		else
			Talk(1,"","��n �ng kh�ng c� th� g� t�t, mu�i ph�i c�n th�n, nh�ng vi�c h�n l�m ��u th�i tha.")
		end
	else
		Talk(1,"","��n �ng kh�ng c� g� t�t! ")
	end
end;

function L20_get_yes()
	Talk(3,"","��i M�n �� La hoa m�c � tr�n s��n n�i c�a T�y B�c. L�c m� ng��i h�i hoa ph�i c�n th�n, ��i M�n �� La c� ��c do �� ph�i h�i hoa trong th�i gian nh�t ��nh, n�u kh�ng s� b� tr�ng ��c m� ch�t. ","Trong 1 th�i gian ng�n m� h�i 10 ��a hoa th� th�t l� phi�n ph�c.","Cho n�n S� mu�i h�i �� 10 ��a mau ch�ng �em v�.")
	SetTask(6,20*256+10)
	AddNote("�i h�i 10 ��a hoa ��i Man �� La. C�n th�n hoa c� ��c, trong m�t th�i gian ng�n ph�i l�y ���c 10 ��a hoa �em v�. ")
	Msg2Player("�i h�i 10 ��a hoa ��i Man �� La. C�n th�n hoa c� ��c, trong m�t th�i gian ng�n ph�i l�y ���c 10 ��a hoa �em v�. ")
end;

function L20_get_no()
end;

function L20_check()
	i = GetItemCount(1)
	for j = 1, i do DelItem(1) end			-- �����û��10�仨
	if (i >= 10) then		--�����10�����������
		Talk(1,"","<#> Y�n Hi�u Tr�i:"..i.."<#> ��i Man �� La Hoa �� �� r�i. S� mu�i qu� l� c� b�n l�nh, c� th� tr� th�nh Nh� Ph�m Hoa S�.")
		SetTask(6,30*256)
		SetRank(33)
--		AddMagic(269)
		add_cy(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("Ch�c m�ng b�n! �� ���c th�ng Th�y Y�n m�n Nh� Ph�m Hoa S�! H�c ���c v� c�ng B�ng T�m Tr�i �nh. ")
		AddNote("H�i ���c 10 ��a ��i Man �� La Hoa, ho�n th�nh nhi�m v� ��i Man �� La Hoa. ���c th�ng l� Nh� Ph�m Hoa S�. ")
	else
		Talk(2,"","Nh�ng ng��i v�n ch�a h�i �� 10 �o� ��i M�n �� La hoa, m�t l�n ch�a h�i �� 10 �o� l� ch�a d�ng ���c.","Xin s� mu�i h�y �i th�m m�t chuy�n n�a.")
		SetTask(6,20*256+10)
	end
end;

function L40_get_yes()
	Talk(1,"","���c! Vi�c n�y giao cho ng��i.")
	SetTask(6,40*256+10)
	AddNote("Ti�p nh�n nhi�m v�: Gi�o hu�n t�n �c b� trong th�nh ��i L� ")
	Msg2Player("Ti�p nh�n nhi�m v�: Gi�o hu�n t�n �c b� trong th�nh ��i L� ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(2,"","Y�n s� t�! Ta �� c�u ���c t�t c� nh�ng ng��i con g�i b� t�n �c b� b�t �i, v� �� cho h�n m�t b�i h�c, h�n s� kh�ng d�m l�m chuy�n x�u �y n�a ��u!","Ch� c�n �� t� Thu� Y�n M�n ch�ng ta ra tay th� kh�ng c� vi�c g� l� kh�ng th�nh, b�n l�nh c�a ng��i ng�y c�ng cao, ti�p t�c n� l�c th�m nh�!")
	SetTask(6,50*256)
	SetRank(77)
--	AddMagic(100)
	add_cy(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! �� ���c th�ng l� Th�y Y�n m�n Hoa Th�n S� Gi�! H�c ���c v� c�ng H� Th� H�n B�ng. ")
	AddNote("C�u tho�t c�c d�n n� b� t�n �c b� b�t c�c, d�y h�n m�t b�i h�c. Ho�n th�nh nhi�m v� c�p 40. ���c th�ng l� Th�y Y�n m�n Hoa Th�n S� Gi�! ")
end;

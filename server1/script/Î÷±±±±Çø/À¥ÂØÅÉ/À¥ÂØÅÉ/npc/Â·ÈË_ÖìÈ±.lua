-- ���� ���� ��ȱ 30������
-- by��Dan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if (UTask_kl == 30*256+10) and (GetItemCount(111) >= 3) then		--30���������
			L30_prise()
		elseif ((UTask_kl == 30*256) and (GetLevel() >= 30)) then		--30����������
			Say("S� t�n Ch��ng m�n c� l�nh �i t�m 3 vi�n D� Minh Ch�u, nh�ng chuy�n nh� nh�t nh� v�y th� giao cho ng��i �i l�m v�y. ",2,"D�......... /L30_get_yes","Kh� n�ng c�a ta th�p k�m, ch� s� kh�ng ��m ���ng n�i. /L30_get_no")
		else
			Talk(1,"","Ta suy ngh� m�i c�ng kh�ng hi�u t�i sao s� ph� ta v�n c�n �� nh�ng ng��i nh� l�o gi� Th�n t�n t�i tr�n ��i. Ng��i ta th��ng n�i kh�ng ��c b�t tr��ng phu, kh�ng gi�t l�o �� �i c� nh� l� c�n c�i ung b�c... �, ng��i � ��y nghe l�n g� ��! ")
		end
	else
		Talk(1,"","C�n L�n ph�i n�u mu�n c�ng c�c m�n ph�i � trung nguy�n b�nh ��ng ��a v�, nh�t ��nh ph�i c� nh�ng ng��i v� c�ng xu�t ch�ng, nh�n ngh�a h�n ng��i nh� ta n�m quy�n m�i ���c!")
	end
end;

function L30_get_yes()
	Talk(1,"","Nghe n�i g�n ��y c� c�i ��ng Tuy�t B�o, b�n trong c� r�t nhi�u d� minh ch�u gi� tr� n�i ti�ng kh�p n�i, ta s� �i ��n ��y th� v�n may v�y!")
	SetTask(9,30*256+10)
	AddNote("Ti�p nh�n nhi�m v� c�p 30: V�o Tuy�t B�o ��ng l�y v� 3 vi�n D� Minh Ch�u ")
	Msg2Player("Ti�p nh�n nhi�m v� c�p 30: V�o Tuy�t B�o ��ng l�y v� 3 vi�n D� Minh Ch�u ")
end;

function L30_get_no()
	Talk(1,"","S� huynh sai b�o m� c�ng d�m kh�ng tu�n l�nh, qu� l� to gan!")
end;

function L30_prise()
	Talk(1,"","Uhmm! ��ng t�c c�ng kh�ng ��n n�i ch�m. ���c! Ta s� phong ng��i l� Th�i Vi H� Ph�p, t� ��y v� sau c� c� g�ng l�m vi�c cho ta th� t�t nhi�n s� kh�ng �t l�i �ch cho ng��i!")
	i = GetItemCount(111)
	for j = 1, i do DelItem(111) end
	SetTask(9,40*256)
	SetRank(22)
--	AddMagic(178)
--	AddMagic(172)
--	AddMagic(393)
--	AddMagic(173)
--	AddMagic(177)			-- �ٴ��ɺ�
	add_kl(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�ng m�ng ng��i! �� ���c th�ng c�p th�nh C�n L�n ph�i Th�i Vi H� Ph�p, h�c ���c v� c�ng Nh�t Khi Tam thanh, Thi�n T� T�n L�i, Thi�n Thanh ��a Tr�c, B�c Minh ��o H�i ")
	AddNote("T�m ���c 3 h�t D� Minh Ch�u, ho�n th�nh nhi�m v� c�p 30 c�a C�n L�n, ���c th�ng ti�n tr� Th�i Vi H� Ph�p ")
end;

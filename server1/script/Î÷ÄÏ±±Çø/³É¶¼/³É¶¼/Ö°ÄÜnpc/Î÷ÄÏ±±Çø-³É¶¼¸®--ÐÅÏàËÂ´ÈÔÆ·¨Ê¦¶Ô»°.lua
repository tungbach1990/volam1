--���ϱ��� �ɶ��� �����´Ⱥ���ʦ�Ի�
--author: yuanlan	
--date: 2003/3/6
-- Update: Dan_Deng(2003-08-12)

function main(sel)
	UTask_em = GetTask(1);
	if (UTask_em <10) then				--û�м��������
		Talk(4, "", "Th� ch�! Xem d�ng l� ng��i c� luy�n v�! Kh�ng bi�t c� ��nh ��n Nga Mi hay ���ng m�n th�nh gi�o kh�ng?", "N�u th�t s� c� � ��, tr��c ti�n xin nghe v�i l�i khuy�n c�a l�o n�p!", "Nga mi Thanh Hi�u s� th�i v� tr� tr� c�a t� n�y l� ch� tri giao, b� t� bi v�i m�i ng��i, s� kh�ng l�m kh� cho ng��i. Nh�ng m�y �� t� t�c gia c�a h� v� c�ng cao c��ng v� r�t ng�o m�n. N�u nh� ng��i mu�n l�n n�i Nga Mi, ph�i th�ng qua s� kh�o nghi�m c�a h� m�i ��� ", "N�i ��n Th�c Nam tr�c H�i ���ng m�n, l�o n�p khuy�n ng��i ��ng �i! Ng��i trong ���ng m�n h�nh s� b� hi�m, ch�nh t� l�n l�n, b�n trong r�t l� nghi�m ng�t, mu�n x�ng v�o Tr�c H�i, e r�ng l�nh �t d� nhi�u!")
	elseif (UTask_em == 40*256+50) then 		--������40������
		UTask_emsub02 = GetByte(GetTask(29),2)
		if (UTask_emsub02 == 0) then 
			Say("A di �� ph�t! Th� ra l� n� hi�p c�a Nga Mi ph�i. Ph�t l� c�a ch��ng m�n Thanh hi�u s� th�i qu� ph�i r�t cao th�m, nh�ng tr�nh �� ph�t h�c c�a �� t� m�n h� c�ng kh�ng k�m, l�o t�ng kh�ng t� l��ng s�c, mu�n th�nh gi�o, th�nh gi�o!", 2, "M�i ��i s� ch� b�o /L40_V2_Q1", "V�n b�i c�n b�n vi�c kh�c n�a /no")
		elseif (UTask_emsub02 == 3) then
			L40_V2_Q1()
		elseif (UTask_emsub02 == 5) then
			L40_V2_Q2()
		elseif (UTask_emsub02 == 7) then
			L40_V2_Q3()
		else
			if (HaveItem(167) == 0) then
				AddEventItem(167)
				Talk(1,"","N� hi�p qu� kh�ng h� danh �� t� Nga Mi. �ng T�nh H� Th�n ph� ��y! Xin nh�n l�y!")
			else
				Talk(1,"","Tr�nh �� Ph�t h�c c�a �� t� Nga Mi kh�ng k�m g� v� h�c! L�o t�ng b�i ph�c!")
			end
		end
	elseif ((UTask_em == 50*256+50) and (HaveItem(23) == 1)) then		--������50������
		Talk(5, "","T� V�n Ph�p s�:A Di �� Ph�t! N� hi�p c� g� ch� gi�o?","T�i h� theo l�nh s� t�n, bi�u l� v�t cho qu� t�, l�m phi�n ��i s� h�i Ph��ng tr��ng T� H�i c�a qu� t� m�t ti�ng.","�a t� � t�t c�a t�n s�,ch�ng qua b�n t�ng kh�ng bi�t Ph��ng tr��ng hi�n gi� � ��u, �ang lo l�ng cho s� an nguy c�a �ng �y.","Kh�ng bi�t x�y ra chuy�n g�?","Th�t l� k� l�! Ph��ng tr��ng s�ng nay sau khi nh�n ���c m�t phong th� th� �i v�o h�u vi�n, ��n bay gi� v�n ch�a th�y ra, c�ng kh�ng bi�t �� x�y ra chuy�n g�.")
		SetTask(1, 50*256+60)
		AddNote("Sau khi tr� chuy�n v�i T� V�n Ph�p s� � T�n T��ng t� Th�nh ��, ���c bi�t T� H�i ��i s� �� �i v�o ��a ��o h�u vi�n. ")
		Msg2Player("Sau khi tr� chuy�n v�i T� V�n Ph�p s�, ���c bi�t ph��ng tr��ng T� H�i ��i s� �� �i v�o ��a ��o h�u vi�n. ")
	elseif (UTask_em == 50*256+60) then
		Talk(1,"","Th�t l� k� l�! Ph��ng tr��ng s�ng nay sau khi nh�n ���c m�t phong th� th� �i v�o h�u vi�n, ��n bay gi� v�n ch�a th�y ra, c�ng kh�ng bi�t �� x�y ra chuy�n g�.")
	elseif (UTask_em >= 50*256+80) and (GetFaction() == "emei") then
		Talk(1,"","�a t� n� hi�p c�u Ph��ng tr��ng! N� hi�p Nga Mi qu� l� danh b�t h� truy�n.")
	elseif (UTask_em == 70*256) then
		Talk(1,"","N� hi�p ng�y sau h�nh t�u giang h�, c� g� c�n tr� gi�p th� xin c� n�i, b�n t� s� h�t l�ng gi�p ��.")
	else
		Say("L�u r�i kh�ng g�p, Thanh Hi�u S� Th�i v�n b�nh an ch�? ")	--��������ɺ�ķ�����Ի�
	end
end;

function no()
	Talk(1,"","V�y b�n t�ng kh�ng l�m phi�n n� hi�p n�a.")
end;

function L40_V2_Q1()
	Say("Ph�t gi�o truy�n nh�p trung th� t� tri�u ��i n�o?", 4, "Chi�n qu�c /f1", "��i H�n /L40_V2_Q2", "��i ���ng /f1", "��i Minh /f1")
end;

function f1()
	Say("A Di �� Ph�t! Xem ra n� th� ch� kh�ng hi�u s�u s�c ph�t h�c. ")
	SetTask(29, SetByte(GetTask(29),2,3))
end;

function L40_V2_Q2()
	Say("T�t l�m! N� hi�p c� bi�t Cao t�ng t� ���ng tri�u ��n Thi�n Tr�c th�nh kinh l� ai kh�ng?", 4, "Bi�n C� /f2", "Ki�m Ch�n /f2", "Nh�t H�nh /f2", "Huy�n Trang /L40_V2_Q3")
end;

function f2()
	Say("N� hi�p c� nh� sai kh�ng?", 0)
	SetTask(29, SetByte(GetTask(29),2,5))
end;

function L40_V2_Q3()
	Say("Hay l�m! Qu� ph�i � Nga mi s�n l� m�t trong b�n thi�n h� t� ��i ph�t s�n. N� hi�p c� bi�t l� m�n ph�i n�o kh�ng thu�c t� ��i Ph�t s�n kh�ng?", 4, "Ph� �� s�n /f3", "C�u Hoa s�n /f3", "Tung s�n /L40_V2_prise", "Ng� ��i s�n /f3")
end;

function f3()
	Say("L� n�o t�n s� ch�a d�y qua cho c�c �� t� sao?", 0)
	SetTask(29, SetByte(GetTask(29),2,7))
end;

function L40_V2_prise()
	Talk(1,"","Tr�nh �� Ph�t h�c c�a �� t� Nga Mi kh�ng k�m g� v� h�c! L�o t�ng b�i ph�c! N� hi�p qu� kh�ng h� danh �� t� Nga Mi. �ng T�nh H� Th�n ph� ��y! Xin nh�n l�y!")
	AddEventItem(167)
	SetTask(29, SetByte(GetTask(29),2,10))
	AddNote("L�y ���c �ng T�nh H� Th�n Ph� � ch� T� V�n ph�p s� T�n T��ng t� t�i Th�nh ��. ")
	Msg2Player("���c �ng T�nh H� Th�n Ph�. ")
end;

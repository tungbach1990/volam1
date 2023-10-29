--��ԭ���� ���ݸ� ��¥�ϰ�Ի���ؤ��10������ؤ��90��������ȭ����������
-- by��Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 10*256+10) then		--10��������
		SetTask(8,10*256+20)
		Talk(4,"L10_buy","�ng ch�! Ta mu�n mua r��u!","Th� kh�c th� ta kh�ng c�, ch� c� r��u l� nhi�u kh�ch quan mu�n mua r��u g�?","Hu� Tuy�n T�u, Kim L�ng Xu�n, B�ch Hoa Nh��ng, Kinh Hoa L� v� Song C�u ��i Kh�c.","�i da, kh�ng may Hu� Tuy�n T�u �� b�n h�t r�i, c�n m�t b�nh cu�i c�ng t�n ma men T�y B�n Ti�n n�i ti�ng trong th�nh mua �i m�t. Ch�c gi� n�y h�n �ang vui v� say men r��u. C�n l�i 4 lo�i r��u ��u c�, nh�ng b�i ��u l� r��u danh ti�ng, v� v�y kh�ng th� b�n r� ���c!")
	elseif (UTask_gb >= 10*256+20) and (UTask_gb < 20*256) then		--�����߶�ʧ����
		if (HaveItem(77) == 0) then
			Say("Kim L�ng Xu�n v�a th�m v�a ng�y ng�t, ch� c�n 400 l��ng, m�i nhanh ch�n v�o mua!",2,"Mua/L10_buy_yes1","Kh�ng mua/L10_buy_no")
		elseif (HaveItem(78) == 0) then
			Say("B�ch Hoa Nh��ng v� ng�t th�m n�ng, ch� c�n 400 l��ng, m�i nhanh ch�n v�o mua!",2,"Mua/L10_buy_yes2","Kh�ng mua/L10_buy_no")
		elseif (HaveItem(79) == 0) then
			Say("Kinh Hoa L� ng�t th�m n�t m�i, ch� c�n 400 l��ng, m�i nhanh ch�n v�o mua!",2,"Mua/L10_buy_yes3","Kh�ng mua/L10_buy_no")
		elseif (HaveItem(80) == 0) then
			Say("Song C�u ��i Kh�c ��m n�ng, ch� c�n 400 l��ng, m�i nhanh ch�n v�o mua!",2,"Mua/L10_buy_yes4","Kh�ng mua/L10_buy_no")
		else
			Talk(1,"","C�c lo�i m� t�u th�m ng�y ng�t! H��ng bay tr�m d�m, ng�t ng�y l�ng ng��i!")
		end
	elseif (GetTask(128) == 10) and (HaveItem(76) == 0) then			-- ؤ��90��������
		Say("Hu� Tuy�n T�u th�m ng�y ng�t! ch� c�n 1000 l��ng, m�i nhanh ch�n v�o mua!",2,"Mua/U128_10","Kh�ng mua/L10_buy_no")
	elseif (GetTask(75) == 10) and (GetTask(55) == 10) and (HaveItem(77) == 0) then			-- ȭ����������
		Say("Kim L�ng Xu�n v�a th�m v�a ng�y ng�t, ch� c�n 800 l��ng, m�i nhanh ch�n v�o mua!",2,"Mua/U75_10","Kh�ng mua/L10_buy_no")
	else
		Talk(1,"","��n ��t D��ng Ch�u c�nh ��p, l�i l�m m� n�, sao c� th� thi�u r��u ngon? Kh�ch quan! U�ng ch�t r��u ngon ch�!")
	end
end;

function U75_10()
	if (GetCash() >= 800) then
		Pay(800)
		AddEventItem(77)
		Msg2Player("C� Kim L�ng Xu�n ")
	else
		L10_buy_noMoney()
	end
end

function U128_10()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(76)
		Msg2Player("C� r��u Hu� tuy�n ")
	else
		L10_buy_noMoney()
	end
end

function L10_buy()
	Say("Ngo�i 4 lo�i r��u, t�nh kh�ch quan 1200 l��ng! Mu�n mua kh�ng?",2,"Mua/L10_buy_yes","Kh�ng mua/L10_buy_no")
end;

function L10_buy_yes()
	if (GetCash() >= 1200) then
		Pay(1200)
		AddEventItem(77)
		AddEventItem(78)
		AddEventItem(79)
		AddEventItem(80)
		AddNote("C� 4 lo�i m� t�u Kim L�ng Xu�n, B�ch Hoa Xu�n, Kinh Hoa L�, Song C�u ��i Kh�c ")
		Msg2Player("C� 4 lo�i m� t�u Kim L�ng Xu�n, B�ch Hoa Xu�n, Kinh Hoa L�, Song C�u ��i Kh�c ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_no()
	Talk(1,"","��a �! C��p ng��i ta hay sao? Kh�ng mua, quy�t kh�ng mua!")
end;

function L10_buy_yes1()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(77)
		Msg2Player("C� Kim L�ng Xu�n ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes2()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(78)
		Msg2Player("C� B�ch Hoa Xu�n ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes3()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(79)
		Msg2Player("C� Kinh Hoa L� ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes4()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(80)
		Msg2Player("C� Song C�u ��i Kh�c ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_noMoney()
	Talk(1,"","Kh�ng c� ti�n? V�y kh�ng ���c r�i!")
end;

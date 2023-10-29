Include("\\script\\event\\cookies2007\\head.lua");

function iscookies2007()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070414 and nDate <= 20070424) then
		return 1;
	else
		return 0;
	end;
end;

function cookies2007_main()
	Say("B�n h�ng rong: L�o phu ch� bu�n b�n nh�, g�n ��y c� mua v� m�t �t h�ng h�a, d� ��nh m�ng 3 th�ng 3 s� �em b�n. C� ng� ��u tr�n ���ng b� b�n th� ph� ��nh c��p h�t s� h�ng h�a v� ti�n tr�n ng��i. L�o xin c�c v� ��i hi�p gi�p �� �i l�y l�i h�ng h�a v� ti�n v�.", 3,
			"Ta �� t�m th�y r�i/want_take_cookiesma",
			"Ta mu�n t�m hi�u ho�t ��ng m�ng 3 th�ng 3/about_cookies2007", 
			"Ta s� quay l�i sau/OnCancel");
end;

function want_take_cookiesma()
	if (checkcookies2007Limit() ~= 1) then
		Say("B�n h�ng rong: Th�t ng�i qu�, ch� c� ng��i ch�i <color=yellow> c�p tr�n 50 �� n�p th�<color> m�i c� th� nh�n Bao nguy�n li�u l�m b�nh.", 0);
		return 0;
	end;
	if (iscookies2007() == 1) then
		sure_task_cookiesma();
	else
		Say("B�n h�ng rong: [Ho�t ��ng ch�a di�n ra] T�i h�ng h�a c�a l�o ch�a ��ng nguy�n li�u r�t t�t, �a t� ��i hi�p quan t�m.",0);
		return 0;
	end
end;

function sure_task_cookiesma()
	if (iscookies2007() == 1) then
			if GetCash() < 100000 then 
				Say("B�n h�ng rong: L�o phu b� m�t <color=yellow>10 v�n l��ng<color>, ch�ng hay ��i hi�p �� t�m th�y hay ch�a?",0);
				return 0;
			end
			if CalcFreeItemCellCount() < 1 then 
				Say("B�n h�ng rong: Xin h�y s�p x�p l�i h�nh trang! L�o phu c� ph�n qu� nh� mu�n g�i t�ng ��i hi�p.",0);
				return 0;
			end
			local nsum = CalcEquiproomItemCount(6,1,1393,-1);
			if nsum < 20 then
				Say("B�n h�ng rong: ��i hi�p v�n ch�a t�m �� t�i h�ng h�a, l�o phu b� m�t <color=yellow>20 t�i h�ng h�a<color> c� m�.",0);
				return 0;
			end	
			if ConsumeEquiproomItem(20,6,1,1393,-1) ~= 1 then
				WriteLog(format("[2007M�ng 3 th�ng 3] \t%sName:%s\tAccount:%s\t H�y b� t�i h�ng h�a th�t b�i.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
				Say("B�n h�ng rong: H�y b� t�i h�ng h�a th�t b�i.",0);
				return 0;
			else
				WriteLog(format("[2007M�ng 3 th�ng 3]\t%sName:%s\tAccount:%s\t H�y b� T�i h�ng h�a th�nh c�ng.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
			end
			Pay(100000);
			AddItem(6,1,1394,1,0,0);
			Say("B�n h�ng rong: ��y l� Bao nguy�n li�u l�m b�nh, �ai hi�p h�y mau ch�ng c�ng v�i v� n� hi�p n�o �� l�m b�nh �i.", 0);
		--end;
	end;
end;

function about_cookies2007()
	Talk(3,"","B�n h�ng rong: Trong th�i gian ho�t ��ng, t�t c� ng��i ch�i khi ��nh qu�i luy�n c�ng s� c� c� h�i nh�t ���c <color=yellow>T�i h�ng h�a<color>. Sau ��, mang 20 <color=yellow>T�i h�ng h�a<color> v� <color=yellow>10 v�n l��ng<color> ��n NPC b�n h�ng rong t�i c�c ��i th�nh th� �� ��i l�y <color=yellow>Bao nguy�n li�u l�m b�nh<color>.","T� ��i nam n� (��ng c�p tr�n 50 �� n�p th�) c� th� ��n c�c th�nh th�, t�n th� th�n hay c�c khu v�c phong c�nh �� c�ng nhau l�m b�nh."," Trong qu� tr�nh l�m b�nh, ng��i ch�i s� ti�n h�nh c�c thao t�c Nh�o b�t, ��i v� ��u xanh, B� nh�n v�o b�nh, Th�m c�iThao t�c c�ng nhanh g�n th� b�nh l�m ra s� c�ng ngon.");
end;

function OnCancel()
	
end
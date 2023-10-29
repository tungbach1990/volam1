-- ��������� �����˴��˴�
-- lixin 2005-9-7

--�����˴���	
WULINMENG_NPC = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>V� l�m truy�n nh�n<link>"


tab_city = {
{1,520,1601,3269, "<#> Ph��ng T��ng ph� "},
{11,521,1601,3269, "<#> Th�nh �� ph� "},
{37,522,1601,3269, "<#> Bi�n Kinh ph� "},
{78,523,1601,3269, "<#> T��ng D��ng ph� "},
{80,524,1601,3269, "<#> D��ng Ch�u ph� "},
{162,525,1601,3269, "<#> ��i L� ph� "},
{176,526,1601,3269, "<#> L�m An ph� "},
}

startdate = 05091618
enddate = 05091824

function mid_autumn_main()
	local nDay = tonumber(GetLocalDate("%y%m%d"))
	local mid_sdate = floor(startdate / 100)
	local mid_edate = floor(enddate / 100)
	if ( nDay >= mid_sdate and nDay <= mid_edate ) then
		Describe(WULINMENG_NPC.."<#> ���ng gia b�o � Ba Th�c g�n ��y �� c� nh�ng bi�u hi�n tr� m�t v�i V� l�m! ��c C� minh ch� mu�n t� ch�c m�t h�i thi l�m b�nh � Minh Nguy�t tr�n nh�m t�m hi�u th�c h� c�a ���ng m�n! Xem ra l�n n�y l�nh �t d� nhi�u. C� nhi�u cao th� s� xu�t hi�n. C�c ng��i ��n �� tham gia nh� ph�i h�t s�c th�n tr�ng!", 4, "<#> Ta bi�t r�i!, ��a ta ��n Minh Nguy�t tr�n nh�./autumn_enter", "<#> Ta mu�n ��n ch� ��i h�i hoa ��ng /lantern_enter", "<#> Li�n quan v� ho�t ��ng h� tr� trung thu /autumn_help","<#> �� ta suy ngh� l�i!/cancel");
	else
		Describe(WULINMENG_NPC.."<#> ���ng gia b�o � Ba Th�c g�n ��y �� c� nh�ng bi�u hi�n tr� m�t v�i V� l�m! ��c C� minh ch� mu�n t� ch�c m�t h�i thi l�m b�nh � Minh Nguy�t tr�n nh�m t�m hi�u th�c h� c�a ���ng m�n! Xem ra l�n n�y l�nh �t d� nhi�u. C� nhi�u cao th� s� xu�t hi�n. C�c ng��i ��n �� tham gia nh� ph�i h�t s�c th�n tr�ng!", 2, "<#> Ta bi�t r�i!, ��a ta ��n Minh Nguy�t tr�n nh�./autumn_enter", "<#> �� ta suy ngh� l�i!/cancel");
	end
end;


function autumn_enter()
	local nDate = tonumber(date("%y%m%d%H"));
	local nCount = getn(tab_city);
	local cityid = 0;

	for i=1,nCount do
		if( SubWorldIdx2ID( SubWorld ) == tab_city[i][1] ) then
			cityid = i
			break
		end;
	end;
	if ( GetPlayerCount() >=700 or cityid <= 0 ) then
		Describe(WULINMENG_NPC..tab_city[cityid][5].."<#> T� ��y ��n Minh Nguy�t tr�n r�t nguy hi�m! Hay l� ng��i d0i t� th�nh th� kh�c v�o �� nh�!", 1, "<#> V�y c�ng ���c! C�m �n!/cancel");
		return
	end
	NewWorld(tab_city[cityid][2],tab_city[cityid][3],tab_city[cityid][4]);
	SetFightState(0);
	if(nDate >= startdate and nDate <= enddate) then
		Say("<#> C�c khu v�c t� ch�c h�i Hoa ��ng l�: Hoa S�n, Thanh Th�nh s�n, V� Di s�n, �i�m Th��ng s�n v� Minh Nguy�t tr�n.T� ng�y ��n ng�y, m�i ng�y t� 18:00-24:00, b�n c� th� ��n �� ng�m hoa ��ng, th��ng nguy�t, tham gia c�c ho�t ��ng v� nh�n th��ng.",0)
	end
end

function autumn_help()
	Describe(WULINMENG_NPC.."<#> Ho�t ��ng trung thu l�n n�y bao g�m c� <color=red>thi l�m b�nh t�i Minh Nguy�t tr�n<color>. T� <color=red>Ng�y 16 th�ng 9 ��n ng�y 18 th�ng 9, m�i ng�y t� 18:00-24:00<color>, c� 4 khu v�c ��u m� h�i <color=red>hoa ��ng<color>. Ng��i mu�n ��n khu v�c n�o?", 3, "<#> Li�n quan v� Ho�t ��ng 'Hoa ��ng' Trung thu /huadeng_help","<#> Li�n quan ��n ho�t ��ng l�m b�nh trung thu /yuebing_help","<#> Ta �� bi�t r�i /cancel");
end;

function huadeng_help()
	Describe(WULINMENG_NPC.."<#> T� <color=red>ng�y 16 th�ng 9 ��n 18 th�ng 9, m�i ng�y 18:00-24:00 <color>, <color=yellow>Thanh Th�nh s�n<color>, <color=yellow>V� Di s�n<color>, <color=yellow>�i�m Th��ng s�n<color>, <color=yellow>Hoa S�n<color> s� ��ng lo�t m� h�i hoa ��ng. Ch� c�n b�n <color=red>li�n t�c ��p d��ng 3 c�u ��<color> s� nh�n ���c ph�n th��ng. M�i ng�y ch� c� <color=red>100 ph�n th��ng<color>!",1,"<#> Ta �� bi�t r�i /cancel")
end

function yuebing_help()
	Describe(WULINMENG_NPC.."<#> Trong th�i gian t� 16/9 ��n 30/9 m�i ng��i c� th� nh� V� L�m Truy�n Nh�n ��a v�o Minh Nguy�t tr�n, sau �� t�m c�c <color=red>Th� b�nh<color> �� t�m hi�u quy t�c l�m b�nh. ��ng th�i m�i ng�y t� <color=red>9:00-24:00<color> t�i 7 th�nh th� s� c� H�nh C��c th��ng nh�n trao ��i c�c nguy�n li�u l�m b�nh!",1,"<#> Trang k� /yuebing_help2")
end

function yuebing_help2()
	Describe(WULINMENG_NPC.."<#> L�m b�nh trung thu g�m 3 b��c: <color=red>'nh�o b�t' <color>, <color=red>'l�m nh�n b�nh'<color>, <color=red>'n��ng b�nh'<color>, m�i kh�u c� m�t th�i gian nh�t ��nh, ho�n th�nh m�i kh�u b�n s� ���c th�ng b�o ��n b��c k� ti�p, n�u v��t qu� th�i gian, s� b� th�t b�i. N�u b�n l�m th�nh c�ng <color=red>B�nh trung thu Th�p c�m<color>, <color=red>B�nh trung thu H�nh nh�n<color>, <color=red>B�nh trung thu ��u tr�ng<color>, <color=red>B�nh trung thu nh�n ��u<color> c� th� mang ��n Minh Nguy�t tr�n t�m <color=red>Minh Nguy�t L�o nh�n<color> ��i th��ng!",1,"<#> K�t th�c ��i tho�i!/cancel")
end

function lantern_enter()
	Describe(WULINMENG_NPC.."<#> ��i h�i trung thu hoa ��ng ���c t� ch�c � 4 khu v�c: Thanh Th�nh s�n, V� Di s�n, �i�m Th��ng s�n, Hoa S�n. Ng��i th�ch ��n khu n�o?",5, "<#> Thanh Th�nh s�n/#lantern_enter_lantern(21)", "<#> V� Di s�n/#lantern_enter_lantern(193)", "<#> �i�m Th��ng s�n/#lantern_enter_lantern(167)", "<#> Hoa S�n/#lantern_enter_lantern(2)", "<#> K�t th�c ��i tho�i!/cancel")
end

tbLANTERN_ENTER_POS = {
		[2] = { 	--huashan
			{ 2287 ,4092 },
			{ 2595, 3501 },
			{ 2546, 3618 },
			{ 2360, 3758 },
			{ 2332, 3912 },
			{ 2355, 4045 },
			{ 2428, 4054 },
			{ 2525, 4052 },
			{ 2290, 4087 },
			{ 2546, 4035 },
		 },
		[21] = { 	--qingchengshan
			{ 2621, 4501 },
			{ 2577, 3292 },
			{ 2387, 3706 },
			{ 2561, 3313 },
			{ 2365, 4016 },
			{ 2735, 3965 },
			{ 2542, 3915 },
			{ 2270, 3842 },
			{ 2830, 3700 },
			{ 2049, 4107 },
		 },
		[167] = { 	--diancangshan
			{ 1606, 3214 },
			{ 1373, 2532 },
			{ 1689, 2620 },
			{ 1430, 2692 },
			{ 1617, 2738 },
			{ 1216, 2805 },
			{ 1586, 2850 },
			{ 1430, 2950 },
			{ 1671, 3034 },
			{ 1517, 3215 },
		 },
		[193] = { 	--wuyishan
			{ 1937, 2851},
			{ 1071, 2843 },
			{ 1130, 3074 },
			{ 1113, 2641 },
			{ 1447, 3243 },
			{ 1808, 2705 },
			{ 1513, 2497 },
			{ 1213, 2565 },
			{ 1431, 2776 },
			{ 1310, 2435 },
		 },
}

function lantern_enter_lantern(area)
	local tb_enter_pos = tbLANTERN_ENTER_POS[area]
	if ( tb_enter_pos ~= nil ) then
		local randnum = random( getn( tb_enter_pos ) )
		NewWorld(area, tb_enter_pos[randnum][1], tb_enter_pos[randnum][2])
		SetFightState(1)
	end
end



function cancel()
end
	
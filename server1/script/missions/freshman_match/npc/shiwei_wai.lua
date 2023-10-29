--���ִ������

Include("\\script\\missions\\freshman_match\\tryout\\head.lua")
function main()
	Say( "Th� v� h�i tr��ng: T� 1 th�ng 6 n�m 2005 ��n 10 th�ng 6 n�m 2005, m�i ng�y 20:00 ��n 23:00 s� t� ch�c <color=yellow>li�n ��u V� l�m ki�t xu�t<color>. Cu�c thi n�y nh�m m�c ��ch t�o c� h�i cho c�c T�n Th� giang h� (c�p 50 ��n c�p 89) giao l�u h�c h�i kinh nghi�m v�i c�c ��ng m�n, n�ng cao k� n�ng c�a T�n Th�, mau ��n tham gia �i!", 1, "��ng �!/want_enrol_option")
end

function want_enrol_option()
	if (validateDate(CP_UPTO_TRYOUT, CP_END_TRYOUT)) then
		local optiontab = {
				"Tham gia thi ��u m�n ph�i ki�t xu�t V� l�m/want_enrol",
				"Ki�m tra th�nh t�ch thi ��u ki�t xu�t!/look_sort",
				"H� tr� thi ��u V� l�m ki�t xu�t/help_freshmanmatch",
				"Ta s� quay l�i sau!/OnCancel"
				}
		Say("Mu�n tham gia thi ��u V� l�m ki�t xu�t m�n ph�i �?", getn(optiontab), optiontab)
	elseif(tonumber(date("%y%m%d%H")) >= CP_END_TRYOUT) then
		Say("Thi ��u V� l�m ki�t xu�t m�n ph�i �� k�t th�c, 5 ng��i ��ng ��u c�a c�c m�n ph�i c� th� ��n L�m An g�p S� gi� ki�t xu�t (203, 202) nh�n danh hi�u.", 0)
	else
		nHour = mod(CP_UPTO_TRYOUT, 100)
		nDay = floor(mod(CP_UPTO_TRYOUT, 10000) / 100)
		nMonth = floor(mod(CP_UPTO_TRYOUT, 1000000) / 10000)
		Say( "V� l�m m�n ph�i ki�t xu�t s� b�t ��u t� "..date( "%Y" ).."n�m"..nMonth.."nguy�t "..nDay.."nh�t "..nHour.."ch�nh th�c b�t ��u xin ti�p t�c ch� � theo d�i!", 0 )
	end
end

function want_enrol()
	if ( nt_gettask( CP_TASKID_REGIST ) ~= CP_UPTO_TRYOUT ) then
	
		if (GetLevel() >= 90  ) then
			Say("��ng c�p t� 90 tr� l�n kh�ng ���c tham gia thi ��u.", 0)
			return
		end
		
		if ( GetLevel() < 50 ) then
			Say( "��ng c�p c�a b�n ch�a ��t y�u c�u (c�p 50) kh�ng ���c b�o danh tham gia!", 0 )
			return
		end
		
	end
	local nHour = mod( CP_UPTO_TRYOUT, 100 )
	local opentime = TRYOUT_TIMER_2 / 60 / 60 / FRAME2TIME
	if (GetMissionV( MS_STATE ) == 0) then
		local talkstr = "Thi ��u ki�n xu�t m�i ng�y t� "..nHour..":00 gi� "..opentime..", b�y gi� l� "..date( "%H:%M" )..", h�y quay l�i sau!"
		Say(talkstr, 0)
		return
	elseif (GetMissionV(MS_STATE) == 2) then
		local talkstr = "V�ng thi ��u ki�t xu�t �ang ���c ti�n h�nh, xin ch� hi�p sau!"
		Say(talkstr, 0)
		return
	end
		
	Say("Thi ��u ki�n xu�t m�i ng�y t� "..nHour..":00 gi� "..opentime..", th�i gian b�o danh l� 5 ph�t, th�i gian thi ��u l� 15 ph�t, m�i ng��i ��u c� th� tham gia."..CP_MAXROUND.."v�ng thi ��u. Sau khi b�o danh v�o khu v�c chu�n b� thi ��u, b�n c� th� r�i kh�i ho�c ch� ��n l�c thi ��u.", 2, "Ta mu�n tham gia thi ��u ki�t xu�t!/sure_enrol_1", "�� ta xem l�i/OnCancel")
end

function sure_enrol_1()
	Say("Theo hi�u l�nh c�a V� l�m Minh ch�, trong thi ��u V� l�m ki�t xu�t nghi�m c�m s� d�ng thu�c PK, b�n ph�i xem tr�n ng��i c� th� thu�c �y tr��c khi tham gia, n�u kh�ng s� b� ��nh ch� thi ��u. Ta s� x�a �i tr�ng th�i d� th��ng PK c�a ng��i. <color=red>L�c v�o tr��ng ��u, ng��i ph�i xem �� hao m�n c�a trang b�. Sau khi v�o tr��ng ��u, nghi�m c�m di chuy�n v�t ph�m. Ng��i h�y ki�m tra l�i v�t ph�m trong h�nh trang �� ��y ch�a?",2, "Ta �� s�n s�ng!/sure_enrol_2", "Ta s� quay l�i sau!/OnCancel")
end

function sure_enrol_2()
	Say("Quan vi�n h�i tr��ng:<color=red>V�o khu v�c chu�n b� v� khu v�c thi ��u, ng��i ch�i kh�ng th� di chuy�n v�t ph�m trong h�nh trang nh�ng v�n c� th� s� d�ng v�t ph�m trong thanh c�ng c� v� h�nh trang. Ng��i h�y ki�m tra l�i v�t ph�m trong thanh c�ng c� �� ��y hay ch�a?",2,"X�c nh�n/sure_enrol", "Ta ch�a s�n s�ng!/OnCancel")
end

function sure_enrol()
	local forbiditem_con = 0
	local forbiditem_key = 0
	local keyitem = {}
	local keyitem_g = {}
	local keyitem_d = {}
	local keyitem_p = {}
	for i = 1, 3 do
		keyitem[i] = ITEM_GetImmediaItemIndex (i)
		if (keyitem[i] ~= 0) then
			keyitem_g[i], keyitem_d[i], keyitem_p[i] = GetItemProp(keyitem[i])
		else
			keyitem_g[i] = 0
			keyitem_d[i] = 0
			keyitem_p[i] = 0
		end
	end
	for i = 1, getn(CP_FORBID_ITEM) do
		forbiditem_con = CalcEquiproomItemCount( CP_FORBID_ITEM[i][2][1], CP_FORBID_ITEM[i][2][2], CP_FORBID_ITEM[i][2][3], CP_FORBID_ITEM[i][2][4] )
		if (forbiditem_con > 0) then
			break
		end
		for j = 1, 3 do 
			if (keyitem_g[j] == CP_FORBID_ITEM[i][2][1] and keyitem_d[j] == CP_FORBID_ITEM[i][2][2] and keyitem_p[j] == CP_FORBID_ITEM[i][2][3]) then
				forbiditem_key = 1
				break
			end
		end
	end
	if(forbiditem_con > 0 or forbiditem_key > 0) then
		Say("Ng��i th�t to gan! D�m kh�ng tu�n l�nh c�a V� L�m Minh Ch�, t� � �em d��c ph�m c�m v�o, mau r�i kh�i ��y!", 0)
		return
	end
	
	if (keyitem[1] == 0 and keyitem[2] == 0 and keyitem[3] == 0) then
		Say("B�ng c�ng c� c�a b�n hi�n gi� kh�ng c� �� d��c ph�m v�o, b�n h�y ch�n d��c ph�m ��t v�o ��ng v� tr� m�nh d�ng �i!<color=red> Sau khi �� v�o tr��ng ��u c�m di chuy�n v�t ph�m, xin h�y x�c nh�n v�t ph�m trong b�ng c�ng c� �� ���c s�p x�p xong!", 0)
		return 
	end
	
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		local talkstr = "Ng��i m�i l�n ��u tham gia V� l�m ki�t xu�t? C� mu�n tham gia kh�ng?"
		Say(talkstr, 2, "Ta mu�n tham gia!/pay_enrol_money", "�� ta xem l�i/OnCancel")
		return
	end
	
	join_tryout()
	Msg2Player("Sau khi v�o khu v�c thi ��u, kh�ng th� di chuy�n v�t ph�m trong h�nh trang nh�ng v�n c� th� s� d�ng v�t ph�m trong h�nh trang v� thanh c�ng c�.");
end

function pay_enrol_money()

		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end
		nt_settask( CP_TASKID_LOGOUT, 0)
		join_tryout()
end

function look_sort()
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		for i = 1096 , 1105 do
			nt_settask(i, 0)
		end
		nt_settask( CP_TASKID_LOGOUT, 0)
	end
	
	if (nt_gettask(CP_TASKID_ROUND) == 0) then
		Say("Hi�n B�n v�n ch�a thi ��u tr�n n�o!", 0)
	else
		Say("Thi ��u V� l�m ki�t xu�t cho ph�p m�i ng��i tham gia nhi�u nh�t"..CP_MAXROUND.."l�n. Hi�n t�i b�n �� tham gia <color=yellow>"..nt_gettask(CP_TASKID_ROUND).."<color> l�n thi ��u, �i�m th��ng l�:"..nt_gettask(CP_TASKID_POINT)..", th�ng"..nt_gettask(CP_TASKID_WIN).."tr�n, thua"..nt_gettask(CP_TASKID_LOSE).."tr�n, h�a"..nt_gettask(CP_TASKID_TIE).."tr�n.", 0)
	end
end


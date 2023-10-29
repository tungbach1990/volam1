--���ִ������
Include("\\script\\missions\\championship\\head.lua")
Include("\\script\\missions\\championship\\tryout\\head.lua")
function main()
	Say("Quan vi�n ��u tr��ng: Tr�n ��u l�n n�y s� ch�n trong anh h�ng thi�n h�, c�c v� l�m h�o ki�t ch�n ra 90 V� l�m cao th� l�m ��i bi�u tham gia ��i h�i V� l�m to�n khu v�c! M�i b�n ��n tham gia ��i h�i v� l�m s�i n�i, h�o h�ng!", 1, "��ng �!/want_enrol_option")
end

function want_enrol_option()
	cp_syntaskround()
	if (validateDate(CP_UPTO_TRYOUT, CP_END_TRYOUT)) then
		local optiontab = {
				"Tham gia tr�n d� tuy�n m�n ph�i/want_enrol",
				"Tra xem th�nh t�ch d� tuy�n hi�n t�i c�a ta /look_sort",
				"H� tr� thi ��u d� tuy�n M�n ph�i/help_tryout",
				"Ta s� quay l�i sau!/OnCancel"
				}
		Say("Mu�n v�o ��i h�i V� l�m?", getn(optiontab), optiontab)
	elseif(tonumber(date("%y%m%d%H")) > CP_END_TRYOUT) then
		Say("Thi ��u d� tuy�n ��i h�i v� l�m �� k�t th�c, b�n c� th� ��n L�m An g�p Vi�n quan ��i h�i V� L�m xem danh s�ch tr�ng tuy�n.", 0)		
	else
		nHour = mod(CP_UPTO_TRYOUT, 100)
		nDay = floor(mod(CP_UPTO_TRYOUT, 10000) / 100)
		nMonth = floor(mod(CP_UPTO_TRYOUT, 1000000) / 10000)
		Say("Thi ��u d� tuy�n ��i h�i V� l�m s� t� ch�c v�o"..date("%Y").."n�m"..nMonth.."nguy�t "..nDay.."nh�t "..nHour.."ch�nh th�c b�t ��u xin ti�p t�c ch� � theo d�i!",0)
	end
end

function want_enrol()
	--if ���˺ŵ�������ɫ�ѱ��� then
	--	Say("���ʺ��ڱ������н�ɫ�μ�����Ԥѡ������������ɫ�ڱ������ܲ��������ڷ���������ɫ�ʸ�����ñ���ɫ����������", 0)
	--	return 
	--end
	if (nt_gettask(CP_TASKID_REGIST) == 9) then	--�Ѿ�ȡ���˱����ʸ�
		Say("B�n �� b� t� c�ch tham gia thi ��u d� tuy�n m�n ph�i, kh�ng th� ti�p t�c b�o danh tham gi thi ��u.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_TITLE) == 9) then		--�Ѿ�ȡ�þ���Ȧ�ʸ�
		Say("B�n �� nh�n ���c t� c�ch tuy�n th�, ��ng ��n ��y gi�nh ng�i n�a!", 0)
		return
	end
	local nHour = mod(CP_UPTO_TRYOUT, 100)
	local opentime = TRYOUT_TIMER_2 / 60 / 60 / FRAME2TIME
	if (GetMissionV(MS_STATE) == 0) then
		local talkstr = "Thi ��u d� tuy�n m�n ph�i m�i ng�y t� "..nHour..":00 gi� "..opentime..", b�y gi� l� "..date("%H:%M")..", h�y quay l�i sau!"
		Say(talkstr, 0)
		return
	elseif (GetMissionV(MS_STATE) == 2) then
		local talkstr = "V�ng thi ��u n�y �ang ti�n h�nh thi ��u, xin ��i tr�n sau h�y v�o!"
		Say(talkstr, 0)
		return
	end
		
	Say("Thi ��u d� tuy�n M�n ph�i m�i ng�y v�o l�c"..nHour..":00 gi� "..opentime.." gi�, th�i gian b�o danh l� 5 ph�t, th�i gian thi ��u l� 10 ph�t, m�i ng��i ch� c� th� tham gia"..CP_MAXROUND.."v�ng thi ��u. Sau khi b�o danh v�o khu v�c chu�n b�, b�n c� th� ch�n r�i kh�i ho�c ch� ��n l�c thi ��u. C�n c� v�o th�nh t�ch thi ��u ch�n ra 5 ng��i ��i di�n M�n ph�i tham gia thi ��u v�ng chung k�t khu v�c", 2, "Ta mu�n tham gia d� tuy�n!/sure_enrol_1", "�� ta xem l�i/OnCancel")
end

function sure_enrol_1()
	Say("Theo hi�u l�nh c�a Minh ch�, trong v� l�m thi ��u ki�t xu�t nghi�m c�m s� d�ng <color=red>d��c ph�m PK<color>, b�n ph�i xem tr�n ng��i c� th� thu�c �y tr��c khi tham gia, n�u kh�ng s� b� ��nh ch� thi ��u. Ta s� x�a �i tr�ng th�i d� th��ng PK c�a ng��i. <color=red>L�c v�o tr��ng ��u, ng��i ph�i xem �� hao m�n c�a trang b�. Sau khi v�o tr��ng ��u, nghi�m c�m di chuy�n v�t ph�m. Ng��i h�y ki�m tra l�i v�t ph�m trong thanh c�ng c� �� ��y hay ch�a?",2, "Ta �� s�n s�ng!/sure_enrol_2", "Ta s� quay l�i sau!/OnCancel")
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
		Say("B�ng c�ng c� c�a b�n kh�ng c� �� d��c ph�m, hay l� b�n h�y b� d��c ph�m v�o b�ng c�ng c�! <color=red> Sau khi v�o tr��ng ��u c�m di chuy�n v�t ph�m, xin x�c nh�n v�t ph�m b�ng c�ng c� �� ��y hay ch�a?<color>", 0)
		return 
	end
	
	if (nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		local talkstr = "Ng��i l�n ��u tham gia d� tuy�n c�n ph�i n�p 10 v�n l��ng b�o danh."
		Say(talkstr, 2, "��y l� 10 v�n l��ng./pay_enrol_money", "�� ta xem l�i/OnCancel")
		return
	end
	
	join_tryout()
	Msg2Player("Sau khi v�o khu v�c thi ��u, kh�ng th� di chuy�n v�t ph�m trong h�nh trang nh�ng v�n c� th� s� d�ng v�t ph�m trong h�nh trang v� thanh c�ng c�.");
end

function pay_enrol_money()
	if (GetCash() >= CP_CASH) then
		Pay(CP_CASH)
		
		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end

		join_tryout()
		return
	end
	Say("B�n kh�ng c� �� ph� b�o danh, �� 10 v�n h�y quay l�i!", 0)
end

function look_sort()
	if (nt_gettask(CP_TASKID_ROUND) == 0) then
		Say("Hi�n B�n v�n ch�a thi ��u tr�n n�o!", 0)
	else
		Say("Thi ��u d� tuy�n ��i h�i V� l�m m�n ph�i cho ph�p m�i ng��i tham gia nhi�u nh�t"..CP_MAXROUND.."l�n. Hi�n t�i b�n �� tham gia <color=yellow>"..nt_gettask(CP_TASKID_ROUND).."<color> v�ng thi ��u, t�ng �i�m th��ng l�:"..nt_gettask(CP_TASKID_POINT)..", th�ng"..nt_gettask(CP_TASKID_WIN).."tr�n, thua"..nt_gettask(CP_TASKID_LOSE).."tr�n, h�a"..nt_gettask(CP_TASKID_TIE).."tr�n.", 0)
	end
end


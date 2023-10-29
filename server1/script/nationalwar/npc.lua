-- �ڸ����飺����ϵͳ���
-- By: wangbin(2009-5-24)

Include("\\script\\nationalwar\\head.lua")
Include( "\\script\\lib\\say.lua" )
Include("\\script\\item\\tianziyuxi.lua")
IncludeLib("ITEM")
Include("\\script\\lib\\awardtemplet.lua")

function main()
	Say("N�i c�c th��ng th� h�u ch�",
		7,
		"Thi�n T� ��ng c�/nw_enthrone",
		"Thi�n T� ng� ch�/nw_emperororder",
		"Qu�c V��ng chi�u th�/nw_kingorder",
		"L�nh ph�n th��ng/nw_accept",
		"L�ng d�n l� c�n c�n chu�n m�c/nw_comment",
		"Thi�t b�t tr�c th� (s� k�)/nw_history",
		"Ta ch� ��n ch�i/Cancel")
end

-- ���ӵǻ�
function nw_enthrone()
	if (NW_IsEmperor() == 1) then
		Say("L� ��ng c� �� di�n ra r�i, l� n�o b� h� qu�n r�i?")
		return
	end
	local result = NW_GetTask(NW_TASKNO_WARRESULT)
	if (result == 0 and NW_GetEmperorName() == "") then
		Say("V� anh h�ng n�y c� ch� kh� h�n ng��i, nh�ng h�y ��i th�i c� ��.")
	elseif (result == 1 or result == 2) then
		local master = ""
		local side = 0
		if (result == 1) then
			-- ��Ӯ
			_, master = GetCityOwner(CITYIDX_LINAN)
			side = 1
		else
			-- ��Ӯ
			_, master = GetCityOwner(CITYIDX_BIANJING)
			side = 0
		end
		if (GetName() ~= master) then
			Say("���ng kim Thi�n T� kh�ng ph�i ng��i b�nh th��ng ��m ���ng ���c")
		else
			NW_Enthrone(side)
			NW_SetTask(NW_TASKNO_WARRESULT, 100 + result)
		end
	else
		Say("���ng kim Thi�n T� anh minh, ng��i h�y ch�p nh�n s� th�t �i.")
	end
end

-- ������ּ
function nw_emperororder()
	Say("Thi�n T� ng� ch�",
		7,
		"��t qu�c hi�u/nw_emperororder_setnationtitle",
		"Kh�p ch�n m�ng vui/nw_emperororder_congratulate",
		"��i x� thi�n h�/nw_emperororder_absolve",
		"Thi�n T� chi�u th�/nw_emperororder_message",
		"Quy�n ti�n/nw_emperororder_levy",
		"C�m n�i/nw_emperororder_forbidtalkdlg",
		"Ta ch� ��n ch�i/Cancel")
end

-- ����گ��
function nw_kingorder()
	Say("Ng��i ��ng ��u m�t n��c, c� quy�n h�n cao nh�t",
		3,
		"Phong ��i th�n/nw_kingorder_instate",
		"�i�u ch�nh thu� su�t/nw_kingorder_taxdlg",
		"Kh�ng l�m g�./Cancel")
end

-- ��ȡ
function nw_accept()
	Say("Tr�ng s� xu�t tr�n, gi�t ��ch l�p c�ng",
		5,
		"Nh�n l�nh b�i qu�c chi�n/nw_accept_token",
		"Nh�n ph�n th��ng Ho�ng ��/nw_accept_domainring",
		--New emperor award - Modified By DinhHQ - 20120726
		--"Nh�n ph�n th��ng Thi�n T�/nw_accept_empirering",
		"Nh�n ph�n th��ng Thi�n T�/VnEmperorNewAward",
		"Nh�n thi�n t� ng�c t�/nw_accept_empireseal",
		"Ta ch� gh� qua xem/Cancel")
end

-- ��ȡ/��ս����
function nw_accept_token()
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N�i ��y l� n�o kh�ng thu�c khu v�c t�ng kim?")
		return
	end
	tong, master = GetCityOwner(city)
	if (GetTong() ~= tong) then
		Say("Nh�n ng��i kh�ng gi�ng nh� th�n d�n n��c ta, l� n�o ng��i l� gian t� c�a ��ch?")
		return
	end
	if (master ~= GetName() and NW_GetDuty() == NWPOSITION_NONE) then
		Say("Ng��i kh�ng li�n quan kh�ng th� tham d� qu�c gia ��i s�!")
		return
	end
	local free = CalcFreeItemCellCount()
	if (free == 0) then
		Say("H�nh trang kh�ng �� ch� tr�ng, s�p x�p l�i r�i ��n nh�n l�i.")
		return
	end
	local count = 10
	if (free < count) then
		count = free
	end
	local token = TAB_TOKEN[city]
	for i = 1, count do
		local item = AddItem(token[1], token[2], token[3], 1, 0, 0)
		if (item ~= 0) then
			local timeout = GetLocalTime() + SECONDS_ONEDAY
			ITEM_SetExpiredTime2(item, timeout)
			SyncItem(item)
		end
	end
	Say(format("��y l� <color=red>%d<color> qu�c chi�n l�nh b�i. C� th� nh�n th�m n�u mu�n.", count))
end

-- ��ȡ/��ȡ�ۻʽ���
function nw_accept_domainring()
		
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));	
	
	local nWiner = mod(NW_GetTask(NW_TASKNO_WARRESULT), 100);
	local city   = GetCityArea()

	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N�i ��y l� n�o kh�ng thu�c khu v�c t�ng kim?")
		return
	end
	
	if nWiner ~= 1 and nWiner ~= 2 then
		Say("V�n ch�a ��nh �o�t ���c ai l� thi�n t�")
		return
	end

	if nWiner == 1 and city ~= CITYIDX_BIANJING then
		Say("Ph�n th��ng d�nh cho ng��i c� h�ng t�m tr�ng ch� d�nh l�i giang s�n, xin h�y ��n th�nh th� c�a m�nh �� l�nh th��ng!")
		return
	end
	
	if nWiner == 2 and city ~= CITYIDX_LINAN then
		Say("Ph�n th��ng d�nh cho ng��i c� h�ng t�m tr�ng ch� d�nh l�i giang s�n, xin h�y ��n th�nh th� c�a m�nh �� l�nh th��ng!")
		return
	end
	
	tong, master = GetCityOwner(city)
	if (NW_IsEmperor() == 1) then
		Say("Thi�n T� ��ng nh�n <color=red>ph�n th��ng Thi�n T�<color>.")
	elseif (GetTong() ~= tong) then
		Say("Nh�n b� d�ng l�p l� c�a ng��i, h�n l� l� gian t� c�a ��ch?")
	elseif (master ~= GetName()) then
		Say("Ng��i kh�ng li�n quan kh�ng th� tham d� qu�c gia ��i s�!")
	elseif (NW_GetTask(NW_TASKNO_GETDOMAINRING) ~= 0) then
		Say("Qu�c ch� �� nh�n th��ng r�i.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("Chi�n s� c�p b�o, xin m�i b� h� ngh�nh chi�n.")
	else
		local free = FindFreeRoomByWH(2, 3)
		if (free ~= 1) then
			Say("H�nh trang kh�ng �� ch� tr�ng, s�p x�p l�i r�i ��n nh�n l�i.")
			return
		end
		
		local item = AddItem(0,10,7,1,0,0)
		if (item == 0) then
			WriteLog(format("[NW]Failed to give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("C� �i�u g� �� kh�ng �n, b�o v�t t�m th�i kh�ng th� giao cho ng��i ���c.")
		else
			
			if nWeek == 0 then	nWeek = 7;	end
			if nWeek == 1 and	nHour < 21	then	nWeek = 8;	end
			local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
		
			ITEM_SetExpiredTime(item, nExpiredDate, 120000)
			SyncItem(item)
			
			NW_SetTask(NW_TASKNO_GETDOMAINRING, 1)
			WriteLog(format("[NW]Give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("Ph�n th��ng l� <color=red>Phi�n V�<color>, xin m�i qu�c ch� nh�n l�y.")
		end
		
		
	end
end

-- ��ȡ/��ȡ���ӽ���
function nw_accept_empirering()
	--Change emperor ring and horse award - modified By DinhHQ -  20120726
	do return end
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));		
	
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N�i ��y l� n�o kh�ng thu�c khu v�c t�ng kim?")
	elseif (NW_IsEmperor() ~= 1) then
		Say("<color=red>Ph�n th��ng c�a thi�n t�<color> ch� c� th� Thi�n T� m�i nh�n ���c, ng��i l� ai m� d�m m�o danh Thi�n T�!")
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 0) then
		Say("B� h� �� nh�n th��ng r�i.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("Chi�n s� c�p b�o, xin m�i b� h� chu�n b� ngh�nh chi�n.")
	else
		local free = FindFreeRoomByWH(2, 4)
		if (free ~= 1) then
			Say("H�nh trang kh�ng �� ch� tr�ng, s�p x�p l�i r�i ��n nh�n l�i.")
			return
		end
		
		if nWeek == 0 then	nWeek = 7;	end
		if nWeek == 1 and	nHour < 21	then	nWeek = 8;	end
		local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
		
		local itemHorse = AddItem(0,10,7,1,0,0)
		if (itemHorse == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("C� �i�u g� �� kh�ng �n, b�o v�t t�m th�i kh�ng th� giao cho ng��i ���c.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
		ITEM_SetExpiredTime(itemHorse, nExpiredDate, 120000)
		SyncItem(itemHorse)
		
		-- �Ѿ��ɹ���ȡ��������Ʒ
		NW_SetTask(NW_TASKNO_GETEMPIRERING, 1) 
		
		local itemBeijin = AddGoldItem(0,142)
		if (itemBeijin == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddGoldItem(0,142)] to %s", GetName()))
			Say("C� �i�u g� �� kh�ng �n, b�o v�t t�m th�i kh�ng th� giao cho ng��i ���c.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddGoldItem(0,142)] to %s", GetName()))
		ITEM_SetExpiredTime(itemBeijin, nExpiredDate, 120000)
		SyncItem(itemBeijin)
		
		local itemYaDian = AddGoldItem(0,141)
		if (itemYaDian == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddGoldItem(0,141)] to %s", GetName()))
			Say("C� �i�u g� �� kh�ng �n, b�o v�t t�m th�i kh�ng th� giao cho ng��i ���c.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddGoldItem(0,141)] to %s", GetName()))
		ITEM_SetExpiredTime(itemYaDian, nExpiredDate, 120000)
		SyncItem(itemYaDian)
		
		Say("Ph�n th��ng c�a b� h� l� <color=red>V� danh gi�i ch�, v� danh ch� ho�n, phi�n v�<color>.")
	end
end

-- ��ȡ/��ȡ��������
function nw_accept_empireseal()
	
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N�i ��y l� n�o kh�ng thu�c khu v�c t�ng kim?")
	elseif (NW_IsEmperor() ~= 1) then
		Say("Ch� c� Thi�n T� m�i th� mang ���c Thi�n T� ng�c t�, ng��i th�t to gan d�m gi� m�o Thi�n T�!")
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRESEAL) ~= 0) then
		Say("B� h� �� nh�n <color=red>Thi�n T� ng�c t�<color> r�i.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("Chi�n s� c�p b�o, xin m�i b� h� chu�n b� ngh�nh chi�n.")
	else
		local free = CalcFreeItemCellCount()
		if (free == 0) then
			Say("H�nh trang kh�ng �� ch� tr�ng, s�p x�p l�i r�i ��n nh�n l�i.")
			return
		end
		local itemidx = AddItem(6, 1, 2059, 1, 0, 0)
		if (itemidx == 0) then
			WriteLog(format("[NW]Failed to give emperor-seal[Item(6,1,2059,1,0,0)] to %s", GetName()))
			Say("C� �i�u g� �� kh�ng �n, b�o v�t t�m th�i kh�ng th� giao cho ng��i ���c.")
		else
			WriteLog(format("[NW]Give emperor-seal[Item(6,1,2059,1,0,0)] to %s", GetName()))
			tbItemTianZiYuXi:GiveCallBack(itemidx)
			NW_SetTask(NW_TASKNO_GETEMPIRESEAL, 1)
			Say("��y l� Thi�n T� ng�c t�, xin m�i b� h� nh�n l�y.")
		end
	end
end

-- �����Ǹ˳�
function nw_comment()
	Say("Tuy r�ng quy�n th� c�a Thi�n T� cao nh�ng c�ng kh�ng th� xem th��ng l�ng d�n ���c.",
		3,
		"Nh�n x�t ���ng kim Thi�n T�/nw_comment_commit",
		"Xem k�t qu� nh�n x�t/nw_comment_query",
		"Kh�ng c� vi�c g�/Cancel")
end

-- ����ֱ��
function nw_history()
	Say("H�o ki�t tuy nhi�u, nh�ng trong l�ch s� ch� l�u danh, t� c� ch� kim c� m�y ng��i?",
		4,
		"L�ch s� thi�n t�/nw_history_emperor",
		"T�ng qu�c s� k�/nw_history_song",
		"Kim qu�c s� k�/nw_history_jin",
		"Ta ch� ��n t��ng ni�m m�t l�c./Cancel")
end

-- ������ּ/��������
function nw_emperororder_setnationtitle()
	if (NW_IsEmperor() ~= 1) then
		Say("Qu�c hi�u ch� c� ���ng kim Thi�n T� m�i l�p ���c.")
	else
--		local year, mon, day, hour, min, sec, wday = MakeDateTime(7)
--		if (wday == 0 or wday > 2) then

		if 	NW_GetTask(NW_TASKNO_NATIONALTITLE) ~= 0 then
			Say("B�m b� h�, qu�c hi�u �� loan kh�p b�n b� r�i, kh�ng th� s�a ���c n�a.")
		else
			nw_emperororder_inputtitle()
		end
	end
end

-- ������ּ/�������ţ����������
function nw_emperororder_inputtitle()
--	AskClientForString(
--		"nw_oninputnationtitle",
--		"",
--		1,
--		NW_MAXLEN_NATIONTITLE,
--		"�����������ţ�")

	Say(
		"Xin m�i b� h� ch�n qu�c hi�u",
		5,
		format("%s/#nw_oninputnationtitle(\"%s\")", "KimLong", "KimLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "ThanhLong", "ThanhLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "B�chLong", "B�chLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "H�aLong", "H�aLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "H�cLong", "H�cLong")
		)
end

-- ������ּ/�������ţ��ص�����
function nw_oninputnationtitle(title)
	if (NW_IsEmperor() ~= 1) then
		Say("C�c h� d�m gi� m�o ���ng kim Thi�n T�!")
		return
	end
	local len = strlen(title)
	if (len == 0) then
		nw_emperororder_inputtitle()
	elseif (len > NW_MAXLEN_NATIONTITLE) then
		Say("B�m b� h�! Qu�c hi�u n�y qu� d�i r�i, b�ch t�nh kh�ng th� nh� ���c ��u.",
			2,
			"Xin m�i nh�p l�i/nw_emperororder_inputtitle",
			"�� ta suy ngh� th�m/Cancel")
	elseif (NW_CheckText(title) ~= 1) then
		Say("Qu�c hi�u n�y ph�i truy�n mi�ng v� sau, uy danh thi�n h�,t� h�i quy ph�c",
			2,
			"Xin m�i nh�p l�i/nw_emperororder_inputtitle",
			"�� ta suy ngh� th�m/Cancel")
	else
		local emperor = NW_GetEmperorName()
		AddGlobalCountNews(format("[Thay ��i chi�u th�] Thi�n T� <color=red>%s<color> thay ��i qu�c hi�u th�nh \"<color=red>%s<color>\".", emperor, title), 5)
		NW_SetNationTitle(title)
		NW_SetTask(NW_TASKNO_NATIONALTITLE, 1)
		Say("Th�n l�nh ch�.")
	end
end

--������ּ/����ͬ��
function nw_emperororder_congratulate()
	if (NW_IsEmperor() ~= 1) then
		Say("L� nghi ��n ti�p ph�i do Thi�n T� ch� tr�!")
		return
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_CONGRATULATION) + SECONDS_ONEWEEK) then
		Say("B� h�, l� nghi qu� nhi�u s� r�t hao t�i t�n c�a m� kh�ng h�p l�.")
	else
		Say("B�y gi� l� gi� t�t, b� h� mu�n c� h�nh l� nghi?",
			2,
			"Tu�n l�nh!/nw_emperororder_congratulate_inputwords",
			"Kh�ng /Cancel")
	end
end

-- ������ּ/����ͬ�죺�趨�ش�
function nw_emperororder_congratulate_inputwords()
	AskClientForString(
		"nw_emperororder_congratulate_words",
		"",
		1,
		NW_MAXLEN_CONGRATULATIONWORDS,
		"Xin m�i b� h� vi�t l�i ch�c m�ng:")
end

-- ������ּ/����ͬ�죺�趨�ش�
function nw_emperororder_congratulate_words(words)
	if (NW_IsEmperor() ~= 1) then
		Say("C�c h� d�m gi� m�o ���ng kim Thi�n T�!")
		return
	end
	local len = strlen(words)
	if (len == 0) then
		Say("Tai th�n kh�ng ���c t�t l�m, xin m�i b� h� n�i l�i th�m m�t l�n n�a.")
	elseif (len > NW_MAXLEN_CONGRATULATIONWORDS) then
		Say("L�i ch�c d�i qu� s� l�m b�ch t�nh r�t kh� nh�.")
	elseif (NW_CheckText(words) ~= 1) then
		Say("L�i ch�c c� t� kh�ng h�p l� l�m, xin b� h� h�y suy x�t l�i.")
	else
		-- ����30����
		NW_OpenCongratulation(words, 30)
		NW_SetTask(NW_TASKNO_CONGRATULATION, GetCurServerTime())
		AddGlobalCountNews(format("[Kh�p ch�n m�ng vui] s� ���c ph�t t�i k�nh th� gi�i\"<color=red>%s<color>\" ch�c m�ng thi�n t� ��u s� ���c phong th��ng!", words), 10)
		Say("Th�n l�nh ch� v� s� �i thu x�p ngay l�p t�c.")
	end
end

-- ������ּ/��������
function nw_emperororder_absolve()
	if (NW_IsEmperor() ~= 1) then
		if (NW_InEmperorTong() ~= 1 or NW_GetDuty() ~= NWPOSITION_MINISTER) then
			Say("��i x� thi�n h� l� quy�n h�n c�a Thi�n �")
			return
		end
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_ABSOLVE) + SECONDS_ONEWEEK) then
		Say("B� h� t� bi, kh�p th� gian ��u bi�t. Nh�ng lo�i h�nh ng�c n�y kh�ng th� l�ng l�o ���c")
	else
		Say("Th�n l�nh ch�, �� x� ph�m nh�n thi�n h�")
		NW_SetTask(NW_TASKNO_ABSOLVE, time)
		AddGlobalCountNews("[��i x� thi�n h�] T�t c� ph�m nh�n nh�t th�y mi�n t�i, ��u c� th� ��i tho�i v�i lao ��u �� xin v� nh�.", 3)
	end
end

-- ������ּ/ļ��
function nw_emperororder_levy()
	if (NW_IsEmperor() ~= 1) then
		Say("��y l� quy�n h�n thi�n t�")
		return		
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_LEVY) + SECONDS_ONEWEEK) then
		Say("B� h� �� quy�n ti�n m�t l�n, quy�n ti�n th�m l�n n�a s� g�y ai o�i cho d�n")
	else
		NW_SetTask(NW_TASKNO_LEVY, time)
		NW_Levy(10000, 80)
		AddGlobalCountNews("[Thi�n T� quy�n ti�n] Thi�n T� c� ch� t�t c� th�n d�n quy�n ti�n, kh�ng ai ���c ph�p kh�ng ch�.", 3)
	end
end

-- ������ּ/����گ��
function nw_emperororder_message()
	if (NW_IsEmperor() ~= 1) then
		if (NW_InEmperorTong() ~= 1 or NW_GetDuty() ~= NWPOSITION_MINISTER) then
			Say("Chi�u th� thi�n h� l� quy�n h�n c�a Thi�n �")
			return
		end
	end
	local currtime = GetCurServerTime()
	local tasktime = NW_GetTask(NW_TASKNO_MESSAGETIME)
	if (tasktime ~= 0 and currtime <= tasktime + SECONDS_ONEWEEK and
		NW_GetTask(NW_TASKNO_MESSAGECOUNT) >= NW_MAXCOUNT_MESSAGE) then
		Say("B� h� ph�t qu� nhi�u chi�u th�, b�ch t�nh ��u kh�ng mu�n nghe.")
	else
		nw_emperororder_inputmessage()
	end
end

-- ������ּ/����گ�飺��������
function nw_emperororder_inputmessage()
	AskClientForString(
		"nw_emperororder_onmessage",
		"",
		NW_MINLEN_MESSAGE,
		NW_MAXLEN_MESSAGE,
		"B� h� h� chi�u th�:")
end

-- ������ּ/����گ�飺���ݼ��
function nw_emperororder_onmessage(msg)
	local len = strlen(msg)
	if (len < NW_MINLEN_MESSAGE or len > NW_MAXLEN_MESSAGE) then
		Say("Chi�u th� l� ph�t ng�n c�a Thi�n T�, ng�n qu� hay d�i qu� th� kh�ng th� bi�u ��t th�nh �.",
			2,
			"Xin m�i nh�p l�i/nw_emperororder_inputmessage",
			"�� ta suy ngh� l�i/Cancel")
	elseif (NW_CheckText(msg) ~= 1) then
		Say("Chi�u th� c� m�t s� t� kh�ng �n, xin b� h� h�y suy x�t l�i.",
			2,
			"Xin m�i nh�p l�i/nw_emperororder_inputmessage",
			"�� ta suy ngh� l�i/Cancel")
	else
		local currtime = GetCurServerTime()
		local tasktime = NW_GetTask(NW_TASKNO_MESSAGETIME)
		local count = 1
		if (tasktime == 0 or currtime > tasktime + SECONDS_ONEWEEK) then
			NW_SetTask(NW_TASKNO_MESSAGETIME, currtime)
			NW_SetTask(NW_TASKNO_MESSAGECOUNT, count)
		else
			count = NW_GetTask(NW_TASKNO_MESSAGECOUNT) + 1
			NW_SetTask(NW_TASKNO_MESSAGECOUNT, count)
		end
		AddGlobalCountNews(format("[Thi�n T� chi�u th�] <color=red>%s<color>", msg), 3)
		Say(format("Th�n �� nh� r�i, tu�n n�y b� h� c�n c� th� g�i th�m <color=red>%d<color> l�n", NW_MAXCOUNT_MESSAGE - count))
	end
end

-- ������ּ/����
function nw_emperororder_forbidtalkdlg()
	if (NW_IsEmperor() ~= 1) then
		Say("C�c h� d�m gi� m�o ���ng kim Thi�n T�!")
		return
	end
	local tasktime = NW_GetTask(NW_TASKNO_FORBIDCHATTIME)
	local currtime = GetCurServerTime()
	if (tasktime ~= 0 and currtime < tasktime + SECONDS_ONEDAY) then
		Say("B� h� v�n c�n �ang gi�n, xin m�i ��i m�i vi�c ngu�i �i ��.")
	else
		Say("M�c d� b� h� c� th� c�m n�i m�t ng��i, nh�ng l�ng ng��i c� th� lu�n �o�n. Xin b� h� h�y th�n tr�ng khi h�nh s�",
			2,
			"Ta �� quy�t ��nh r�i/nw_emperororder_forbidtalk",
			"�� ta suy ngh� l�i/Cancel")
	end
end

-- ������ּ/���ԣ����������
function nw_emperororder_forbidtalk()
	AskClientForString(
		"nw_emperororder_forbidtalk_input",
		"",
		1,
		32,
		"Xin m�i nh�p t�n c�n c�m n�i:")
end

-- ������ּ/���ԣ������������
function nw_emperororder_forbidtalk_input(name)
	NW_ForbidChat(name, 30)
	local currtime = GetCurServerTime()
	NW_SetTask(NW_TASKNO_FORBIDCHATTIME, currtime)
	AddGlobalCountNews(format("[Chi�u th� thi�n h�]\"<color=red>%s<color>\"Ch�c gi�n Thi�n T�, c�m n�i n�a gi� th� uy.", name), 3)
	Say(format("Th�n l�nh ch�: C�m n�i <color=red>%s<color> trong v�ng n�a gi�.", name))
end

-- �����Ǹ˳�/���鵱������
function nw_comment_commit()
	Say("C�ng ��o t� c� t�i m�i ng��i, Thi�n T� tuy quy�n cao uy nghi�m nh�ng c�ng kh�ng th� t� l�a d�i b�n th�n.",
		3,
		"T�n d��ng Thi�n T�/nw_comment_celebratedlg",
		"T� c�o Thi�n T�/nw_comment_criticizedlg",
		"Kh�ng c� vi�c g�/Cancel")
end

-- �����Ǹ˳�/��ѯ������
function nw_comment_query()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("Hi�n t�i v�n ch�a c� thi�n t�, b�ch t�nh r�t ch� mong m�t minh qu�n th�ng nh�t thi�n h�")
		return
	end
	local goodness, badness = NW_GetRemark()
	local value = floor(goodness - badness)
	local title = ""
	if (value > 3000) then
		title = "Th�nh Qu�n"
	elseif (value >= 1001) then
		title = "Minh qu�n"
	elseif (value >= 101) then
		title = "H�u v�"
	elseif (value >= -100) then
		title = "Thanh t�nh"
	elseif (value >= -1000) then
		title = "V� v�"
	elseif (value >= -3000) then
		title = "Dung qu�n"
	else
		title = "H�n qu�n"
	end
	Say(format("���ng kim Thi�n T� l� <color=yellow>%s<color>, thi�n �c l� <color=yellow>%d<color>, v� ph�a <color=yellow>%s<color>.", emperor, value, title))
end

-- �����Ǹ˳�/���鵱������/�������ӣ��������
function nw_comment_celebratedlg()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("Hi�n t�i v�n ch�a c� thi�n t�, b�ch t�nh r�t ch� mong m�t minh qu�n th�ng nh�t thi�n h�")
		return
	end
	GiveItemUI(
		"T�n d��ng Thi�n T�",
		"���ng kim Thi�n T� anh minh, th��ng thi�n l�nh �� t�n d��ng",
		"nw_comment_celebrate",
		"Cancel")
end

-- �����Ǹ˳�/���鵱������/��������
function nw_comment_celebrate(count)
	local total_count = 0
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		local genre, detail, particular = GetItemProp(item)
		if (genre ~= 6 or detail ~= 1 or particular ~= 197) then
			Say("Ch� c� th� d�ng th��ng thi�n l�nh �� t�n d��ng Thi�n T�")
			return
		else
			total_count = total_count + GetItemStackCount(item)
		end
	end
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		RemoveItemByIndex(item)
	end
	NW_RemarkEmperor(total_count)
	nw_comment_query()
end

-- �����Ǹ˳�/���鵱������/�������ӣ��������
function nw_comment_criticizedlg()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("Hi�n t�i v�n ch�a c� thi�n t�, b�ch t�nh r�t ch� mong m�t minh qu�n th�ng nh�t thi�n h�")
		return
	end
	GiveItemUI(
		"T� c�o Thi�n T�",
		"���ng kim thi�n t� v� ��c, ph�t �c l�nh �� t� c�o",
		"nw_comment_criticize",
		"Cancel")
end

-- �����Ǹ˳�/���鵱������/��������
function nw_comment_criticize(count)
	local total_count = 0
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		local genre, detail, particular = GetItemProp(item)
		if (genre ~= 6 or detail ~= 1 or particular ~= 198) then
			Say("Ch� c� th� d�ng ph�t �c l�nh t� c�o Thi�n T�")
			return
		else
			total_count = total_count + GetItemStackCount(item)
		end
	end
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		RemoveItemByIndex(item)
	end
	NW_RemarkEmperor(-total_count)
	nw_comment_query()
end

tbHistoryScoreTitle = 
{
    [1] = {nValue = -3000, strTitle = "H�n qu�n"},
    [2] = {nValue = -1001, strTitle = "Dung qu�n"},
    [3] = {nValue = -101, strTitle = "V� v�"},
    [4] = {nValue = 100, strTitle = "Thanh t�nh"},
    [5] = {nValue = 1000, strTitle = "H�u v�"},
    [6] = {nValue = 3000, strTitle = "Minh qu�n"},
    [7] = {nValue = 3000, strTitle = "Th�nh Qu�n"},
}

tbHistoryCapital = 
{
    [0] = "Bi�n Kinh",
    [1] = "L�m An",
}

function history_page_gen(tb_pageinfo, str_parameter)
    local strContent;
    local tbOption = {"R�i kh�i/Cancel",};
    local tbContent = {};
    local tbTianzi = {}
	
	for i = tb_pageinfo.from, tb_pageinfo.to do
	    local strGeneration;
	    tbTianzi.szEmperor, _, tbTianzi.szTitle, tbTianzi.szTong, tbTianzi.nBeginTime, tbTianzi.nSide, tbTianzi.nScore, tbTianzi.nEndTime = NW_EmperorHistory(tb_pageinfo.total - i + 1, str_parameter);
	    local strEmperor;
	    local strBeginTime;
	    local strEndTime;
	    local strTitle;
	    local strTong;
	    local strScore;
	    local strCapital;
	    
	    if (tbTianzi.nEndTime == 0) then
	        strGeneration = "���ng kim th�nh th��ng";
	    else
	        strGeneration = format("Thi�n T� ��i th� <color=red>%d<color>", tb_pageinfo.total - i + 1);
	    end
	    
	    if(tbTianzi.szEmperor == nil or tbTianzi.szEmperor == "") then
            strEmperor = "V� h� ";
	        strTitle = "V� h� ";
	        strBeginTime = "<color=yellow>V�<color>";
	        strEndTime = "<color=yellow>V�<color>";
	        strTong = "V� h� ";
	        strScore = "V� h� "
	        strCapital = "V� h� "
	    else
	        strEmperor = tbTianzi.szEmperor;
	        strTitle = tbTianzi.szTitle;
	        strBeginTime = format("<color=green>%d<color> n�m <color=green>%02d<color> th�ng <color=green>%02d<color> ng�y", floor(tbTianzi.nBeginTime/10000), floor(mod(tbTianzi.nBeginTime,10000)/100), mod(tbTianzi.nBeginTime,100));
	        if (tbTianzi.nEndTime == 0) then
	            strEndTime = "<color=yellow>V�<color>";
	        else
	            strEndTime = format("<color=green>%d<color> n�m <color=green>%02d<color> th�ng <color=green>%02d<color> ng�y", floor(tbTianzi.nEndTime/10000), floor(mod(tbTianzi.nEndTime,10000)/100), mod(tbTianzi.nEndTime,100));
	        end
	        
	        strTong = tbTianzi.szTong;
	        for j = 1, getn(tbHistoryScoreTitle) do
                if ((strScore == nil or strScore == "") and tbTianzi.nScore <= tbHistoryScoreTitle[j].nValue) then
                    strScore = tbHistoryScoreTitle[j].strTitle;
                end
            end
            if (strScore == nil or strScore == "") then
                strScore = tbHistoryScoreTitle[getn(tbHistoryScoreTitle)].strTitle;
            end
            strCapital = tbHistoryCapital[tbTianzi.nSide];
	    end
	    tbContent[getn(tbContent) + 1] = 
        {
            format("%s: <color=yellow>%s<color>", strGeneration, strEmperor),
        }
        tbContent[getn(tbContent) + 1] = 
        {
			format("Qu�c hi�u: <color=yellow>%s<color>", strTitle),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("��ng quang: %s", strBeginTime),
        }   
        tbContent[getn(tbContent) + 1] = 
        {
			format("Bang h�i: <color=yellow>%s<color>", strTong),
        }      
        tbContent[getn(tbContent) + 1] = 
        {
            format("Tho�i v�: %s", strEndTime),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("Ho�ng th�nh: <color=yellow>%s<color>", strCapital),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("Ng��i ��i ��nh gi�: <color=yellow>%s<color>", strScore),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            "--------------------------------------------",
        }
	end
   
    local var_width = {50}
    local var_align = 1
	
	strContent = maketable(tbContent, var_width, var_align);
	
    return strContent, tbOption;
end
-- ����ֱ��/����ʷ��
function nw_history_emperor()
	saypage(NW_EmperorHistoryCount(), 3, "history_page_gen", -1);
end

-- ����ֱ��/�ι�ʷ��
function nw_history_song()
	saypage(NW_EmperorHistoryCount(1), 3, "history_page_gen", 1);
end

-- ����ֱ��/���ʷ��
function nw_history_jin()
	saypage(NW_EmperorHistoryCount(0), 3, "history_page_gen", 0);
end

-- ����گ��/�ַ��
function nw_kingorder_instate()
	Say("Xin h�y b� v� mi�n nhi�m ��i th�n t�i giao di�n bang h�i")
end

-- ����گ��/����˰�ʶԻ�
function nw_kingorder_taxdlg()
	city = GetCityArea()
	tong, master = GetCityOwner(city)
	if ((city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) or master ~= GetName()) then
		Say("��t ��nh thu� su�t kinh th�nh l� ��c quy�n c�a qu�c ch�.")
		return
	end
	Say("B� h� c� mu�n ��t thu� su�t m�i kh�ng?",
		2,
		"Tu�n l�nh!/nw_kingorder_tax",
		"Kh�ng /Cancel")
end

-- ����گ��/����˰�ʶԻ�
function nw_kingorder_tax()
	city = GetCityArea()
	OpenCityManageUI(city)
end

function VnEmperorNewAward()	
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));		
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N�i ��y l� n�o kh�ng thu�c khu v�c t�ng kim?")
		return
	elseif (NW_IsEmperor() ~= 1) then
		Say("<color=red>Ph�n th��ng c�a thi�n t�<color> ch� c� th� Thi�n T� m�i nh�n ���c, ng��i l� ai m� d�m m�o danh Thi�n T�!")
		return
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 0) then
		Say("B� h� �� nh�n th��ng r�i.")
		return
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("Chi�n s� c�p b�o, xin m�i b� h� chu�n b� ngh�nh chi�n.")
		return				
	end	
	if CountFreeRoomByWH(3, 3) < 1 then
		Talk(1, "", "�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng 1 3x3 h�nh trang")
		return
	end
	NW_SetTask(NW_TASKNO_GETEMPIRERING, 1)
	if NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 1 then
		return
	end
	VnEmperorGiveAward()
end

function VnEmperorGiveAward()
	local tbNewAward = {
		["VoDanhGioiChi"] = {
			{tbProp={0,3621},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3622},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3623},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3624},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3625},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3626},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3627},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3628},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3629},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3630},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3631},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3632},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3633},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3634},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3635},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
		},
		["VoDanhChiHoan"] = {
			{tbProp={0,3636},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3637},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3638},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3639},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3640},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3641},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3642},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3643},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3644},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3645},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3646},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3647},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3648},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3649},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3650},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
		},
	}
	local tbHorseAward = {szName="Phong V�n Chi�n M�",tbProp={0,10,20,1,0,0},nCount=1,nExpiredTime=10080, nBindState = -2}
	local nRand1 = random(1, 15)
	local nRand2 = random(1, 15)
	local tbFinalAward = {
		[1] = tbNewAward["VoDanhGioiChi"][nRand1],
		[2] = tbNewAward["VoDanhChiHoan"][nRand2],
		[3] = tbHorseAward,
	}
	tbAwardTemplet:Give(tbFinalAward, 1, {"ThienTu","NhanPhanThuongThienTu"})
end
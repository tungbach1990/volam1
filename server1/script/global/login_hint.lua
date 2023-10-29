Include("\\script\\lib\\common.lua")
Include("\\script\\global\\rename_head.lua")

--�����
EVENTS_TB = {
--	{
--		--��ʾ�����
--		ndate = {051101, 051131},	--��ֹ���ڣ���ѡ
--		ntime = {2000, 2359},		--��ֹʱ�䣬��ѡ
--		level = {1, 200},			--��ֹ���𣬿�ѡ
--		taskequal = {taskid, taskvalue},	--���������ȣ���ѡ
--		tasknot = {taskid, taskvalue},		--����������ȣ���ѡ
--		checkfunc = func			--��⺯������ѡ����������nil��ʾ�����������򴥷�
--		
--		--�����
--		name = "ĳĳ�",			--����ƣ�����
--		describe = "��˵������",	--�˵����Ҳ������һ�����������ַ�������ѡ
--		detail =
--[[�����������д�ܶ����֣���ϸ������Ļ��
--���������ŵ���ʽ�������ɻ��С�
--����Ҳ������һ�����������ַ���]],	--����飬��ѡ \___����ֻ��ѡ��һ
--		callback = nil,				--�ص���������ѡ /
--		link = nil,					--Describe�Ի�link��Ϣ����ѡ��ʹ��detailʱ��Ч��
--	},
	{
		ndate = {070414,070424},
		name = "M�ng 3 th�ng 3",
		describe = "T� ng�y <color=yellow>14/4/2007<color> ��n <color=yellow>24/4/2007<color>, trong th�i gian ho�t ��ng, t�t c� ng��i ch�i trong qu� tr�nh ��nh qu�i luy�n c�ng s� c� c� h�i nh�t ���c <color=yellow>T�i h�ng h�a<color>. Mang t�i h�ng h�a v� ng�n l��ng ��n NPC B�n h�ng rong t�i c�c ��i th�nh th� �� ��i l�y <color=yellow>Bao ��ng nguy�n li�u<color>.",
	},
	{	--3����ǰ�����������
		level = {1, 3},
		tasknot = {1014, 2},
		name = "Nhi�m v� s� nh�p ",
		describe = "Long Ng� cung c�p nhi�m v� S� nh�p",
		callback = Uworld1000_word,
	},
	{	--����������������
		level = {80, 119},
		name = "V� l�m li�n ��u, v� l�m li�n ��u 'Ki�t xu�t'",
		describe = "B�n c� th� ��n g�p Quan vi�n b�o danh tham gia li�n ��u V� l�m.",
		detail =
[[V� l�m t� v� �ang trong giai �o�n chu�n b�. ��ng c�p c�a b�n c� th� tham gia <color=yellow>V� L�m T�n T� Li�n Tr�i<color>.
V� tr� c�a S� gi� li�n ��u t�n t� l�: <color=yellow>Bi�n Kinh (222, 191)<color>, <color=yellow>L�m An (182, 204)<color>.]],
	},
	{	--�������������߼�
		level = {120, 200},
		name = "V� l�m li�n ��u, v� l�m li�n ��u 'Ki�t xu�t'",
		describe = "B�n c� th� ��n g�p Quan vi�n b�o danh tham gia li�n ��u V� l�m.",
		detail =
[[V� l�m t� v� �ang trong giai �o�n chu�n b�. ��ng c�p c�a b�n c� th� tham gia <color=yellow>V� L�m Li�n Tr�i<color>.
V� tr� c�a S� gi� li�n ��u l�: <color=yellow>��i L� (200, 197)<color>, <color=yellow>D��ng Ch�u (219, 190)<color>.]],
	},
	{	--�Ի�֮ҹ
		name = "��m Huy Ho�ng",
		describe = "V� L�m Minh ch� ��c C� Ki�m  m� ho�t ��ng mang t�n '��m Huy Ho�ng' v�o m�i t�i 7 gi� 30 ph�t. ",
		detail =
[[Tr��c m�t l� th�i gian m�a thu�n gi� h�a. �� ��p t� th�nh t�nh c�a c�c nh�n s� v� l�m tr�n giang h�, V� l�m minh ch� truy�n nh�n m� ra ho�t ��ng '��m Huy Ho�ng'. Ho�t ��ng b�t ��u v�o 19h30 m�i t�i. M�i ��t ho�t ��ng di�n ra trong 30 ph�t. N�i dung c� th� c� th� ��n t�m L� Quan �� t�m hi�u.]],
	},

	-- {
	-- 	name = "<#>��ɫ����",
	-- 	describe = "<#>�����ڲ��������У����Ľ�ɫ����������ҵĽ�ɫ��������������������ϵͳ�Ѱ����Զ��������������Ҫ���¸ı��ɫ���Ļ����뵽�����ִ�������ƹ�Ա��ѡ���޸Ľ�ɫ������ֻ�ܸ���һ�ν�ɫ������������ϸ�Ķ���Ӧ˵����",
	-- },
	-- {
	-- 	name = "<#>������",
	-- 	describe = "�����ڲ��������У������ڵİ�ᣬ����������������������������������ϵͳ�Ѱ������ڵİ���Զ����������������Ҫ���¸ı������Ļ����뵽�����ִ�������ƹ�Ա��ѡ���޸İ����������ֻ�ܸ���һ�ΰ��������������ϸ�Ķ���Ӧ˵����",
	-- },
}

EVENT_HINT_LINK = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy060\\enemy060_st.spr>C�c ho�t ��ng g�n ��y ���c s�p x�p:<link>"
EVENT_HINT_TIMES = 3	--ÿ��������ʾ����

--����нϸ��ӵĻ��Ҫ�Զ���һЩ��������������Include����ʹ�ã�
--	if EVENTS_TB then EVENTS_TB[getn(EVENTS_TB)+1] = {����} end
--�ķ�ʽ���
--=================================================================
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
--=================================================================

--��½ʱ���õĺ���
function event_hint_login(bExchangeIn)
	-- ��������ľͲ�������ʾ��
	if (bExchangeIn == 1) then
		return
	end
	local n_date = tonumber(GetLocalDate("%y%m%d"));
	local n_time = tonumber(GetLocalDate("%H%M"));
	local n_times;
	if (GetTask(2308) ~= n_date) then	--���ǽ����½��
		SetTask(2308, n_date);
		SetTask(2309, 0);
		n_times = 0;
	else
		n_times = GetTask(2309);
	end
	if (n_times >= EVENT_HINT_TIMES) then	--�Ѵﵽ��ʾ������������ʾ
		return
	end
	
	local n_level = GetLevel();
	local tb = {};
	for i = 1, getn(EVENTS_TB) do
		if event_hint_check(EVENTS_TB[i], n_date, n_time, n_level) then	--��������
			tb[getn(tb)+1] = i;
		end
	end
	if (getn(tb) == 1) then	--ֻ��һ�����ֱ����ʾ����
		event_show_detail(tb, 1);
	elseif (getn(tb) > 0) then	--����
		event_show_all(tb);
	end
	
	SetTask(2309, n_times + 1)
	
	bingfu_hint()	--������������ʱ��ӵĸ����ȼ�������ʾ�������ڹ淶��ʹ��
end

--���ĳ����Ƿ���Ҫ֪ͨ��ǰ���
function event_hint_check(tb_event, n_date, n_time, n_level)
	local tb = tb_event.ndate;
	if (tb) then	--�޶�����
		if (n_date < tb[1] or n_date > tb[2]) then	--���ڲ���
			return
		end			
	end
	tb = tb_event.ntime;
	if (tb) then	--�޶�ʱ��
		if (n_time < tb[1] or n_time > tb[2]) then	--���ڲ���
			return
		end			
	end
	tb = tb_event.level;
	if (tb) then	--�޶�����
		if (n_level < tb[1] or n_level > tb[2]) then	--���𲻷�
			return
		end			
	end
	tb = tb_event.taskequal
	if (tb) then	--����������
		if (GetTask(tb[1]) ~= tb[2]) then
			return
		end			
	end
	tb = tb_event.tasknot
	if (tb) then	--�����������
		if (GetTask(tb[1]) == tb[2]) then
			return
		end			
	end
	local func = tb_event.checkfunc
	if (func) then	--�����ж�
		if (not func()) then
			return
		end			
	end
	return 1
end

--��ʾ���л
function event_show_all(tb)
	local str = "<enter>";
	local tb_option = {};
	for i = 1, getn(tb) do
		local tb_event = EVENTS_TB[tb[i]];
		str = str .. "<color=red>" .. tb_event.name .. "<color><enter>";
		if (tb_event.describe) then
			local str_des
			if (type(tb_event.describe) == "function") then
				str_des = tb_event.describe()
			else
				str_des = tostring(tb_event.describe)
			end
			str = str .. "  " .. str_des .. "<color><enter>";
		end
		if (tb_event.detail or tb_event.callback) then
			tb_option[getn(tb_option)+1] = tb_event.name.."Chi ti�t/#event_show_detail({"..join(tb).."},"..i..")";
		end
	end
	tb_option[getn(tb_option)+1] = "H�m nay kh�i nh�c nh� ta/event_hint_stop";
	tb_option[getn(tb_option)+1] = "Ta bi�t r�i!/no";
	Describe(EVENT_HINT_LINK..str, getn(tb_option), tb_option);
end

--��ʾĳһָ������飨ȫ������ǰ�ڼ�����
function event_show_detail(tb, n)
	local tb_event = EVENTS_TB[tb[n]];
	if (tb_event.callback) then
		tb_event.callback();
	else
		local str = "<enter><color=red>"..tb_event.name.."<color><enter>"
		local tb_option = {};
		if (getn(tb) > 1) then
			tb_option[1] = "ta c�n mu�n  t�m hi�u c�c ho�t ��ng kh�c/#event_show_all({"..join(tb).."})";
		end
		tb_option[getn(tb_option)+1] = "H�m nay kh�i nh�c nh� ta/event_hint_stop";
		tb_option[getn(tb_option)+1] = "Ta bi�t r�i!/no";
		if (tb_event.link) then
			str = tb_event.link .. str
		else
			str = EVENT_HINT_LINK .. str
		end
		if (tb_event.detail) then
			if (type(tb_event.detail) == "function") then
				str = str .. tb_event.detail()
			else
				str = str .. tb_event.detail
			end
		elseif (tb_event.describe) then
			if (type(tb_event.describe) == "function") then
				str = str .. tb_event.describe()
			else
				str = str .. tostring(tb_event.describe)
			end
		end
		Describe(str, getn(tb_option), tb_option);
	end
end

function event_hint_stop()
	SetTask(2309, EVENT_HINT_TIMES);
end

function bingfu_hint()
	-- ��ɫ������ʾ
	local msg = ""
	if (check_renamerole() == 1) then
		msg = msg .. "<#>Trong qu� tr�nh s�t nh�p m�y ch�, h� th�ng �� t� ��ng ��i t�n nh�n v�t cho b�n. H�y ��n NPC S� gi� t�i c�c t�n th� th�n �� <color=red>��i l�i t�n nh�n v�t<color> b�n mu�n."
	end
	-- ��������ʾ
	if (check_renametong() == 1) then
		msg = msg .. "<#>Trong qu� tr�nh s�t nh�p m�y ch�, h� th�ng �� t� ��ng ��i t�n bang h�i c�a b�n. H�y ��n NPC S� gi� t�i c�c t�n th� th�n �� <color=red>��i l�i t�n bang h�i<color> b�n mu�n."
	end
	if (check_castellan_remedy() == 1) then
		msg = msg .. "<#>Trong qu� tr�nh s�t nh�p m�y ch�, h� th�ng �� t� ��ng t��c �i quy�n th�ng tr� th�nh th� c�a bang h�i b�n. H�y ��n NPC S� gi� t�i c�c t�n th� th�n �� <color=red>Nh�n l�i b�i th��ng t��ng �ng<color>. Ch�c n�ng n�y ch� c� hi�u l�c trong v�ng <color=red>1 th�ng k� t� khi s�t nh�p m�y ch�<color>."
	end
	
	if (msg ~= "") then
		Say(msg, 1, "<#> Bi�t r�i!/cancel")
	end
end

if login_add then login_add(event_hint_login, 0) end


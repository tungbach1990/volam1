Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function wlls_get_winrate()
	local n_total	= GetTask(WLLS_TASKID_TOTAL)
	if (n_total > 0) then
		return floor(GetTask(WLLS_TASKID_WIN) / n_total * 100)
	else
		return 0
	end
end

function wlls_get_total()
	local n_total	= GetTask(WLLS_TASKID_TOTAL)
	if (n_total > 255) then
		return 255
	else
		return n_total
	end
end

WLLS_REG_TABLE	= {
	-- ���ƣ�	��ȡ������				��ʾ��																			��λ)
	{"gi�i t�nh",	GetSex,					{"Nam", "N� "},																	""},
	{"m�n ph�i",	GetLastFactionNumber,	{"Thi�u L�m", "Thi�n V��ng", "���ng M�n", "Ng� ��c", "Nga Mi", "Th�y Y�n", "C�i Bang", "Thi�n Nh�n", "V� �ang", "C�n L�n"},""},
	{"��ng c�p",	GetLevel,				{{80,99}, {100,119}, {120,129}, {130,139}, {140,149}, {150,nil}},	"c�p"},
	{"tham gia thi ��u",	wlls_get_total,			{{nil,9}, {10,48}, {49,99}, {100,200}, {200,nil}},								"tr�n"},
	{"t� l� th�ng",	wlls_get_winrate,		{{nil,29}, {30,49}, {50,70}, {70,90}, {90,nil}},								"%"},
}

function main()
	local n_ntype	= GetGlbValue(GLB_WLLS_NEXT)
	if (WLLS_TAB[n_ntype].max_member <= 1) then
		Say("Hi�n v� l�m t� v� theo h�nh th�c ��n ��u. Ta kh�ng th� gi�p ng��i r�i!", 0)
		return
	end
	local n_lid = LG_GetLeagueObj(WLLS_REG_LGTYPE, GetName())
	local tb_option	= {}
	tb_option[getn(tb_option)+1]	= "Ta mu�n ki�m tra/wlls_reg_query_menu"
	if FALSE(n_lid) then
		tb_option[getn(tb_option)+1]	= "Ta mu�n ��ng k� /wlls_reg_me"
	else
		tb_option[getn(tb_option)+1]	= "Tin t�c c�a ta/wlls_view_me"
		tb_option[getn(tb_option)+1]	= "Ta mu�n x�a c�c th�ng tin �� nh�p/wlls_want2out"
	end
	tb_option[getn(tb_option)+1]	= "K�t th�c ��i tho�i/OnCancel"
	Say("S� gi� li�n ��u: V� l�m li�n ��u ch�nh th�c b�t ��u" .. WLLS_TAB[n_ntype].name .. ", C� th� g�p ta �� t� hi�u v� c�c th�ng tin c�a nh�ng tuy�n th� kh�c ho�c �ang k� c�c th�ng tin c�a m�nh v� t� ��i", getn(tb_option), tb_option)
end

-- �Ǽǳ�Ա
function wlls_reg_me()
	-- ��ս��
	local n_lid = LG_CreateLeagueObj()
	LG_SetLeagueInfo(n_lid, WLLS_REG_LGTYPE, GetName())
	LG_ApplyAddLeague(n_lid, "", "") 
	LG_FreeLeagueObj(n_lid)

	-- ���������������
	wlls_save_myinfo()

	Talk(1, "wlls_view_me", "   ��ng k� th�nh c�ng! C� th� thay ��i c�c th�ng tin")
end

-- �鿴�Լ�
function wlls_view_me()
	-- ��� �յǼ�/�ո��� �������д˺��� �п�����ʾ�쳣
	Describe(wlls_get_infostr(GetName()), 3,
		"Thay ��i tin t�c c� b�n c�a ta/wlls_reg_refresh", "S�a tin t�c ��i h�u k� v�ng/#wlls_edit_need('')", "Tr� l�i")
end

-- �����Լ��Ļ�����Ϣ
function wlls_reg_refresh()
	wlls_save_myinfo()
	Talk(1, "wlls_view_me", strfill_right("Thay ��i th�nh c�ng!", 30))
end

-- �����������Ϣ����
function wlls_save_myinfo()
	local tb_info = {}
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_info[n_idx]	= tb_fmt[2]()
		if (type(tb_fmt[3][1]) == "string") then	-- ö��+1
			tb_info[n_idx]	= tb_info[n_idx] + 1
		end
	end
	local n_data	= wlls_reg_savedata(tb_info)
	LG_ApplySetLeagueTask(WLLS_REG_LGTYPE, GetName(), 1, n_data)
end

-- �鿴���༭����������Ϣ
function wlls_edit_need(str, b_query)
	if (str == "") then	-- �մ�
		SetTaskTemp(WLLS_TEMPTASK, LG_GetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2))
		if b_query then
			str	= "Xin thay ��i c�c th�ng tin m�c ��nh c�a ��i h�u "
		else
			str	= "B�n hi�n gi� �� c� th� thay ��i c�c th�ng tin ��i h�u"
		end
	end
	
	str	= "S� gi� li�n ��u:\n#" .. str
	str	= str .. "\nHi�n �ang thi�t l�p:\n" .. wlls_get_needinfo(GetTaskTemp(WLLS_TEMPTASK))
	if b_query then
		str	= str .. "\n\nc� mu�n thay ��i kh�ng? Thay ��i xong l� c� th� ki�m tra."
	else
		str	= str .. "\n\nc� mu�n thay ��i kh�ng? Thay ��i xong nh� 'L�u thay ��i'."
	end
	
	local tb_option = {}
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_option[n_idx]	= "Thay ��i" .. tb_fmt[1] .. "/#wlls_want2modify_need(" .. n_idx .. "," .. tostring(b_query) .. ")"
	end
	
	if b_query then
		tb_option[getn(tb_option)+1] = "Ki�m tra ngay/wlls_reg_query_begin"
		tb_option[getn(tb_option)+1] = "Tr� l�i/wlls_reg_query_menu"
	else
		tb_option[getn(tb_option)+1] = "L�u thay ��i/#wlls_save_need()"
		tb_option[getn(tb_option)+1] = "L�u v� ki�m tra/#wlls_save_need(1)"
		tb_option[getn(tb_option)+1] = "H�y b� thay ��i/wlls_view_me"
	end
	Say(str, getn(tb_option), tb_option)
end

-- ׼���޸�ĳ������ֵ
function wlls_want2modify_need(n_idx, b_query)
	local tb_fmt	= WLLS_REG_TABLE[n_idx]
	local tb_info	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	local n_value	= tb_info[n_idx]
	local tb_option	= {}
	for i = 0, getn(tb_fmt[3]) do
		if (n_value ~= i) then
			tb_option[getn(tb_option)+1]	= wlls_get_oneneed(n_idx, i).."/#wlls_modify_need("..n_idx..","..i.."," .. tostring(b_query) .. ")"
		end
	end
	tb_option[getn(tb_option)+1]	= "Kh�ng thay ��i/#wlls_edit_need ('C� mu�n thay ��i thi�t l�p kh�c kh�ng?'," .. tostring(b_query) .. ")"
	Say("S� gi� li�n ��u: K� v�ng l�c tr��c <color=yellow>" .. tb_fmt[1] .. "<color>thi�t l�p l�:<color=yellow>" ..
		wlls_get_oneneed(n_idx, n_value) .. "<color>\nxin ch�n ph�m vi m�i:", getn(tb_option), tb_option)
end

-- Ҫע����Ա
function wlls_want2out()
	Say("S� gi� li�n ��u: Sau khi x�a, t�t c� c�c tuy�n th� kh�c ��u s� kh�ng th� xem ���c c�c tin t�c! Quy�t ��nh k� ch�a?", 2, "Ta quy�t ��nh x�a!/wlls_doout", "Th�i sau h�ng t�nh!/OnCancel")
end

-- ע����Ա
function wlls_doout()
	LG_ApplyRemoveLeague(WLLS_REG_LGTYPE, GetName())
	Talk(1, "main", strfill_right("X�a th�nh c�ng", 30))
end

-- ��ѯ�˵�
function wlls_reg_query_menu()
	local tb_option = {}
	tb_option[getn(tb_option)+1]	= "T�m hi�u theo [t�n]/wlls_reg_query_name"
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		tb_option[getn(tb_option)+1]	= "Theo [" .. tb_fmt[1] .. "] /#wlls_reg_query_single(" .. n_idx .. ")"
	end
	tb_option[getn(tb_option)+1] = "T�m hi�u cao c�p/#wlls_edit_need('',1)"
	tb_option[getn(tb_option)+1] = "Tr� l�i"
	Say("S� gi� li�n ��u: B�n c� th� c�n c� v�o c�c lo�i h�nh kh�c nhau �� t�m hi�u tuy�n th�, bao g�m gi�i t�nh, m�n ph�i, ��ng c�p.", getn(tb_option), tb_option)
end

-- �鿴���ѣ����룩
function wlls_reg_query_name()
	AskClientForString("wlls_reg_query_name_do", "", 1, 16, "Nh�p t�n th�nh vi�n mu�n t�m hi�u")
end

-- �鿴���ѣ���ѯ��
function wlls_reg_query_name_do(str_name)
	Describe(wlls_get_infostr(str_name), 1, "Tr� l�i/wlls_reg_query_menu", "Tr� l�i")
end

-- ׼�������ѯ
function wlls_reg_query_single(n_idx)
	local tb_fmt	= WLLS_REG_TABLE[n_idx]
	local tb_option	= {}
	for i = 1, getn(tb_fmt[3]) do
		tb_option[getn(tb_option)+1]	= wlls_get_oneneed(n_idx, i).."/#wlls_reg_query_single_do("..n_idx..","..i..")"
	end
	tb_option[getn(tb_option)+1]	= "Tr� l�i/wlls_reg_query_menu"
	Say("S� gi� li�n ��u: Hi�n t�i theo th� t�<color=yellow>"..tb_fmt[1].."<color> t�m hi�u, xin ch�n ph�m vi c�n t�m hi�u:", getn(tb_option), tb_option)
end

-- �����ѯ
function wlls_reg_query_single_do(n_idx, n_need)
	local tb_info	= {}
	for n, tb_fmt in WLLS_REG_TABLE do
		if (n == n_idx) then
			tb_info[n]	= n_need
		else
			tb_info[n]	= 0
		end
	end
	SetTaskTemp(WLLS_TEMPTASK, wlls_reg_savedata(tb_info))
	wlls_reg_query_begin()
end

-- �����ѯ
function wlls_reg_query_begin()
	SetStringTask(WLLS_STRINGTASK, "")
	wlls_reg_query_do()
end

-- ������ʱ������ѯ
function wlls_reg_query_do(str_name, b_next)
	-- ȷ����ҳ�ĵ�һ��ս��ID
	local n_lid
	local str_start
	if b_next then	-- ��ҳ��str_name����ʼ��Ա
		SetStringTask(WLLS_STRINGTASK, str_name)
		str_start	= str_name
	else
		str_start	= GetStringTask(WLLS_STRINGTASK)
	end
	if (str_start ~= "") then	-- ��ǰҳ
		n_lid	= LG_GetLeagueObj(WLLS_REG_LGTYPE, str_start)
	else	-- ��һҳ
		n_lid	= LG_GetFirstLeague(WLLS_REG_LGTYPE)
	end
	
	-- ��������ս��
	local str_myname	= GetName()
	local str
	local tb_option	= {}
	local tb_need	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	while (not FALSE(n_lid)) do
		local tb_info	= wlls_reg_loaddata(LG_GetLeagueTask(n_lid, 1))
		if (wlls_check_need(tb_need, LG_GetLeagueTask(n_lid, 1))) then	-- �ҵ�һ��ƥ��
			local str_lgname	= LG_GetLeagueInfo(n_lid)
			if (str_myname ~= str_lgname) then	-- ���������Լ�
				local n_got	= getn(tb_option)
				if (n_got == 0) then	-- ��һ��
					-- ��ʾҪ��ѯ��ս��
					if (not str_name) then 	-- Ĭ����ʾ��ҳ��һ��
						str_name	= str_lgname
					end
					str	= wlls_get_infostr(str_name)
				elseif (getn(tb_option) >= 10) then	-- ����
					str_name	= str_lgname
					break
				end
				if (str_lgname == str_name) then	-- ���ǵ�ǰ��ѯ��ս��
					tb_option[getn(tb_option)+1]	= "< " .. safeshow(str_name) .. " >/#wlls_reg_query_do('" .. safestr(str_name) .. "')"
				else
					tb_option[getn(tb_option)+1]	= safeshow(str_lgname) .. "/#wlls_reg_query_do('" .. safestr(str_lgname) .. "')"
				end
			end
		end
		n_lid = LG_GetNextLeague(WLLS_REG_LGTYPE, n_lid)
	end

	if (not str) then	-- û���ҵ�
		Say("S� gi� li�n ��u: Xin l�i! Kh�ng th� t�m th�nh vi�n ��ng k� ph� h�p v�i y�u c�u.", 1, "Tr� l�i/wlls_reg_query_menu")
		return
	end

	if (not FALSE(n_lid)) then	-- ���滹��
		tb_option[getn(tb_option)+1]	= "Trang k� /#wlls_reg_query_do('" .. safestr(str_name) .. "', 1)"
	end
	tb_option[getn(tb_option)+1]	= "Tr� l�i/wlls_reg_query_menu"
	Describe(str, getn(tb_option), tb_option)
end

-- �޸�ĳ������ֵ
function wlls_modify_need(n_idx, n_value, b_query)
	local tb_info	= wlls_reg_loaddata(GetTaskTemp(WLLS_TEMPTASK))
	tb_info[n_idx]	= n_value
	-- ����һ���߼�
	if (n_idx == 2) then	-- ����
		if (n_value == 1 or n_value == 2) then
			if (tb_info[1] == 2) then
				tb_info[1] = 1
			end
		elseif (n_value == 5 or n_value == 6) then
			if (tb_info[1] == 1) then
				tb_info[1] = 2
			end
		end
	elseif (n_idx == 1) then	-- �Ա�
		if (n_value == 1) then
			if (tb_info[2] == 5 or tb_info[2] == 6) then
				tb_info[2] = 0
			end
		elseif (n_value == 2) then
			if (tb_info[2] == 1 or tb_info[2] == 2) then
				tb_info[2] = 0
			end
		end
	end
	SetTaskTemp(WLLS_TEMPTASK, wlls_reg_savedata(tb_info))
	wlls_edit_need(WLLS_REG_TABLE[n_idx][1] .. "�� s�a", b_query)
end

-- ��������������Ϣ
function wlls_save_need(b_query)
	local n_data	= GetTaskTemp(WLLS_TEMPTASK)
	if (n_data ~= LG_GetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2)) then
		LG_ApplySetLeagueTask(WLLS_REG_LGTYPE, GetName(), 2, n_data)
	end
	Talk(1, iif(b_query, "wlls_reg_query_begin", "wlls_view_me"), strfill_right("B�o l�u th�nh c�ng!", 30))
end

-- �õ���Ӧ�ĳ�Ա��Ϣ�ַ���
function wlls_get_infostr(str_name)
	local n_lid	= LG_GetLeagueObj(WLLS_REG_LGTYPE, str_name)
	if FALSE(n_lid) then
		return "<link=image[0,8]:#npcspr:?NPCSID=87?ACTION=0>S� gi� li�n ��u<link>: Xin l�i! th�nh vi�n '"..safeshow(str_name).."' kh�ng t�n t�i, ho�c ��   x�a b�."
	end
	local n_data1	= LG_GetLeagueTask(n_lid, 1)
	local n_data2	= LG_GetLeagueTask(n_lid, 2)
	local tb_info	= wlls_reg_loaddata(n_data1)
	local str_ret
	if (tb_info[1] == 1) then
		str_ret = "<link=image[0,0]:\\spr\\Ui3\\���Ф��\\Ф��\\001.spr>" .. str_name .. "<link>\n"
	else
		str_ret = "<link=image[0,0]:\\spr\\Ui3\\���Ф��\\Ф��\\003.spr>" .. str_name .. "<link>\n"
	end
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local str	= wlls_get_oneinfo(n_idx, tb_info[n_idx])
		if (mod(n_idx, 2) == 1) then	-- ����
			str_ret	= str_ret .. " " .. tb_fmt[1] .. ":" .. strfill_left(str, 10)
		else	-- ˫��
			str_ret	= str_ret .. tb_fmt[1] .. ":" .. str .. "\n"
		end
	end
	n_lid	= LG_GetLeagueObjByRole(WLLS_LGTYPE, str_name)
	if FALSE(n_lid) then
		str_ret	= str_ret .. "chi�n ��i: kh�ng\n"
	else
		local str_lgname, _, n_count = LG_GetLeagueInfo(n_lid)
		local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_stype ~= GetGlbValue(GLB_WLLS_NEXT)) then
			str_ret	= str_ret .. "Chi�n ��i:"..str_lgname.." (�� qu� h�n) \n"
		else
			local str_lgname, _, n_count = LG_GetLeagueInfo(n_lid)
			local n_ntype	= GetGlbValue(GLB_WLLS_NEXT)
			local n_maxmem	= WLLS_TAB[n_ntype].max_member
			str_ret	= str_ret .. "Chi�n ��i:" .. str_lgname .. " (" .. n_count .. "/" .. n_maxmem .. ")\n"
		end
	end
	return str_ret .. "\n��i c� hy v�ng:\n" .. wlls_get_needinfo(n_data2)
end

-- �õ���Ӧ��������Ϣ�ַ���
function wlls_get_needinfo(n_data)
	local tb_info	= wlls_reg_loaddata(n_data)
	local str_ret	= ""
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local str	= wlls_get_oneneed(n_idx, tb_info[n_idx])
		if (mod(n_idx, 2) == 1) then	-- ����
			str_ret	= str_ret .. " " .. tb_fmt[1] .. ":" .. strfill_left(str, 10)
		else	-- ˫��
			str_ret	= str_ret .. tb_fmt[1] .. ":" .. str .. "\n"
		end
	end
	return str_ret
end

-- ����һ��������Ϣ���ַ���
function wlls_get_oneneed(n_idx, n_value)
	local tb		= WLLS_REG_TABLE[n_idx][3]
	local str_units	= WLLS_REG_TABLE[n_idx][4]
	if (type(tb[1]) == "table") then	-- ��ֵ��Χ
		local tb_range	= tb[n_value]
		if (not tb_range) then
			return "Kh�ng v�n ��"
		elseif (not tb_range[1]) then
			return "#" .. tb_range[2] .. str_units
		elseif (not tb_range[2]) then
			return "#" .. tb_range[1] .. str_units
		else
			return tb_range[1] .. "~" .. tb_range[2] .. str_units
		end
	elseif (type(tb[1]) == "string") then	-- ö��
		local str = tb[n_value]
		if (not str) then
			return "Kh�ng v�n ��"
		else
			return str
		end
	else
		error("type(tb[1]) == " .. type(tb[1]))
	end
end

-- ����һ����Ա������Ϣ���ַ���
function wlls_get_oneinfo(n_idx, n_value)
	local tb	= WLLS_REG_TABLE[n_idx][3]
	local str_units	= WLLS_REG_TABLE[n_idx][4]
	if (type(tb[1]) == "table") then	-- ��ֵ
		if (n_value >= 255) then
			return "#" .. n_value .. str_units
		else
			return n_value .. str_units
		end
	elseif (type(tb[1]) == "string") then	-- ö��
		local str = tb[n_value]
		if (not str) then
			return "Ch�a bi�t"
		else
			return str
		end
	else
		error("type(tb[1]) == " .. type(tb[1]))
	end
end

-- �������ֵ�Ƿ����
function wlls_check_need(tb_need, n_data)
	local tb_value	= wlls_reg_loaddata(n_data)
	for n_idx, tb_fmt in WLLS_REG_TABLE do
		local n_need	= tb_need[n_idx]
		if (n_need ~= 0) then
			local tb		= WLLS_REG_TABLE[n_idx][3]
			local n_value	= tb_value[n_idx]
			if (type(tb[1]) == "table") then	-- ��ֵ��Χ
				local tb_range	= tb[n_need]
				if (not tb_range[1]) then
					if (n_value > tb_range[2]) then
						return
					end
				elseif (not tb_range[2]) then
					if (n_value < tb_range[1]) then
						return
					end
				else
					if (n_value < tb_range[1] or n_value > tb_range[2]) then
						return
					end
				end
			elseif (type(tb[1]) == "string") then	-- ö��
				if (n_need ~= n_value) then
					return
				end
			else
				error("type(tb[1]) == " .. type(tb[1]))
			end
		end
	end
	return 1
end

-- ���� ��Ϣ ���� ���������
function wlls_reg_savedata(tb_info)
	local n_data	= 0;
	n_data	= SetByte(n_data, 1, tb_info[1] * 16 + tb_info[2])
	n_data	= SetByte(n_data, 2, tb_info[3])
	n_data	= SetByte(n_data, 3, tb_info[4])
	n_data	= SetByte(n_data, 4, tb_info[5])
	return n_data
end

-- ���� ��������� ���� ��Ϣ
function wlls_reg_loaddata(n_data)
	local n_data1	= GetByte(n_data, 1)
	tb_info	= {
		floor(n_data1 / 16),
		mod(n_data1, 16),
		GetByte(n_data, 2),
		GetByte(n_data, 3),
		GetByte(n_data, 4),
	}
	return tb_info
end



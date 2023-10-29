-- zuofanggongren.lua 
-- �������˽ű�
-- 2005-09-07 by steve

Include("\\script\\event\\mid_autumn\\mooncake_head.lua")
IncludeLib("TIMER")
IncludeLib("RELAYLADDER")


-- ��ͬ�����±��ĵȴ�ʱ��
tbl_time_wait = {
	[TYPE_SHIJIN		  ] = 600,
	[TYPE_GUOREN		  ] = 300,
	[TYPE_DANHUANGLIANRONG] = 180,
	[TYPE_DANHUANGDOUSHA  ] = 180,
	[TYPE_LIANRONG		  ] = 180,
	[TYPE_DOUSHA		  ] = 180,
};

tbl_finish_stat = {
	[STAT_HUOMIAN_MAKING] = STAT_HUOMIAN_FINISH,	-- �������
	[STAT_BAOXIAN_MAKING] = STAT_BAOXIAN_FINISH,	-- �������
	[STAT_HONGKAO_MAKING] = STAT_HONGKAO_FINISH,	-- �濾���
};

tbl_making_msg = {
	[STAT_BAOXIAN_MAKING] = "<#> b�t ��u l�m <color=yellow>nh�n b�nh<color>",
	[STAT_HONGKAO_MAKING] = "<#> B�t ��u <color=yellow>n��ng b�nh<color>",
};

-- ��ͬ���͵��±�
tbl_mooncake = {
	"<#> B�nh trung thu th�p c�m ",
	"<#> B�nh Trung thu H�nh nh�n",
	"<#> B�nh trung thu ��u tr�ng",
	"<#> B�nh Trung Thu ��u Tr�ng",
	"<#> B�nh Trung Thu B�t Sen",
	"<#> B�nh trung thu nh�n ��u ",
};

tbl_mooncake_item = {
	{6, 1, 896, 1, 0, 0, 379}, -- ʲ���±�,
	{6, 1, 895, 1, 0, 0, 251}, -- �����±�,
	{6, 1, 894, 1, 0, 0, 188}, -- ���������±�,
	{6, 1, 893, 1, 0, 0, 187}, -- ���ƶ�ɳ�±�,
	{6, 1, 892, 1, 0, 0, 186}, -- �����±�,
	{6, 1, 891, 1, 0, 0, 185}, -- ��ɳ�±�,
};

-- �±��Ƿ���Ҫ���������е��������˴���ȡ����
tbl_mooncake_exchangable = {
	1, -- ʲ���±�
	1, -- �����±�
	0, -- ���������±�
	1, -- ���ƶ�ɳ�±�
	0, -- �����±�
	1, -- ��ɳ�±�
};

-- ������ͬ���͵��±���Ҫ�Ĳ���
tbl_mooncake_material = {
	--�� ���� ���� Ҭ˿ ��� ɰ�� ���� ��ɳ
	{0,	1, 1, 3, 4, 4, 1, 1},	-- ʲ���±���4���+4ɰ��+��ɳ+����+����+����+3Ҭ˿
	{0, 1, 2, 0, 6, 6, 0, 0},	-- �����±���6���+6ɰ��+1����+2����
	{2, 0, 0, 0, 5, 6, 2, 0},	-- ���������±���5���+6ɰ��+2����+2��
	{2, 0, 0, 0, 6, 5, 0, 2},	-- ���ƶ�ɳ�±���6���+5ɰ��+2��ɳ+2��
	{0, 0, 0, 0, 5, 8, 2, 0},	-- �����±���5���+8ɰ��+2����
	{0, 0, 0, 0, 8, 5, 0, 2},	-- ��ɳ�±���8���+5ɰ��+2��ɳ
};

-- ȷ��Ҫ�����±��ĶԻ�
tbl_mooncake_talk = {
	"<#> <color=red>B�nh Trung Thu Th�p C�m<color> c�n c�: 4 b�t m�, 4 ���ng c�t, 1 ��u xanh, 1 g�i b�t sen, 1 h�nh nh�n, 1 ��u ph�ng, 3 c�m d�a. Nghe n�i lo�i c�m d�a n�y ch� c� � ph��ng Nam th�i, m�c l�m ��y! N�u �� v�y, ta s� c�n  th�n, b�t ��u ch�?",
	"<#> <color=red>B�nh Trung Thu H�nh nh�n<color> c�n c�: 6 b�t m�, 6 ���ng c�t, 1 h�nh nh�n, 2 ��u ph�ng. �em m�t �t ��u ph�ng xay cho n�t sau �� �em b� v�o trong b�nh trung thu, nh� v�y m�i t�a ���c h��ng th�m c�a b�nh t� trong ra. Kh�ng n�i nhi�u n�a, b�t ��u ch�?",
	"<#> <color=red>B�nh Trung Thu Sen Tr�ng<color> c�n c�: 5 b�t m�, 6 ���ng c�t, 2 g�i b�t sen, 2 tr�ng. C�n hai tr�ng, m�t tr�ng ta d�ng l�m nh�n, tr�ng kia ta b�i l�n b� m�t sau khi n��ng, c�ch n�a ti�ng b�i l�n m�t l�n. Kh�ng n�i nhi�u n�a, b�t ��u ch�?",
	"<#> <color=red>B�nh Trung Thu ��u Tr�ng<color> c�n c�: 6 b�t m�, 5 ���ng c�t, 2 ��u xanh, 2 tr�ng. Ng��i bi�t kh�ng v�y? C�n hai tr�ng, m�t tr�ng ta d�ng l�m nh�n, tr�ng kia ta b�i l�n b� m�t sau khi n��ng, c�ch n�a ti�ng b�i l�n m�t l�n. Kh�ng n�i nhi�u n�a, b�t ��u ch�?",
	"<#> <color=red>B�nh Trung Thu B�t Sen<color> c�n c�: 5 b�t m�, 8 ���ng c�t, 2 g�i b�t sen. B� quy�t l� ph�i �em nh�y c�a h�t sen b� �i sau �� xay th�nh b�t sen, ��ng th�i ph�i tr�n ��u v�i ���ng c�t, nh� v�y m�i l�m ra ���c b�nh ngon. Kh�ng n�i nhi�u n�a, b�t ��u ch�?",
	"<#> <color=red>B�nh Trung Thu ��u Xanh<color> c�n c�: 8 b�t m�, 5 ���ng c�t, 2 ��u xanh. ��ng xem th��ng lo�i b�nh trung thu n�y, nh�ng mu�n l�m ngon ph�i c� b� quy�t ��, nh� ��u xanh ch�ng h�n sau khi ng�m xong ph�i b� v� m�i xay n�t, nh� v�y s� c� v� ngon. Kh�ng n�i nhi�u n�a, b�t ��u ch�?",
};

-- ��ͬ�±�״̬�ĶԻ�
tbl_maketalk = {
	-- �������
	[STAT_HUOMIAN_FINISH] = {
		"<#> B�t �� ��nh xong, b�y gi� b�t ��u l�m nh�n, c�n m�t �t th�i gian, c� th� nh� ng��i ph� ��y, v� v�y trong l�c l�m nh�n ng��i ��ng r�i kh�i Minh Nguy�t tr�n, sau khi xong ta s� th�ng b�o cho ng��i. Sau khi nghe ta g�i th� l�p t�c ��n ��y, nguy�n li�u �� l�u s� b� h�ng!",
		"<#> Ta bi�t r�i! B�t ��u �i!/keep_making_mooncake",
		"<#> L�t n�a ta s� quay l�i!/cancel"},
	-- �������
	[STAT_BAOXIAN_FINISH] = {
		"<#> Nh�n �� l�m xong r�i, qua giai �o�n n��ng ��y, c�n m�t �t th�i gian, c� th� nh� s� gi�p �� c�a ng��i, trong th�i gian n�y ng��i ��ng n�n r�i kh�i Minh Nguy�t tr�n, xong ta s� th�ng b�o cho ng��i, nh� ��y khi nghe ta g�i ph�i l�p t�c ��n ngay kh�ng th� kh�t b�nh ��!",
		"<#> Ta bi�t r�i! B�t ��u �i!/keep_making_mooncake",
		"<#> L�t n�a ta s� quay l�i!/cancel"},
};


tbl_stoptalk = {
	-- ���ں���
	[STAT_HUOMIAN_MAKING] = {
		"<#> N�u v�y ta b�t ��u pha b�t ��y, c�n m�t �t th�i gian, c� th� nh� ng��i ph� ��y, v� v�y trong l�c l�m nh�n ng��i ��ng r�i kh�i Minh Nguy�t tr�n, sau khi xong ta s� th�ng b�o cho ng��i. Sau khi nghe ta g�i th� mau l�p t�c ��n ��y, nguy�n li�u �� l�u s� b� h�ng!",
		"<#> Ta bi�t r�i! B�t ��u �i!/resume_making_mooncake",
		"<#> L�t n�a ta s� quay l�i!/cancel"},
	-- ���ڰ���
	[STAT_BAOXIAN_MAKING] = {
		"<#> B�t �� ��nh xong, b�y gi� b�t ��u l�m nh�n, c�n m�t �t th�i gian, c� th� nh� ng��i ph� ��y, v� v�y trong l�c l�m nh�n ng��i ��ng r�i kh�i Minh Nguy�t tr�n, sau khi xong ta s� th�ng b�o cho ng��i. Sau khi nghe ta g�i th� l�p t�c ��n ��y, nguy�n li�u �� l�u s� b� h�ng!",
		"<#> Ta bi�t r�i! B�t ��u �i!/resume_making_mooncake",
		"<#> L�t n�a ta s� quay l�i!/cancel"},
	-- ���ں濾
	[STAT_HONGKAO_MAKING] = {
		"<#> Nh�n �� l�m xong r�i, qua giai �o�n n��ng ��y, c�n m�t �t th�i gian, c� th� nh� s� gi�p �� c�a ng��i, trong th�i gian n�y ng��i ��ng n�n r�i kh�i Minh Nguy�t tr�n, xong ta s� th�ng b�o cho ng��i, nh� ��y khi nghe ta g�i ph�i l�p t�c ��n ngay kh�ng th� kh�t b�nh ��!",
		"<#> Ta bi�t r�i! B�t ��u �i!/resume_making_mooncake",
		"<#> L�t n�a ta s� quay l�i!/cancel"},
};

-- ��������
tbl_stepname = {
	[STAT_HUOMIAN_MAKING] = "<#> Pha b�t",	-- ���ں���
	[STAT_BAOXIAN_MAKING] = "<#> L�m nh�n",	-- ���ڰ���
	[STAT_HONGKAO_MAKING] = "<#> N��ng",	-- ���ں濾
};

tbMOONCAKE_LADDERID = {
				{ 10189, 40 },
				{ 10190, 41 },
				{ 10191, 42 },
				{ 10192, 43 },
				{ 10193, 44 },
				{ 10194, 45 },
}


function resume_making_mooncake()
	TM_ResumeTimer(TIMER_MOONCAKE)
	
end

-- ȷ��Ҫ�������±�����
function confirm_mooncake(ltype)
	Say(tbl_mooncake_talk[ltype], 2,
		"��ng r�i./" .. format("#make_mooncake(%d)", ltype),
		"Kh�ng! �� ta suy ngh� l�i!/cancel")
end

-- �Ի��������±�
function talk_makemooncake()
	local caption = "<#> Th� b�nh: X��ng ch�ng ta c� b� quy�t l�m b�nh ri�ng c� th� t�o ra nh�ng chi�c b�nh h�p kh�u v� ng��i kh� t�nh nh�t. ng��i mu�n l�m b�nh trung thu lo�i n�o?"
	Say(caption,
		7,
		"<#> Ta mu�n l�m B�nh Trung Thu ��u Xanh/" .. format("#confirm_mooncake(%d)", TYPE_DOUSHA),
		"<#> Ta mu�n l�m B�nh Trung Thu B�t Sen/" .. format("#confirm_mooncake(%d)", TYPE_LIANRONG),
		"<#> Ta mu�n l�m B�nh Trung Thu ��u Tr�ng/" .. format("#confirm_mooncake(%d)", TYPE_DANHUANGDOUSHA),
		"<#> Ta mu�n l�m B�nh Trung Thu Sen Tr�ng/" .. format("#confirm_mooncake(%d)", TYPE_DANHUANGLIANRONG),
		"<#> Ta mu�n l�m B�nh Trung Thu H�nh nh�n/" .. format("#confirm_mooncake(%d)", TYPE_GUOREN),
		"<#> Ta mu�n l�m B�nh Trung Thu Th�p C�m/" .. format("#confirm_mooncake(%d)", TYPE_SHIJIN),
		"<#> Ta ch� �i d�o th�i/cancel")
end

-- �Ի�������±�����״̬
function talk_querymooncake(varv)
	local ltype = floor(varv / 1000)	-- �±�����
	local stat = mod(varv, 1000)	-- �±�״̬
	name = tbl_mooncake[ltype]
	-- �±�������
	if (stat == STAT_PARCHED or stat == STAT_HUOMIAN_PARCHED) then
		Say("<#> Th�t xin l�i v� kh�ch quan n�y, ta th�y ng��i l�u qu� ch�a ��n �� l�m kh�t b�nh r�i!",
			1,
			"<#> Nh�n b�nh trung thu b� kh�t/#take_parched_mooncake("..stat..")")
	-- �±�������
	elseif (stat == STAT_HONGKAO_FINISH) then
		close_hint()
		local caption = ""
		if (tbl_mooncake_exchangable[ltype] == 1) then
			caption = "<#> V� kh�ch quan n�y, <color=red>" .. tbl_mooncake[ltype] .. "<color> �� l�m xong r�i, c� th�m kh�ng v�y? Mau th��ng th�c xem! Nghe ��u trong th� tr�n c� v� Minh Nguy�t l�o nh�n th�ch �n b�nh trung thu l�m, ng��i �em ��n cho �ng ta �i bi�t ��u c� t�ng ph�m b�t ng�!"
		else
			caption = "<#> V� kh�ch quan n�y, <color=red>" .. tbl_mooncake[ltype] .. "<color> �� ���c l�m xong, th�m kh�ng v�y? Mau th��ng th�c �i n�o!"
		end
		Say(caption, 1, "<#> Nh�n b�nh trung thu/" .. format("#take_mooncake(%d)", ltype))
	elseif (tbl_stoptalk[stat] ~= nil) then		-- ������
		-- ��ͣ
		if (TM_IsTimerSuspending(TIMER_MOONCAKE) == 1) then
			Say(tbl_stoptalk[stat][1], 2, tbl_stoptalk[stat][2], tbl_stoptalk[stat][3])
		-- �±�������
		else
			local talk = "<#> V� kh�ch quan n�y ��ng g�p, <color=red>" .. tbl_mooncake[ltype] .. "<color> c�n �ang <color=red>" .. tbl_stepname[stat] .. "<color>, sau khi xong giai �o�n n�y ta s� th�ng b�o cho!"
			Talk(1, "", talk)
		end
	elseif (tbl_maketalk[stat] ~= nil) then		-- �������
		close_hint()
		-- ��ͣ��ʱ
		TM_SuspendTimer(TIMER_MOONCAKE)
		Say(tbl_maketalk[stat][1], 2, tbl_maketalk[stat][2], tbl_maketalk[stat][3])
	else
		print("MOONCAKE: something is wrong!!!")
	end
end

-- ���㵱ǰ������Ҫ������ʱ��
function get_make_time()
	return random(30, 60)
end

-- ����������ϵ��±�ԭ��
function consume_material(ltype)
	local material_list = tbl_mooncake_material[ltype]
	-- ���ԭ���Ƿ����
	for i = 1, getn(material_list) do
		local want_count = material_list[i]
		local material_item = tbl_material[i]
		if (want_count ~= 0) then
			local curr_count = CalcEquiproomItemCount(material_item[2], material_item[3], 1, -1)
			if (curr_count < want_count) then
				Talk(1, "", "<#> V� kh�ch quan n�y, nguy�n li�u tr�n ng��i ng��i kh�ng ��, ��i t�m �� nguy�n li�u r�i h�y ��n!")
				return 0
			end
		end
	end
	-- ����ԭ��
	for i = 1, getn(material_list) do
		local want_count = material_list[i]
		local material_item = tbl_material[i]
		if (want_count ~= 0) then
			ConsumeEquiproomItem(want_count, material_item[2], material_item[3], 1, -1)
		end
	end
	return 1
end

-- ��ʼ�����±�
function make_mooncake(ltype)
	if (consume_material(ltype) == 1) then
		local varv = ltype * 1000 + STAT_HUOMIAN_MAKING
		nt_setTask(VARV_MOONCAKE, varv)
		-- DEBUG
		--print(format("make_mooncake: nt_setTask(%d, %d)", VARV_MOONCAKE, varv))
		local resttime = get_make_time()
		TM_SetTimer(resttime * 18,
			TIMER_MOONCAKE,
			1,	-- ��ʱ��ִֻ��һ�� 
			2);	-- ��ʱ���������ʱ��Ϊ׼
		-- DEBUG
		--print(format("TM_SetTimer(%d, %d, %d, %d)", resttime * 18, TIMER_MOONCAKE, 1, 2))
		TM_SuspendTimer(TIMER_MOONCAKE)
		
		Say("<#> N�u v�y ta b�t tay <color=red>pha b�t<color>, c�n m�t �t th�i gian, c� th� nh� ng��i ph� ��y, v� v�y trong l�c l�m nh�n ng��i ��ng r�i kh�i Minh Nguy�t tr�n, sau khi xong ta s� th�ng b�o cho ng��i. Sau khi nghe ta g�i th� l�p t�c ��n ��y, nguy�n li�u �� l�u s� b� h�ng!",
			2,
			"<#> Ta bi�t r�i! B�t ��u �i!/resume_mooncake",
			"<#> L�t n�a ta s� quay l�i!/cancel")
	end
end

-- �ָ������±�
function resume_mooncake()
	Msg2Player("<#> B�y gi� b�t ��u <color=yellow>pha b�t <color>��y!")
	TM_ResumeTimer(TIMER_MOONCAKE)
end

-- ���������±�
function keep_making_mooncake()
	local varv = GetTask(VARV_MOONCAKE)
	local ltype = floor(varv / 1000)
	local stat = mod(varv, 1000)
	if (stat < STAT_MAX) then
		stat = stat + 1
		nt_setTask(VARV_MOONCAKE, ltype * 1000 + stat)
		
		if (tbl_making_msg[stat] ~= nil) then
			Msg2Player(tbl_making_msg[stat])
		end
	
		local nExp = makecake_addexp(GetLevel(), 0.20)
		if (nExp ~= 0 and nExp ~= nil) then
			AddOwnExp(nExp)
		end
		-- DEBUG
		--print(format("keep_making_mooncake: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + stat))
		
		TM_SetTimer(get_make_time() * 18,
			TIMER_MOONCAKE,
			1,	-- ��ʱ��ִֻ��һ�� 
			2);	-- ��ʱ���������ʱ��Ϊ׼
	end
end

-- ��ȡ�������±�
function take_parched_mooncake(stat)
	local varv = GetTask(VARV_MOONCAKE)
	local lstat = mod(varv, 1000)		-- �±�״̬
	if (lstat == STAT_HUOMIAN_PARCHED or lstat == STAT_PARCHED) then
		nt_setTask(VARV_MOONCAKE, 0)
		AddItem(6,1,890,1,0,0)
		Msg2Player("<#> ng��i nh�n ���c m�t b�nh trung thu n��ng xong")
		CastSkill(358, 1)
		local nExp = 0;
		if (stat == STAT_PARCHED) then
			nExp = makecake_addexp(GetLevel(), 0.20)
		else
			nExp = makecake_addexp(GetLevel(), 0.10)
		end
		if (nExp ~= 0 and nExp ~= nil) then
			AddOwnExp(nExp)
		end
	end
end

-- ��ȡ���õ��±�
function take_mooncake(ltype)
	local varv = GetTask(VARV_MOONCAKE)
	local stat = mod(varv, 1000)		-- �±�״̬
	local type = floor(varv / 1000)		-- �±�����
	if (type == ltype and stat == STAT_HONGKAO_FINISH) then
		nt_setTask(VARV_MOONCAKE, 0)
		local cakename = tbl_mooncake[ltype]
		local item = tbl_mooncake_item[ltype]
		AddItem(item[1], item[2], item[3], item[4], item[5], item[6])
		Msg2Player("<#> B�n nh�n ���c m�t <color=yellow>" .. cakename .. "<color>")
		if (ltype == 1) then
			AddGlobalNews("<#> Ch�c m�ng ng��i ch�i"..GetName().."<#> l�m ���c B�nh Trung Thu Th�p C�m")
		end
		ladder_mooncake_ladder(ltype)
		local nExp = makecake_addexp(GetLevel(), 0.60)
		if (nExp ~= 0 and nExp ~= nil) then
			AddOwnExp(nExp)
		end
		WriteLog(date("%y-%m-%d,%H:%M,") .. GetAccount() .. "(".. GetName().. ") get a " .. cakename)
		CastSkill(item[7],1)
	end
end

-- ������ɵ���Ӧ����
function timeout_make(ltype, stat)
	local finish_stat = tbl_finish_stat[stat];
	-- DEBUG
	--print(format("Msg2Player(%s)", tbl_notice[finish_stat]))
	Msg2Player(tbl_notice[finish_stat])

	-- ��ǰ�׶�����ˣ��ȴ����ִ����һ����
	-- DEBUG
	--print(format("timeout_make(%d, %d)", ltype, stat))
	nt_setTask(VARV_MOONCAKE, ltype * 1000 + finish_stat)
	-- DEBUG
	--print(format("timeout_make: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + finish_stat))
	TM_SetTimer(tbl_time_wait[ltype] * 18,
		TIMER_MOONCAKE,
		1,	-- ��ʱ��ִֻ��һ�� 
		2);	-- ��ʱ���������ʱ��Ϊ׼
	-- ����������ȡ�±��Ķ�ʱ��
	start_hint()
end

-- �ȴ���ʱ����Ӧ����
function timeout_wait(ltype, stat)
	close_hint()
	-- �ȴ���ʱ�䵽�ˣ���һ�û��ִ����һ�����±�����
	if (stat == STAT_HONGKAO_FINISH ) then
		--yuebing guoshi 
		nt_setTask(VARV_MOONCAKE, ltype * 1000 + STAT_PARCHED)
		-- DEBUG
		--print(format("timeout_wait: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + STAT_PARCHED))
	else
		nt_setTask(VARV_MOONCAKE, ltype * 1000 + STAT_HUOMIAN_PARCHED)
		-- DEBUG
		--print(format("timeout_wait: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + STAT_HUOMIAN_PARCHED))
	end

end

-- ��ͬ״̬�Ķ�ʱ��
tbl_timer = {
	[STAT_HUOMIAN_MAKING] = timeout_make,	-- ���ں���
	[STAT_HUOMIAN_FINISH] = timeout_wait,	-- �������
	[STAT_BAOXIAN_MAKING] = timeout_make,	-- ���ڰ���
	[STAT_BAOXIAN_FINISH] = timeout_wait,	-- �������
	[STAT_HONGKAO_MAKING] = timeout_make,	-- ���ں濾
	[STAT_HONGKAO_FINISH] = timeout_wait,	-- �濾���
};

-- ��ʱ��
function OnTimer()
	local varv = GetTask(VARV_MOONCAKE)
	local ltype = floor(varv / 1000)
	local stat = mod(varv, 1000)
	if (ltype >= TYPE_MIN and
		ltype <= TYPE_MAX and
		stat >= STAT_MIN and
		stat <= STAT_MAX) then
		timer = tbl_timer[stat]
		if (timer ~= nil) then
			timer(ltype, stat)
		end
	end
end

-- ����˵��
function about_mooncake(step)
	if (step == 1) then
		Talk(1,"#about_mooncake(2)","<#> Th� b�nh: L�m b�nh trung thu c�n ti�n h�nh <color=red>3<color> giai �o�n. Ch�n lo�i h�nh b�nh trung thu c�n l�m, chu�n b� �� c�c th� nguy�n li�u, c�c b��c ���c ti�n h�nh nh� sau: <color=red>'Pha b�t<color>', <color=red>'L�m nh�n'<color>, <color=red>'N��ng'<color>. Qua ba giai �o�n tr�n ho�n th�nh b�nh trung thu.")
	elseif (step == 2) then
		Talk(1, "#about_mooncake(3)","<#> M�i m�t giai �o�n ��u c� m�t th�i gian l�m nh�t ��nh, sau m�i giai �o�n l�m xong, s� c� h�n s� d�ng (L�m ra b�nh c�ng ngon th� b�o qu�n ���c c�ng l�u) , <color=red>c�p 50 v� c�p 50 tr� l�n <color>ng��i ch�i sau khi tr�i qua m�i giai �o�n l�m s� nh�n ���c �i�m kinh nghi�m nh�t ��nh.")
	elseif (step == 3) then
		Talk(1, "","<#> N�u trong th�i gian l�m, ch�a tr�i qua giai �o�n ti�p theo ho�c nh�n b�nh, th� xem nh� th�t b�i, ch� nh�n ���c <color=red>b�nh trung thu b� kh�t<color>.")

	end
end

function main()
	local varv = GetTask(VARV_MOONCAKE)
	-- DEBUG
	--print(format("GetTask(%d):%d", VARV_MOONCAKE, varv))
	if (varv == 0) then
		local caption = "<#> B�nh � Minh Nguy�t tr�n n�i ti�ng kh�p n�i. B�nh trung thu ch�ng ta l�m ra b�o ��m kh�u v� th�m ngon. V� kh�ch quan n�y c� mua kh�ng?"
		Say(caption,
			3,
			"<#> Ta mu�n l�m m�t v�i b�nh trung thu/talk_makemooncake",
			"<#> Li�n quan ��n vi�c l�m b�nh trung thu/#about_mooncake(1)",
			"<#> �� ta suy ngh� l�i!/cancel")
	else
		talk_querymooncake(varv)
	end
end

function makecake_addexp(level, percent)
	if ( percent == nil or percent == 0 ) then
		return 0
	end
	local ratio = random( 15, 20 ) * percent ;
	local nExp = 0;
	if ( level == 50 ) then
		nExp = floor( 700 * ratio )
	elseif ( level > 50 and level < 100 ) then
		nExp = floor(( 700 + floor((level - 50)/5) * 100) * ratio )
	elseif ( level > 100 ) then
		nExp = floor( 1700 * ratio )
	else
		nExp = 0
	end
	return nExp
end

function nt_setTask(taskid, value)
	SetTask(taskid, value)
	SyncTaskValue(taskid) -- ͬ�����ͻ���
end

	
function ladder_mooncake_ladder(ltype)
	local RoleName = "";
	local Data = "";
	local mooncake_data = 0;
	local mapid = SubWorldIdx2ID(SubWorld);
	local ladderid = tbMOONCAKE_LADDERID[ltype][1]
	local glbvalueid = tbMOONCAKE_LADDERID[ltype][2]
	
	SetGlbValue(glbvalueid, GetGlbValue(glbvalueid) + 1)
	if (ltype == 4 or ltype == 5 or ltype == 6 ) then
		if ( GetGlbValue(glbvalueid) ~= 5) then
			return
		end
	end
	
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(ladderid, i);
		if ( RoleName == tostring(mapid) ) then
			mooncake_data = tonumber(Data)
			break
		end
	end
	
	if (mooncake_data == "" or mooncake_data == nil) then
		mooncake_data = 0
	end
	
	Ladder_NewLadder(ladderid, tostring(mapid), mooncake_data + GetGlbValue(glbvalueid), 1)
	SetGlbValue(glbvalueid, 0)
end
	
	

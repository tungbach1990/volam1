Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function wlls_want2transback()
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("Th� v� h�i tr��ng: Chi�n ��i c�a b�n kh�ng ph�i �ang thi ��u sao? N�u b�y gi� r�i ��i s� kh�ng th� l�nh ph�n th��ng. B�n ngh� k� ch�a?",
			2, "��ng v�y!/wlls_transback", "Kh�ng c�n!/OnCancel")
	else
		wlls_transback()
	end
end

--����Ƿ���Խ���׼�������ɹ����أ�n_matchtype,leagueid�������򷵻�nil
function wlls_ready2join()
	local n_mtype, n_group = wlls_get_mapinfo()
	local n_lid = wlls_check_player(GetName(), nil, n_mtype)
	if (FALSE(n_lid)) then
		wlls_transback()
		return nil
	end
	
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	if (n_matchphase < 3) then
		Say("B�y gi� b�n ng��i ch�a thi ��u, c� c�n ta ��a ng��i v�?", 2, "��ng v�y!/wlls_transback", "Ta ch�a mu�n v�!/OnCancel")
		return nil
	end
	
	local tb_option = wlls_add_option({}, "Kh�ng c�n")
	if (n_matchphase == 3) then	--��Ъʱ��
		--����������һ����
		Say("Xin h�y t�m ngh� � ��y! Hi�n v�n ch�a b�t ��u thi ��u, ng��i c�n y�u c�u n�o kh�ng?", getn(tb_option), tb_option)
		return nil
	end
	
	--�ж��Ƿ�Խ��
	local str = wlls_levelcheck(n_lid)
	if (str) then
		Say("Quan vi�n h�i tr��ng:"..str, 2, "Ta mu�n r�i kh�i h�i tr��ng!/wlls_want2transback", "Kh�ng c�n!/OnCancel")
		return nil
	end

	if (n_matchphase == 5) then	--����ʱ��
		local n_combatmap = wlls_get_mapid(3, n_mtype, n_group)
		local n_resttime = WLLS_TIMER_FIGHT_TOTAL - GetGlbValue(GLB_WLLS_TIME)
		n_resttime = ceil(n_resttime*WLLS_TIMER_FIGHT_FREQ/60)
		Say("V�n �ang ti�n h�nh thi ��u! Th�i gian k�t th�c c�n"..n_resttime.."ph�t, b�n c�n gi�p �� g� kh�ng?", getn(tb_option), tb_option)
		return nil
	end

	if (n_matchphase == 4) then	--׼��ʱ��
		return n_mtype, n_lid
	end
	
	print("n_matchphase error! :"..n_matchphase)
end

function main()
	local n_mtype, n_lid = wlls_ready2join()
	if (FALSE(n_mtype)) then
		return
	end
	
	local nLevel	= wlls_get_level(n_mtype)
	if (not wlls_CheckIsOpen(nLevel)) then
		return
	end
	
	local tb_option = {"Ta mu�n tham chi�n!/wlls_en1"}
	wlls_add_option(tb_option, "Kh�ng c�n")
	Say("Hi�n thi ��u �ang trong giai �o�n b�o danh, mu�n tham gia thi ��u ph�i kh�ng?", getn(tb_option), tb_option)
	
	local _, _, n_count = LG_GetLeagueInfo(n_lid)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_maxmem = WLLS_TAB[n_type].max_member
	if (n_count < n_maxmem) then
		Msg2Player("Nh�m c�a b�n hi�n ch� c�n<color=yellow>"..n_count.."<color>th�nh vi�n, chi�n ��i c�a b�n c� th� gia nh�p nhi�u nh�t<color=yellow>"..n_maxmem.."<color>th�nh vi�n.")
	end
end

function wlls_en1()
	Say("V� l�m li�n ��u kh�ng ���c s� d�ng <color=red> b�t c� lo�i d��c ph�m PK n�o<color>, <color=yellow>c�c hi�u qu� h� tr� cho k� n�ng c�ng b� v� hi�u<color>. Sau khi b�t ��u thi ��u c� th� <color=yellow>�i�u ph�i l�i c�c k� n�ng<color>. Tr��c khi v�o ��u tr��ng c�n xem l�i �� hao m�n c�a c�c trang b�, ��u tr��ng kh�ng cho ph�p v�t trang b� ra ngo�i",2, "Ta �� s�n s�ng!/wlls_en2", "Ta s� quay l�i sau!/OnCancel")
end

function wlls_en2()
	Say("Quan vi�n h�i tr��ng:<color=red>V�o khu v�c chu�n b� v� khu v�c thi ��u, ng��i ch�i kh�ng th� di chuy�n v�t ph�m trong h�nh trang nh�ng v�n c� th� s� d�ng v�t ph�m trong thanh c�ng c� v� h�nh trang. Ng��i h�y ki�m tra l�i v�t ph�m trong thanh c�ng c� �� ��y hay ch�a?",2,"X�c nh�n/wlls_en3", "Ta ch�a s�n s�ng!/OnCancel")
end

function wlls_en3()
	local n_mtype, n_lid = wlls_ready2join()
	if (FALSE(n_mtype)) then return end
	if not wlls_en_check() then return end
	
	local szResult = n_mtype.." "..GetName()
	LG_ApplyDoScript(0, "", "", "\\script\\leaguematch\\joinmatch.lua", "wlls_want2join", szResult , "", "")
end


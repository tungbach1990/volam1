Include("\\script\\global\\login_head.lua")
Include( "\\script\\missions\\leaguematch\\head.lua" )

function wlls_login()
	local str_plname = GetName()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_plname)
	if (n_lid ~= 0) then
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level = WLLS_TAB[n_mytype].match_type[n_mtype].level
		local n_phase = GetGlbValue(GLB_WLLS_PHASE)
		if (n_phase >= 2) then
			local n_wday = tonumber(GetLocalDate("%w"))
			_M("n_wday="..n_wday)
			if (n_wday == 0 or n_wday >= 5) then
				Msg2Player("Hi�n �ang trong gian �o�n V� l�m li�n ��u, h�m nay t� <color=yellow>18:00~19:00<color> v� <color=yellow>21:00~22:00<color> c� ti�n h�nh <color=yellow>8<color> tr�n"..WLLS_LEVEL_DESC[n_level]..".")
			else
				Msg2Player("Hi�n �ang trong gian �o�n V� l�m li�n ��u, h�m nay t� <color=yellow>18:00~19:00<color> s� ti�n h�nh <color=yellow>4<color> tr�n"..WLLS_LEVEL_DESC[n_level]..".")
			end
		else
			local str = wlls_levelcheck()
			if (str) then
				Msg2Player(str)
			end
		end
		local str_lgname = LG_GetLeagueInfo(n_lid)
		local n_addtotal = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TOTAL)
		_M("wlls_login : n_addtotal="..n_addtotal)
		if (n_addtotal > 0) then
			local n_addwin = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_WIN)
			local n_addtie = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TIE)
			LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TOTAL, 0, "", "")
			LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_WIN, 0, "", "")
			LG_ApplySetMemberTask(WLLS_LGTYPE, str_lgname, str_plname, WLLS_LGMTASK_TIE, 0, "", "")
			wlls_award_pl(n_level, n_addwin, n_addtie, n_addtotal)
		end
	else
		local n_level = wlls_player_level()
		if (n_level > 0) then
			Msg2Player("B�n c� th� ��n g�p Quan vi�n b�o danh tham gia li�n ��u V� l�m.")
		end
	end
	wlls_sync_lginfo(n_lid)
end

--����һ��if�жϣ����Ա�����ؽű�ʱ�ı�����ʵ����ʹ����Ҳ���ᷢ������
if login_add then login_add(wlls_login, 2) end

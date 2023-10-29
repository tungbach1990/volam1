--�᳡����

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )

function main()
	local mm = ceil(( WLLS_TIMER_PREP_TOTAL - GetGlbValue(GLB_WLLS_TIME)) * WLLS_TIMER_PREP_FREQ / 60 )
	local tb_option = wlls_add_option({"�� ta chu�n b� ��!/wlls_want2leave"}, "Ti�p t�c thi ��u")
	Say("Th� v� h�i tr��ng: th�i gian b�t ��u thi ��u c�n"..mm.."ph�t, ng��i chu�n b� xong ch�a?", getn(tb_option), tb_option)
end

function wlls_want2leave()
	Say("Th� v� h�i tr��ng: Ng��i nh�t ��nh mu�n r�i kh�i? S�p thi ��u r�i! ��ng n�n b� l� th�i gian th� ��u!", 2, "Ta mu�n r�i kh�i ��y!/wlls_sure2leave", "Ta mu�n � l�i thi ��u!/OnCancel")
end

function wlls_sure2leave()
	SetLogoutRV(0);		--������������������㲻��ͬһ�ص�
	local n_signmap = wlls_get_mapid(1)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
end

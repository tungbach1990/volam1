Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\event\\great_night\\lantern\\create_lanterns.lua")
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\passerby\\passerby181\\passerby181_pst.spr>L� quan:<link>"

Great_Night_DiaStr = {
	"��m Huy Ho�ng",
	format("%s Huy chi ch��ng b�t ��u l�c 12h00 m�i ng�y. V� L�m Minh Ch� s� t�n t�m gieo tr�ng nh�ng h�t huy ho�ng. Sau 5 ph�t, c�c v� v� l�m nh�n s� c� th� b�t ��u h�i nh�ng qu� huy ho�ng ch�n n�y, �n v�o c�ng l�c s� t�ng ti�n.<enter>",DescLink_LiGuan),
	
	format("%s Ho�ng chi ch��ng b�t ��u m�i t�i <color=yellow>t� 19h55 gi� ��n 21h45 gi�<color>. Trong kho�ng th�i gian n�y, c�c v� ��i hi�p c� th� tham gia c�c ho�t ��ng �� ���c nh�n ��i ph�n th��ng. <enter> Tr��c m�t g�m c�c ho�t ��ng:  <enter>%s<enter>%s<enter>%s<enter>. C�c v� ��i hi�p v�o l�c <color=yellow>19h45<color> c� th� ��n g�p L� Quan �� h�i xem ho�t ��ng n�o ���c nh�n ��i ph�n th��ng trong ng�y.",DescLink_LiGuan,"Chi�n tr��ng T�ng Kim","Th�ch th�c th�i gian","Chu�i nhi�m v� D� T�u"),
	
	"T�m hi�u ho�t ��ng 'Huy ho�ng'/gn_huizhizhang",
	"T�m hi�u ho�t ��ng 'Ho�ng chi ch��ng'/gn_huangzhizhang",
	"Ch� l� �i d�o ch�i th�i!/OnCancel",
	"Tr� l�i/onGreat_Night",
	"Hi�u r�i/OnCancel",
}

function onGreat_Night()
	Describe(format("%s Tr��c m�t l� th�i gian m�a thu�n gi� h�a, �� ��p t� c�ng s�c ��ng g�p c�c v� ��i hi�p, V� l�m minh ch� ��c C� Ki�m �� t� ch�c ho�t ��ng <color=yellow>'��m huy ho�ng'<color>. Th�i gian b�t ��u ho�t ��ng m�i ng�y l� 12h00. <enter><color=yellow>12h00 tr�a nay s� di�n ra ho�t ��ng 'Huy chi ch��ng', nh�ng n�i s� xu�t hi�n qu� ho�ng kim l�:  %s<color><enter><color=yellow>19h45 h�m nay s� di�n ra ho�t ��ng 'Ho�ng chi ch��ng', ho�t ��ng nh�n ��i ph�n th��ng l�: %s<color><enter>",
				DescLink_LiGuan,
				"M�c B�c Th�o Nguy�n",
				huang_event_name()),
	 3, 
	Great_Night_DiaStr[4], 
	Great_Night_DiaStr[5],
	Great_Night_DiaStr[6]
 	)
end

function gn_huizhizhang()
	Describe(Great_Night_DiaStr[2],2,
	 Great_Night_DiaStr[7],
	 Great_Night_DiaStr[8])
end

function gn_huangzhizhang()
	Describe(Great_Night_DiaStr[3], 2, Great_Night_DiaStr[7], Great_Night_DiaStr[8])
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

function gn_lanternjoin()
	local area = gb_GetTask(GN_LANTERN_NAME_TSK, GN_LANTERN_TSK_MAP)
	if (area == 0 or area == nil) then
		Describe(DescLink_LiGuan.."Ho�t ��ng �o�n ch� 'Hoa ��ng' v�n ch�a b�t ��u! Xin tr� l�i sau nh�!", 1, "Ta bi�t r�i!/OnCancel")
		return
	end
	for i = 1, getn(tbLANTERNS_NPC) do
		if (area == tbLANTERNS_NPC[i][1]) then
			Describe(DescLink_LiGuan.."t�i nay ho�t ��ng 'Hoa ��ng' s� t� ch�c t�i <color=yellow>"..tbLANTERNS_NPC[i][7].."<color>, hay l� b�y gi� ��n �� tr��c nh�!", 2, "��n khu v�c �o�n ch� hoa ��ng/lantern_enter_lantern", "�� ta suy ngh� l�i ��!/OnCancel")
		end
	end
end

function lantern_enter_lantern()
	local nNowTime = tonumber(GetLocalDate("%H%M"));
	if (nNowTime < 1930 or nNowTime > 2001) then
		Describe(DescLink_LiGuan.."Ho�t ��ng �o�n ch� 'Hoa ��ng' v�n ch�a b�t ��u! Xin tr� l�i sau nh�!", 1, "Ta bi�t r�i!/OnCancel")
		return
	end
	
	local area = gb_GetTask(GN_LANTERN_NAME_TSK, GN_LANTERN_TSK_MAP)
	if (area == 0 or area == nil) then
		Describe(DescLink_LiGuan.."Ho�t ��ng �o�n ch� 'Hoa ��ng' v�n ch�a b�t ��u! Xin tr� l�i sau nh�!", 1, "Ta bi�t r�i!/OnCancel")
		return
	end
	local tb_enter_pos = tbLANTERN_ENTER_POS[area]
	if ( tb_enter_pos ~= nil ) then
		local randnum = random( getn( tb_enter_pos ) )
		NewWorld(area, tb_enter_pos[randnum][1], tb_enter_pos[randnum][2])
		SetFightState(1)
	end
end

function OnCancel()
end
WLLS_TB	= 1715
WLLS_TASKID_WIN		= WLLS_TB+5	--¸öÈËÊ¤Àû´ÎÊı
WLLS_TASKID_TIE		= WLLS_TB+6	--¸öÈËÆ½¾Ö´ÎÊı
WLLS_TASKID_TOTAL	= WLLS_TB+7	--¸öÈË²ÎÈü´ÎÊı
WLLS_TASKID_POINT	= 2500		--¸öÈËÀÛ¼Æ»ı·Ö
WLLS_TASKID_HONOUR	= 2501		--¸öÈËÈÙÓşµãÊı£¨¿ÉÏûºÄ»ı·Ö£©

--WLLS_TASKID_POINT	= 2500		--¸öÈËÀÛ¼Æ»ı·Ö£¨Ô½ÄÏ£©
WLLS_TASKID_HONOUR	= 2501		--¸öÈËÈÙÓşµãÊı£¨¿ÉÏûºÄ»ı·Ö£©

WLLS_TASKID_LGTYPE	= WLLS_TB+11	--Õ½¶ÓÀàĞÍ
WLLS_TASKID_LGPOINT	= WLLS_TB+12	--Õ½¶Ó»ı·Ö
WLLS_TASKID_LGRANK	= WLLS_TB+13	--Õ½¶ÓÅÅÃû
WLLS_TASKID_LGWIN	= WLLS_TB+14	--Õ½¶ÓÊ¤Àû´ÎÊı
WLLS_TASKID_LGTIE	= WLLS_TB+15	--Õ½¶ÓÆ½¾Ö´ÎÊı
WLLS_TASKID_LGTOTAL	= WLLS_TB+16	--Õ½¶Ó²ÎÈü´ÎÊı
WLLS_TASKID_LGTIME	= WLLS_TB+17	--Õ½¶ÓÕ½¶·Ê±¼ä

--ÎäÁÖÁªÈü
function showbwtaskdesc(nTaskIdx, nTaskGenre)
	--¸öÈËÕ½¼¨
	NewTask_TaskTextOut(nTaskGenre, "Thµnh tİch c¸ nh©n Vâ l©m ®¹i héi")
	local n_total = GetTask(WLLS_TASKID_TOTAL)
	local n_win = GetTask(WLLS_TASKID_WIN)
	local n_point = GetTask(WLLS_TASKID_POINT)
	local n_honour = GetTask(WLLS_TASKID_HONOUR)
	NewTask_DetailTextOut(nTaskGenre, "   tham gia tæng céng "..n_total.."trËn thi ®Êu, ®¹t ®­îc"..n_win.." lÇn chiÕn th¾ng, ®iÓm tİch lòy ®¹t ®­îc "..n_point.." . HiÖn cã thÓ tiªu hao ®iÓm vinh dù "..n_honour.." <enter>")
	--Õ½¶ÓĞÅÏ¢
	NewTask_TaskTextOut(nTaskGenre, "\n========== <color=red>Tin tøc chiÕn ®éi Vâ l©m ®¹i héi<color> ==========")
	local n_lgtype = GetTask(WLLS_TASKID_LGTYPE)
	tb_desc = {"Vâ l©m liªn ®Êu", "Vâ l©m liªn ®Êu"}
	if (n_lgtype > 0) then
		NewTask_DetailTextOut(nTaskGenre, "   B¹n ®· gia nhËp <color=red>"..tb_desc[n_lgtype].."<color>chiÕn ®éi<enter>")
		n_win = GetTask(WLLS_TASKID_LGWIN)
		n_total = GetTask(WLLS_TASKID_LGTOTAL)
		local n_tie = GetTask(WLLS_TASKID_LGTIE)
		local n_lose = n_total - n_tie - n_win
		n_point = GetTask(WLLS_TASKID_LGPOINT)
		local n_time = ceil(GetTask(WLLS_TASKID_LGTIME)/18)
		local f_rate = 0
		if (n_total > 0) then
			f_rate = n_win/n_total*100
		end
		local n_rank = GetTask(WLLS_TASKID_LGRANK)
		local str_rank
		if (n_rank > 1000) then
			str_rank = " Thø h¹ng sau <color=yellow>1000<color>"
		elseif (n_rank > 0) then
			str_rank = "  "..point2str(n_rank, 2).."  "
		else
			str_rank = " vÉn ch­a xÕp h¹ng "
		end
		NewTask_DetailTextOut(nTaskGenre, "   ®· tham gia ®Êu <color=yellow>"..n_total.."<color> trËn: ")
		NewTask_DetailTextOut(nTaskGenre, "     th¾ng <color=yellow>"..n_win.."<color>trËn, hßa <color=yellow>"..n_tie.."<color>trËn, thua<color=yellow>"..n_lose.."<color>trËn<enter>")
		NewTask_DetailTextOut(nTaskGenre, "     tû lÖ th¾ng <color=yellow>"..strsub(f_rate,1,4).."<color>%<enter>")
		NewTask_DetailTextOut(nTaskGenre, "   ®iÓm tİch lòy chiÕn ®éi: <color=yellow>"..n_point.."<color>   thêi gian thi ®Êu tİch lòy: <color=yellow>"..n_time.."<color>gi©y<enter>")
		NewTask_DetailTextOut(nTaskGenre, "<color=hblue>           << "..str_rank.." >>           <color>")
	else
		NewTask_DetailTextOut(nTaskGenre, "   B¹n vÉn ch­a nhËp chiÕn ®éi, ®Õn gÆp Quan viªn liªn ®Êu kiÖt xuÊt b¸o danh.<enter>")
	end
end


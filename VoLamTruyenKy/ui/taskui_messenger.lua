
--½«¿ªÏäĞòºÅ×ª»»³É×Ö·û´®
function get_task_string(nCode)
	local szRet = ""
	local nCount = 0
	if nCode then
		while(nCode > 0) do
			local nDigit = mod(nCode, 10)
			nCode = floor(nCode/10)
			if 0==nCount then
				szRet = format("%d",nDigit)
			else
				szRet = format("%d,%s",nDigit,szRet)
			end
			nCount = nCount+1
		end
	end
	return szRet,nCount
end

function showmessengerdesc(nTaskIdx, nTaskGenre) --´³¹ØÈÎÎñÖ®ĞÅÊ¹ÈÎÎñ
	Uworld1201 = GetTask(1201)
	Uworld1202 = GetTask(1202)
	Uworld1203 = GetTask(1203)
	Uworld1204 = GetTask(1204)
--	Uworld1205 = GetTask(1205)
--	Uworld1206 = GetTask(1206)
--	Uworld1207 = GetTask(1207)
--	Uworld1208 = GetTask(1208)
--	Uworld1209 = GetTask(1209)
--	Uworld1210 = GetTask(1210)
--	Uworld1211 = GetTask(1211)
--	Uworld1212 = GetTask(1212)
--	Uworld1213 = GetTask(1213)
--	Uworld1214 = GetTask(1214)
--	Uworld1215 = GetTask(1215)
--	Uworld1216 = GetTask(1216)
--	Uworld1218 = GetTask(1218)
	
	NewTask_TaskTextOut(nTaskGenre, "<color=red>Chµo mõng b¹n vµo giao diÖn nhiÖm vô:<color>")
--	NewTask_TaskTextOut(nTaskGenre, "ÄãÔÚ·çÖ®ÆïµØÍ¼ÖĞÀÛ»ı´¥ÅöµÄ±êÖ¾Îª£º"..Uworld1208)
--	NewTask_TaskTextOut(nTaskGenre, "ÄãÔÚÉ½ÉñÃíµØÍ¼ÖĞÀÛ»ı¸ÉµôµÄµ¶ÑıÎª£º"..Uworld1209)
--	NewTask_TaskTextOut(nTaskGenre, "ÄãÔÚÇ§±¦¿âµØÍ¼ÖĞÀÛ»ı¿ªÆôµÄ±¦ÏäÎª£º"..Uworld1210)
--	NewTask_TaskTextOut(nTaskGenre, "ÄãÄ¿Ç°µÄĞÅÊ¹»ı·ÖÎª£º"..Uworld1205)
	NewTask_TaskTextOut(nTaskGenre, "  <enter>")
	
	if ( Uworld1204 ~= 0 ) then
		NewTask_TaskTextOut(nTaskGenre, "Ng­¬i ®· nhËn ®­îc nhiÖm vô Tİn Sø Thiªn B¶o Khè.")
			
--		if ( Uworld1201 ~= 0 ) then -- ·çÖ®ÆïÈÎÎñ
--			if ( Uworld1201 == 10 ) then
--				NewTask_TaskTextOut(nTaskGenre, "Äã¿ÉÒÔÈ¥ÕÒ<color=red>³µ·ò<color>£¬´ÓËûÄÇÀï¾­¹ı½øÈë¿ì½İµØÍ¼<color=red>·çÖ®Æï<color>µ½´ïËÍĞÅµØµã¡£")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1201 == 20 ) then
--				NewTask_TaskTextOut(nTaskGenre, "ÄãÔÚ¸Ã¹Ø¿¨ĞèÒª´¥Åö<color=red>5Ã¶³âºò±êÖ¾<color>±ã¿ÉË³ÀûÍ¨¹ı¡£µ±È»£¬Äã¿ÉÒÔ×ÔÓÉÑ¡ÔñÁôÔÚ±¾¹ØµÄÊ±¼ä£¬Ö»ÒªÔÚ¹æ¶¨Ê±ÏŞÄÚÍ¨¹ı£¬²¢½«ĞÅ¼ã½»µ½Ä¿±ê³ÇÊĞæä¹Ù´¦¼´¿É¡£")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1201 == 30 ) then
--				NewTask_TaskTextOut(nTaskGenre, "ÄãÒÑ<color=red>´ïµ½<color>±¾¹ØµÄ¹ı¹ØÒªÇó£¬Çë¾¡¿ìÓëĞÅÊ¹ÁªÏµ¡£")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			end
--			NewTask_TaskTextOut(nTaskGenre, "ÄãĞèÒª´¥Åö<color=red>5Ã¶³âºò±êÖ¾<color>£¬Ä¿Ç°ÄãÒÑ´¥·¢ÁË<color=red>"..Uworld1207.."<color>Ã¶")
--		end
--		
--		if ( Uworld1202 ~= 0 ) then -- É½ÉñÃíÈÎÎñ
--			if ( Uworld1202 == 10 ) then
--				NewTask_TaskTextOut(nTaskGenre, "Äã¿ÉÒÔÈ¥ÕÒ<color=red>³µ·ò<color>£¬´ÓËûÄÇÀï¾­¹ı½øÈë¿ì½İµØÍ¼<color=red>É½ÉñÃí<color>µ½´ïËÍĞÅµØµã¡£")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1202 == 20 ) then
--				NewTask_TaskTextOut(nTaskGenre, "ÄãÔÚ¸Ã¹Ø¿¨ĞèÒª¸Éµô<color=red>Á½Ãûµ¶Ñı<color>±ã¿ÉË³ÀûÍ¨¹ı¡£µ±È»£¬Äã¿ÉÒÔ×ÔÓÉÑ¡ÔñÁôÔÚ±¾¹ØµÄÊ±¼ä£¬Ö»ÒªÔÚ¹æ¶¨Ê±ÏŞÄÚÍ¨¹ı£¬²¢½«ĞÅ¼ã½»µ½Ä¿±ê³ÇÊĞæä¹Ù´¦¼´¿É¡£")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1202 == 30 ) then
--				NewTask_TaskTextOut(nTaskGenre, "ÄãÒÑ<color=red>´ïµ½<color>±¾¹ØµÄ¹ı¹ØÒªÇó£¬Çë¾¡¿ìÓëĞÅÊ¹ÁªÏµ¡£")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			end
--			NewTask_TaskTextOut(nTaskGenre, "ÄãĞèÒª¸Éµô<color=red>Á½Ãûµ¶Ñı<color>£¬Ä¿Ç°ÄãÒÑÉ±ËÀÁË<color=red>"..Uworld1207.."<color>Ãû")
--		end
		
		if ( Uworld1203 ~= 0 ) then -- Ç§±¦¿âÈÎÎñ
			if ( Uworld1203 == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "Ng­¬i cã thÓ ®i t×m<color=yellow> Xa Phu <color>, tõ chç cña «ng ta ®i qua b¶n ®å Kho¸i TiÖp<color=yellow>Thiªn B¶o Khè<color> ®Õn ®Şa ®iÓm ®­a tin.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 20 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				NewTask_TaskTextOut(nTaskGenre, "T¹i nhiÖm vô cöa ¶i nµy ng­¬i c¨n cø <color=yellow>["..szTask.."]<color>Thø tù më 5 B¶o R­¬ng")
				NewTask_TaskTextOut(nTaskGenre, "Ng­¬i ®· më B¶o R­¬ng: <color=yellow>["..szFinish.."]<color>.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 21 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				NewTask_TaskTextOut(nTaskGenre, "Ng­¬i cã thÓ t×m<color=yellow> Xa Phu<color> ®­a ng­¬i ®i ®Õn b¶n ®å nhiÖm vô Thiªn B¶o Khè.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
				NewTask_TaskTextOut(nTaskGenre, "T¹i nhiÖm vô cöa ¶i nµy ng­¬i c¨n cø <color=yellow>["..szTask.."]<color>Thø tù më 5 B¶o R­¬ng")
				NewTask_TaskTextOut(nTaskGenre, "HiÖn t¹i ng­¬i ®· më B¶o R­¬ng: <color=yellow>["..szFinish.."]<color>.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 25 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				NewTask_TaskTextOut(nTaskGenre, "Chóc mõng ng­¬i ®· hoµn thµnh nhiÖm vô, nhanh chãng ®i t×m<color=yellow>Tiªu TrÊn<color>®i.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 30) then
				NewTask_TaskTextOut(nTaskGenre, "Ng­¬i ®·<color=yellow>®¹t ®Õn <color>yªu cÇu v­ît ¶i cña ¶i nµy, h·y nhanh chãng liªn hÖ víi Tİn Sø.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			end
		end
	else
		NewTask_TaskTextOut(nTaskGenre, "Ng­¬i vÉn ch­a nhËn nhiÖm vô Tİn Sø Thiªn B¶o Khè, cã thÓ ®Õn §¹i Lı hoÆc Thµnh §« t×m<color=yellow>DŞch Quan<color>nhËn nhiÖm vô.")
	end
end
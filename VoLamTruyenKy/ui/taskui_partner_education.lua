IncludeLib("FILESYS")
IncludeLib("PARTNER")

TabFile_Load( "\\settings\\task\\partner\\reward\\index_taskid.txt" , "taskindex");	 --»ñµÃÍ¬°éĞŞÁ·µÄ±í¸ñ


function showpartnerdesc(nTaskIdx, nTaskGenre) --Í¬°éÈÎÎñÏµÍ³
--------------------------------------------------------------Í¬°éĞŞÁ·ÈÎÎñ------------------------------------------------------
	NewTask_TaskTextOut(nTaskGenre, "<color=red>Chµo mõng b¹n ®Õn víi giao diÖn nhiÖm vô §ång hµnh: <color>")
	if ( GetTask(1237) ~= 0 ) then
		NewTask_TaskTextOut(nTaskGenre, "<color=red>B¹n tiÕp nhËn nhiÖm vô luyÖn cÊp §ång hµnh: <color>")
		local nRowCount = TabFile_GetRowCount("taskindex")
		for i=2, nRowCount do
			local real_taskid  = tonumber( TabFile_GetCell( "taskindex" ,i,"index_taskid"))
			if ( GetTask(1237) == real_taskid ) then
				local real_content   =	TabFile_GetCell( "taskindex" ,i , "index_content")
				NewTask_TaskTextOut(nTaskGenre, "B¹n cÇn ph¶i hoµn thµnh"..real_content.."nhiÖm vô. B¹n ®· tiªu diÖt xong"..GetTask(1236).."Con " )
			end
		end
	else
		--local NpcCount = PARTNER_Count() 
		NewTask_TaskTextOut(nTaskGenre, "NhiÖm vô luyÖn cÊp §ång hµnh ®· hoµn thµnh.")
		--if ( NpcCount ~= 0 ) then
			--for i=1,NpcCount do 
				--if (PARTNER_GetTaskValue(i,2) == 2) then
					--NewTask_TaskTextOut(nTaskGenre, "ÄãÒÑÍê³ÉÁË"..GetTask(1241).."¸öÍ¬°éĞŞÁ·ÈÎÎñ¡£¿ÉÒÔ»ØÈ¥ÁìÈ¡½±Àø£¬Ò²¿ÉÒÔ¿ªÆôÁíÒ»¸öĞŞÁ·¾íÖáÁË¡£" )
				--end		
			--end
		--end
	end	
	
-------------------------------------------------------------Í¬°é½ÌÓıÈÎÎñ---------------------------------------------------------
	if ( GetTask(1226) == 10 ) then
		NewTask_TaskTextOut(nTaskGenre, "<color=red>B¹n ®· tiÕp nhËn nhiÖm vô s¬ nhËp §ång hµnh: <color>")
		NewTask_TaskTextOut(nTaskGenre, "<color=yellow>NhiÖm vô s¬ nhËp §ång hµnh tiÕn hµnh ë chç cña L­ Thanh, §­êng ¶nh, H¾c B¹ch Song S¸t, Thu Y Thñy. B¹n ®· t×m qua ai råi?<color>")
		
		-------------------------------------------------Â¬Çà´¦-----------------------------------
		if ( GetTask(1227) == 10 ) then
			
			if ( GetTask(1232) == 255 ) and ( GetTask(1227) == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "B¹n ®· hoµn thµnh mäi nhiÖm vô ë chç Vâ sÜ, ®em Th¶o d­îc vÒ cho L­ Thanh.")
			else
				if ( GetBit(GetTask(1232),1) == 1 ) and ( GetBit(GetTask(1232),2) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô ®èi tho¹i víi M¹c TiÕu Phong lÊy ®­îc D­îc th¶o. T×m M¹c TiÕu Phong ®Ó nhËn phÇn th­ëng.")
				elseif ( GetBit(GetTask(1232),2) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô ë chç M¹c TiÕu Phong, ®Õn t×m Vâ sÜ lÊy D­îc th¶o.")
				end
				
				if ( GetBit(GetTask(1232),3) == 1 )  and ( GetBit(GetTask(1232),4) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Th¾ng c­îc §å phu Ng­u M·n M·n lÊy ®­îc D­îc th¶o. T×m Ng­u M·n M·n nhËn phÇn th­ëng.")
				elseif ( GetBit(GetTask(1232),4) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô ë chç Ng­u M·n M·n, ®Õn t×m Vâ sÜ lÊy D­îc th¶o.")
				end
				
				if ( GetBit(GetTask(1232),5) == 1 )  and ( GetBit(GetTask(1232),6) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô, ®èi tho¹i víi TiÓu §inh lÊy ®­îc Th¶o d­îc, t×m TiÓu §inh nhËn phÇn th­ëng.")
				elseif ( GetBit(GetTask(1232),6) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô ë chç TiÓu §inh, ®Õn t×m Vâ sÜ lÊy D­îc th¶o.")
				end
			
				if ( GetBit(GetTask(1232),7) == 1 )  and ( GetBit(GetTask(1232),8) == 0 )  then
					NewTask_TaskTextOut(nTaskGenre, "Th¾ng c­îc V©n T­íc Nhi, lÊy ®­îc Th¶o d­îc. T×m V©n T­íc Nhi nhËn phÇn th­ëng.")
				elseif ( GetBit(GetTask(1232),8) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô ë chç V©n T­íc Nhi, ®Õn t×m Vâ sÜ lÊy D­îc th¶o.")
				end
			end
			
		elseif ( GetTask(1227) == 20 ) then
			NewTask_TaskTextOut(nTaskGenre, "<color=red>B¹n ®· häc xong ë chç L­ Thanh, cã thÓ ®i t×m ng­êi kh¸c.<color>")
		end
		
		------------------------------------------ÌÆÓ°-------------------------------------
		if ( GetTask(1228) == 20 ) then
			NewTask_TaskTextOut(nTaskGenre, "<color=red>®· hoµn thµnh nhiÖm vô cña §­êng ¶nh.<color>")
		elseif ( GetTask(1228) == 8191 ) then
			NewTask_TaskTextOut(nTaskGenre, "§­êng ¶nh sau khi biÕt ®­îc tin tøc cña TiÓu Thu Y vui mõng kh«n xiÕt, cho b¹n biÕt nhiÒu bİ mËt liªn quan §ång hµnh. §èi tho¹i víi y lÇn n÷a ®Ó nhËn phÇn th­ëng.<color>")
		elseif ( GetBit(GetTask(1228),13) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "§­êng Thu Y b¶o b¹n vÒ gÆp cha c« ta. C« ta sÏ vÒ sau.")
		elseif ( GetBit(GetTask(1228),12) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "TiÓu Thu Y nãi thóc thóc kh«ng ch¬i víi c« bĞ. B¹n ra søc khuyªn c« bĞ, cuèi cïng c« bĞ còng theo b¹n vÒ. §èi tho¹i víi c« bĞ ®Ó l·nh phÇn th­ëng.")
		elseif ( GetBit(GetTask(1228),11) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "Tr¸c Phi Phµm nãi sau nói cã mét ®øa bĞ cã kh¶ n¨ng lµ §­êng Thu Y, h·y qua xem thö!")
		elseif ( GetBit(GetTask(1228),10) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "Tr¸c Phi Phµm nãi chuyÖn khiÕn ng­êi ta t­ëng h¾n bŞ ®iªn. §èi tho¹i víi y, xem y cho b¹n phÇn th­ëng g×.<color>")
		elseif ( GetTask(1228) == 511 ) then
			NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô chç C¬ Quan nh©n, ®i t×m Tr¸c Phi Phµm thö nghiÖm ®i!")
		elseif ( GetBit(GetTask(1228),1) == 1 ) then
			NewTask_TaskTextOut(nTaskGenre, "§­êng ¶nh nhê b¹n vµo con ®­êng thÇn bİ ®Ó cøu con cña «ng ta lµ §­êng Thu Y.")
			
			if ( GetBit(GetTask(1228),2) == 1 )  and ( GetBit(GetTask(1228),3) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô chç C¬ Quan nh©n thø 1, nhËn phÇn th­ëng")
			elseif ( GetBit(GetTask(1228),3) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nhËn phÇn th­ëng chç C¬ Quan nh©n thø 1, tiÕp tôc t×m C¬ Quan nh©n thø 2")
			end
				
			if ( GetBit(GetTask(1228),4) == 1 ) and ( GetBit(GetTask(1228),5) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô chç C¬ Quan nh©n thø 2, nhËn phÇn th­ëng")
			elseif ( GetBit(GetTask(1228),5) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nhËn phÇn th­ëng chç C¬ Quan nh©n thø 2, tiÕp tôc t×m C¬ Quan nh©n thø 3")
			end
				
			if ( GetBit(GetTask(1228),6) == 1 ) and ( GetBit(GetTask(1228),7) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô chç C¬ Quan nh©n thø 3, nhËn phÇn th­ëng")
			elseif ( GetBit(GetTask(1228),7) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nhËn phÇn th­ëng chç C¬ Quan nh©n thø 3, tiÕp tôc t×m C¬ Quan nh©n thø 4")
			end
				
			if ( GetBit(GetTask(1228),8) == 1 ) and ( GetBit(GetTask(1228),9) == 0 )  then
				NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô chç C¬ Quan nh©n thø 4, nhËn phÇn th­ëng")
			elseif ( GetBit(GetTask(1228),9) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "nhËn phÇn th­ëng chç C¬ Quan nh©n thø 4, tiÕp tôc t×m C¬ Quan nh©n thø 5")
			end
		end
		
		------------------------------------------------°×É·-------------------------------------------
			if ( GetTask(1229) == 20 ) then
				NewTask_TaskTextOut(nTaskGenre, "<color=red>Hoµn thµnh nhiÖm vô cña B¹ch S¸t.<color>")
			elseif ( GetTask(1229) == 31 ) then
				NewTask_TaskTextOut(nTaskGenre, "quay vÒ t×m B¹ch S¸t ®èi tho¹i.")
			elseif (  GetBit(GetTask(1229),1) == 1 ) then
				NewTask_TaskTextOut(nTaskGenre, "B¹ch S¸t nhê b¹n ®i vµo th¸p Tam §¹o Sü vµ miÕu thê T¹ qu¶ phô ë phİa nam V©n Trung TrÊn ®Ó cøu 2 ®Ö tö cña «ng ta")
				
				if (  GetBit(GetTask(1229),2) == 1 ) and  (  GetBit(GetTask(1229),3) == 0 ) then
					NewTask_TaskTextOut(nTaskGenre, "Khóc V¹n cho b¹n biÕt nhiÒu ®iÒu liªn quan ®Õn §ång hµnh. §èi tho¹i víi y ®Ó nhËn phÇn th­ëng.")
				elseif (  GetBit(GetTask(1229),3) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Sau khi ®èi tho¹i víi Khóc V¹n, ®Õn t×m 1 vŞ ®Ö tö kh¸c cña B¹ch S¸t lµ T¹ Thanh Nhi. C« ta ë miÕu thêi T¹ qu¶ phô.")
				end
				
				if (  GetBit(GetTask(1229),4) == 1 ) and  (  GetBit(GetTask(1229),5) == 0 ) then
					NewTask_TaskTextOut(nTaskGenre, "T¹ Thanh Nhi lµ mét c« g¸i kiªn c­êng, kh«ng khuÊt phôc tr­íc sè mÖnh. Tin r»ng ng­¬i còng nh­ thÕ, ®èi tho¹i víi c« ta ®Ó l·nh phÇn th­ëng.")
				elseif (  GetBit(GetTask(1229),5) == 1 ) then
					NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô ë chç T¹ Thanh Nhi, ®Õn t×m 1 vŞ ®Ö tö kh¸c cña B¹ch S¸t lµ Khóc V¹n. Y ®îi b¹n ë th¸p Tam §¹o sÜ.")
				end
			end
			
			-------------------------------------------ºÚÉ·----------------------------------
			if ( GetTask(1230) == 20 ) then
				NewTask_TaskTextOut(nTaskGenre, "<color=red>Hoµn thµnh nhiÖm vô ë chç H¾c S¸t.<color>")
			elseif ( GetTask(1230) == 16 ) then
				NewTask_TaskTextOut(nTaskGenre, "H¾c S¸t tuy nghiªm kh¾c cùc ®oan nh­ng th­ëng ph¹t ph©n minh. §èi tho¹i víi H¾c S¸t ®Ó nhËn phÇn th­ëng.")
			elseif ( GetTask(1230) == 15 ) then
				NewTask_TaskTextOut(nTaskGenre, " ®¸nh xong bao c¸t, cã thÓ quay l¹i gÆp l·o gia ta thØnh gi¸o")
			elseif ( GetTask(1230) == 14 ) then
				NewTask_TaskTextOut(nTaskGenre, "L·o Gia Tö b¶o b¹n ®i vµo hiÖu vâ tr­êng ®¸nh bao c¸t. Xem ra kh«ng ®¸nh ®ñ sè lÇn th× kh«ng thÓ giao nhiÖm vô.")	
			elseif ( GetTask(1230) == 13 ) then
				NewTask_TaskTextOut(nTaskGenre, "B¹n nhËn ®­îc 1 quyÓn MËt ®å thÇn bİ#Nam Minh Tam §o¹n Kİch. §èi tho¹i víi «ng ta, xem «ng ta cßn kiÓm tra g× n÷a")			
			elseif ( GetTask(1230) == 12 ) then
				NewTask_TaskTextOut(nTaskGenre, "LÊy ®­îc MËt tŞch, vÒ gÆp H¾c S¸t phôc mÖnh.")	
			elseif ( GetTask(1230) == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "L·o Gia Tö b¶o b¹n d¾t ng­êi ®Ö tö bİ mËt trong hiÖu vâ tr­êng cña «ng.")	
			end
			
			
			------------------------------------------ÇïÒÂË®-----------------------------------------
			if ( GetTask(1231) == 20 ) then
				NewTask_TaskTextOut(nTaskGenre, "<color=red>NhiÖm vô Thu Y Thñy ®· hoµn thµnh.<color>")
			elseif ( GetTask(1231) == 18 ) then
				NewTask_TaskTextOut(nTaskGenre, "Hoµn thµnh nhiÖm vô ë chç Long B¸t, quay vÒ t×m Thu ®¹i tû!")
			elseif ( GetTask(1231) == 17 ) then
				NewTask_TaskTextOut(nTaskGenre, "Tr¶ lêi ®óng c©u hái cña Long B¸t quay vÒ t×m y nhËn th­ëng.")
			elseif ( GetTask(1231) == 16 ) then
				NewTask_TaskTextOut(nTaskGenre, "NhËn phÇn th­ëng tõ Long B¸t, xem y cßn lêi g× muèn nãi?")	
			elseif ( GetTask(1231) == 15 ) then
				NewTask_TaskTextOut(nTaskGenre, "§· hoµn thµnh nhiÖm vô, h·y ®i ®èi tho¹i víi Long B¸t.")			
			elseif ( GetTask(1231) == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "Thu Y Thñy b¶o b¹n ®Õn Long V­¬ng ®µi t×m Long B¸t lÊy MËt tŞch, më ra xem vµ ®¸nh cäc gç ®Ó luyÖn c«ng.<color>")	
			end
		elseif ( GetTask(1226) == 20 ) and (  GetBit(GetTask(1232),20) == 0 ) then		
			NewTask_TaskTextOut(nTaskGenre, "§èi tho¹i víi KiÕm Hoµng ®Ö tö.")	
		elseif  ( GetTask(1226) == 20 ) and (  GetBit(GetTask(1232),20) == 1 ) then		
			NewTask_TaskTextOut(nTaskGenre, "tr¶ lêi thµnh c«ng c©u hái cña KiÕm Hoµng ®Ö tö, quay vÒ t×m y l·nh th­ëng.")	
	end

end
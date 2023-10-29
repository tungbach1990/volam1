-- ÏÔÊ¾ÊÀ½çÈÎÎñµÄ¹ı³Ì
function showworldtaskdesc(nTaskIdx, nTaskGenre)
	local Uworld1066  = GetTask(1066)
	local Uworld1065  = GetTask(1065)
	
	local myWorldText = {
			[0]="B¹n nghe ®ån TÜnh S­ (205, 199) ë<color=red> T©y S¬n th«n<color> rÊt am hiÓu vÒ T©y S¬n tù.",
			[1]="TÜnh S­ cho b¹n biÕt vµi ®iÒu vÒ T©y S¬n LÜnh, nh­ng «ng b¶o b¹n ®i thu thËp 500 quyÓn <color=red>MËt ®å thÇn bİ<color> ",
			[2]="B¹n giao 500 quyÓn MËt tŞch giao cho TÜnh S­, TÜnh S­ b¶o b¹n vµo th«n (214, 195) t×m <color=red>T©y S¬n TiÓu NhŞ<color>, Y sÏ dÉn b¹n ®i T©y S¬n LÜnh."
			}
			
	local CollectMeatText = {
			[0]="NhiÖm vô T©n Thñ th«n lÊy thŞt t­¬i",
			[1]="B¹n ®Õn gÆp Vâ s­ tiÕp nhËn nhiÖm vô ®Õn T©n Thñ th«n hoÆc ngoµi thµnh ®¸nh qu¸i lÊy thŞt t­¬i, Vâ s­ yªu cÇu b¹n lÊy ®­îc"..Uworld1066.."miÕng thŞt t­¬i."
	}
	
	--local myTaskValue = GetTask(1064)

	--if (GetLevel()>=100) then		
	--	if (myTaskValue < 2) then
	--		NewTask_TaskTextOut(nTaskGenre, myWorldText[myTaskValue])
	--	else
	--		NewTask_TaskTextOut(nTaskGenre, myWorldText[2])			
	--	end
	--	NewTask_TaskTextOut(nTaskGenre, "<enter>")
	--end
	
	if ( Uworld1066 ~= 0 ) then
		NewTask_TaskTextOut(nTaskGenre, CollectMeatText[0])
		NewTask_TaskTextOut(nTaskGenre, CollectMeatText[1])
		NewTask_TaskTextOut(nTaskGenre, "<enter>")
	end
	
	NewTask_TaskTextOut(nTaskGenre, "B¹n hiÖn cã "..Uworld1065.."miÕng thŞt t­¬i. §em thŞt t­¬i t×m Vâ s­ tiÕp nhËn nhiÖm vô mua b¸n thŞt ®Ó nhËn phÇn th­ëng.")

	--storm_task(nTaskIdx, nTaskGenre)		--Storm ÈÎÎñÃæ°æ
	--zq_mooncake_task(nTaskIdx, nTaskGenre)	--ÖĞÇïÔÂ±ı
end


--Storm ÈÎÎñÃæ°æ ----------------------------------------------------------------------------------------------
function storm_task(nTaskIdx, nTaskGenre)
	--µÃµ½×îºóÒ»´Î´¥·¢»ı·ÖÏµÍ³µÄÈÕÆÚ
	local n_date = GetTask(1678)
	local str_date = floor(n_date/10000).."."..floor(mod(n_date,10000)/100).."."..mod(n_date,100)
	str_date = "<color=white>("..str_date..")<color>"
	
	if (GetTask(1661) > 275) then
		NewTask_TaskTextOut(nTaskGenre, "<enter>'<color=red>Phong ba th¸ng 9<color>' ho¹t ®éng ®· kÕt thóc!")
	else
		NewTask_TaskTextOut(nTaskGenre, "<enter>'<color=red>Phong ba th¸ng 9<color>' t×nh h×nh ho¹t ®éng h«m nay"..str_date..":<enter>")
		NewTask_DetailTextOut(nTaskGenre, " tªn ho¹t ®éng   sè lÇn   tr¹ng th¸i   ®iÓm tİch lòy cao nhÊt<enter>")
		storm_gamedetail("ChiÕn tr­êng Tèng Kim", 1, 1681, 1682, 1685)
		storm_gamedetail("s¸t thñ ", 2, 1687, 1688, 1691)
		--storm_gamedetail("ĞÅÊ¹ÈÎÎñ", 1, 1693, 1694, 1697)
		storm_gamedetail("NhiÖm vô D· TÈu", 1, 1699, 1700, 1703)
	end
	NewTask_TaskTextOut(nTaskGenre, "<enter>'<color=red>Phong ba th¸ng 9<color>'   t×nh h×nh ®iÓm tİch lòy gÇn ®©y"..str_date..":<enter>")
	NewTask_DetailTextOut(nTaskGenre, " §iÓm tİch lòy h«m nay:"..point2str(GetTask(1662)).."     §iÓm tİch lòy h«m qua:"..point2str(GetTask(1663)).."<enter>")
	NewTask_DetailTextOut(nTaskGenre, " §iÓm tİch lòy tuÇn nµy:"..point2str(GetTask(1667)).."     §iÓm tİch lòy tuÇn tr­íc:"..point2str(GetTask(1668)).."<enter>")
	NewTask_DetailTextOut(nTaskGenre, " §iÓm tİch lòy th¸ng nµy:"..point2str(GetTask(1672)).."     §iÓm tİch lòy th¸ng tr­íc:"..point2str(GetTask(1673)).."<enter>")
end

--ÏÔÊ¾Ö¸¶¨»î¶¯µÄ·ç±©»ı·Ö²ÎÓëÇé¿ö
function storm_gamedetail(nTaskIdx, nTaskGenre, name, max_count, task_start, task_count, task_point)
	local trycount = GetTask(task_count)
	local str = "[<color=green>"..name.."<color>]   "..point2str(trycount,1).."/"..max_count.."   "
	if (GetTask(task_start) > 0) then
		str = str.."<color=red>§ang tiÕn hµnh<color>"
	elseif (trycount <= 0) then
		str = str.."<color=blue>Ch­a tiÕn hµnh<color>"
	elseif (trycount < max_count) then
		str = str.."<color=green>§· tiÕn hµnh<color>"
	else
		str = str.."<color=8947848>§· kÕt thóc<color>"
	end
	str = str.."   "..point2str(GetTask(task_point)).."<enter>"
	NewTask_DetailTextOut(nTaskGenre, str)
end


--ÖĞÇï ÔÂ±ıÃæ°æ --------------------------------------------------------------------------------------------------
ZQ_MOONCAKE_TYPE = {"B¸nh Trung Thu thËp cÈm", "B¸nh Trung Thu Qu¶ Nh©n", "B¸nh Trung thu sen trøng", "B¸nh Trung Thu §Ëu Trøng", "B¸nh Trung thu h¹t sen ", "B¸nh Trung Thu §Ëu Xanh"}
ZQ_MOONCAKE_LIFE = {10, 5, 3, 3, 3, 3}
ZQ_MOONCAKE_STAT = {{3,"nhµo bét",98}, {5,"lµm nh©n b¸nh",77}, {7,"n­íng b¸nh",104}}

function zq_mooncake_task(nTaskIdx, nTaskGenre)
	local n_taskvalue = GetTask(1569)
	local n_cake_type = floor(n_taskvalue/1000)
	local n_cake_stat = mod(n_taskvalue, 1000)
	NewTask_TaskTextOut(nTaskGenre, "<enter>Ho¹t ®éng lµm b¸nh Trung thu:<enter>")
	if (n_cake_type == 0) then
		NewTask_DetailTextOut(nTaskGenre, "   vÉn ch­a b¾t ®Çu!~~~<pic=5><enter>"
			.."     Mau ®Õn ®©y lµm! <pic=59>!<enter>")
	else
		NewTask_DetailTextOut(nTaskGenre, "  <color=green><bclr=dgreen>"..ZQ_MOONCAKE_TYPE[n_cake_type].."<bclr><color>")
		if (n_cake_stat == 1 or n_cake_stat == 2) then
			NewTask_DetailTextOut(nTaskGenre, "   Chao «i! ChiÕc b¸nh nµy ®· bŞ n­íng khĞt råi!~~<pic=10><enter>")
		else
			NewTask_DetailTextOut(nTaskGenre, "      <Tr×nh tù>     <Tr¹ng th¸i><enter>")
			local str = ""
			for _, tb_stat in ZQ_MOONCAKE_STAT do
				if (n_cake_stat == tb_stat[1]-1 or n_cake_stat == tb_stat[1]) then
					str = str.."   <pic=115>"
				else
					str = str.."      "
				end
				str = str.."<color=white><bclr=fire>"..tb_stat[2].."<bclr><color>     "
				if (n_cake_stat < tb_stat[1]) then
					str = str.."<color=hblue>ch­a tiÕn hµnh<color>"
				elseif (n_cake_stat == tb_stat[1]) then
					str = str.."<color=yellow>®ang tiÕn hµnh<color><pic=99>"
				else
					str = str.."<color=green>®· hoµn thµnh<color><pic="..tb_stat[3]..">"
				end
				str = str.."<enter>"
			end
			if (n_cake_stat == 4 or n_cake_stat == 6 or n_cake_stat == 8) then
				str = str.."<enter>   H·y ®Õn <color=yellow>Thî b¸nh<color>xem sao.<color><enter>"
			end
			NewTask_DetailTextOut(nTaskGenre, str)
		end
	end
end

--·µ»ØÖ¸¶¨³¤¶È¡¢´øÑÕÉ«µÄ×Ö·û´®
--len£º	Ö¸¶¨³¤¶È£¬nilÎªÄ¬ÈÏÖµ
function point2str(point, len, color)
	if not color then
		color = "yellow"
	end
	local str = tostring(point)
	if (len == nil) then
		len = 4
	end
	
	while (strlen(str) < len) do
		str = " "..str
	end
	
	return "<color="..color..">"..str.."<color>"
end
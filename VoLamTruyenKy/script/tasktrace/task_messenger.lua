function messengerdesc() --´³¹ØÈÎÎñÖ®ÐÅÊ¹ÈÎÎñ
	local myTaskInfo = ""
	local Uworld1204 = GetTask(1204)
	local Uworld1205 = GetTask(1205)
	if (Uworld1204 ~= 0 ) then
		local Uworld1201 = GetTask(1201)
		local Uworld1202 = GetTask(1202)
		local Uworld1203 = GetTask(1203)	
		if (Uworld1203 ~= 0 ) then -- Ç§±¦¿âÈÎÎñ
			if ( Uworld1203 == 10 ) then
				myTaskInfo = myTaskInfo.."Ng­¬i h·y ®Õn b¶n ®å <color=yellow>Thiªn B¶o Khè<color>."
			elseif ( Uworld1203 == 20 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				myTaskInfo = myTaskInfo.."Ng­¬i ph¶i më 5 B¶o R­¬ng <color=yellow>["..szTask.."]<color>.<enter>"
				myTaskInfo = myTaskInfo.."§· më: <color=yellow>["..szFinish.."]<color>."
			elseif ( Uworld1203 == 21 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				myTaskInfo = myTaskInfo.."Ng­¬i ph¶i më 5 B¶o R­¬ng <color=yellow>["..szTask.."]<color>.<enter>"
				myTaskInfo = myTaskInfo.."§· më: <color=yellow>["..szFinish.."]<color>."
			elseif ( Uworld1203 == 25 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				myTaskInfo = myTaskInfo.."§· hoµn thµnh nhiÖm vô,h·y t×m <color=yellow>Tiªu TrÊn<color>."
			elseif ( Uworld1203 == 30) then
				myTaskInfo = myTaskInfo.."§· <color=yellow>hoµn thµnh <color>nhiÖm vô, h·y t×m <color=yellow>DÞch quan<color>."
			end
		else
			if (Uworld1201==10) then
				myTaskInfo = myTaskInfo.."Ng­¬i h·y ®Õn b¶n ®å <color=yellow>Phong Kú<color>."
			elseif (Uworld1201==20) then
				local nToaDo = GetTask(1207)
				myTaskInfo = myTaskInfo.."Ph¶i më 5 täa ®é trinh s¸t. HiÖn t¹i ®· më ®­îc <color=yellow>"..nToaDo.."<color> c¸i."
			elseif (Uworld1201==30) then
				myTaskInfo = myTaskInfo.."§· <color=yellow>hoµn thµnh <color>nhiÖm vô, h·y t×m <color=yellow>DÞch quan<color>."
			end
			if (Uworld1202==10) then
				myTaskInfo = myTaskInfo.."Ng­¬i h·y ®Õn b¶n ®å <color=yellow>S¬n ThÇn MiÕu<color>."
			elseif (Uworld1202==20) then
				local nBoss = GetTask(1207)
				myTaskInfo = myTaskInfo.."CÇn giÕt 2 tªn §ao Yªu. HiÖn t¹i ®· tiªu diÖt <color=yellow>"..nBoss.."<color> con."
			elseif (Uworld1202==30) then
				myTaskInfo = myTaskInfo.."§· <color=yellow>hoµn thµnh <color>nhiÖm vô, h·y t×m <color=yellow>DÞch quan<color>."
			end
		end
	else
		myTaskInfo = "HiÖn cã <color=yellow>"..Uworld1205.."<color> ®iÓm th­ëng. NhËn nhiÖm vô t¹i:"
		myTaskInfo = myTaskInfo.."<enter><color=yellow>Phong Kú<color>: BiÖn Kinh, D­¬ng Ch©u"
		myTaskInfo = myTaskInfo.."<enter><color=yellow>S¬n ThÇn MiÕu<color>: Ph­îng T­êng, L©m An"
		myTaskInfo = myTaskInfo.."<enter><color=yellow>Thiªn B¶o Khè<color>: T­¬ng D­¬ng, Thµnh §«"
	end
	return myTaskInfo
end

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
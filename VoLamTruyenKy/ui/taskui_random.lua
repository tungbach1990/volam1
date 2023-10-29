IncludeLib("FILESYS")


-- ÈÎÎñÁ´¶ÁÈ¡ÎÄ¼şÊ±µÄ×Ö·û´®¶¨Òå
TL_BUYGOODS = "TaskLink_BuyGoods"
TL_FINDGOODS = "TaskLink_FindGoods"
TL_SHOWGOODS = "TaskLink_ShowGoods"
TL_FINDMAPS = "TaskLink_FindMaps"
TL_UPGROUND = "TaskLink_UpGround"
TL_WORLDMAPS = "TaskLink_WorldMaps"


-- Ëæ»úÈÎÎñ
function showrandraskdesc(nTaskIdx, nTaskGenre)
	local myTaskMainInfo,myTaskOrder,myTaskInfo1,myTaskInfo2,myTaskInfo3 -- ÓÃÒÔÏÔÊ¾¾ßÌåÈÎÎñËµÃ÷µÄ×Ö·û
	
	local myTaskType = GetTask(1021)
	local myTaskCol = GetTask(1030)
	
	local myTaskCourse = GetTask(1028)
	
	local nNeedNum = 0;

	if (myTaskType == 0) then
		NewTask_TaskTextOut(nTaskGenre, "B¹n ch­a tiÕp nhËn nhiÖm vô cña D· TÈu, cã thêi gian h·y ®Õn gÆp «ng ta xem!")
		return 
	end
	
	if (myTaskType==1) then -- Èç¹ûÊÇ¹ºÂòÎïÆ·µÄÈÎÎñ
	
		TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
		
		myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS,myTaskCol,"TaskInfo1")
		myTaskInfo2 = TabFile_GetCell(TL_BUYGOODS,myTaskCol,"TaskInfo")
		myTaskMainInfo = "®Õn  "..myTaskInfo2.." mua  "..myTaskInfo1.."  cho D· TÈu."
			
	elseif (myTaskType==2) then -- Èç¹ûÊÇÎïÆ·Ñ°ÕÒµÄÈÎÎñ
		
		TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
		
		-- Ä§·¨ÊôĞÔ
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"MagicCnName")
		-- ¾ßÌåµÄÎäÆ÷Àà±ğ
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"TaskInfo")
		-- ×îĞ¡Ä§·¨ÊôĞÔ
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"MinValue")
		-- ×î´óÄ§·¨ÊôĞÔ
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"MaxValue")
		
		if (myTaskOrder=="n") then
			myTaskMainInfo = "®i t×m"..myTaskInfo1.." gióp ta."
		else
			myTaskMainInfo = "®i t×m"..myTaskOrder.." thÊp nhÊt lµ "..myTaskInfo2.." lín nhÊt lµ "..myTaskInfo3.." "..myTaskInfo1.." vÒ cho D· TÈu!"
		end
		
	elseif (myTaskType==3) then
	
		TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
	
			-- Ä§·¨ÊôĞÔÖĞÎÄÃû
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MagicCnName")
		-- Ä§·¨ÊôĞÔµÄ×îĞ¡Öµ
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MinValue")
		-- Ä§·¨ÊôĞÔµÄ×î´óÖµ
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MaxValue")
		
		myTaskMainInfo = "§i t×m bé trang bŞ "..myTaskOrder.." thÊp nhÊt lµ "..myTaskInfo1.." cao nhÊt lµ "..myTaskInfo2.." cho D· tÈu!"
		
	elseif (myTaskType==4) then
	
		TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
	
		-- µØÍ¼µÄÃû³Æ
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS,myTaskCol,"TaskInfo1")
		-- ËùÒªµÄµØÍ¼ÊıÁ¿
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS,myTaskCol,"Num")		
		-- µØÍ¼µÄÀàĞÍ
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS,myTaskCol,"MapType")
		
		if (tonumber(myTaskInfo2) == 1) then
			myTaskInfo3 = "§Şa §å chİ "
		else
			myTaskInfo3 = "MËt chİ "
		end
		
		myTaskMainInfo = "§Õn <color=yellow>"..myTaskOrder.."<color> t×m <color=yellow>"..myTaskInfo1.."<color> quyÓn"..myTaskOrder..myTaskInfo3.." vÒ cho D· TÈu!".."B¹n hiÖn ®· thu thËp ®­îc <color=yellow>"..GetTask(1025).."<color> tÊm"..myTaskInfo3
		
	elseif (myTaskType==5) then

		TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)

		-- ĞèÒªÌáÉıµÄÊıÖµÀàĞÍ
		myTaskOrder = TabFile_GetCell(TL_UPGROUND,myTaskCol,"NumericType")
		-- ĞèÒªÌáÉıµÄÊıÖµ×ÜÊı
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND,myTaskCol,"NumericValue")
		
		if (tonumber(myTaskOrder) == 1) then
			myTaskInfo2 = " cÊp"
		elseif (tonumber(myTaskOrder) == 2) then
			myTaskInfo2 = "®iÓm kinh nghiÖm "
		elseif (tonumber(myTaskOrder) == 3) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetRepute();
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "®iÓm danh väng. Danh väng cña b¹n hiÖn t¹i lµ "..GetRepute().." ®iÓm, cÇn ph¶i n©ng lªn"..nNeedNum.." ®iÓm,"
		elseif (tonumber(myTaskOrder) == 4) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetTask(151);
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "®iÓm phóc duyªn. Phóc duyªn cña b¹n hiÖn t¹i lµ "..GetTask(151).." ®iÓm, cÇn ph¶i n©ng lªn"..nNeedNum.." ®iÓm,"
		elseif (tonumber(myTaskOrder) == 5) then
			myTaskInfo2 = "®iÓm PK"
		elseif (tonumber(myTaskOrder) == 6) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetTask(747);
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "®iÓm th­ëng Tèng Kim, ®iÓm th­ëng cña b¹n hiÖn lµ "..GetTask(747).." ®iÓm, cÇn ph¶i n©ng lªn"..nNeedNum.." ®iÓm,"
		end
		
		myTaskMainInfo = "§i n©ng cÊp   "..myTaskInfo1.." "..myTaskInfo2
		
	elseif (myTaskType==6) then
	
		TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
	
		-- ĞèÒªÊÕ¼¯µÄÉ½ºÓÉçğ¢Í¼²ĞÆ¬
		myTaskOrder = TabFile_GetCell(TL_WORLDMAPS,myTaskCol,"Num")
		
		myTaskMainInfo = "®Õn ®­a D· TÈu "..myTaskOrder.." m¶nh b¶n ®å S¬n Hµ X· T¾c.".."B¹n hiÖn ®· thu thËp ®­îc <color=yellow>"..GetTask(1027).."<color> tÊm."
		
	end
	
	if (myTaskCourse==1) then
		NewTask_TaskTextOut(nTaskGenre, AEXP_TASKDESCWORKING..myTaskMainInfo)
	elseif (myTaskCourse==2) or (myTaskCourse==3) then
		NewTask_TaskTextOut(nTaskGenre, AEXP_TASKDESCCOMPLETE..myTaskMainInfo)
	end
	
end
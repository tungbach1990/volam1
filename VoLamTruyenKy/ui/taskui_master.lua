IncludeLib("FILESYS")


--¾çÇéÈÎÎñtabfileÂ·¾¶
AEXP_PASSTASK_1			=	"\\settings\\task\\newtask\\mastertask\\mainpasstask.txt"
AEXP_PASSAUXTASK_1		= 	"\\settings\\task\\newtask\\branch\\auxpasstask.txt"

--¾çÇéÈÎÎñtabfileÁĞÃû
AEXP_PASSTASK_TASKID	= 	"TaskId"
AEXP_PASSTASK_LEVEL		= 	"Level"
AEXP_PASSTASK_VALUE 	= 	"Value"
AEXP_PASSTASK_DESC		= 	"Desc"
AEXP_PASSTASK_TEXT		= 	"Text"
AEXP_PASSTASK_TITLE		=	"Title"
AEXP_PASSTASK_MINLEVEL	= 	"MinLevel"
AEXP_PASSTASK_MAXLEVEL	= 	"MaxLevel"
AEXP_PASSTASK_PARENTID	=	"ParentTaskId"

--Èç¹ûÈÎÎñÎª¸ÃÖµÄÇÃ´±íÊ¾¸ÃTaskIdµÄÈÎÎñÒÑ¾­Íê³É
--ÔÚÅäÖÃÎÄ¼şÖĞ²»ĞèÒªĞ´1000£¬·ñÔò»á¸ßÁÁÏÔÊ¾
AEXP_COMPLETE_VALUE = 1000

function showpasstaskdesc_tutor(nTaskIdx, nTaskGenre)
	showpasstaskdesc(nTaskIdx, nTaskGenre, 1000);
end

function showpasstaskdesc_zheng(nTaskIdx, nTaskGenre)
	showpasstaskdesc(nTaskIdx, nTaskGenre, 1001);
end

function showpasstaskdesc_zhong(nTaskIdx, nTaskGenre)
	showpasstaskdesc(nTaskIdx, nTaskGenre, 1002);
end

function showpasstaskdesc_xie(nTaskIdx, nTaskGenre)
	showpasstaskdesc(nTaskIdx, nTaskGenre, 1003);
end

--¾çÇéÈÎÎñÏÔÊ¾µÄÖ÷º¯Êı
function showpasstaskdesc(nTaskIdx, nTaskGenre, nTaskValueID)
	--Ê×ÏÈµÃµ½µ±Ç°µÄÈÎÎñ±äÁ¿
	local nMyTaskValue = GetTask(nTaskValueID)
	if (0 == nMyTaskValue) then
		NewTask_TaskTextOut(nTaskGenre, "HiÖn b¹n vÉn ch­a tiÕp nhËn nhiÖm vô!")
		return 
	end
	
	--½«ÈÎÎñÉèÖÃÎªÍê³É
	if (AEXP_COMPLETE_VALUE == nMyTaskValue) then
		NewTask_SetFinishedTask(nTaskGenre, nTaskIdx)
	end
	
	--´ò¿ªÖ÷ÈÎÎñµÄtabfile
	if (TabFile_Load(AEXP_PASSTASK_1, AEXP_PASSTASK_1) == 0) then
		print("Load TabFile Error!"..AEXP_PASSTASK_1)
		return
	end
	--°ÑÖ§ÏßÈÎÎñµÄfileÒ²¸ø´ò¿ª°É
	if (TabFile_Load(AEXP_PASSAUXTASK_1, AEXP_PASSAUXTASK_1) == 0) then
		print("Load TabFile Error!"..AEXP_PASSAUXTASK_1)
		return
	end

	local blnFindTask = 0
	local nRowCount = tonumber(TabFile_GetRowCount(AEXP_PASSTASK_1))
	local nRowAuxCount = tonumber(TabFile_GetRowCount(AEXP_PASSAUXTASK_1))
	local nPreLevel = -1		--Ö÷ÈÎÎñĞèÒª¼ÇÂ¼Ç°Ò»¸öµÄÈÎÎñµÈ¼¶£¬µ±µÈ¼¶Ìø±äÊ±ÏÔÊ¾Ö§ÏßÈÎÎñµÄĞÅÏ¢
	--±éÀúºÍÖ÷ÏßÈÎÎñ¶ÔÓ¦µÄID
	for nIndex = 2, nRowCount do
		local nFileTaskID = tonumber(TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_TASKID))
		--Èç¹ûÒÑ¾­±éÀú¹ıÒªÕÒµÄTaskIdÄÇÃ´Ìø³ö
		if (blnFindTask == 1 and nFileTaskID > nTaskValueID) then
			break
		end
		
		if (nFileTaskID == nTaskValueID) then
			local nFileTaskValue = tonumber(TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_VALUE))
			if (nMyTaskValue < nFileTaskValue) then
				--¾¹È»±ÈÎÒ¶¼Ğ¡£¬²»ÔÙ±éÀú µ½ÕâÀïÒÑ¾­ÓĞ´íÎó·¢ÉúÁË
				break
			end
		
			local nFileLevel = tonumber(TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_LEVEL))
			
			if (nFileLevel ~= nPreLevel) then
				--ÏÈÏÔÊ¾ÉÏÒ»¸öµÈ¼¶Ö§ÏßÈÎÎñ
				
				showauxpass(nFileTaskID, nPreLevel, nRowAuxCount)
				--ÏÔÊ¾Ö÷ÈÎÎñµÄÃèÊöÒÔ¼°Ãû³Æ								
				local strTaskTitle = TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_TITLE)
				local strTaskDesc = TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_DESC)
				if (strTaskTitle~=nil and strTaskTitle ~= "") then
					NewTask_DetailTextOut(nTaskGenre, "<enter>")
					NewTask_DetailTextOut(nTaskGenre, strTaskTitle)	
				end
				if (strTaskDesc ~= nil and strTaskDesc ~= "") then
					NewTask_DetailTextOut(nTaskGenre, strTaskDesc)
					NewTask_DetailTextOut(nTaskGenre, "<enter>")
				end
				nPreLevel = nFileLevel
			end
				
			--Èç¹ûÔÚÎÄ¼şÖĞÕÒµ½ºÍµ±Ç°Íæ¼ÒÒ»ÑùµÄTaskValueĞèÒª¸ßÁÁÏÔÊ¾£¬²¢ÇÒÏÔÊ¾Ö§ÏßÈÎÎñµÄĞÅÏ¢
			local strTaskText = TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_TEXT)
			if (nMyTaskValue == nFileTaskValue) then
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESCWORKING..strTaskText))
				--ÏÔÊ¾µ±Ç°µÈ¼¶µÄÖ§ÏßÈÎÎñ
				showauxpass(nFileTaskID, nFileLevel, nRowAuxCount)
				break
			else
				--ÕâÀï¿Ï¶¨ÊÇĞ¡ÓÚ£¬Ç°Ãæ¿Ï¶¨Òª¼ÓÍê³ÉµÄ·ûºÅ
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESCCOMPLETE..strTaskText))
			end			
						
			blnFindTask = 1		
		end
	end	
	
	--ÈÎÎñÍê³Éºó£¬Ìí¼ÓÒ»¾ä»°
	if (AEXP_COMPLETE_VALUE == nMyTaskValue) then
		NewTask_DetailTextOut(nTaskGenre, "NhiÖm vô ®· hoµn thµnh.")
	end
	
	--ÕâÀï¿ÉÒÔ²»ÊÍ·Å
	--TabFile_UnLoad(AEXP_PASSTASK_1)	
	--TabFile_UnLoad(AEXP_PASSAUXTASK_1)
end

--Ö§ÏßÈÎÎñµÄÏÔÊ¾
--Ö§ÏßÈÎÎñµÄÏÔÊ¾¹æÔò2004-12-31 14;25
--²»ÔÚÍæ¼ÒµÈ¼¶·¶Î§ÄÚµÄÖ§ÏßÈÎÎñÈç¹ûÒÑ¾­Íê³É(value = 1000)ÄÇÃ´ÍêÕûµÄÏÔÊ¾£»Èç¹ûÈÎÎñÃ»ÓĞÍê³É£¬ÄÇÃ´ÏÔÊ¾"¸ÃÈÎÎñÄúÒÑ¾­ÎŞ·¨½øĞĞ";Èç¹û¸ÃÈÎÎñÎª0ÄÇÃ´Ê²Ã´¶¼²»ÒªÏÔÊ¾ºÃÁË
--Èç¹ûÍæ¼ÒÔÚµÈ¼¶·¶Î§Ö®ÄÚ£¬ÄÇÃ´ÏÔÊ¾¹æÔòÍ¬Ö÷ÏßÈÎÎñÒ»Ñù£¬ÏÔÊ¾µ½µ±Ç°²½Öè 
--ĞèÒªÅĞ¶ÏÍæ¼Ò×ÔÉíµÄµÈ¼¶ÔÚÖ§Ïß·¶Î§Ö®ÄÚ
function showauxpass(nParentId, nLevel, nRowCount)
	--Èç¹ûµÈ¼¶ÊÇ-1ÄÇÃ´²»ÏÔÊ¾Ö§ÏßÈÎÎñ£¬ÒòÎª-1±íÊ¾µÚÒ»´Î³öÏÖµÈ¼¶Ìø×ª
	
	if (nLevel == -1 ) then
		return
	end
	
	local nFirst = 0
	local nMyAuxValue = 0
	for nIndex = 2, nRowCount do
		local nFileParentTaskID = tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_PARENTID))
		local nFileMinLevel =  tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_MINLEVEL))		
		if (nFileParentTaskID > nParentId) then
			break
		end
		--Èç¹ûÕÒµ½¹ıparent¶øÇÒnLevel²»ÏàµÈÁËÄÇÃ´ÒÑ¾­¹ıÁË±éÀú·¶Î§£¬Ìø³ö
		if (nFirst == 1 and nFileMinLevel ~= nLevel) then
			break
		end
		
		if (nFileParentTaskID == nParentId and nLevel == nFileMinLevel) then			
			local nFileMinLevel = tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_MINLEVEL))
			local nFileMaxLevel =  tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_MAXLEVEL))
			local nMyLevel = GetLevel()
				
			if (nFirst == 0) then
				local nMyAuxTaskId = tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_TASKID))
				nMyAuxValue = GetTask(nMyAuxTaskId)
				if (nMyAuxValue == 0) then
					--Ã»ÓĞ½ÓÊÜ¸ÃµÈ¼¶µÄÖ§ÏßÈÎÎñ£¬Ìø³öÈ¥
					--NewTask_DetailTextOut(nTaskGenre, AEXP_TASKDESAUX.."Ã»ÓĞ½ÓÊÜÏàÓ¦µÈ¼¶µÄÖ§ÏßÈÎÎñ")
					break
				end				
				local strTaskTitle = TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_TITLE)
				--Èç¹ûÊÇµÚÒ»´ÎÄÇÃ´ÏÔÊ¾Ö§ÏßÈÎÎñµÄ±êÌâºÍÏêÏ¸ĞÅÏ¢(±ğÍüÁËËõ½ø)				
				local strTaskDesc = TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_DESC)
				NewTask_DetailTextOut(nTaskGenre, AEXP_TASKDESAUX..strTaskTitle)
				NewTask_DetailTextOut(nTaskGenre, AEXP_TASKDESAUX..strTaskDesc)
				if (nMyLevel < nFileMinLevel or nMyLevel >= nFileMaxLevel) then
					--µÈ¼¶³¬¹ı·¶Î§£¬¶øÇÒÈÎÎñÍê³ÉÄÇÃ´ÍêÈ«ÏÔÊ¾,·ñÔòÏÔÊ¾Ò»¾ä»°È»ºóÌø³ö
					if (nMyAuxValue == AEXP_COMPLETE_VALUE) then
						--Íê³É£¬ÏÔÊ¾ËùÓĞ
					else
						--Ã»ÓĞÍê³É												
						if (nMyLevel < nFileMaxLevel and nMyAuxValue ~= 0) then
							NewTask_DetailTextOut(AEXP_PASSAUXTASK_1,AEXP_TASKDESAUX.."B¹n kh«ng thÓ nhËn nhiÖm vô cao h¬n ®¼ng cÊp yªu cÇu!")
							break
						else
							NewTask_DetailTextOut(AEXP_PASSAUXTASK_1,(AEXP_TASKDESAUX.."NhiÖm vô phô tuyÕn nµy b¹n ®· hoµn thµnh ®­îc mÊy b­íc, nh­ng hiÖn giê kh«ng thÓ tiÕp tôc ®­îc n÷a"))
						end 												
					end
				end  
				nFirst = 1
			end-- end of (nFirst == 0)
			--ÏÔÊ¾ÈÎÎñÍê³ÉÇé¿ö
			local nFileAuxValue = tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_VALUE))
			local strTaskText = TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_TEXT)
			
			if (nMyAuxValue == AEXP_COMPLETE_VALUE) then
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCCOMPLETE..strTaskText))
			elseif (nMyAuxValue == nFileAuxValue and (nFileMinLevel <= nMyLevel and nMyLevel < nFileMaxLevel)) then
				--ÊıÖµÏàµÈ,²¢ÇÒ·ûºÏµÈ¼¶
				--Ëõ½ø¼Ó¸ßÁÁÏÔÊ¾
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCWORKING..strTaskText))
				break
			elseif (nMyAuxValue == nFileAuxValue and (nMyLevel < nFileMinLevel  or nFileMaxLevel <= nMyLevel)) then
				--ÊıÖµÏàµÈ,µ«²»·ûºÏµÈ¼¶
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCCOMPLETE..strTaskText))
				break
			else
				--ÏÔÊ¾Íê³É
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCCOMPLETE..strTaskText))
			end
		end 		
	end--end of for)
	
	--ÏÔÊ¾Ò»¾äÍê³ÉµÄ»°
	if (nMyAuxValue == AEXP_COMPLETE_VALUE) then
		NewTask_DetailTextOut(AEXP_PASSAUXTASK_1,AEXP_TASKDESAUX.."B¹n ®· hoµn thµnh nhiÖm vô phô tuyÕn nµy ")
	end
end

------------½âÎö[]ÖĞ¼äµÄ×Ö·û´®×ª»¯ÎªÈÎÎñ±äÁ¿µÄÖµ
function parasestring(strMsg)
	if (strMsg == nil or strMsg == "" ) then
		return ""
	end
	
	nFirstPos = strfind(strMsg,"{")
	if (nFirstPos == nil)then		
		return strMsg
	end
	
	local strNew = ""
	local nLen = strlen(strMsg)
	local nStart = 0
	local nEnd = 0	
	local nStart = 0	
	
	for i=1,nLen do 
		local szOne = strsub(strMsg,i,i)
		if (szOne == "{") then			
			strTemp = strsub(strMsg, nStart, i-1)			
			strNew = strNew..strTemp
			nStart = i+1
		elseif (szOne == "}") then
			if (nStart ~= 0) then				
				strTaskId = strsub(strMsg, nStart, i-1)
				if (strTaskId ~= nil and strTaskId ~= "") then
					strNew = strNew..GetTask(tonumber(strTaskId))
				end
				nStart = i+1				
			end
			nEnd = i+1
		end
	end
	strNew = strNew..strsub(strMsg,nEnd,nLen)
	return strNew
end
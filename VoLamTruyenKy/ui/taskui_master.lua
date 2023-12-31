IncludeLib("FILESYS")


--剧情任务tabfile路径
AEXP_PASSTASK_1			=	"\\settings\\task\\newtask\\mastertask\\mainpasstask.txt"
AEXP_PASSAUXTASK_1		= 	"\\settings\\task\\newtask\\branch\\auxpasstask.txt"

--剧情任务tabfile列名
AEXP_PASSTASK_TASKID	= 	"TaskId"
AEXP_PASSTASK_LEVEL		= 	"Level"
AEXP_PASSTASK_VALUE 	= 	"Value"
AEXP_PASSTASK_DESC		= 	"Desc"
AEXP_PASSTASK_TEXT		= 	"Text"
AEXP_PASSTASK_TITLE		=	"Title"
AEXP_PASSTASK_MINLEVEL	= 	"MinLevel"
AEXP_PASSTASK_MAXLEVEL	= 	"MaxLevel"
AEXP_PASSTASK_PARENTID	=	"ParentTaskId"

--如果任务为该值那么表示该TaskId的任务已经完成
--在配置文件中不需要写1000，否则会高亮显示
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

--剧情任务显示的主函数
function showpasstaskdesc(nTaskIdx, nTaskGenre, nTaskValueID)
	--首先得到当前的任务变量
	local nMyTaskValue = GetTask(nTaskValueID)
	if (0 == nMyTaskValue) then
		NewTask_TaskTextOut(nTaskGenre, "Hi謓 b筺 v蒼 ch璦 ti誴 nh薾 nhi謒 v�!")
		return 
	end
	
	--将任务设置为完成
	if (AEXP_COMPLETE_VALUE == nMyTaskValue) then
		NewTask_SetFinishedTask(nTaskGenre, nTaskIdx)
	end
	
	--打开主任务的tabfile
	if (TabFile_Load(AEXP_PASSTASK_1, AEXP_PASSTASK_1) == 0) then
		print("Load TabFile Error!"..AEXP_PASSTASK_1)
		return
	end
	--把支线任务的file也给打开吧
	if (TabFile_Load(AEXP_PASSAUXTASK_1, AEXP_PASSAUXTASK_1) == 0) then
		print("Load TabFile Error!"..AEXP_PASSAUXTASK_1)
		return
	end

	local blnFindTask = 0
	local nRowCount = tonumber(TabFile_GetRowCount(AEXP_PASSTASK_1))
	local nRowAuxCount = tonumber(TabFile_GetRowCount(AEXP_PASSAUXTASK_1))
	local nPreLevel = -1		--主任务需要记录前一个的任务等级，当等级跳变时显示支线任务的信息
	--遍历和主线任务对应的ID
	for nIndex = 2, nRowCount do
		local nFileTaskID = tonumber(TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_TASKID))
		--如果已经遍历过要找的TaskId那么跳出
		if (blnFindTask == 1 and nFileTaskID > nTaskValueID) then
			break
		end
		
		if (nFileTaskID == nTaskValueID) then
			local nFileTaskValue = tonumber(TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_VALUE))
			if (nMyTaskValue < nFileTaskValue) then
				--竟然比我都小，不再遍历 到这里已经有错误发生了
				break
			end
		
			local nFileLevel = tonumber(TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_LEVEL))
			
			if (nFileLevel ~= nPreLevel) then
				--先显示上一个等级支线任务
				
				showauxpass(nFileTaskID, nPreLevel, nRowAuxCount)
				--显示主任务的描述以及名称								
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
				
			--如果在文件中找到和当前玩家一样的TaskValue需要高亮显示，并且显示支线任务的信息
			local strTaskText = TabFile_GetCell(AEXP_PASSTASK_1, nIndex, AEXP_PASSTASK_TEXT)
			if (nMyTaskValue == nFileTaskValue) then
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESCWORKING..strTaskText))
				--显示当前等级的支线任务
				showauxpass(nFileTaskID, nFileLevel, nRowAuxCount)
				break
			else
				--这里肯定是小于，前面肯定要加完成的符号
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESCCOMPLETE..strTaskText))
			end			
						
			blnFindTask = 1		
		end
	end	
	
	--任务完成后，添加一句话
	if (AEXP_COMPLETE_VALUE == nMyTaskValue) then
		NewTask_DetailTextOut(nTaskGenre, "Nhi謒 v�  ho祅 th祅h.")
	end
	
	--这里可以不释放
	--TabFile_UnLoad(AEXP_PASSTASK_1)	
	--TabFile_UnLoad(AEXP_PASSAUXTASK_1)
end

--支线任务的显示
--支线任务的显示规则2004-12-31 14;25
--不在玩家等级范围内的支线任务如果已经完成(value = 1000)那么完整的显示；如果任务没有完成，那么显示"该任务您已经无法进行";如果该任务为0那么什么都不要显示好了
--如果玩家在等级范围之内，那么显示规则同主线任务一样，显示到当前步骤 
--需要判断玩家自身的等级在支线范围之内
function showauxpass(nParentId, nLevel, nRowCount)
	--如果等级是-1那么不显示支线任务，因为-1表示第一次出现等级跳转
	
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
		--如果找到过parent而且nLevel不相等了那么已经过了遍历范围，跳出
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
					--没有接受该等级的支线任务，跳出去
					--NewTask_DetailTextOut(nTaskGenre, AEXP_TASKDESAUX.."没有接受相应等级的支线任务")
					break
				end				
				local strTaskTitle = TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_TITLE)
				--如果是第一次那么显示支线任务的标题和详细信息(别忘了缩进)				
				local strTaskDesc = TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_DESC)
				NewTask_DetailTextOut(nTaskGenre, AEXP_TASKDESAUX..strTaskTitle)
				NewTask_DetailTextOut(nTaskGenre, AEXP_TASKDESAUX..strTaskDesc)
				if (nMyLevel < nFileMinLevel or nMyLevel >= nFileMaxLevel) then
					--等级超过范围，而且任务完成那么完全显示,否则显示一句话然后跳出
					if (nMyAuxValue == AEXP_COMPLETE_VALUE) then
						--完成，显示所有
					else
						--没有完成												
						if (nMyLevel < nFileMaxLevel and nMyAuxValue ~= 0) then
							NewTask_DetailTextOut(AEXP_PASSAUXTASK_1,AEXP_TASKDESAUX.."B筺 kh玭g th� nh薾 nhi謒 v� cao h琻 ng c蕄 y猽 c莡!")
							break
						else
							NewTask_DetailTextOut(AEXP_PASSAUXTASK_1,(AEXP_TASKDESAUX.."Nhi謒 v� ph� tuy課 n祔 b筺  ho祅 th祅h 頲 m蕐 bc, nh璶g hi謓 gi� kh玭g th� ti誴 t鬰 頲 n鱝"))
						end 												
					end
				end  
				nFirst = 1
			end-- end of (nFirst == 0)
			--显示任务完成情况
			local nFileAuxValue = tonumber(TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_VALUE))
			local strTaskText = TabFile_GetCell(AEXP_PASSAUXTASK_1, nIndex, AEXP_PASSTASK_TEXT)
			
			if (nMyAuxValue == AEXP_COMPLETE_VALUE) then
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCCOMPLETE..strTaskText))
			elseif (nMyAuxValue == nFileAuxValue and (nFileMinLevel <= nMyLevel and nMyLevel < nFileMaxLevel)) then
				--数值相等,并且符合等级
				--缩进加高亮显示
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCWORKING..strTaskText))
				break
			elseif (nMyAuxValue == nFileAuxValue and (nMyLevel < nFileMinLevel  or nFileMaxLevel <= nMyLevel)) then
				--数值相等,但不符合等级
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCCOMPLETE..strTaskText))
				break
			else
				--显示完成
				NewTask_TaskTextOut(nTaskGenre, parasestring(AEXP_TASKDESAUX..AEXP_TASKDESCCOMPLETE..strTaskText))
			end
		end 		
	end--end of for)
	
	--显示一句完成的话
	if (nMyAuxValue == AEXP_COMPLETE_VALUE) then
		NewTask_DetailTextOut(AEXP_PASSAUXTASK_1,AEXP_TASKDESAUX.."B筺  ho祅 th祅h nhi謒 v� ph� tuy課 n祔 ")
	end
end

------------解析[]中间的字符串转化为任务变量的值
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
IncludeLib("FILESYS")


-- 任务链读取文件时的字符串定义
TL_BUYGOODS = "TaskLink_BuyGoods"
TL_FINDGOODS = "TaskLink_FindGoods"
TL_SHOWGOODS = "TaskLink_ShowGoods"
TL_FINDMAPS = "TaskLink_FindMaps"
TL_UPGROUND = "TaskLink_UpGround"
TL_WORLDMAPS = "TaskLink_WorldMaps"


-- 随机任务
function randtaskdesc()
	local myTaskMainInfo,myTaskOrder,myTaskInfo1,myTaskInfo2,myTaskInfo3 
	
	local myTaskType = GetTask(1021)
	local myTaskCol = GetTask(1030)
	
	local myTaskCourse = GetTask(1028)
	
	local nNeedNum = 0;

	if (myTaskType == 0) then
		myTaskMainInfo = "B筺 ch璦 ti誴 nh薾 nhi謒 v� c馻 D� T萿, c� th阨 gian h穣 n g苝 玭g ta xem!"
	elseif (myTaskType==1) then -- 如果是购买物品的任务
	
		TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
		
		myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS,myTaskCol,"TaskInfo1")
		myTaskInfo2 = TabFile_GetCell(TL_BUYGOODS,myTaskCol,"TaskInfo")
		myTaskMainInfo = "n  "..myTaskInfo2.." mua  "..myTaskInfo1.."  cho D� T萿."
			
	elseif (myTaskType==2) then -- 如果是物品寻找的任务
		
		TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
		
		-- 魔法属性
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"MagicCnName")
		-- 具体的武器类别
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"TaskInfo")
		-- 最小魔法属性
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"MinValue")
		-- 最大魔法属性
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS,myTaskCol,"MaxValue")
		
		if (myTaskOrder=="n") then
			myTaskMainInfo = "甶 t譵 <color=yellow>"..myTaskInfo1.."<color> gi髉 ta."
		else
			myTaskMainInfo = "甶 t譵 <color=yellow>"..myTaskInfo1..""..myTaskOrder.."t� "..myTaskInfo2.." n "..myTaskInfo3.."<color> v� cho D� T萿!"
		end
		
	elseif (myTaskType==3) then
	
		TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
	
			-- 魔法属性中文名
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MagicCnName")
		-- 魔法属性的最小值
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MinValue")
		-- 魔法属性的最大值
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS,myTaskCol,"MaxValue")
		
		myTaskMainInfo = " t譵 <color=yellow>trang b� "..myTaskOrder.."<color> t� <color=yellow>"..myTaskInfo1.." n "..myTaskInfo2.."<color> cho D� t萿!"
		
	elseif (myTaskType==4) then
	
		TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
	
		-- 地图的名称
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS,myTaskCol,"TaskInfo1")
		-- 所要的地图数量
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS,myTaskCol,"Num")		
		-- 地图的类型
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS,myTaskCol,"MapType")
		
		if (tonumber(myTaskInfo2) == 1) then
			myTaskInfo3 = "мa у ch� "
		else
			myTaskInfo3 = "M藅 ch� "
		end
		
		if tonumber(myTaskInfo1) > GetTask(1025) then
			myTaskMainInfo = "дn <color=yellow>"..myTaskOrder.."<color> t譵 <color=yellow>"..myTaskInfo1.." t蕀 "..myTaskInfo3.."<color>! Х thu th藀 頲 <color=yellow>"..GetTask(1025).."<color> t蕀."
		else
			myTaskMainInfo = "Х t譵 頲 <color=yellow>"..GetTask(1025).."<color> t蕀 <color=yellow>"..myTaskOrder.." "..myTaskInfo3.."<color>! Mau v� t譵 D� T萿 ph鬰 m謓h."
		end
	elseif (myTaskType==5) then

		TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)

		-- 需要提升的数值类型
		myTaskOrder = TabFile_GetCell(TL_UPGROUND,myTaskCol,"NumericType")
		-- 需要提升的数值总数
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND,myTaskCol,"NumericValue")
		
		if (tonumber(myTaskOrder) == 1) then
			myTaskInfo2 = " c蕄"
		elseif (tonumber(myTaskOrder) == 2) then
			myTaskInfo2 = "甶觤 kinh nghi謒 "
		elseif (tonumber(myTaskOrder) == 3) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetRepute();
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "甶觤 danh v鋘g. Hi謓 c� "..GetRepute().." 甶觤, c莕 th猰 "..nNeedNum.." 甶觤,"
		elseif (tonumber(myTaskOrder) == 4) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetTask(151);
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "甶觤 ph骳 duy猲. Hi謓 c� "..GetTask(151).." 甶觤, c莕 th猰 "..nNeedNum.." 甶觤,"
		elseif (tonumber(myTaskOrder) == 5) then
			myTaskInfo2 = "甶觤 PK"
		elseif (tonumber(myTaskOrder) == 6) then
			nNeedNum = (myTaskInfo1 + GetTask(1026)) - GetTask(747);
			
			if nNeedNum<0 then nNeedNum=0; end;
			
			myTaskInfo2 = "甶觤 thng T鑞g Kim. Hi謓 c� "..GetTask(747).." 甶觤, c莕 th猰 "..nNeedNum.." 甶觤,"
		end
		
		myTaskMainInfo = " n﹏g c蕄 "..myTaskInfo1.." "..myTaskInfo2
		
	elseif (myTaskType==6) then
	
		TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
	
		-- 需要收集的山河社稷图残片
		myTaskOrder = TabFile_GetCell(TL_WORLDMAPS,myTaskCol,"Num")
		
		myTaskMainInfo = "a cho D� T萿 "..myTaskOrder.." m秐h b秐 , 產ng c� <color=yellow>"..GetTask(1027).."<color> t蕀."
		
	end	
	return myTaskMainInfo
end

-- ====================== 文件信息 ======================

-- 剑侠情缘online 同伴随机任务任务面版输出文件
-- Edited by peres
-- 2005/11/08 PM 15:47

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 同伴系统的支持
IncludeLib("PARTNER");

-- 用来显示奖励文字的引用
Include("\\script\\item\\taskitem_show.lua");

-- 读入任务系统头文件，包含随机任务
Include("\\script\\task\\system\\task_main.lua");

ID_RANDOMTASK              = 1301;  -- 存储当前玩家接到的随机任务
ID_RANDOMTASK_WAIT         = 1302; -- 存储当前待接的随机任务
ID_RANDOMSTATE             = 1303;  -- 存储随机任务的进展情况
ID_RANDOMBOOK              = 1304;   -- 存储玩家当前的卷轴任务（第二层）
ID_RANDOMBOOKDATE          = 1305;  -- 存储玩家使用任务卷轴的天数
ID_RANDOMBOOKNUM           = 1306;  -- 存储玩家使用任务卷轴的次数

aryTaskStateText = {

	[0]="<color=red> (ch璦 b総 u)<color>",
	[1]="<color=green> (產ng ti課 h祅h)<color>",
	[2]="<color=yellow> ( ho祅 th祅h)<color>",
	[3]="<color=yellow> ( ho祅 th祅h)<color>",

}

-- 总的显示函数
function show_partner_randomdesc()

local strRandom = showRandomTask();
local strBook = showBookTask();

local i=0;

	for i=1, getn(strRandom) do
		NewTask_TaskTextOut(2, strRandom[i]);
	end;

	for i=1, getn(strBook) do
		NewTask_TaskTextOut(2, strBook[i]);
	end;
	
	NewTask_TaskTextOut(2,"<enter>");
	
end;


-- 用来输出随机任务的字符，返回一个字符数组
function showRandomTask()

local taskID = GetTask(ID_RANDOMTASK);
local taskName = "";

local nRow, nCol = 0, 0;

local strTaskText = "";    -- 任务标题
local strTaskSay = "";     -- 任务对话
local strTaskAward = "";   -- 任务奖励
local strMain = {};

local strTitle = "<color=Orange>L謓h b礽 nhi謒 v� 產ng ti課 h祅h: <color><enter><enter>";

	if taskID==0 then
		return {"<color=Orange>Hi謓 t筰 kh玭g nh薾 b蕋 k� l謓h b礽 nhi謒 v� n祇.<color><enter><enter>"};
	end;
	
	-- 得到任务对话表的维度
	nRow, nCol = TaskTalkMatrix(taskName);
	
	-- 从变量中得到任务名
	taskName = TaskName(taskID);
	
	-- 获取任务的描述
	strTaskText = GetTaskText(taskName)..aryTaskStateText[GetTaskStatus(taskName)]..":<enter><enter>";
	
	-- 获取任务的对话内容
	strTaskSay = "<color=Orange>N閕 dung l謓h b礽 nhi謒 v�<color><enter>"..
				 SetTaskPlaneColor(TaskTalk(taskName, 1, 1)).."<enter><enter>";
	
	-- 获取任务奖励的内容
	strTaskAward = CreateAwardText(taskName).."<enter><enter><enter>";
	
	-- 将各个字符合并
	tinsert(strMain, strTitle);
	
	tinsert(strMain, strTaskText);
	
	tinsert(strMain, strTaskSay);
	
	tinsert(strMain, strTaskAward);
	
	return strMain;

end;


-- 用来输出卷轴任务的字符，返回一个字符数组
function showBookTask()

local taskID = GetTask(ID_RANDOMBOOK);
local taskName = "";

local nRow, nCol = 0, 0;

local strTaskText = "";    -- 任务标题
local strTaskSay = "";     -- 任务对话
local strTaskAward = "";   -- 任务奖励
local strMain = {};

local strTitle = "<color=Orange>Nhi謒 v� quy觧 tranh  ti誴 nh薾: <color><enter><enter>";

	if taskID==0 then
		return {"<color=Orange>B筺 v蒼 ch璦 m� M藅 t辌h nhi謒 v�.<color><enter><enter>"};
	end;

	-- 得到任务对话表的维度
	nRow, nCol = TaskTalkMatrix(taskName);
	
	-- 从变量中得到任务名
	taskName = TaskName(taskID);
	
	-- 获取任务的描述
	strTaskText = GetTaskText(taskName)..aryTaskStateText[GetTaskStatus(taskName)]..":<enter><enter>";
	
	-- 获取任务的对话内容
	strTaskSay = "<color=Orange>N閕 dung nhi謒 v� quy觧 tranh: <color><enter>"..
				 SetTaskPlaneColor(TaskTalk(taskName, 1, 1)).."<enter><enter>";
	
	-- 获取任务奖励的内容
	strTaskAward = CreateAwardText(taskName).."<enter>";
	
	-- 将各个字符合并
	tinsert(strMain, strTitle);
	
	tinsert(strMain, strTaskText);
	
	tinsert(strMain, strTaskSay);
	
	tinsert(strMain, strTaskAward);
	
	return strMain;

	
end;



-- 用于处理文本内的关键字，如：性别标识、同伴图像连接标识、重点颜色标识等。
function SetTaskPlaneColor(str)

	local strKey = ":";
	local strKeyLeft = "{{";    -- "<color=yellow>" 简化标识
	local strKeyRight = "}}";   -- "<color>" 简化标识
	local strKeySex = "<sex>"; -- 性别标识
	local strKenPan = "<pan>"; -- 同伴图像连接标识
	local strKenNpc = "<npc>"; -- 对话人物 NPC 的图像和姓名连接标识
	local strKeyDec = "<dec>";
	local strPoint = strfind(str,strKey,1);
	local strName = "";
	local strColorText = str;
	
	local strSexChange = "";
			
	-- 处理重点标识颜色
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- 处理性别标识
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	-- 处理同伴标识
	strColorText = join(split(strColorText,strKenPan), "");
	
	-- 处理 NPC 名字标识
	strColorText = join(split(strColorText,strKenNpc), "");

	-- 处理 DEC 标识
	strColorText = join(split(strColorText,strKeyDec), "");

	str = strColorText;
	return str;
	
end;
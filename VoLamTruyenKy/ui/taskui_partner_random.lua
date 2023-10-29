
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Í¬°éËæ»úÈÎÎñÈÎÎñÃæ°æÊä³öÎÄ¼ş
-- Edited by peres
-- 2005/11/08 PM 15:47

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

-- ÈÎÎñÏµÍ³¿âÖ§³Ö
IncludeLib("TASKSYS");

-- Í¬°éÏµÍ³µÄÖ§³Ö
IncludeLib("PARTNER");

-- ÓÃÀ´ÏÔÊ¾½±ÀøÎÄ×ÖµÄÒıÓÃ
Include("\\script\\item\\taskitem_show.lua");

-- ¶ÁÈëÈÎÎñÏµÍ³Í·ÎÄ¼ş£¬°üº¬Ëæ»úÈÎÎñ
Include("\\script\\task\\system\\task_main.lua");

ID_RANDOMTASK              = 1301;  -- ´æ´¢µ±Ç°Íæ¼Ò½Óµ½µÄËæ»úÈÎÎñ
ID_RANDOMTASK_WAIT         = 1302; -- ´æ´¢µ±Ç°´ı½ÓµÄËæ»úÈÎÎñ
ID_RANDOMSTATE             = 1303;  -- ´æ´¢Ëæ»úÈÎÎñµÄ½øÕ¹Çé¿ö
ID_RANDOMBOOK              = 1304;   -- ´æ´¢Íæ¼Òµ±Ç°µÄ¾íÖáÈÎÎñ£¨µÚ¶ş²ã£©
ID_RANDOMBOOKDATE          = 1305;  -- ´æ´¢Íæ¼ÒÊ¹ÓÃÈÎÎñ¾íÖáµÄÌìÊı
ID_RANDOMBOOKNUM           = 1306;  -- ´æ´¢Íæ¼ÒÊ¹ÓÃÈÎÎñ¾íÖáµÄ´ÎÊı

aryTaskStateText = {

	[0]="<color=red> (ch­a b¾t ®Çu)<color>",
	[1]="<color=green> (®ang tiÕn hµnh)<color>",
	[2]="<color=yellow> (®· hoµn thµnh)<color>",
	[3]="<color=yellow> (®· hoµn thµnh)<color>",

}

-- ×ÜµÄÏÔÊ¾º¯Êı
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


-- ÓÃÀ´Êä³öËæ»úÈÎÎñµÄ×Ö·û£¬·µ»ØÒ»¸ö×Ö·ûÊı×é
function showRandomTask()

local taskID = GetTask(ID_RANDOMTASK);
local taskName = "";

local nRow, nCol = 0, 0;

local strTaskText = "";    -- ÈÎÎñ±êÌâ
local strTaskSay = "";     -- ÈÎÎñ¶Ô»°
local strTaskAward = "";   -- ÈÎÎñ½±Àø
local strMain = {};

local strTitle = "<color=Orange>LÖnh bµi nhiÖm vô ®ang tiÕn hµnh: <color><enter><enter>";

	if taskID==0 then
		return {"<color=Orange>HiÖn t¹i kh«ng nhËn bÊt kú lÖnh bµi nhiÖm vô nµo.<color><enter><enter>"};
	end;
	
	-- µÃµ½ÈÎÎñ¶Ô»°±íµÄÎ¬¶È
	nRow, nCol = TaskTalkMatrix(taskName);
	
	-- ´Ó±äÁ¿ÖĞµÃµ½ÈÎÎñÃû
	taskName = TaskName(taskID);
	
	-- »ñÈ¡ÈÎÎñµÄÃèÊö
	strTaskText = GetTaskText(taskName)..aryTaskStateText[GetTaskStatus(taskName)]..":<enter><enter>";
	
	-- »ñÈ¡ÈÎÎñµÄ¶Ô»°ÄÚÈİ
	strTaskSay = "<color=Orange>Néi dung lÖnh bµi nhiÖm vô<color><enter>"..
				 SetTaskPlaneColor(TaskTalk(taskName, 1, 1)).."<enter><enter>";
	
	-- »ñÈ¡ÈÎÎñ½±ÀøµÄÄÚÈİ
	strTaskAward = CreateAwardText(taskName).."<enter><enter><enter>";
	
	-- ½«¸÷¸ö×Ö·ûºÏ²¢
	tinsert(strMain, strTitle);
	
	tinsert(strMain, strTaskText);
	
	tinsert(strMain, strTaskSay);
	
	tinsert(strMain, strTaskAward);
	
	return strMain;

end;


-- ÓÃÀ´Êä³ö¾íÖáÈÎÎñµÄ×Ö·û£¬·µ»ØÒ»¸ö×Ö·ûÊı×é
function showBookTask()

local taskID = GetTask(ID_RANDOMBOOK);
local taskName = "";

local nRow, nCol = 0, 0;

local strTaskText = "";    -- ÈÎÎñ±êÌâ
local strTaskSay = "";     -- ÈÎÎñ¶Ô»°
local strTaskAward = "";   -- ÈÎÎñ½±Àø
local strMain = {};

local strTitle = "<color=Orange>NhiÖm vô quyÓn tranh ®· tiÕp nhËn: <color><enter><enter>";

	if taskID==0 then
		return {"<color=Orange>B¹n vÉn ch­a më MËt tŞch nhiÖm vô.<color><enter><enter>"};
	end;

	-- µÃµ½ÈÎÎñ¶Ô»°±íµÄÎ¬¶È
	nRow, nCol = TaskTalkMatrix(taskName);
	
	-- ´Ó±äÁ¿ÖĞµÃµ½ÈÎÎñÃû
	taskName = TaskName(taskID);
	
	-- »ñÈ¡ÈÎÎñµÄÃèÊö
	strTaskText = GetTaskText(taskName)..aryTaskStateText[GetTaskStatus(taskName)]..":<enter><enter>";
	
	-- »ñÈ¡ÈÎÎñµÄ¶Ô»°ÄÚÈİ
	strTaskSay = "<color=Orange>Néi dung nhiÖm vô quyÓn tranh: <color><enter>"..
				 SetTaskPlaneColor(TaskTalk(taskName, 1, 1)).."<enter><enter>";
	
	-- »ñÈ¡ÈÎÎñ½±ÀøµÄÄÚÈİ
	strTaskAward = CreateAwardText(taskName).."<enter>";
	
	-- ½«¸÷¸ö×Ö·ûºÏ²¢
	tinsert(strMain, strTitle);
	
	tinsert(strMain, strTaskText);
	
	tinsert(strMain, strTaskSay);
	
	tinsert(strMain, strTaskAward);
	
	return strMain;

	
end;



-- ÓÃÓÚ´¦ÀíÎÄ±¾ÄÚµÄ¹Ø¼ü×Ö£¬Èç£ºĞÔ±ğ±êÊ¶¡¢Í¬°éÍ¼ÏñÁ¬½Ó±êÊ¶¡¢ÖØµãÑÕÉ«±êÊ¶µÈ¡£
function SetTaskPlaneColor(str)

	local strKey = ":";
	local strKeyLeft = "{{";    -- "<color=yellow>" ¼ò»¯±êÊ¶
	local strKeyRight = "}}";   -- "<color>" ¼ò»¯±êÊ¶
	local strKeySex = "<sex>"; -- ĞÔ±ğ±êÊ¶
	local strKenPan = "<pan>"; -- Í¬°éÍ¼ÏñÁ¬½Ó±êÊ¶
	local strKenNpc = "<npc>"; -- ¶Ô»°ÈËÎï NPC µÄÍ¼ÏñºÍĞÕÃûÁ¬½Ó±êÊ¶
	local strKeyDec = "<dec>";
	local strPoint = strfind(str,strKey,1);
	local strName = "";
	local strColorText = str;
	
	local strSexChange = "";
			
	-- ´¦ÀíÖØµã±êÊ¶ÑÕÉ«
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- ´¦ÀíĞÔ±ğ±êÊ¶
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	-- ´¦ÀíÍ¬°é±êÊ¶
	strColorText = join(split(strColorText,strKenPan), "");
	
	-- ´¦Àí NPC Ãû×Ö±êÊ¶
	strColorText = join(split(strColorText,strKenNpc), "");

	-- ´¦Àí DEC ±êÊ¶
	strColorText = join(split(strColorText,strKeyDec), "");

	str = strColorText;
	return str;
	
end;
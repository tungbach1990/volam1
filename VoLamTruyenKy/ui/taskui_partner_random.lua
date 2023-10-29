
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ͬ��������������������ļ�
-- Edited by peres
-- 2005/11/08 PM 15:47

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ͬ��ϵͳ��֧��
IncludeLib("PARTNER");

-- ������ʾ�������ֵ�����
Include("\\script\\item\\taskitem_show.lua");

-- ��������ϵͳͷ�ļ��������������
Include("\\script\\task\\system\\task_main.lua");

ID_RANDOMTASK              = 1301;  -- �洢��ǰ��ҽӵ����������
ID_RANDOMTASK_WAIT         = 1302; -- �洢��ǰ���ӵ��������
ID_RANDOMSTATE             = 1303;  -- �洢�������Ľ�չ���
ID_RANDOMBOOK              = 1304;   -- �洢��ҵ�ǰ�ľ������񣨵ڶ��㣩
ID_RANDOMBOOKDATE          = 1305;  -- �洢���ʹ��������������
ID_RANDOMBOOKNUM           = 1306;  -- �洢���ʹ���������Ĵ���

aryTaskStateText = {

	[0]="<color=red> (ch�a b�t ��u)<color>",
	[1]="<color=green> (�ang ti�n h�nh)<color>",
	[2]="<color=yellow> (�� ho�n th�nh)<color>",
	[3]="<color=yellow> (�� ho�n th�nh)<color>",

}

-- �ܵ���ʾ����
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


-- ����������������ַ�������һ���ַ�����
function showRandomTask()

local taskID = GetTask(ID_RANDOMTASK);
local taskName = "";

local nRow, nCol = 0, 0;

local strTaskText = "";    -- �������
local strTaskSay = "";     -- ����Ի�
local strTaskAward = "";   -- ������
local strMain = {};

local strTitle = "<color=Orange>L�nh b�i nhi�m v� �ang ti�n h�nh: <color><enter><enter>";

	if taskID==0 then
		return {"<color=Orange>Hi�n t�i kh�ng nh�n b�t k� l�nh b�i nhi�m v� n�o.<color><enter><enter>"};
	end;
	
	-- �õ�����Ի����ά��
	nRow, nCol = TaskTalkMatrix(taskName);
	
	-- �ӱ����еõ�������
	taskName = TaskName(taskID);
	
	-- ��ȡ���������
	strTaskText = GetTaskText(taskName)..aryTaskStateText[GetTaskStatus(taskName)]..":<enter><enter>";
	
	-- ��ȡ����ĶԻ�����
	strTaskSay = "<color=Orange>N�i dung l�nh b�i nhi�m v�<color><enter>"..
				 SetTaskPlaneColor(TaskTalk(taskName, 1, 1)).."<enter><enter>";
	
	-- ��ȡ������������
	strTaskAward = CreateAwardText(taskName).."<enter><enter><enter>";
	
	-- �������ַ��ϲ�
	tinsert(strMain, strTitle);
	
	tinsert(strMain, strTaskText);
	
	tinsert(strMain, strTaskSay);
	
	tinsert(strMain, strTaskAward);
	
	return strMain;

end;


-- �����������������ַ�������һ���ַ�����
function showBookTask()

local taskID = GetTask(ID_RANDOMBOOK);
local taskName = "";

local nRow, nCol = 0, 0;

local strTaskText = "";    -- �������
local strTaskSay = "";     -- ����Ի�
local strTaskAward = "";   -- ������
local strMain = {};

local strTitle = "<color=Orange>Nhi�m v� quy�n tranh �� ti�p nh�n: <color><enter><enter>";

	if taskID==0 then
		return {"<color=Orange>B�n v�n ch�a m� M�t t�ch nhi�m v�.<color><enter><enter>"};
	end;

	-- �õ�����Ի����ά��
	nRow, nCol = TaskTalkMatrix(taskName);
	
	-- �ӱ����еõ�������
	taskName = TaskName(taskID);
	
	-- ��ȡ���������
	strTaskText = GetTaskText(taskName)..aryTaskStateText[GetTaskStatus(taskName)]..":<enter><enter>";
	
	-- ��ȡ����ĶԻ�����
	strTaskSay = "<color=Orange>N�i dung nhi�m v� quy�n tranh: <color><enter>"..
				 SetTaskPlaneColor(TaskTalk(taskName, 1, 1)).."<enter><enter>";
	
	-- ��ȡ������������
	strTaskAward = CreateAwardText(taskName).."<enter>";
	
	-- �������ַ��ϲ�
	tinsert(strMain, strTitle);
	
	tinsert(strMain, strTaskText);
	
	tinsert(strMain, strTaskSay);
	
	tinsert(strMain, strTaskAward);
	
	return strMain;

	
end;



-- ���ڴ����ı��ڵĹؼ��֣��磺�Ա��ʶ��ͬ��ͼ�����ӱ�ʶ���ص���ɫ��ʶ�ȡ�
function SetTaskPlaneColor(str)

	local strKey = ":";
	local strKeyLeft = "{{";    -- "<color=yellow>" �򻯱�ʶ
	local strKeyRight = "}}";   -- "<color>" �򻯱�ʶ
	local strKeySex = "<sex>"; -- �Ա��ʶ
	local strKenPan = "<pan>"; -- ͬ��ͼ�����ӱ�ʶ
	local strKenNpc = "<npc>"; -- �Ի����� NPC ��ͼ����������ӱ�ʶ
	local strKeyDec = "<dec>";
	local strPoint = strfind(str,strKey,1);
	local strName = "";
	local strColorText = str;
	
	local strSexChange = "";
			
	-- �����ص��ʶ��ɫ
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- �����Ա��ʶ
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	-- ����ͬ���ʶ
	strColorText = join(split(strColorText,strKenPan), "");
	
	-- ���� NPC ���ֱ�ʶ
	strColorText = join(split(strColorText,strKenNpc), "");

	-- ���� DEC ��ʶ
	strColorText = join(split(strColorText,strKeyDec), "");

	str = strColorText;
	return str;
	
end;

-- ====================== �ļ���Ϣ ======================

-- ������Եonline �������ͷ�ļ�
-- Edited by peres
-- 2005/08/12 PM 10:28

-- ֻ��������������һ���
-- ����������ӵ����
-- ������ָ��Ƥ��
-- ���������������������ʹ
-- ���룬�����ǰ���
-- �����뱧Թʲô
-- ÿ���������Ƕ�������
-- ����֪�����������ֽӴ������İ�ȫ�к���ů�����ܴ�����ȡ��
-- ��ϲ����һ˲�䡣�·��ںڰ��Ĵ��ϣ�Ư������ľ�ͷ

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ͬ��ϵͳ��֧��
IncludeLib("PARTNER");


-- ��չ����ļ����֧��
Include("\\script\\class\\ktabex.lua");

-- �ر�ͼͷ�ļ���֧��
Include("\\script\\task\\random\\treasure_head.lua");

tabMainType = new(KTabFileEx, "\\settings\\task\\random\\rate_type.txt", "MainType");

tabTalk = new(KTabFileEx, "\\settings\\task\\random\\rate_talk.txt", "TalkTable");
tabColl = new(KTabFileEx, "\\settings\\task\\random\\rate_coll.txt", "CollTable");
tabShow = new(KTabFileEx, "\\settings\\task\\random\\rate_show.txt", "ShowTable");
tabKill = new(KTabFileEx, "\\settings\\task\\random\\rate_kill.txt", "KillTable");
tabNext = new(KTabFileEx, "\\settings\\task\\random\\rate_nexttask.txt", "NextTable");

stuTaskFile = {
	["Nhi�m v� ��i tho�i "] = tabTalk,
	["Nhi�m v� thu th�p "] = tabColl,
	["hi�n th� nhi�m v� "] = tabShow,
	["Nhi�m v� S�t qu�i "] = tabKill,
}

-- �����������

ID_RANDOMTASK = 1301;  -- �洢��ǰ��ҽӵ����������
ID_RANDOMTASK_WAIT = 1302; -- �洢��ǰ���ӵ��������
ID_RANDOMSTATE = 1303;  -- �洢�������Ľ�չ���
ID_RANDOMBOOK = 1304;   -- �洢��ҵ�ǰ�ľ������񣨵ڶ��㣩

ID_RANDOMBOOKDATE = 1305;  -- �洢���ʹ��������������
ID_RANDOMBOOKNUM = 1306;  -- �洢���ʹ���������Ĵ���

ID_RANDOMTASKDATE = 1308;  -- �洢��ҽ��������ʱ������
ID_RANDOMTASKNUM = 1309; -- �洢��ҽ����������Ĵ���

ID_RANDOMBOOKTEMP = 1307;  -- �洢���ʹ������������ʱ INDEX������ɾ��
ID_RANDOMTASKTEMP = 2391;  -- �洢���������������� INDEX

ID_USETREAMAP_TIME = 1738;  -- ��������ڱ��Ĵ���

-- ��ʼ��������񻷾���������������򴴽�һ������
-- �ɹ��򷵻� 1��ʧ���򷵻� 0
function initRandomTask()

local partnerindex, partnerstate = PARTNER_GetCurPartner()       -- ����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�

local nTaskID_Now = GetTask(ID_RANDOMTASK);
local nTaskID_Wait = createRandomTask();

	-- ����ȼ�С�� 60 �������ܽ����������
	if GetLevel()<60 then
		return 0;
	end;	
	
	-- ����Ѿ�������һ�� 1O �ε����������ٲ����������
	if checkRandomTaskEnable()~=1 then
		return 0;
	end;
	
	if nTaskID_Now==nTaskID_Wait then -- ���ѡ������������֮ǰ��һ�£���ֱ�ӷ��� 0
		return 0;
	else
		-- ����ȡ�������� ID �ȴ洢�ڴ��ӵ����������
		SetTask(ID_RANDOMTASK_WAIT, nTaskID_Wait);
		
		-- ͬ���������
		SyncTaskValue(ID_RANDOMTASK_WAIT);
		
		setRandomTaskState(1);
		TaskTip("B�n nh�n ���c m�t nhi�m v� ng�u nhi�n");
		
		-- ����ͬ���ͷ����ʾ״̬��50 ��
		PARTNER_AddState(partnerindex, 662, 1, 50);
		return 1;
	end;

end;


-- ����һ����������������������ȡ������ ID �洢�ڱ�����
-- ����ֵ���������ش����������� ID������ 0 ��ʧ��
function createRandomTask()

	local taskName = selectTask(selectType());   -- ����õ�һ������
	local nTaskID = TaskNo(taskName);            -- ���������Ʊ������ ID
	
	-- ������
	if nTaskID~=0 and nTaskID~=nil then
		
		-- ���ظ������ ID
		return nTaskID;
	else
		CDebug:MessageOut("nhi�m v� ng�u nhi�n b� th�t b�i, h�y xem k� l�i!");
		return 0;
	end;

end;

	
-- ѡ�����������
-- �������� string:strType
function selectType()
	local nLevel   = getTaskLevel();
	local nRow     = tabMainType:countArrayRate("Rate"..nLevel);
	local strType  = tabMainType:getCell("TaskType", nRow);
	CDebug:MessageOut("L�a ch�n lo�i nhi�m v�:"..strType);
	return strType;
end;


-- ������������ѡ����������
-- �������� string:taskName
function selectTask(strType)
	local nLevel   = getTaskLevel();
	local nRow     = stuTaskFile[strType]:countArrayRate("Rate"..nLevel);
	local taskName = stuTaskFile[strType]:getCell("TaskName", nRow);
	CDebug:MessageOut("L�a ch�n t�n nhi�m v� c� th�:"..taskName);
	return taskName;
end;


-- ѡ��ڶ����������
-- �������� string:taskName
function selectNextTask()
	local nRow     = tabNext:countArrayRate("Rate");
	local taskName = tabNext:getCell("TaskName", nRow);
	return taskName;
end;


-- ������������״̬
-- ���������int:nState ����Ľ�չ�̶ȣ�0Ϊû������1Ϊ����һ�����񴥷���2Ϊ�Ѿ�ȷ��������
function setRandomTaskState(nState)
	SetTask(ID_RANDOMSTATE, nState);
	
	-- ͬ���������
	SyncTaskValue(ID_RANDOMSTATE);
end;


-- ��ȡ��������״̬
-- ����ֵ��0Ϊû������1Ϊ����һ�����񴥷���2Ϊ�Ѿ�ȷ��������
function getRandomTaskState()
	return GetTask(ID_RANDOMSTATE);
end;


-- �������Ƿ��ܼ������������
function checkRandomTaskEnable()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- ȡ�ý����ʱ�䣬��/��/��
local nOldDate = GetTask(ID_RANDOMTASKDATE);
local nTimes   = GetTask(ID_RANDOMTASKNUM);

	-- ���ʱ�䲻��ͬ�������
	if nNowDate~=nOldDate then
		return 1;
	else
		-- ���ÿ�����˴ﵽ���߳��� 10 ���򲻿�����
		if nTimes>=10 then
			return 0;
		else
			return 1;
		end;
	end;
	
end;

-- д�����������ɵ�ʱ��ʹ���
function writeRandomTaskEnable()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- ȡ�ý����ʱ�䣬��/��/��
local nOldDate = GetTask(ID_RANDOMTASKDATE);
local nTimes   = GetTask(ID_RANDOMTASKNUM);

	-- ���ʱ�䲻��ͬ�����ʱ��
	if nNowDate~=nOldDate then
		nTimes = 0;
	end;

	SetTask(ID_RANDOMTASKDATE, nNowDate);
	SetTask(ID_RANDOMTASKNUM, nTimes + 1);
	
end;



-- �������Ƿ��ܼ���ʹ���������
function checkTaskBookEnable()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- ȡ�ý����ʱ�䣬��/��/��
local nOldDate = GetTask(ID_RANDOMBOOKDATE);
local nTimes   = GetTask(ID_RANDOMBOOKNUM);

	-- ���ʱ�䲻��ͬ�������
	if nNowDate~=nOldDate then
		return 1;
	else
		-- ���ÿ�����˴ﵽ���߳��� 8 ���򲻿�����
		if nTimes>=8 then
			return 0;
		else
			return 1;
		end;
	end;
end;


-- д��������ᵱ����ɵ�ʱ�������
function writeTaskBookTimes()

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- ȡ�ý����ʱ�䣬��/��/��
local nOldDate = GetTask(ID_RANDOMBOOKDATE);
local nTimes   = GetTask(ID_RANDOMBOOKNUM);

	-- ���ʱ�䲻��ͬ�����ʱ��
	if nNowDate~=nOldDate then
		nTimes = 0;
	end;

	SetTask(ID_RANDOMBOOKDATE, nNowDate);
	SetTask(ID_RANDOMBOOKNUM, nTimes + 1);
	
end;


-- ȷ�Ͻ����������Ļص�����
function _confirmRandomTask()

local nTaskID_Now = GetTask(ID_RANDOMTASK);
local nTaskID_Wait = GetTask(ID_RANDOMTASK_WAIT);
	
	-- ��յȴ��ӵ��������
	SetTaskStatus(TaskName(nTaskID_Wait), 0);
	CloseTask( TaskName(nTaskID_Wait) );	
	
	-- ��������Ƶ���ʱ��������
	SetTask(ID_RANDOMTASKTEMP, 0);
	
	ApplyTask( TaskName(nTaskID_Wait) );   -- ���뿪ʼһ������

end;


-- ��ȡ����ĵȼ����� 10~100 ÿ 10 ��һ���ȼ�
-- ����ֵ��int:level
function getTaskLevel()

	local nLevel = GetLevel();

	if nLevel<10 then return 10; end;	
	if nLevel>100 then return 100; end;
	
	return floor(nLevel/10)*10;
	
end;

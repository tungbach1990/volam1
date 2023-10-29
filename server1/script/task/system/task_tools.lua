
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ����ϵͳ���߽ű�
-- Edited by peres
-- 2005/07/29 PM 12:30

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- �������ݶ���ͷ�ļ�
Include("\\script\\task\\system\\task_head.lua");

-- ���� DEBUG ��������ļ�
Include("\\script\\task\\system\\task_debug.lua");

strTitle        = "<color=green>C�m nang nhi�m v�<color>:";
strTitle_Normal = strTitle.."B�n mu�n xem nhi�m v� n�o?<enter>"
strTitle_None   = strTitle.."B�n hi�n ch�a l�m nhi�m v� n�o.";


function main()

Say(strTitle.."B�n mu�n l�m nhi�m v� n�o trong c�m nang nhi�m v� n�y kh�ng?",4,
	"Xem m�nh hi�n �ang l�m nhi�m v� n�o./ShowEventMain",
	"S� tr� v� tr�ng th�i ban ��u/MenuSetTaskClearn",
	"S� x�a to�n b� c�c nhi�m v� /MenuSetEventClearn",
	"��ng/Task_Exit");

return 1;

end;

-- ���ѡ��鿴�¼����������г��������ڽ��е��¼������ѡ��
function ShowEventMain()

local i=0;
local aryEvent = EnumEventList();
local aryTalkText = {strTitle_Normal};

	if aryEvent==nil then
		Say(strTitle_None, 0);
		return
	end;
	
	for i,j in aryEvent do
		rawset(aryTalkText,
				getn(aryTalkText)+1,
				TaskEvent(i, 1, 1).."/#ShowEventDetail("..i..")");
	end;
	
	rawset(aryTalkText, getn(aryTalkText)+1, "��ng/Task_Exit");
	
	SelectSay(aryTalkText);
	
	return 1;


end;


function ShowEventDetail(nEventID)

local aryTask = EnumEventTask(nEventID);
local strMain = {strTitle.."D��i ��y l�<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>T�nh tr�ng chi ti�t:<enter><enter>"} -- �����б��ַ���

local i=0;


	for i=1, getn(aryTask) do
		strMain[1] = strMain[1]..GetTaskText(TaskName(aryTask[i]), 1, 3)..GetTaskStatusText(aryTask[i]).."<enter>";
	end;
	
	rawset(strMain, getn(strMain)+1, "X�a nhi�m v� n�y/#_ClearnTaskState("..nEventID..")");
	rawset(strMain, getn(strMain)+1, "Tr� l�i thanh menu ch�nh/main");
	rawset(strMain, getn(strMain)+1, "��ng/Task_Exit");
	
	SelectSay(strMain);

end;


-- ö�ٳ���ǰ���ڽ��е��¼�
function EnumEventList()

local aryTask  = EnumTaskList(); -- ȡ�õ�ǰ���ڽ�չ������
local aryEvent = {}
local i=0;

	if aryTask==nil then return nil; end;
	
	for i=1, getn(aryTask) do
		rawset(aryEvent,
				GetTaskEventID(aryTask[i]),
				1);
	end;
	
	return aryEvent;

end;


-- ö�ٳ�һ�¼������������񣬷���һ������
function EnumEventTask(nEventID)

local aryTask = {};

local nEvent = GetEventTaskCount(nEventID);

	CDebug:MessageOut("C� ���c:"..nEventID.." s� nhi�m v� l�:"..nEvent);

local i=0;

	if nEvent==0 then return nil; end;
	
	for i=1, nEvent do
		CDebug:MessageOut("�ang nh�p s� nhi�m v�:"..TaskNo(GetEventTask(nEventID, i)));
		rawset(aryTask,
				getn(aryTask)+1,
				TaskNo(GetEventTask(nEventID, i))
				);
	end;
	
	return aryTask;

end;


-- �ص����������һ���¼����������״̬��������ʱ����
function _ClearnTaskState(nEventID)

local aryTask = EnumEventTask(nEventID);

if aryTask==nil then return end;

	for i=1, getn(aryTask) do
		CDebug:MessageOut("�ang x�a"..TaskName(aryTask[i]).."Tr�ng th�i nhi�m v� ");
		SetTaskStatus(TaskName(aryTask[i]), 0);
		CloseTask(TaskName(aryTask[i]));
	end;

	Say(strTitle.."B�n �� x�a h�t<color=yellow>"..TaskEvent(nEventID, 1, 1).."<color>ph�n t�ch to�n b� nhi�m v� ", 0);

end;


-- ��һ���������óɻ�δ��ʼ��״̬
function MenuSetTaskClearn()
	AskClientForString("_SetTaskClearn", "", 1, 20, "Xin h�y nh�p m�t kh�u:");
end;


function _SetTaskClearn(taskID, nIndex)

	if TaskName(taskID)==0 or TaskName(taskID)==nil then
		Say(strTitle.."M�t kh�u n�y kh�ng ��ng!", 0);
		return
	end;

	SetTaskStatus(TaskName(taskID), 0);
	CloseTask(TaskName(taskID));
	
	Say(strTitle.."B�n nh�n ���c<color=yellow>"..TaskName(taskID).."<color>Tr� v� tr�ng th�i ban ��u", 0);

end;


-- ��һ���¼������е��������
function MenuSetEventClearn()
	AskClientForString("_SetEventClearn", "", 1, 20, "Xin h�y nh�p m�t kh�u:");
end;


function _SetEventClearn(eventID, nIndex)

local nEvent = GetEventTaskCount(eventID);

	if nEvent==0 then
		Say(strTitle.."M�t kh�u n�y kh�ng ��ng!", 0);
		return
	end;

	_ClearnTaskState(eventID);
end;


-- ���ַ�����ʾһ�������״̬
function GetTaskStatusText(nTaskID)

local aryText = {
	[0]=" - <color=red>ch�a b�t ��u<color>",
	[1]=" - <color=green>Ti�n h�nh<color>",
	[2]=" - <color=yellow>�� ho�n th�nh<color>",
	[3]=" - <color=yellow>�� nh�n qu� t�ng<color>",
}

	return aryText[GetTaskStatus(TaskName(nTaskID))];
	
end;
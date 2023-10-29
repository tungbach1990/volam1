
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ����ϵͳ���߽ű�
-- Edited by peres
-- 2005/07/29 PM 12:30

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ͬ��ϵͳ��֧��
IncludeLib("PARTNER");

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ��������ϵͳͷ�ļ��������������
Include("\\script\\task\\system\\task_main.lua");

strTitle        = "<color=green>C�m nang nhi�m v�<color>:";
strTitle_Normal = strTitle.."B�n mu�n xem nhi�m v� n�o?<enter>"
strTitle_None   = strTitle.."B�n hi�n ch�a l�m nhi�m v� n�o.";
strPublic       = "<color=green>C�m nang nhi�m v�<color>:"

-- �� main() �ĳ� main_back ���ɽ��������߽���
function main_back()

Say(strTitle.."B�n mu�n l�m nhi�m v� n�o trong c�m nang nhi�m v� n�y kh�ng?",7,
	"Xem m�nh hi�n �ang l�m nhi�m v� n�o./ShowEventMain",
	"b�ng tay b�t ��u m�t nhi�m v� �� t�n t�i/MenuStartTask",
	"Ng�u nhi�n nh�n ���c m�t nhi�m v� b�n ��ng h�nh/MenuGetRandomTask",
	"Nh�n ���c m�t nhi�m v� c� t�t c� v�t ph�m c�n thi�t/MenuGetTaskItem",
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
	
	rawset(aryTalkText, getn(aryTalkText)+1, "��ng/OnTaskExit");
	
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
	rawset(strMain, getn(strMain)+1, "��ng/OnTaskExit");
	
	SelectDescribe(strMain);

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


-- ѡ���ֶ���ʼһ������
function MenuStartTask()
	AskClientForString("_StartTask", "", 1, 20, "Nh�p s� th� t� ho�c t�n nhi�m v�:");
end;


-- �ص��������ֶ���ʼһ��������
function _StartTask(taskName)

-- �������������������������
if tonumber(taskName)~=nil then
	taskName = TaskName(taskName);
end;

	SetTaskStatus(taskName, 0);
	CloseTask(taskName);
	ApplyTask(taskName);
	
end;


-- ���ѡ��һ��ͬ���������
function MenuGetRandomTask()

local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- ����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
local nResult = 0;

	if partnerindex==0 or partnerstate==0 then
		Msg2Player(strPublic.."<color=yellow>Kh�ng c� g�i ��ng h�nh kh�ng nh�n ���c nhi�m v� ng�u nhi�n!<color>");
		return
	end;
	
	nResult = initRandomTask();
		
	if nResult==0 then
		CDebug:MessageOut("T�y theo nhi�m v� b�n s� ch�n s� ID t��ng �ng!");
	end;

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



-- �õ�һ����������Ҫ��������Ʒ
function MenuGetTaskItem()
	AskClientForString("_GetTaskItem", "", 1, 20, "Xin h�y nh�p m�t kh�u:");
end;


-- �ص��������õ�һ����������Ҫ��������Ʒ
function _GetTaskItem(taskID, nIndex)

local taskName = TaskName(taskID);

	-- ���������������ַ� 9999 �Ļ���ֱ��ȡ�������ǰ��
	if tonumber(taskID)==9999 then taskName=TaskName(GetTask(1301)); end;

-- �����������һƽ�װ����������ͨ��Ʒ
local checkType = GetTaskCollectType(taskName);

-- ������ҪѰ�ҵ���Ʒ�б�
local aryOrgCollect = {};

-- ������Ҫ����Ʒ���
local w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, w_GoodsNum, w_DelGoods, w_Quality = 0,0,0,0,0,0,0,0;
	
local i,j,k=0,0,0;

	-- ��ȡ��ҪѰ�ҵ���Ʒ�б�
	if checkType>=1 then
		aryOrgCollect = GetTaskCollectRow(taskName);
	else
		Say("Nhi�m v� �� kh�ng c�n thu th�p v�t ph�m!", 0);
		return
	end;

	-- ����ռ�������ͨװ��
	if checkType==1 then
	
		-- ��ȡ����������Ʒ�б�
		for j, k in aryOrgCollect do
		
				-- ���Զ����ת�����ֺ�����ת�����������ֱ�ʶ
				w_Genre      = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Genre_Row));
				w_Detail     = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Detail_Row));
				w_Particular = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Particular_Row));
				w_Level      = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Level_Row));
				w_GoodsFive  = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_GoodsFive_Row));
				w_GoodsNum   = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_GoodsNum_Row));
				w_DelGoods   = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_DelGoods_Row));
				
				if w_Level==-1 then w_Level=1; end;
				if w_GoodsFive==-1 then w_GoodsFive=0 end;
				
				for i=1, w_GoodsNum do
					AddItem(w_Genre, w_Detail, w_Particular, w_Level, w_GoodsFive, 0, 0);
				end;
				
		end;
		
	else
	
		-- ��ȡ����������Ʒ�б�
		for j, k in aryOrgCollect do
		
			w_Quality    = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_Quality_Row));
			w_GoodsNum   = TranItemNumber(TaskEntity(taskName, j, Entity.Goods_GoodsNum_Row));

				for i=1, w_GoodsNum do
					AddGoldItem(0, w_Quality);
				end;
				
		end;
		
	end;
	
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
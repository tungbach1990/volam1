
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ����ϵͳ�������ͻ��˽ű�
-- Edited by peres
-- 2005/07/04 PM 19:59

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================
-- ����ϵͳ
IncludeLib("TASKSYS");

-- �������ݶ���ͷ�ļ�
Include("\\script\\task\\system\\task_head.lua");

function GetItemDescription(name, magiclevel1, magiclevel2, magiclevel3, magiclevel4, magiclevel5, magiclevel6)

local strDesc = "";

	strDesc = strDesc.."<enter>Mi�u t� nhi�m v�: <color=yellow>"..TaskId(magiclevel1, 1, TaskID_Table.TaskText_Row).."<color><enter><enter>";

	strDesc = strDesc..CreateAwardText(TaskName(magiclevel1));

	strDesc = strDesc.."<enter><color=yellow>Di�n gi�i: nh�p chu�t ph�i th� l�p t�c ti�p nh�n nhi�m v� n�y<color><enter>";
	
	return strDesc;

end;


-- ���ɽ��������ֶ�
function CreateAwardText(taskName)

local nRow, nCol = TaskAwardMatrix(taskName);

local i=0;

local aryAward = {{}};

local strArray = "";
local strArrayRate = "";
local strText = ""; -- ������˵��

local nIsArray = 0; -- �ж��Ƿ�������

local strAwardNormal = {} -- �̶�����Ľ���
local strAward = "Sau khi ho�n th�nh nhi�m v� nh�n ���c ph�n th��ng: <enter>"; -- ��󷵻صĽ����ֶ�

local strType = "";

	strType = TaskAward(taskName, 1, 1);

	-- ���������������ǽ��������Ĵ���
	if strType=="h� th�ng ph�n th��ng" then
		-- ֱ����������������
		taskName = TaskAward(taskName, 1, Award.AlliedAward_Row);
		nRow, nCol = TaskAwardMatrix(taskName);
	end;

	for i=1, nRow do
	
		strArray = TaskAward(taskName, i, Award.ArrayID_Row);
		strArrayRate = TaskAward(taskName, i, Award.ArrayRate_Row);
		strText     = TaskAward(taskName, i, Award.AwardText_Row);
		
		-- �������������������
		if strArray~="" then
		
			-- ������鲻�������ʼ������
			if aryAward[tonumber(strArray)]==nil then
				rawset(aryAward, tonumber(strArray), {}); 
			end;
			
			 rawset(aryAward[tonumber(strArray)],
			 		getn(aryAward[tonumber(strArray)])+1,
			 		"<color=green>"..strText.."<color>  "..strArrayRate.."% c� h�i"
			 		);
			 		
			 nIsArray = 1;
			 
		else
			rawset(strAwardNormal,
					getn(strAwardNormal)+1,
					strText);
		end;
	
	end;
	
	-- ������������������飬��������鷢������
	if nIsArray==1 then
		for i=1, getn(aryAward) do
			strAward = strAward.."<enter>th� "..i.."ph�n th��ng ng�u nhi�n:<enter>";
			strAward = strAward..CreateTextForArray(aryAward[i]);
		end;
	end;
	
	strAward = strAward.."<enter>Ph�n th��ng c� ��nh:<enter>";
	
	if getn(strAwardNormal)~=0 then
	
		for i=1, getn(strAwardNormal) do
			strAward = strAward.."<color=green>"..strAwardNormal[i].."<enter>";
		end;
		
	else
		strAward = strAward.."<color=green>Ph�n th��ng kh�ng c� ��nh<color>";
	end;
	
	return strAward;
	
end;



function CreateTextForArray(aryAward)

local strAward = "";
local i=0;


	-- ����������Ķ�������ȥ
	for i=1, getn(aryAward) do
		strAward = strAward..aryAward[i].."<enter>";
	end;
	
	return strAward;
	
end;
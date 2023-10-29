
-- ====================== �ļ���Ϣ ======================

-- ������Եonline �������������ᴥ���ű�
-- Edited by peres
-- 2005/09/01 PM 16:40

-- ֻ��������������
-- �����మ
-- ���ǵ�
-- �����ָ�Ħ������Ƥ���ϵ�����
-- ������������Ⱥ������ӹ�
-- ��������������ı���ͷ���
-- ����˯ʱ������ӳ�������
-- ���ǵã��峿���ѹ�����һ�̣������������
-- �������۾��������͸������һ��һ����������
-- ����������Ϊ�Ҹ�����ʹ

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- ͬ��ϵͳ��֧��
IncludeLib("PARTNER");

-- ��������ϵͳͷ�ļ��������������
Include("\\script\\task\\system\\task_main.lua");

strPublic       = "<color=green>M�t �� nhi�m v�<color>:";

function main(nIndex)

local partnerindex,partnerstate = PARTNER_GetCurPartner()       -- ����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�

local nTaskID = GetItemMagicLevel(nIndex, 1);

local nNowTaskID = GetTask(ID_RANDOMBOOK);  -- ��ȡ��ǰ��������� ID

local nTaskState = 0;  -- ��ǰ���������״̬

	if (GetProductRegion() == "cn") then
		-- �ж��Ƿ��ٻ���ͬ��
		if partnerindex==0 or partnerstate==0 then
			Msg2Player(strPublic.."<color=yellow>B�n kh�ng c� ��ng h�nh tri�u g�i kh�ng th� ��c n�i dung trong m�t ��.<color>");
			return 1;
		end;
	end;
	
	-- �ж�ÿ�� 8 �ε������Ƿ����
	if checkTaskBookEnable()~=1 then
		Msg2Player(strPublic.."<color= v�nhite>B�n h�m nay qu� m�t r�i, �� ng�y mai l�m ti�p nhi�m v� �i!<color>");
		return 1;
	end;
	
	
	if nNowTaskID ~= 0 then
		nTaskState = GetTaskStatus(TaskName(GetTask(ID_RANDOMBOOK)));
	end;
	
	if nTaskState>0 and nTaskState<3 then
		Say("<color=green>M�t �� nhi�m v�<color>: Hi�n t�i b�n ch�a ho�n th�nh m�t �� nhi�m v�, b�n x�c ��nh l�m nhi�m v� m�i kh�ng?",
			2,
			"Ph�i, ta mu�n b� qua m�t �� nhi�m v� tr��c ��/#_confirmRandomBookTask("..nIndex..")",
			"Kh�ng ph�i, ��i m�t l�t ��!/OnTaskExit");
		return 1;
	else
		
		-- ����������������ص����񣬷��������������濪ʼ
		SetTaskStatus(TaskName(nTaskID), 0);
		local nResult = CloseTask(TaskName(nTaskID));

		-- �洢��Ʒ INDEX �����������
		SetTask(ID_RANDOMBOOKTEMP, nIndex)		
		
		ApplyTask( TaskName(nTaskID) );

		if nResult~=1 then
			WriteTaskLog("[Tr�ng th�i d� th��ng] � Task ID:"..nTaskID..", kh�ng ���c ��ng l�i ��ng c�ch! Process l�: TaskBook Main().");
		end;
		
		return 1;
	end;

end;


-- ȷ�Ͻ��ܾ�������
function _confirmRandomBookTask(nIndex)

local nTaskID = GetItemMagicLevel(nIndex, 1);

	-- ��յ�ǰ�������ľ�������
	SetTaskStatus(TaskName(GetTask(ID_RANDOMBOOK)), 0);
	CloseTask(TaskName(GetTask(ID_RANDOMBOOK)));

	-- ����������������ص����񣬷��������������濪ʼ
	SetTaskStatus(TaskName(nTaskID), 0);
	local nResult = CloseTask(TaskName(nTaskID));
	
	-- �洢��Ʒ INDEX �����������
	SetTask(ID_RANDOMBOOKTEMP, nIndex)
	
	ApplyTask( TaskName(nTaskID) );
	
	if nResult~=1 then
		WriteTaskLog("[Tr�ng th�i d� th��ng] � Task ID:"..nTaskID..", kh�ng ���c ��ng l�i ��ng c�ch! Process l�: _confirmRandomBookTask, tham s� ��a v�o l�:"..nIndex);
	end;
	
	return
	
end;
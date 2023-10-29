
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���彭��ͬ�����ű�ͷ�ļ�
-- Edited by peres
-- 2005/09/09 PM 11:19

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

-- ͬ��ϵͳ��ͷ�ļ�
IncludeLib("PARTNER")

-- ����������֧��
Include ("\\script\\lib\\mem.lua");

-- �����ַ��������ļ�
Include ("\\script\\task\\system\\task_string.lua");

-- ���뽱��ͷ�ļ�
Include ("\\script\\task\\partner\\task_award.lua");

PARID_TASK_MASTER_001 = 3;      -- ��¼����֮���Ľ�չ ID
PARID_TASK_MASTER_002 = 4;      -- ��¼������֮�ؽ�չ�� ID
PARID_TASK_MASTER_003 = 5;      -- ��¼�鱦���˽�չ�� ID
PARID_TASK_MASTER_004 = 6;      -- ��¼������ʿ��չ�� ID
PARID_TASK_MASTER_005 = 14;     -- ��¼���������չ�� ID

PARID_TASK_REWIND_001 = 30;     -- ��¼����֮������ƪ�Ľ�չ ID
PARID_TASK_REWIND_002 = 31;     -- ��¼������֮������ƪ�Ľ�չ ID
PARID_TASK_REWIND_003 = 32;     -- ��¼�鱦��������ƪ�Ľ�չ ID
PARID_TASK_REWIND_004 = 33;     -- ��¼������ʿ����ƪ�Ľ�չ ID

ARY_REWIND_DATE = {
	[1] = 61, -- ��¼����֮������ƪ�Ŀ�ʼ����
	[3] = 62, -- ��¼�鱦��������ƪ�Ŀ�ʼ����
	[4] = 63, -- ��¼������ʿ����ƪ�Ŀ�ʼ����
}

ARY_REWIND_NUM = {
	[1] = 64, -- ��¼����֮������ƪ����ɴ���
	[3] = 65, -- ��¼�鱦��������ƪ����ɴ���
	[4] = 66, -- ��¼������ʿ����ƪ����ɴ���
}

CProcess = {

	-- �������Ŀ�ʼ�����Ƿ���ϣ�������
	checkCondition = function(self)
		return 1;
	end,
	
	-- ����ľ������ݣ�������
	taskEntity = function(self, nCondition)
		return 1;
	end,
	
	-- ִ����������ݣ���������
	-- ���������int:nMode ���Ϊ 1 ���ʾ���˹�ִͬ�д�����
	-- ���� 0 ���ʾִ�й��������ݣ����Լ���ԭ���Ľű�
	-- ���� 1 ���ʾ�����ݣ�Ӧ���ж�����Ľű�ִ��
	doTaskEntity = function(self, nMode)
		
		local nPreservedPlayerIndex = PlayerIndex
		local nMemCount = GetTeamSize()
		
		local nCondition = 0;
		local nResult = 0;
		local i = 0;
		
		if nMode==nil then nMode=0; end;
		
--		if nMode==1 then
--			if (nMemCount == 0) then
--				nCondition = self:checkCondition();
--				nResult = self:taskEntity(nCondition);
--			else
--				for i = 1, nMemCount do -- �����￪ʼѭ������ÿ�����
--					PlayerIndex = GetTeamMember(i);
--					-- �ų��Լ�֮����������ִ��һ��
--					if PlayerIndex~=nPreservedPlayerIndex or nPreservedPlayerIndex==nil then
--						self:taskEntity(self:checkCondition());
--					end;
--				end;
--				PlayerIndex = nPreservedPlayerIndex; -- ѭ��������������黹����� ID
				
--				-- ����������Լ�ִ��һ��
--				nResult = self:taskEntity(self:checkCondition());
--			end;
--		else

		nCondition = self:checkCondition();
		nResult = self:taskEntity(nCondition);
		return nResult;
		
--		end;
--		return nResult;
	end,
	
};

-- �������߾�������Ľ�չ״̬
-- ���������int:nMaster �ڼ������ߣ�int:nState �����״̬
function SetMasterTaskState(nMaster, nState)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count();
	
	-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	PARTNER_SetTaskValue(partnerindex, nMaster, nState);

end;

-- ��ȡ���߾�������Ľ�չ״̬
-- ���������int:nMaster �ڼ�������
-- ����ֵ��int:State �����״̬
function GetMasterTaskState(nMaster)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count();
	
	-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	return PARTNER_GetTaskValue(partnerindex, nMaster);

end;


-- ����������������Ľ�չ״̬
-- ���������int:nRewind �ڼ������ߣ�int:nState �����״̬
function SetRewindTaskState(nRewind, nState)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count();
	
	-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	PARTNER_SetTaskValue(partnerindex, nRewind, nState);

end;


-- ��ȡ������������Ľ�չ״̬
-- ���������int:nRewind �ڼ�������
-- ����ֵ��int:State �����״̬
function GetRewindTaskState(nRewind)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count();
	
	-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	return PARTNER_GetTaskValue(partnerindex, nRewind);

end;


-- ����������������Ƿ�����
-- ���������int:nTask �ڼ�����������
function CheckRewindState(nTask)

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- ȡ�ý����ʱ�䣬��/��/��
local nOldDate = GetPartnerTask(ARY_REWIND_DATE[nTask]);
local nTimes   = GetPartnerTask(ARY_REWIND_NUM[nTask]);

	-- ���ʱ�䲻��ͬ�������
	if nNowDate~=nOldDate then
		return 1;
	else
		-- ���ÿ�����˴ﵽ���߳��� 3 ���򲻿�����
		if nTimes>=3 then
			return 0;
		else
			return 1;
		end;
	end;
	
end;


-- ������������ʼһ���µ���������Ĵ���
function SetRewindStart(nTask)

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- ȡ�ý����ʱ�䣬��/��/��
local nOldDate = GetPartnerTask(ARY_REWIND_DATE[nTask]);

	if nNowDate~=nOldDate then
		SetPartnerTask(ARY_REWIND_DATE[nTask], nNowDate);
		SetPartnerTask(ARY_REWIND_NUM[nTask], 0);
	end;
	
end;


-- ���һ�������������ô˹���
function SetRewindFinish(nTask)

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- ȡ�ý����ʱ�䣬��/��/��
local nTimes   = GetPartnerTask(ARY_REWIND_NUM[nTask]);
local i=0;

	SetPartnerTask(ARY_REWIND_DATE[nTask], nNowDate);
	SetPartnerTask(ARY_REWIND_NUM[nTask], nTimes + 1);

	-- ������еĽ�����¼
	for i=1, 10 do
		SetTaskAwardState(ARY_REWIND_AWARD[nTask], i, 0);
	end;
	
end;


-- ����ͬ����������
-- ���������int:nTaskID ��������ţ�int:nTaskValue �������ֵ
function SetPartnerTask(nTaskID, nTaskValue)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count();
	
	-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	PARTNER_SetTaskValue(partnerindex, nTaskID, nTaskValue);

end;

-- ��ȡͬ����������
-- ���������int:nTaskID ���������
function GetPartnerTask(nTaskID)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count();
	
	-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	return PARTNER_GetTaskValue(partnerindex, nTaskID);
	
end;

-- �����ж�Աִ��ͬһ����
function DoTeamProcess(funProcess)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();

	if (nMemCount == 0) then
		funProcess();
	else
		for i = 1, nMemCount do -- �����￪ʼѭ������ÿ�����
			PlayerIndex = GetTeamMember(i);
			funProcess();
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ѭ��������������黹����� ID
	end;
end;


function OnTaskExit()

end;

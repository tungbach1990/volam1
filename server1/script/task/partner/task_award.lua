
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ���彭��ͬ����齱���ű�ͷ�ļ�
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
IncludeLib("PARTNER");

-- ���� DEBUG ��������ļ�
Include("\\script\\task\\system\\task_debug.lua");

-- ����Ի�֮�µ�ͷ�ļ�
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua");

Include([[\script\tong\tong_award_head.lua]]);--�����Ŀ�깱�׶�by־ɽ
-- ��¼����ƪ�������ŵ� ID

ARY_MASTER_AWARD = {
	[1] = 50,
	[2] = 51,
	[3] = 52,
	[4] = 53,
	[5] = 54,
}

-- ��¼����ƪ�������ŵ� ID
ARY_REWIND_AWARD = {
	[1] = 55,
	[3] = 56,
	[4] = 57,
}

ARY_SKILLBOOK = {849,850,851,853,854,855,859,861,862,863,864,868,870}

-- ͬ��ϵͳ��ͷ�ļ�
IncludeLib("PARTNER")

aryMasterAward = {	
	-- ����֮��
	[1] = function(nState)		
		-- ���崦��ȡ����󷢷Ž���
		if nState==1 then
			AddOwnExp(20000);
			AddPartnerExp(5000);
		end;
		
		-- ����ʦ̫������ȥ�ò�ҩ�󷢷Ž���
		if nState==2 then
			AddOwnExp(20000);
			AddPartnerExp(5000);		
		end;
		
		-- �ɵ�����ɽ����õĽ���
		if nState==3 then
			AddOwnExp(2000);
			AddPartnerExp(1000);
		end;
		
		-- �ɵ������ӻ�õĽ���
		if nState==4 then
			AddOwnExp(2000);
			AddPartnerExp(1000);
		end;

		-- �ɵ�����կ����õĽ���
		if nState==5 then
			AddOwnExp(20000);
			AddPartnerExp(5000);
		end;
		
		-- �ɵ�ɽ������õĽ���
		if nState==6 then
			AddOwnExp(100000);
			AddPartnerExp(20000);
			skillbook_select(2)
		end;

		-- ���ɽ�������������󣬻�������ʦ̫�����ŵĽ���
		if nState==7 then
			AddOwnExp(20000);
			AddPartnerExp(5000);
		end;

		-- ����֮��������ɣ����崦���ŵĽ���
		if nState==8 then
			AddOwnExp(20000);
			AddPartnerExp(5000);
			skillbook_select(1)
		end;
				
	end,
	
	
	-- ������֮��
	[2] = function(nState)
	
		-- ���崦��ȡ����󷢷Ž���
		if nState==1 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
		end;
		
		-- �販ʿ����������󷢷Ž���
		if nState==2 then
			AddOwnExp(40000);
			AddPartnerExp(10000);		
		end;

		-- ��ٴ�������ʹ�ؿ�ȫ�����غ󷢷Ž���
		if nState==3 then
			AddOwnExp(400000);
			AddPartnerExp(400000);
			skillbook_select(2)
		end;

		-- �販ʿ���ظ��󷢷ŵĽ���
		if nState==4 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
		end;
		
		-- ���崦�������õ��Ľ���
		if nState==5 then
			AddOwnExp(100000);
			AddPartnerExp(10000);
			skillbook_select(1)
		end;					
	end,

	
	-- �鱦����
	[3] = function(nState)
	
		-- ���崦��ȡ����󷢷Ž���
		if nState==1 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
		end;
		
		-- ��Ӧ����Ӫ�ȶ����󷢷ŵĽ���
		if nState==2 then
			AddOwnExp(20000);
			AddPartnerExp(10000);		
		end;

		-- �ɵ�һ��ǹ�����õĽ���
		if nState==3 then
			AddOwnExp(4000);
			AddPartnerExp(5000);
		end;

		-- �ɵ�һ���������õĽ���
		if nState==4 then
			AddOwnExp(4000);
			AddPartnerExp(5000);
		end;
		
		-- �ɵ�һ�����������õĽ���
		if nState==5 then
			AddOwnExp(20000);
			AddPartnerExp(50000);
		end;
		
		-- �ɵ�һ��ˢ���ֻ�õĽ���
		if nState==6 then
			AddOwnExp(40000);
			AddPartnerExp(80000);
		end;

		-- Ӫ�ȳ������󷢷ŵĽ���
		if nState==7 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
		end;
		
		-- ���崦�������õ��Ľ���
		if nState==8 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
			skillbook_select(1)
		end;
	end,

	
	-- ������ʿ
	[4] = function(nState)
	
		-- ���崦��ȡ����󷢷Ž���
		if nState==1 then
			AddOwnExp(40000);
			AddPartnerExp(20000);
		end;

		-- �����èè���õĽ���
		if nState==2 then
			AddOwnExp(60000);
			AddPartnerExp(80000);
		end;

		-- ������ɺ��õĽ���
		if nState==3 then
			AddOwnExp(60000);
			AddPartnerExp(80000);
		end;
		
		-- ����幫�Ӻ��õĽ���
		if nState==4 then
			AddOwnExp(60000);
			AddPartnerExp(80000);
		end;

		-- ���������õĽ���
		if nState==5 then
			AddOwnExp(60000);
			AddPartnerExp(80000);
		end;

		-- �����Х�����õĽ���
		if nState==8 then
			AddOwnExp(60000);
			AddPartnerExp(80000);
		end;

		-- ���5��boss������һ�Ի���õĽ���
		if nState==6 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
		end;
		
		-- ���崦�������õ��Ľ���
		if nState==7 then
			AddOwnExp(40000);
			AddPartnerExp(10000);
			skillbook_select(1)
		end;					
	end,

	
	-- ��������
	[5] = function(nState)
		
		-- �������ͬ���ǰ4��ͬ���������ȫ���
		if nState==1 then
			AddOwnExp(5000000);
			AddPartnerExp(1000000);
		end;

	end,
}



-- ����ƪ����Ľ�������
aryRewindAward = {
	
	-- ����֮��
	[1] = function(nState)
	
		-- ���崦��ȡ����󷢷Ž���
		if nState==1 then
			AddOwnExp(CountDoubleMode(10000));
			AddPartnerExp(CountDoubleMode(1000));
		end;
		
		-- ����ʦ̫������ȥ�ò�ҩ�󷢷Ž���
		if nState==2 then
			AddOwnExp(CountDoubleMode(10000));
			AddPartnerExp(CountDoubleMode(1000));		
		end;
		
		-- �ɵ�����ɽ����õĽ���
		if nState==3 then
			AddOwnExp(CountDoubleMode(1000));
			AddPartnerExp(CountDoubleMode(200));		
		end;
		
		-- �ɵ������ӻ�õĽ���
		if nState==4 then
			AddOwnExp(CountDoubleMode(1000));
			AddPartnerExp(CountDoubleMode(200));
		end;

		-- �ɵ�����կ����õĽ���
		if nState==5 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(2000));
		end;
		
		-- �ɵ�ɽ������õĽ���
		if nState==6 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(2000));
		end;

		-- ���ɽ�������������󣬻�������ʦ̫�����ŵĽ���
		if nState==7 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(500));
		end;

		-- ����֮��������ɣ����崦���ŵĽ���
		if nState==8 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(1000));
			skillbook_select(3)
			tongaward_partner_juqing(1);--�����Ŀ��by־ɽ
		end;
				
	end,
	
	
	-- �鱦����
	[3] = function(nState)
	
		-- ���崦��ȡ����󷢷Ž���
		if nState==1 then
			AddOwnExp(CountDoubleMode(30000));
			AddPartnerExp(CountDoubleMode(2000));
		end;
		
		-- ��Ӧ����Ӫ�ȶ����󷢷ŵĽ���
		if nState==2 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(500));		
		end;

		-- �ɵ�һ��ǹ�����õĽ���
		if nState==3 then
			AddOwnExp(CountDoubleMode(2000));
			AddPartnerExp(CountDoubleMode(500));
		end;

		-- �ɵ�һ���������õĽ���
		if nState==4 then
			AddOwnExp(CountDoubleMode(2000));
			AddPartnerExp(CountDoubleMode(500));
		end;
		
		-- �ɵ�һ�����������õĽ���
		if nState==5 then
			AddOwnExp(CountDoubleMode(10000));
			AddPartnerExp(CountDoubleMode(2000));
		end;
		
		-- �ɵ�һ��ˢ���ֻ�õĽ���
		if nState==6 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(2000));
		end;

		-- Ӫ�ȳ������󷢷ŵĽ���
		if nState==7 then
			AddOwnExp(CountDoubleMode(20000));
			AddPartnerExp(CountDoubleMode(2000));
		end;
		
		-- ���崦�������õ��Ľ���
		if nState==8 then
			AddOwnExp(CountDoubleMode(30000));
			AddPartnerExp(CountDoubleMode(2000));
			skillbook_select(3)
			tongaward_partner_juqing(1);--�����Ŀ��by־ɽ
		end;
	end,

	
	-- ������ʿ
	[4] = function(nState)
	
		-- ���崦��ȡ����󷢷Ž���
		if nState==1 then
			AddOwnExp(CountDoubleMode(30000));
			AddPartnerExp(CountDoubleMode(2000));
		end;

		-- �����èè���õĽ���
		if nState==2 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(3000));
		end;

		-- ������ɺ��õĽ���
		if nState==3 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(3000));
		end;
		
		-- ����幫�Ӻ��õĽ���
		if nState==4 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(3000));
		end;

		-- ���������õĽ���
		if nState==5 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(3000));
		end;

		-- �����Х�����õĽ���
		if nState==8 then
			AddOwnExp(CountDoubleMode(50000));
			AddPartnerExp(CountDoubleMode(3000));
		end;

		-- ���5��boss������һ�Ի���õĽ���
		if nState==6 then
			AddOwnExp(CountDoubleMode(30000));
			AddPartnerExp(CountDoubleMode(2000));
		end;
		
		-- ���崦�������õ��Ľ���
		if nState==7 then
			AddOwnExp(CountDoubleMode(30000));
			AddPartnerExp(CountDoubleMode(3000));
			skillbook_select(3)
			tongaward_partner_juqing(0);--�����Ŀ��by־ɽ
		end;					
	end,
}

-- select_item:����ֵΪ1��ʾ�������1�������飬Ϊ2��ʾ������������飬Ϊ3��ʾ10%���ʽ������������
function skillbook_select(select_item)
		local i = random(199,599)
		local SKILLBOOK_LEVEL = floor(i/100)
		local j = getn(ARY_SKILLBOOK)
		local SKILLBOOK_NAME = ARY_SKILLBOOK[random(1,j)]
		if ( select_item == 1 ) then
			AddItem(6,1,SKILLBOOK_NAME,1,0,0)
			Msg2Player("<color=yellow>��õ���һ��ͬ�鼼���飡<color>");
		elseif ( select_item == 2 ) then
			AddItem(6,1,SKILLBOOK_NAME,SKILLBOOK_LEVEL,0,0)
			Msg2Player("<color=yellow>��õ���һ��ͬ�鼼���飡<color>");
		elseif ( select_item == 3 ) then
			local w = random(1,100)
			if ( w <= 30 ) then
				AddItem(6,1,SKILLBOOK_NAME,SKILLBOOK_LEVEL,0,0)
				Msg2Player("<color=yellow>��õ���һ��ͬ�鼼���飡<color>");
			end
		end;
end

function PayMasterAward(nTask, nState)
	if CheckMasterAwardState(nTask, nState)==1 then
		aryMasterAward[nTask](nState);
	end;
end;


function PayRewindAward(nTask, nState)
	if CheckRewindAwardState(nTask, nState)==1 then
		aryRewindAward[nTask](nState);
	end;
end;


-- ������ƪ�Ľ����Ƿ��ܸ��跢��
function CheckMasterAwardState(nTask, nState)

local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
local NpcCount = PARTNER_Count();

local nValue = 0;
local nBit = 0;

	-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	nValue = PARTNER_GetTaskValue(partnerindex, ARY_MASTER_AWARD[nTask]);
	nBit = GetBit(nValue, nState);

	if nBit==0 then
		nValue = SetBit(nValue, nState, 1);
		PARTNER_SetTaskValue(partnerindex, ARY_MASTER_AWARD[nTask], nValue);
		CDebug:MessageOut("������� "..nTask.." ������ĵ� "..nState.." ��״̬�Ƿ��ܷ������ɹ�");
		return 1;
	else
		CDebug:MessageOut("������� "..nTask.." ������ĵ� "..nState.." ��״̬�Ƿ��ܷ�����ʧ��");
		return 0;
	end;

end;

-- �������ƪ�Ľ����Ƿ��ܸ��跢��
function CheckRewindAwardState(nTask, nState)

local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
local NpcCount = PARTNER_Count();

local nValue = 0;
local nBit = 0;

	-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	nValue = PARTNER_GetTaskValue(partnerindex, ARY_REWIND_AWARD[nTask]);
	nBit = GetBit(nValue, nState);
	
	if nBit==0 then
		nValue = SetBit(nValue, nState, 1);
		PARTNER_SetTaskValue(partnerindex, ARY_REWIND_AWARD[nTask], nValue);
		CDebug:MessageOut("��������� "..nTask.." ������ĵ� "..nState.." ��״̬�Ƿ��ܷ������ɹ�");
		return 1;
	else
		CDebug:MessageOut("��������� "..nTask.." ������ĵ� "..nState.." ��״̬�Ƿ��ܷ�����ʧ��");
		return 0;
	end;

end;


-- ����һ������Ľ���״̬
function SetTaskAwardState(nTask, nState, nBit)

local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
local NpcCount = PARTNER_Count();

local nValue = PARTNER_GetTaskValue(partnerindex, nTask);

	nValue = SetBit(nValue, nState, nBit);
	
	PARTNER_SetTaskValue(partnerindex, nTask, nValue);
	
end;


function GetTaskAwardState(nTask, nState)

local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
local NpcCount = PARTNER_Count();

local nBit = GetBit(PARTNER_GetTaskValue(partnerindex, nTask), nState);

	CDebug:MessageOut("Get Bit��"..nBit, 2);

end;

-- ����ͬ��ľ���
function AddPartnerExp(nExp)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --����ٻ���ͬ���index,ͬ��״̬Ϊ�ٳ���Ϊ���ٳ�
	local NpcCount = PARTNER_Count();
	
	-- ���û�д�ͬ�����û���ٻ�ͬ����ֱ�ӷ��� nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	PARTNER_AddExp(partnerindex, nExp, 1);
	
end;


-- ˫�����ģʽ
-- ���������int:nValue ��Ҫ����ļ�ֵ��
function CountDoubleMode(nValue)

local nDoubleMode = greatnight_huang_event(5);

	if nDoubleMode~=0 or nDoubleMode~=nil then
		return nValue*nDoubleMode;
	else
		return nValue;
	end;

end;

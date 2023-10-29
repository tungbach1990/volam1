if (not __TONG_AWORD_HEAD__) then
	__TONG_AWORD_HEAD__ = 1;
	
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\tong\\contribution_entry.lua");


TASKID_TONG_RECORDTEMP		=	153;		--���ڼ�¼�ν�Ȼ����һ�õĻ��ָ���������
TASKID_TONG_TASKLINKTEMP	=	154;		--���ڼ�¼Ұ�������ֵ��
TASKID_TONG_WUSHENBLESS		=	2509;		--����͸�ʵЧ


function FALSE(param)
	if (param == nil or param == "" or param == 0) then
		return 1;
	end;
	return 0;
end;

--�ν�ս�������Ŀ�ꡣ
function tongaward_battle(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 0.03 * COEF_CONTRIB_TO_VALUE;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_SOJIN);
end;

--��ʹ�����׶Ƚ���
function tongaward_message(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 0.15 * COEF_CONTRIB_TO_VALUE;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_XINSHI);
end;

--���������׶Ƚ���
function tongaward_challengeoutoftime(nPhaseID)
	local nValue = 0;
	if (nPhaseID > 0 and nPhaseID <= 10) then
		nValue = 4 * COEF_CONTRIB_TO_VALUE;
	elseif (nPhaseID > 10 and nPhaseID <= 20) then
		nValue = 8 * COEF_CONTRIB_TO_VALUE;
	elseif (nPhaseID > 20 and nPhaseID <= 28) then
		nValue = 10 * COEF_CONTRIB_TO_VALUE;
	end;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_CHUNGGUAN);
end;

--Ұ�������׶Ƚ���
function tongaward_tasklink(nMainValue)
	if (FALSE(nMainValue) == 1) then
		return
	end;
	local nValue = floor(nMainValue / 8);
	if (FALSE(nValue) == 1) then
		return
	end;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_YESHOU);	
end;

--�����������׶Ƚ���
function tongaward_league()
	local nValue = 25 * COEF_CONTRIB_TO_VALUE;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_WULIN);	
end;

--������ǹ��׶Ƚ���
function tongaward_citywar(isWin)
--	local nValue = 100 * COEF_CONTRIB_TO_VALUE;
--	if (nType == 1) then
--		nValue = 300 * COEF_CONTRIB_TO_VALUE;
--	end;
--	ContriValueEntryLogic(nValue, EVE_FENGHUO);	
end;

--�»��ƹ��׶Ƚ���
function tongaward_riddle()
--	local nValue = 4 * COEF_CONTRIB_TO_VALUE;
--	nValue = extong_double_award(nValue);
--	ContriValueEntryLogic(nValue, EVE_HUADENG);	
end;

--�Ի�֮�ֹ��׶Ƚ���
function tongaward_goldenseed()
	local nValue = 35 * COEF_CONTRIB_TO_VALUE;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_ZHONGZI);	
end;

--����¼����׶Ƚ���
function tongaward_randomevent()
--	local nValue = 50 * COEF_CONTRIB_TO_VALUE;
--	ContriValueEntryLogic(nValue, EVE_SHUIJI);	
end;

--ͬ�����������׶Ƚ���
function tongaward_partner_xiulian()
--	local nValue = 20 * COEF_CONTRIB_TO_VALUE;
--	ContriValueEntryLogic(nValue, EVE_XIULIAN);	
end;

--ͬ����������׶Ƚ���
function tongaward_partner_juqing(nType)
--	local nValue = 50 * COEF_CONTRIB_TO_VALUE;
--	if (nType == 1) then
--		nValue = 100 * COEF_CONTRIB_TO_VALUE;
--	end;
--	ContriValueEntryLogic(nValue, EVE_JUQING);	
end;

--ɱ��boss���׶Ƚ���
function tongaward_killer()
	ContriValueEntryLogic(10 * COEF_CONTRIB_TO_VALUE, EVE_KILLER);	
end;

--����ɶɴ����׶Ƚ���
function tongaward_fenglingdui()
	ContriValueEntryLogic(50 * COEF_CONTRIB_TO_VALUE, EVE_FENGLINGDU);	
end;

--�������׶Ƚ���
function tongaward_longmai()
--	ContriValueEntryLogic(24 * COEF_CONTRIB_TO_VALUE, EVE_LONGMAI);	
end;

--�Ƿ��з������׶�����
function extong_double_award(nvalue)
	local nCurTime = GetCurServerTime();
	local nMyTime = GetTask(TASKID_TONG_WUSHENBLESS);
	if (nMyTime > nCurTime) then
		nvalue = nvalue * 2;
	end;
	return nvalue;
end;
	
end;	--// end of __TONG_AWORD_HEAD__

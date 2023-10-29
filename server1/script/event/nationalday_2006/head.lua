
-- ====================== �ļ���Ϣ ======================

-- ������Եonline 2006 �����ڻͷ�ļ�
-- Edited by peres
-- 2006/09/26 PM 14:52

-- ����ͬ����Ц���������Ǵ�����֣�
-- ���Ŀ���Ҳû���κ���ζ��
-- ��˵�����ˡ�
-- ����˵������ɡ�
-- ����ȹ�Ӻ����£��ǳ�������һ��һ�����ϡ�
-- ̬�������Ե����裬�·����˻ص�����������ȥ��

-- ======================================================


ID_GETDOUBLEEXP_DATE = 2502;  -- ��ȡ˫��������
ID_GETDOUBLEEXP_NUM  = 2503;  -- ��ȡ˫���Ĵ���

ID_GETTASKBOOK_DATE  = 2504;  -- ��ȡ������������
ID_GETTASKBOOK_NUM   = 2505;  -- ��ȡ�������Ĵ���

ID_MOREEXP_ONLINETIME        = 2506;  -- �����������ʱ��
ID_MOREEXP_DATE              = 2507;  -- ��¼����ϴ���ȡ���������
ID_MOREEXP_TIMES             = 2508;  -- ��¼�����ȡ�Ĵ���

Include("\\script\\task\\task_addplayerexp.lua");

-- �ж��Ƿ��������ڵ�������
function isNationalDay()

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));

	-- ����ڻʱ�䣺2006/10/01 ~ 2006/10/03
	if (nDate==61001 or nDate==61002 or nDate==61003) then
		return 1;
	else
		return 0;
	end;

end;


-- �ж�����Ƿ��ܻ�ȡ���͵ľ���
function canGetMoreExp()

local nLevel = GetLevel();

local nTime       = GetGameTime();
local nLateTime   = GetTask(ID_MOREEXP_ONLINETIME);

local nDate       = tonumber(GetLocalDate("%y%m%d"));
local nLateDate   = GetTask(ID_MOREEXP_DATE);

local nGetTimes   = GetTask(ID_MOREEXP_TIMES);

	if nGetTimes==0 then return 1; end;  -- һ��Ҳû����Ļ�����ֱ����

	if (nTime - nLateTime >= 60*60) and (nDate~=nLateDate) and nGetTimes<3 then
		return 1;
	else
		return 0;
	end;

end;

-- ������Ҹõö��پ���
function countMoreExpNum()

local nGetTimes   = GetTask(ID_MOREEXP_TIMES);
local aryExp = {[0]=5000000, [1]=10000000, [2]=15000000};

	if nGetTimes<3 then
		return aryExp[nGetTimes];
	else
		return 0;
	end;

end;


-- �����ȡ�����д�������
function writeMoreExpData()

local nTime       = GetGameTime();
local nDate       = tonumber(GetLocalDate("%y%m%d"));
local nGetTimes   = GetTask(ID_MOREEXP_TIMES);

	SetTask(ID_MOREEXP_ONLINETIME, nTime);
	SetTask(ID_MOREEXP_DATE, nDate);
	SetTask(ID_MOREEXP_TIMES, nGetTimes + 1);

end;


-- �еȼ����Ƶ�������Ҿ��飬��� nLimitLevel Ϊ 0 ������
function addPlayerExpForLimit(myExpValue, nLimitLevel)

	tl_addPlayerExpForLimit(myExpValue, nLimitLevel);

end;


--�ж�����Ƿ�����
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;

-- ����ϵͳ��д�� LOG ����
function WriteTaskLog(strMain)

	-- ����ǿ�ֵ��д��
	if strMain==nil then return end;

	WriteLog("[2006�����ڻ]"..date("[%y��%m��%d��%Hʱ%M��]").."[�˺ţ�"..GetAccount().."][��ɫ��"..GetName().."]"..strMain);
end;



-- ====================== �ļ���Ϣ ======================

-- ������Եonline 2006 Ԫ���ͷ�ļ�
-- Edited by peres
-- 2005/12/21 PM 19:42

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

ID_GETDOUBLEEXP_DATE = 2334;  -- ��ȡ˫��������
ID_GETDOUBLEEXP_NUM  = 2335;  -- ��ȡ˫���Ĵ���

ID_GETTASKBOOK_DATE  = 2336;  -- ��ȡ������������
ID_GETTASKBOOK_NUM   = 2337;  -- ��ȡ�������Ĵ���

ID_MOREEXP_ONLINETIME        = 2338;  -- �����������ʱ��
ID_MOREEXP_DATE              = 2339;  -- ��¼����ϴ���ȡ���������
ID_MOREEXP_TIMES             = 2340;  -- ��¼�����ȡ�Ĵ���


IncludeLib( "FILESYS" );

Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������

--TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- ��������ľ����

-- �ж��Ƿ�Ԫ�����ڵ�������
function isNewYearTime()

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));

	-- Ԫ���ʱ�䣺2005/12/30 ~ 2006/1/1
	if (nDate==51230 or nDate==51231 or nDate==60101) then
		return 1;
	else
		return 0;
	end;

end;

-- ������ߺ��Զ��������������گ��
function autoGetCard()

local nCount = CalcEquiproomItemCount(6,1,1011,-1);
	
	-- ����������û�У���������Ԫ����䣬�͸�����һ��
	if nCount<1 and isNewYearTime()==1 then
		AddItem(6, 1, 1011, 1, 0, 0, 0);
		return
	else
		return
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
local aryExp = {[0]=10000000, [1]=15000000, [2]=20000000};

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
	tl_addPlayerExpForLimit(myExpValue, nLimitLevel)
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

	WriteLog("[2006��Ԫ���]"..date("[%y��%m��%d��%Hʱ%M��]").."[�˺ţ�"..GetAccount().."][��ɫ��"..GetName().."]"..strMain);
end;

-- ���뿪ʼ�Ĺ�����
if login_add then login_add(autoGetCard, 0); end;
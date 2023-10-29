
-- ====================== �ļ���Ϣ ======================

-- ������Եonline 2006 ũ�����ڻͷ�ļ�
-- Edited by peres
-- 2006/01/09 PM 15:00

-- ����й��Ҹ�
-- �Ҹ�ֻ��˲���Ƭ�ϣ�һС��һС��
-- ������ĺڰ�������󺣣�ͯ���ʱ�����͸�ĸһ������ȥ����
-- ҹ��Ĵ��ڷ����������������СС����λ�ϸо��Լ����ų�ˮƯ������ľ�ͷ
-- ����һ�̣������ǲ����ڵ�
-- ֻ�������������ˡ������మ

-- ======================================================

-- ����ϵͳ��֧��
IncludeLib("TASKSYS");

-- �������Ĵ���֧��
Include("\\script\\task\\random\\task_head.lua");

ID_GETDOUBLEEXP_DATE = 2342;  -- ��ȡ˫��������

ID_GETTASKBOOK_DATE  = 2343;  -- ��ȡ������������

ID_MOREEXP_ONLINETIME        = 2344;  -- �����������ʱ��
ID_MOREEXP_DATE              = 2345;  -- ��¼����ϴ���ȡ���������

-- ���н�����ȡ�������ܼ�¼���� byte ��
-- b1 ��¼˫������  b2 ��¼�������  b3 ��¼�������  b4 ��¼��Ϧ֮ҹ��ȡ��������
ID_NUMRECORD                 = 2346;

aryTalk = {

	[60127] = "�������Ͼ��ǳ�Ϧ֮ҹ��Ŷ��������ø�˭һ��������أ�",
	[60128] = "�������������Ͼ���<color=yellow>��Ϧ֮ҹ<color>��Ŷ���������Բ����ʲô�أ���û�С����ꡱ�Ĵ���ѽ��",
	[60129] = "����ð���������<color=yellow>���³�һ<color>����ϰ����Ϳ���Ҫ���ص�Ŷ��ף���µ�һ�����µĿ�ʼ��",
	[60130] = "����ð���������<color=yellow>���³���<color>������̽�׷��ѵĺ�����Ŷ��",
	[60131] = "����ð���������<color=yellow>���³���<color>�������ʲô�µĴ����أ�",
	[60201] = "����ð���������<color=yellow>���³���<color>����û�и����˰���ѽ��",
	[60202] = "����ð���������<color=yellow>���³���<color>����׼����ʼ��һ���æ���˰ɣ�",
	[60203] = "����ð���������<color=yellow>���³���<color>������ǹ��˴�˵�������񡱵�����Ŷ��ף������Դ��������",

}

-- �ж��Ƿ��ڴ��ڵ��ڼ�
function isSpringTime()

-- ��������飺2006 �� 1 �� 27 �� ~ 2006 �� 2 �� 3 ��
local aryDate = {60127, 60128, 60129, 60130, 60131, 60201, 60202, 60203};

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));

local i=0;

	for i=1, getn(aryDate) do
		if aryDate[i]==nDate then
			return 1;
		end;
	end;

	return 0;
	
end;

-- �ж��Ƿ��ڳ�Ϧ������Сʱ��
function isNewYearEve()

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));

-- ȡ������ʱ��
local nHour = tonumber(GetLocalDate("%H"));

	if (nDate==60128 and nHour==23) or (nDate==60129 and nHour==0) then
		return 1;
	end;
	
	return 0;

end;

-- ��ٴ������Ի�
function mainTalk()

local szName = GetName();
local szSpeWord = "";

	-- �����������䣬��ȡ����ش�
	if isSpringTime()==1 then 
		szSpeWord = aryTalk[tonumber(GetLocalDate("%y%m%d"))]; 
	else
		Say("��٣�������˼��Ŀǰ���Ǵ��ڴ��ڻ�ڼ�Ŷ�����ڻ�Ǵ� <color=yellow>2006��1��27��<color> ��ʼ�� <color=yellow>2006��2��3��<color> ��ֹ�ġ�", 0);
		return
	end;

	Say("��٣�"..szName.."��"..szSpeWord.."�л���˵���ҾͲ���������ʱ���ˣ�������ȡ��һ���´���Ʒ�أ�", 6,
		"��ȡ��Ϧ֮ҹ�������ķ����/getNewYearEveAward",
		"��ȡÿ�յİ�Сʱ˫������/getDoubleExp",
		"��ȡÿ�յľ��齱��/getMoreExp_Confirm",
		"��ȡÿ�յ��������/getTaskBook",
		"�йذ׾��������Ϣ/getBaijuInfo",
		"�뿪/OnExit");

end;


-- ��ȡ��Ϧ֮ҹ�Ľ���
function getNewYearEveAward()

local nResult = 0;

	if isNewYearEve()~=1 then
		Say("��٣��Ǻǣ���Ϧ֮ҹ���������ֻ����<color=yellow>������ʮ��<color>��<color=yellow>��ʱ��23:00 - 01:00��<color>��ȡŶ��", 0);
		return
	end;
	
	-- ����ȼ�δ�ﵽ 80 ��
	if GetLevel()<80 then
		Say("��٣�ֻ�� 80 �����ϵ��˲�����ȡ��ݺ���Ŷ��", 0);
		return
	end;
	
	if getAwardTime(4)>=1 then
		Say("��٣��Ǻǣ�������֣����Ѿ�����˳�Ϧ֮��ر�ͼ��Ŷ��", 0);
		return
	end;
	
	-- ��¼һ��
	setAwardTime(4, 1);
	
	-- ����һ�Ųر�ͼ
	nResult = CreateTreasureMap();
	
	Msg2Player("���õ���һ����ٲر�ͼ��ף��<color=yellow>������֣��������⣡<color>");
	
	Say("���õ���һ����ٲر�ͼ��ף��<color=yellow>������֣��������⣡<color>", 0);
	
	WriteTaskLog("�ڳ�Ϧ��������ȡ��һ�Ųر�ͼ������Ϊ��"..nResult);
	
	return

end;


-- ��ȡÿ�հ�Сʱ��˫������
function getDoubleExp()

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isSpringTime()==0 then
		Say("��٣�ʵ�ڲ�����˼�����ڲ��Ǵ��ڻʱ�䣬���ڻʱ���Ǵ� <color=yellow>2006��1��27��<color> ��ʼ�� <color=yellow>2006��2��3��<color> ��ֹ�ġ�", 0);
		return
	end;

	-- ����ȼ�δ�ﵽ 80 ��
	if GetLevel()<80 then
		Say("��٣�ֻ�� 80 �����ϵ��˲�����ȡ˫������Ŷ��", 0);
		return
	end;

	if nDate~= GetTask(ID_GETDOUBLEEXP_DATE) then
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		setAwardTime(1, 1);
		
	elseif getAwardTime(1)>=1 then
	
		Say("������Ѿ���ȡ����˫��������Ŷ��", 0);
		return
		
	else
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		setAwardTime(1, 1);

	end;
	
	-- 80 �����ϵ���ÿ�������ȡһ�� 8 Сʱ����˫��
	if GetLevel()>=80 then
	
		AddSkillState(531,10,1,8*60*60*18);
		AddSkillState(461,1, 1,8*60*60*18);
		
		Msg2Player("���õ���<color=green> 8 Сʱ��˫�����飡<color>");
		WriteTaskLog("�õ��� 8 Сʱ��˫�����飡");
		
	else
		Say("��٣�ֻ�� 80 �����ϵ��˲�����ȡ˫������Ŷ��", 0);
	end;

end;


-- ��ȡÿ�յ��������
function getTaskBook()

local nRandomTaskID, nRandomItemIndex = 0, 0;

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));

-- ����Ѿ���ȡ������������
local nTimes = getAwardTime(2);
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isSpringTime()==0 then
		Say("��٣�ʵ�ڲ�����˼�����ڲ��Ǵ��ڻʱ�䣬���ڻʱ���Ǵ� <color=yellow>2006��1��27��<color> ��ʼ�� <color=yellow>2006��2��3��<color> ��ֹ�ġ�", 0);
		return
	end;
	
	-- ����Ƿǳ忨�û�
	if IsCharged()==0 then
		Say("��٣����δ��ڻֻ�г忨�û����ܲ���Ŷ��", 0);
		return
	end;
	
	-- ����ȼ�δ�ﵽ 80 ��
	if GetLevel()<80 then
		Say("��٣�ֻ�� 80 �����ϵ��˲�����ȡ����������Ŷ��", 0);
		return
	end;
	
	if nTimes>=3 then
	
		Say("��٣��ڴ��ڻ�ڼ�ÿ��ֻ����ȡ<color=yellow>����<color>�������Ŷ��", 0);
		return
		
	end;
		
	if nDate~= GetTask(ID_GETTASKBOOK_DATE) then
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		setAwardTime(2, nTimes + 1);
		
	elseif nDate==GetTask(ID_GETTASKBOOK_DATE) then
		
		Say("��٣�������Ѿ���ȡ�����������Ŷ�����ǵ����������ɣ�", 0);
		return
		
	end;
	
	-- ѡ��һ���ڶ�����������
	nRandomTaskID = TaskNo(selectNextTask());
		
	-- ����һ���������
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	
	-- ͬ����Ʒħ������
	SyncItem(nRandomItemIndex);

	Msg2Player("���õ���<color=green>�������һ����<color>");
	
	WriteTaskLog("�õ���һ��������ᣬ���Ϊ��"..nRandomTaskID);
	
end;


-- ��ð׾������Ϣ
function getBaijuInfo()

	Say("���� <color=yellow>2006��1��27����2006��2��3��<color> ÿ��<color=red>0��00~18��00<color>��ʹ�ð׾���һ���õľ��齫���������ܰ׾���һ���������Ƚ��� 1.5 ����", 0);
	return

end;



-- ��ȡÿ�յľ���ȷ��
function getMoreExp_Confirm()

	Say("��٣���������Ҫ��ȡ���������;�����", 2,
		"�ǵ�/getMoreExp",
		"����/mainTalk");
	return
	
end;


-- ��ȡÿ�յľ���
function getMoreExp()

local nExp = countMoreExpNum();

-- ȡ������
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- ������ڲ��ԣ�ֱ�ӷ���
	if isSpringTime()==0 then
		Say("��٣�ʵ�ڲ�����˼�����ڲ��Ǵ��ڻʱ�䣬���ڻʱ���Ǵ� <color=yellow>2006��1��27��<color> ��ʼ�� <color=yellow>2006��2��3��<color> ��ֹ�ġ�", 0);
		return
	end;
	
	-- ����Ƿǳ忨�û�
	if IsCharged()==0 then
		Say("��٣����δ��ڻֻ�г忨�û����ܲ���Ŷ��", 0);
		return
	end;
	
	if canGetMoreExp()==1 then
		if GetLevel()<50 then
			addPlayerExpForLimit(nExp, 5); -- ����ֻ���� 5 ��
		else
			addPlayerExpForLimit(nExp, 0); -- ������
		end;
		
		Msg2Player("���õ��˴��ڻ�ľ��齱����<color=yellow>"..nExp.."<color> �㾭�飡");
		
		writeMoreExpData();  -- ��¼��ȡ������������
	
		WriteTaskLog("�õ�ÿ�յĽ������飺"..nExp);
		
	else
		Say("��٣������ڵ��������ܹ���ȡÿ�յľ��飬��1��27����2��3���ڼ䣬ÿ���������ﶼ�ɻ����������顣<color=yellow>��Щ����ÿ������һ�Ρ�һ������������<color>����������ȡ����֮�������Ҫ<color=yellow>���߳���1Сʱ<color>Ŷ��", 0);
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

local nGetTimes   = getAwardTime(3);

	if nGetTimes==0 then return 1; end;  -- һ��Ҳû����Ļ�����ֱ����

	if (nTime - nLateTime >= 60*60) and (nDate~=nLateDate) and nGetTimes<3 then
		return 1;
	else
		return 0;
	end;

end;



-- ������Ҹõö��پ���
function countMoreExpNum()

local nGetTimes   = getAwardTime(3);
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
local nGetTimes   = getAwardTime(3);

	SetTask(ID_MOREEXP_ONLINETIME, nTime);
	SetTask(ID_MOREEXP_DATE, nDate);
	setAwardTime(3, nGetTimes + 1);

end;


-- �еȼ����Ƶ�������Ҿ��飬��� nLimitLevel Ϊ 0 ������
function addPlayerExpForLimit(myExpValue, nLimitLevel)

local myOwnExp = 0;
local myNeedExp = 0;
local myPayExp = 0;

local nUpLevel = 0; -- �Ѿ������ļ���

	while (myExpValue>0) do
	
		myOwnExp = GetExp();
		myNeedExp = tonumber(TabFile_GetCell("TL_UPLEVELEXP", GetLevel()+1, 2)) - myOwnExp;
	
		if nUpLevel>=nLimitLevel and nLimitLevel>0 then
			break;
		end;
		
		if (myExpValue<myNeedExp) then
			AddOwnExp(myExpValue);
			myExpValue = 0;
		else
			myExpValue = myExpValue - myNeedExp;
			AddOwnExp(myNeedExp);
			
			nUpLevel = nUpLevel + 1;
			
		end;
	end;

end;


-- ��¼��ȡ�����Ĵ���
-- b1 ��¼˫������  b2 ��¼�������  b3 ��¼�������  b4 ��¼��Ϧ֮ҹ��ȡ��������
function setAwardTime(nType, nNum)
	SetTask(ID_NUMRECORD, SetByte(GetTask(ID_NUMRECORD), nType, nNum));
end;

-- ��ȡ��ȡ�����Ĵ���
-- b1 ��¼˫������  b2 ��¼�������  b3 ��¼�������  b4 ��¼��Ϧ֮ҹ��ȡ��������
function getAwardTime(nType)
	return GetByte(GetTask(ID_NUMRECORD), nType);
end;


-- ����ϵͳ��д�� LOG ����
function WriteTaskLog(strMain)

	-- ����ǿ�ֵ��д��
	if strMain==nil then return end;

	WriteLog("[2006ũ������]"..date("[%y��%m��%d��%Hʱ%M��]").."[�˺ţ�"..GetAccount().."][��ɫ��"..GetName().."]"..strMain);
end;


function OnExit()

end;
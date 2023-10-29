-------------------------------------------------------------------------
-- FileName		:	task_addplayerexp.lua
--  Author		:	xiaoyang
-- CreateTime	:	2005-08-22 13:08:05
-- Desc			:	������ۼӾ���ű�[���Եȼ�����]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
IncludeLib("SETTING");
TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- ��������ľ����
Include("\\script\\task\\metempsychosis\\task_head.lua")

-- ��ȡ�����Ӧ����������
function tl_getUpLevelExp(nLevel, nTransCont)
	local myNeedExp = 0
	local strNeedExp = ""
	if (not nTransCont or (nTransCont < 0 or nTransCont > %NTRANSLIFE_MAX)) then
		nTransCont = 0;
	end
	
	-- ��ֹ��������
	if nLevel<=1 or nLevel>200 then
		return 0;
	end;

	myNeedExp = tonumber(TabFile_GetCell("TL_UPLEVELEXP", nLevel, 2));
	strNeedExp = TabFile_GetCell("TL_UPLEVELEXP", nLevel, 3 + nTransCont);
	if (strNeedExp ~= "") then
		myNeedExp = myNeedExp + (tonumber(strNeedExp) * 10000)
	end

	return myNeedExp;		
end

-- ����Ӿɵȼ����������Ŀǰ�ĵȼ���Ҫ���پ���ֵ
function tl_countuplevelexp(myOldLevel,myOldExp, nTransCont)

local i
local myLevel = GetLevel()
local myExp = GetExp()
local nNowExp = tl_getUpLevelExp(myLevel + 1, nTransCont) -- ��ǰ�ȼ�����ľ���

local myTotalExp = 0

	if (myOldLevel<myLevel) then
	
		for i=myOldLevel,myLevel do
			myTotalExp = myTotalExp + tl_getUpLevelExp(i + 1, nTransCont)
		end
		
		myTotalExp = (myTotalExp - myOldExp) - (nNowExp - myExp)
	
		return myTotalExp
	else
		return myExp - myOldExp
	end

end

-- �����ۼ���Ҿ���ĺ���
function tl_addPlayerExp(myExpValue)

local myOwnExp = 0
local myNeedExp = 0
local myPayExp = 0
local nNextLevel = 0
local nTransCont = ST_GetTransLifeCount();

	-- LLG_MODIFY_20060603
	-- Ԥ����ѭ���������100��
	--while (myExpValue>0) do
	local i = 0;
	for i = 0, 180 do
		if (myExpValue <= 0) then
			return
		end
		myOwnExp = GetExp()
		nNextLevel = GetLevel()+1
		myNeedExp = tl_getUpLevelExp(nNextLevel, nTransCont);
		
		myNeedExp = myNeedExp - myOwnExp
		
		if (myNeedExp <= 0) then
			break
		end
		
		if (myExpValue<=myNeedExp) then
			AddOwnExp(myExpValue)
			myExpValue = 0
		else
			myExpValue = myExpValue - myNeedExp
			AddOwnExp(myNeedExp)
		end
		
	end
end

-- �еȼ����Ƶ�������Ҿ��飬��� nLimitLevel Ϊ 0 ������
function tl_addPlayerExpForLimit(myExpValue, nLimitLevel)

local myOwnExp = 0;
local myNeedExp = 0;
local myPayExp = 0;
local nNextLevel = 0;
local nUpLevel = 0; -- �Ѿ������ļ���
local nTransCont = ST_GetTransLifeCount();

	while (myExpValue>0) do
	
		if nUpLevel>=nLimitLevel and nLimitLevel>0 then
			break;
		end;
	
		myOwnExp = GetExp();
		nNextLevel = GetLevel() +1;
		myNeedExp = tl_getUpLevelExp(nNextLevel, nTransCont);
	
		myNeedExp = myNeedExp - myOwnExp
		if (myNeedExp < 0) then
			break
		end
			
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

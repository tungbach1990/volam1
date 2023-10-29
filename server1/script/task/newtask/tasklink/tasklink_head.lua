-- Ұ���������ű�ͷ�ļ�
-- Edited by peres
-- 2004/12/25 ʥ��������

Include("\\script\\global\\fuyuan.lua"); -- ����ȡ�ø�Ե���ļ�
Include("\\script\\task\\newtask\\newtask_head.lua"); -- ������ϵͳ��ͷ�ļ�������ͬ������

Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������

IncludeLib("FILESYS");
IncludeLib("BATTLE");

TL_MAXTIMES = 20 -- ÿ������ 20 ������
TL_MAXLINKS = 20 -- ÿ������ 20 ����
TL_MAXLOOPS = 20 -- ����ܹ������� 20 ��������
-- TL_MAXLINKSCOUNT = 4 -- ÿ�������ֻ���� 4 ��

TL_UPLEVELEXP = "TaskLink_UpLevel"


DEBUG_TASKVALUE = 1046;  -- ����׷��ˢȡ������ BUG �ı���

ID_TASKLINK_LIMITDATE 				= 2419;  -- ��¼ÿ�����Ƶ�����
ID_TASKLINK_LIMITNUM  				= 2420;  -- ��¼ÿ�����ƵĴ���
ID_TASKLINK_LIMITCancelCount 	= 2797;  -- ��¼ÿ��ȡ���Ĵ���
TSK_TASKLINK_SEANSONPOINT = 1825	--��¼����ת����Ұ�Ż���ֵ
TKS_TASKLINK_SPITEM	= 2690		-- ��¼��ȡҰ�ŵ����ر���ʱ�������

-- ��ȡ�ļ�ʱ���ַ�������
TL_BUYGOODS = "TaskLink_BuyGoods"
TL_FINDGOODS = "TaskLink_FindGoods"
TL_SHOWGOODS = "TaskLink_ShowGoods"
TL_FINDMAPS = "TaskLink_FindMaps"
TL_UPGROUND = "TaskLink_UpGround"
TL_WORLDMAPS = "TaskLink_WorldMaps"
TL_LEVELLINK = "TaskLink_Level"

TL_MAINTASKLEVEL = "TaskLink_MainLevel"
TL_AWARDBASIC = "Award_Basic"
TL_AWARDLINK = "Award_Link"
TL_AWARDLOOP = "Award_Loop"

TL_TASKGOODSTALK = "TaskLink_GoodsTalk"
TL_TASKBUYTALK = "TaskLink_BuyTalk"
TL_TASKSHOWTALK = "TaskLink_ShowTalk"
TL_TASKFINDMAPS = "TaskLink_FindTalk"
TL_TASKUPGROUNDTALK = "TaskLink_UpGroundTalk"
TL_TASKWORLDTALK = "TaskLink_WorldTalk"

-- ������ TABLE FILE ��Ԥ����
TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)
TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
TabFile_Load("\\settings\\task\\levellink.txt",TL_LEVELLINK) -- ÿ���ȼ����Ӧ�ĳ�ʼ�ȼ�
TabFile_Load("\\settings\\task\\tasklink_mainlink.txt",TL_MAINTASKLEVEL) -- ÿ��������������Ӧ�ĵȼ�������ֵļ���
-- TabFile_Load("\\settings\\npc\\player\\level_exp.txt",TL_UPLEVELEXP) -- ��������ľ����

TabFile_Load("\\settings\\task\\award_basic.txt",TL_AWARDBASIC)
TabFile_Load("\\settings\\task\\award_link.txt",TL_AWARDLINK)
TabFile_Load("\\settings\\task\\award_loop.txt",TL_AWARDLOOP)

TabFile_Load("\\settings\\task\\talk\\talk_findgoods.txt",TL_TASKGOODSTALK)
TabFile_Load("\\settings\\task\\talk\\talk_buygoods.txt",TL_TASKBUYTALK)
TabFile_Load("\\settings\\task\\talk\\talk_showgoods.txt",TL_TASKSHOWTALK)
TabFile_Load("\\settings\\task\\talk\\talk_findmaps.txt",TL_TASKFINDMAPS)
TabFile_Load("\\settings\\task\\talk\\talk_upground.txt",TL_TASKUPGROUNDTALK)
TabFile_Load("\\settings\\task\\talk\\talk_worldmap.txt",TL_TASKWORLDTALK)


-- ȷ����ҵ�ǰ������״̬Ӧ�������ڵڼ���
function tl_getfirstloop()
	-- ������ʱû�л��Ĳ������ֻ��Ϊ 0 
	return 0
end


-- ���յ������������������������������������
function tl_dealtask()

-- ����ȷ����ҵ�����ȼ�
local myTaskLevel = tl_gettaskstate(2)

-- Ȼ���������õȼ�Ӧ�ý���ʲô���͵�����
local myTaskType = tl_gettasktype(myTaskLevel)

tl_setplayertasktype(myTaskType)

-- ����ٶ���Ӧ�ı�ȷ������������ڱ���е��к� 
local myTaskID = tl_gettasklink(myTaskType,myTaskLevel)

tl_savetasktablecol(myTaskID)

-- ������ռ���ͼ����Ļ����¼��ͼ�ı�ź�Ҫ�ռ��ľ�������
local myTaskMapID = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapID"))
local myMapType = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapType"))
local myMapNum = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))

-- ��5��������ж�����
local myTaskValueType

-- ��¼�������
-- ��¼��ҵ���������
tl_setplayertasktype(myTaskType)

-- ��¼��ҵ��������������
tl_savetasktablecol(myTaskID)

-- ��Ӧ��ͬ����������ͬ�ı����洢����

	if ( myTaskType == 1 ) then
		-- ��������Ի�Ԫ�ص����ֵ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkBuy[1]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkBuy[3]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkBuy[6]) + 1 ))
		
	elseif ( myTaskType == 2 ) then
		-- ��������Ի�Ԫ�ص����ֵ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkGoods[1]) + 1 ))
		tl_savetalkvalue(2,random( 2,getn(Task_TalkGoods[2]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkGoods[3]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkGoods[4]) + 1 ))
		tl_savetalkvalue(5,random( 2,getn(Task_TalkGoods[5]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkGoods[6]) + 1 ))
			
	elseif ( myTaskType == 3 ) then
		-- ��������Ի�Ԫ�ص����ֵ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkShow[1]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkShow[4]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkShow[6]) + 1 ))

		
	elseif ( myTaskType == 4 ) then
		-- ��������Ի�Ԫ�ص����ֵ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkFind[1]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkFind[4]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkFind[6]) + 1 ))

		nt_setTask(1031,myTaskMapID)
		nt_setTask(1032,SetByte(nt_getTask(1032),1,myMapType))
		nt_setTask(1032,SetByte(nt_getTask(1032),2,myMapNum))
		nt_setTask(1025,0) -- ���ԭ���ĵ�ͼ־����
	elseif ( myTaskType == 5 ) then -- �����������ֵ����������Ļ������ж���������ֵ
		-- ��������Ի�Ԫ�ص����ֵ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkUp[1]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkUp[3]) + 1 ))
		tl_savetalkvalue(4,random( 2,getn(Task_TalkUp[4]) + 1 ))
		tl_savetalkvalue(6,random( 2,getn(Task_TalkUp[6]) + 1 ))	
		
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		
		if (myTaskValueType == 2) then -- ������Ǿ���ֵ
			local nCurExp = GetExp()
			nt_setTask(1033,GetLevel())
			nt_setTask(2574, floor(nCurExp/1e5))
			nt_setTask(1034, mod(nCurExp,1e5))
		elseif (myTaskValueType == 3) then -- �����������
			nt_setTask(1026,GetRepute())
		elseif (myTaskValueType == 4) then -- ������Ǹ�Ե
			nt_setTask(1026,nt_getTask(151))
		elseif (myTaskValueType == 5) then -- ������� PK ֵ
			nt_setTask(1026,GetPK())
		elseif (myTaskValueType == 6) then -- ��������ξ�����
			nt_setTask(1026,nt_getTask(747))
		end
		
	elseif ( myTaskType == 6 ) then
		-- ��������Ի�Ԫ�ص����ֵ
		tl_savetalkvalue(1,random( 2,getn(Task_TalkWorld[1]) + 1 ))
		tl_savetalkvalue(3,random( 2,getn(Task_TalkWorld[3]) + 1 ))
	end
	
	tl_settaskcourse(1) -- ���������չ����Ϊ 1 

end


-- �����ѭ������һ��
function tl_taskprocess()

local myTaskTimes = tl_gettaskstate(1) -- ��ҽ��е��Ĵ���
local myTaskLinks = tl_gettaskstate(2) -- ��ҽ��е�������
local myTaskLoops = tl_gettaskstate(3) -- ��ҽ��е��Ļ���
local myTaskCancel = tl_gettaskstate(4)
local myTaskLinksCount = tl_gettaskstate(6) -- �������ڵ�ǰ�������Ѿ������˼���

	myTaskTimes = myTaskTimes + 1
	
	if (myTaskLoops >= TL_MAXLOOPS) then
		myTaskLoops = 0;
	end;
	
	if (myTaskTimes >= TL_MAXTIMES) then
	
		myTaskTimes = 0
		myTaskLinksCount = myTaskLinksCount + 1
		
		-- �������ﱣ��һ������״̬
		tl_settaskstate(1,myTaskTimes)
		tl_settaskstate(2,myTaskLinks)
		tl_settaskstate(6,myTaskLinksCount)
		
		if (tl_counttasklinknum(2) >= TL_MAXLINKS) then -- �����Ѿ����е���״
		
			myTaskTimes = 0
			myTaskLinks = tl_getfirstlink()
--			tl_print("�õ��˳�ʼ��������"..myTaskLinks);
			myTaskLinksCount = 0
			myTaskLoops = myTaskLoops + 1
			
			if (myTaskLoops >= TL_MAXLOOPS) then
				myTaskLoops = 0
			end
			
			tl_settaskstate(1,myTaskTimes)
			tl_settaskstate(2,myTaskLinks)
			tl_settaskstate(6,myTaskLinksCount)
		
		end
		
		if (myTaskLinksCount == tl_gettasklinknum(myTaskLinks)) then -- ���������Ѿ�����˸���ɵ�����
			myTaskLinks = myTaskLinks + 1
			myTaskLinksCount = 0
		end
			
	end

tl_settaskstate(1,myTaskTimes)
tl_settaskstate(2,myTaskLinks)
tl_settaskstate(3,myTaskLoops)
tl_settaskstate(6,myTaskLinksCount)

-- �������¼һ�����������
nt_setTask(1044, tl_counttasklinknum(1));

end



-- ��⺯��������ȷ������Ƿ��Ѿ����������
-- ����ֵ
-- 1���Ѿ��������
-- 0����δ�����
-- ������� nTaskGoods �ж����﷽ʽ
-- ��������� 1 �Ļ������ࡢ���ϸ�ࡢ���С��ȼ�
-- ��������� 2 �Ļ������ࡢ���ϸ�ࡢ���С��ȼ���ħ������ID��ħ���������ޡ�ħ����������
-- ��������� 3 �Ļ���ħ������ID��ħ���������ޡ�ħ����������
function tl_checktask(nTaskGoods)

local i,j

-- �������������Ʒ
local myTaskGoods

-- ������������Ʒ�����ࡢ���ϸ�ࡢ���С��ȼ�
local myGenre,myDetail,myParticular,myGoodsFive,myLevel,myMagicID,myMagicMax,myMagicMin

-- ������������Ʒ�����࣬����ħ�����Ժʹ�ħ������
local myGoodsClean,myGoodsMagic

-- ������Ҫ��ĵ�ͼ־ ID, ��ͼ־�������͵�ͼ־������
local myTaskMaps,myTaskMapNum,myTaskMapType

-- ������Ҫ����������ֵ����ֵ����
local myTaskValue,myTaskValueType,myOrgValue

-- ������Ҫ���ɽ�����ͼ����
local myWorldMaps,nWorldMaps

-- ��ȡ��ҵ�ǰ���ӵ���������
local myTaskType = tl_getplayertasktype()
local myTaskID = tl_gettasktablecol()

	if ( myTaskType == 1) then
		
		myGenre = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Particular"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"GoodsFive"))
		myLevel = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Level"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myGoodsFive,myLevel}
		
		--tl_print("������Ҫ�����ƷΪ��"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
		if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 2) then
	
		myGenre = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Particular"))
		
		myGoodsFive = TabFile_GetCell(TL_FINDGOODS,myTaskID,"GoodsFive")
		
		if (myGoodsFive == "n") then
			myGoodsFive = 0
			nTaskGoods[5] = 0
		else
			myGoodsFive = tonumber(myGoodsFive)
		end
		
		myLevel = TabFile_GetCell(TL_FINDGOODS,myTaskID,"Level")
		
		if (myLevel == "n") then
			myLevel = 0
			nTaskGoods[4] = 0
		else
			myLevel = tonumber(myLevel)
		end
		
		myMagicID = TabFile_GetCell(TL_FINDGOODS,myTaskID,"MagicEnName")
		myMagicMax = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MaxValue"))
		myMagicMin = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MinValue"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myLevel,myGoodsFive,myMagicID,myMagicMin,myMagicMax}
		myGoodsClean = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5]} -- ��������ж�ħ��������ȡ��ֵ
		myGoodsMagic = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5],nTaskGoods[6],nTaskGoods[7],nTaskGoods[8]}
		
		if (myMagicID == "n") then
			--tl_print("������Ҫ�����ƷΪ��"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
				return 1
			else
				return 0
			end			
		else
			myMagicID = tonumber(myMagicID)
			--tl_print("������Ҫ�����ƷΪ��"..myGenre..myDetail..myParticular..myLevel..myGoodsFive.."ħ�����ԣ�"..myMagicID.." ��Сֵ��"..myMagicMin.." ���ֵ��"..myMagicMax)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[6] == myMagicID) and (tonumber(nTaskGoods[7]) >= myMagicMin) and (tonumber(nTaskGoods[7]) <= myMagicMax) then
				return 1
			else
				return 0
			end
		end 
		
	elseif ( myTaskType == 3) then
	
		myMagicID = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MagicEnName"))
		myMagicMin = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MinValue"))
		myMagicMax = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MaxValue"))
		
		--tl_print("������Ҫ�����ƷΪ��"..myMagicID..myMagicMin..myMagicMax)
		
		if ( nTaskGoods[1] == myMagicID) and ( nTaskGoods[2] >= myMagicMin ) and ( nTaskGoods[2] <= myMagicMax )then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 4) then
	
		myTaskMapNum = nt_getTask(1025)

		if (myTaskMapNum>=tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))) then
			myTaskMapNum = 0
			nt_setTask(1025,myTaskMapNum) -- ������ 0
			return 1
		else
			return 0
		end
		
	elseif (myTaskType == 5) then
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		myTaskValue = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue"))
		local n_transcount = ST_GetTransLifeCount();
		if (myTaskValueType == 2) then
			local n_level = nt_getTask(1033);
			local n_exp = nt_getTask(2574) * 1e5 + nt_getTask(1034);
			if (tl_countuplevelexp(n_level, n_exp, n_transcount) >= tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue"))) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 3) then -- ����ֵ
			myOrgValue = GetRepute()
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 4) then -- ��Եֵ
			myOrgValue = nt_getTask(151)
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 5) then -- PK ֵ
			myOrgValue = GetPK()
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 6) then -- �ν����
			myOrgValue = nt_getTask(747)
			if (myOrgValue-(nt_getTask(1026)) >= myTaskValue) then
				return 1
			else
				return 0
			end			
		end
		
	elseif (myTaskType == 6) then
		myWorldMaps = tonumber(TabFile_GetCell(TL_WORLDMAPS,myTaskID,"Num"))
		if (nt_getTask(1027) >= myWorldMaps) then
			nWorldMaps = nt_getTask(1027) - myWorldMaps -- ������ɾ����Ҫ��ɽ�����ͼ��Ƭ
			nt_setTask(1027,nWorldMaps)
			return 1
		else
			return 0
		end
	end
	
end


-- �Ӻ���������ȷ����ǰ������ӵ��������������һ�����͵�����
-- ����ֵΪ 1~6�����Ϊ 0 ����һ�û�д���������
function tl_getplayertasktype()

local myTaskType

--	myTaskType = strsub(format("%d",nt_getTask(1021),1,1))
myTaskType = nt_getTask(1021)

return myTaskType

end


-- �Ӻ����������趨��ǰ������ӵ��������������һ�����͵�����
function tl_setplayertasktype(myTaskType)
	nt_setTask(1021,myTaskType)
end


-- �Ӻ��������Լ�¼��ҵ�ǰ�����������Ӧ�ı������
function tl_savetasktablecol(myTaskCol)
	nt_setTask(1030,myTaskCol)
end


-- �Ӻ��������Զ�ȡ��ҵ�ǰ��������Ӧ�ľ���������
function tl_gettasktablecol()
	return nt_getTask(1030)
end


-- �Ӻ�������������״̬
-- 1����ǰ���еĴ���
-- 2����ǰ���е�����
-- 3����ǰ���еĻ���
-- 4��ʣ��ȡ���Ĵ���
-- 5����ҵ�ǰ���ӵ�����Ŵ����� 1021 ��
-- 6�������ÿһ���ĸ������Ѿ����˼��Σ����Ϊ 4
function tl_gettaskstate(myTaskState)

local n

if ( myTaskState <= 4) then
	n = GetByte(nt_getTask(1020),myTaskState)
elseif ( myTaskState == 5) then
	n = nt_getTask()
elseif ( myTaskState == 6) then
	n = nt_getTask(1035)
end

return n

end


-- �Ӻ��������������״̬
-- 1����ǰ���еĴ���
-- 2����ǰ���е�����
-- 3����ǰ���еĻ���
-- 5����ҵ�ǰ���ӵ�����Ŵ����� 1021 ��
-- 6�������ÿһ���ĸ������Ѿ����˼���
function tl_settaskstate(myTaskState,myTaskValue)

local n

	if ( myTaskState <= 3) then
		n = nt_getTask(1020)
		nt_setTask(1020,SetByte(n,myTaskState,myTaskValue))
	elseif ( myTaskState == 4) then
		n = nt_getTask(1020)
		if myTaskValue<=254 then
			nt_setTask(1020,SetByte(n,myTaskState,myTaskValue))
		else
			Msg2Player("S� l�n b�n x�a b� �� ��t ��n gi�i h�n <color=yellow>254 l�n<color>, kh�ng th� t�ng th�m!");
			return
		end;
	elseif ( myTaskState == 6) then
		nt_setTask(1035,myTaskValue)
	end
	
end


-- �Ӻ��������õ�ǰ����Ľ���״̬��1��2��3
function tl_settaskcourse(myTaskCourse)
	nt_setTask(1028,myTaskCourse)
end


-- �Ӻ�������ȡ��ǰ����Ľ���״̬��1��2��3
function tl_gettaskcourse()
	return nt_getTask(1028)
end


-- �Ӻ�������¼�Ի�Ԫ�ص���ֵ
function tl_savetalkvalue(myValueType,myTalkValue)

	if (myValueType==1) then
		nt_setTask(1038,myTalkValue)
	elseif (myValueType==2) then
		nt_setTask(1039,myTalkValue)
	elseif (myValueType==3) then
		nt_setTask(1040,myTalkValue)
	elseif (myValueType==4) then
		nt_setTask(1041,myTalkValue)
	elseif (myValueType==5) then
		nt_setTask(1042,myTalkValue)
	elseif (myValueType==6) then
		nt_setTask(1043,myTalkValue)
	end
	
end


-- �Ӻ�������ȡ�Ի�Ԫ�ص���ֵ
function tl_gettalkvalue(myValueType)

local myTalkValue

	if (myValueType==1) then
		myTalkValue = nt_getTask(1038)
	elseif (myValueType==2) then
		myTalkValue = nt_getTask(1039)
	elseif (myValueType==3) then
		myTalkValue = nt_getTask(1040)
	elseif (myValueType==4) then
		myTalkValue = nt_getTask(1041)
	elseif (myValueType==5) then
		myTalkValue = nt_getTask(1042)
	elseif (myValueType==6) then
		myTalkValue = nt_getTask(1043)
	end
	
return myTalkValue
	
end


--  //////////////////////////////////////////////////////////////
-- //                  �������������ֵ����                    //
--//////////////////////////////////////////////////////////////

-- ��Ѱ�ȼ����Ӧ�����ȷ����ҵ�ǰ����������һ�ȼ���������һ��
function tl_getfirstlink()

	local i
	local myLevel = GetLevel()
	local myTaskLevel,myBelongLevel
	
	for i=1,getn(Task_MainTaskLink) do
		myTaskLevel = Task_MainTaskLink[i][1]
		if (myLevel>=myTaskLevel) then
			myBelongLevel = Task_MainTaskLink[i][2]
		end
	end
	
	return myBelongLevel

end


-- ��Ѱ�������ܱ���ȡ��Ӧ�ȼ��������������
-- ������� myTaskLevel Ϊ�������ĵȼ� 1~20
-- ����ֵΪ 1~6 1����Ʒ���� 2����ƷѰ�� 3����Ʒչʾ 4����ͼ�ռ� 5����ֵ���� 6��ɽ�����
function tl_gettasktype(myTaskLevel)

	local i,j,k = 0,0,0
	local myMainRate = 0 -- ��������������һ���ȼ�����ܱ���
	local myTaskType -- ���ص���������
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		myMainRate = myMainRate + Task_MainLevelRate[myTaskLevel][i]
	end
	
	-- ����Ȩ�ع�ʽ�������������������
	j = random(1,myMainRate)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		k = k + Task_MainLevelRate[myTaskLevel][i]
		if ( j <= k) then
			return i
		end
	end
	
	-- �쳣���������Ҷ�ѡ�����������͵Ļ���ѡ 4
	
	--tl_print("�ű���ѡ���������͵�ʱ�����");
	
	return 0

end


-- ��Ѱ��������ȡ����Ӧ������
-- ����ֵ�Ǹ������ڱ��е��к�
function tl_gettasklink(myTaskType,myTaskLevel)

	local myTaskCol -- ��¼������к�

	if ( myTaskType == 1 ) then -- ����ǹ�����Ʒ������
		myTaskCol = tl_selecttask(Task_BuyGoods,myTaskLevel)
	elseif ( myTaskType == 2 ) then
		myTaskCol = tl_selecttask(Task_FindGoods,myTaskLevel)	
	elseif ( myTaskType == 3 ) then
		myTaskCol = tl_selecttask(Task_ShowGoods,myTaskLevel)	
	elseif ( myTaskType == 4 ) then
		myTaskCol = tl_selecttask(Task_FindMaps,myTaskLevel)
	elseif ( myTaskType == 5 ) then
		myTaskCol = tl_selecttask(Task_UpGround,myTaskLevel)
	elseif ( myTaskType == 6 ) then
		myTaskCol = tl_selecttask(Task_WorldMaps,myTaskLevel)
	end

	return myTaskCol

end



-- ���������б����Ȩ������������񣬷���ֵΪ��Ӧ��������к�
function tl_selecttask(myTaskTable,myTaskLevel)

local i,j,k = 0,0,0
local myMainRate  = 0 -- �������Ȩ��

	for i=1,getn(myTaskTable[myTaskLevel]) do
		myMainRate = myMainRate + myTaskTable[myTaskLevel][i][2]
	end
	
	-- ����Ȩ�ع�ʽ��������������������
	j = random(1,myMainRate)
	
--	tl_print ("�������Ȩ��:  "..myMainRate)
--	tl_print ("�����������Ȩ��  :  "..j)
	
	for i=1,getn(myTaskTable[myTaskLevel]) do
	
		k = k + myTaskTable[myTaskLevel][i][2]
		
		if ( j < k ) then
--			tl_print ("ѡ���˱���еĵ�  "..myTaskTable[myTaskLevel][i][1].."  �С�")
			return myTaskTable[myTaskLevel][i][1]
		end
			
	end
	
	-- �쳣����������ѡ�����Ļ��򷵻� 2�������������Ҽ���������ȥ
--	tl_print ("�ű���ѡ����������ʱ����")
	return 2
	
end



-- �Ӻ���������һ��������������Ӧ�����ַ���ʶ
function tl_gettasktextID(myTaskType)

local myTaskTextID

	if (myTaskType == 1) then
		myTaskTextID = TL_BUYGOODS
	elseif (myTaskType == 2) then
		myTaskTextID = TL_FINDGOODS
	elseif (myTaskType == 3) then
		myTaskTextID = TL_SHOWGOODS
	elseif (myTaskType == 4) then
		myTaskTextID = TL_FINDMAPS
	elseif (myTaskType == 5) then
		myTaskTextID = TL_UPGROUND
	elseif (myTaskType == 6) then
		myTaskTextID = TL_WORLDMAPS
	end
	
	return myTaskTextID
end


-- ����һ�������Ȩ�����䵱ǰ�ȼ�����ռ�İٷֱ�
-- myTableName �����Ҫ��ȡ�����ַ�
-- myTaskRate ��ǰ�����Ȩ��
-- myTableCol ���������(�ַ���������)
function tl_counttaskrate(myTableName,myTaskRate,myTableCol)

local i
local myTotalRate = 0
local myReadRate
local myPercent

local myTableRow = TabFile_GetRowCount(myTableName) -- ��ȡTABLE�ļ���������

	for i = 3,myTableRow-1 do
		myReadRate = tonumber(TabFile_GetCell(myTableName,myTableRow,myTableCol))
		myTotalRate = myTotalRate + myReadRate
		i = i + 1
	end

myPercent = (myTaskRate / myTotalRate) * 100

return myPercent

end



-- ����Ӿɵȼ����������Ŀǰ�ĵȼ���Ҫ���پ���ֵ
function tl_countuplevelexp(myOldLevel,myOldExp)

local i
local myLevel = GetLevel()
local myExp = GetExp()
local n_transcount = ST_GetTransLifeCount();
local nNowExp = tl_getUpLevelExp(myLevel + 1, n_transcount) -- ��ǰ�ȼ�����ľ���

local myTotalExp = 0

if (myOldLevel<myLevel) then


	for i=myOldLevel,myLevel do
		myTotalExp = myTotalExp + tl_getUpLevelExp(i + 1, n_transcount)
	end
	
	myTotalExp = (myTotalExp - myOldExp) - (nNowExp - myExp)

	return myTotalExp
else
	return myExp - myOldExp
end

end


-- �Ӻ��������㵱ǰ������Ҫ����ȼ��������������ٴ�
-- �Ѿ������ԣ�ȷ������1~20 ����������ȷ����
function tl_gettasklinknum(myTaskLink)


local myTaskLevel
local myTaskLinks,myTaskLinksNum

myTaskLevel,myTaskLinksNum = tl_getlinksforlevel(myTaskLink)

myTaskLinksNum = Task_MainTaskLink[myTaskLevel][3] - Task_MainTaskLink[myTaskLevel][2] + 1

if 	(myTaskLink==Task_MainTaskLink[myTaskLevel][3]) then
	myTaskLinks = 20 - ((myTaskLinksNum-1) * floor(20 / (myTaskLinksNum)))
else
	myTaskLinks = floor(20 / (myTaskLinksNum))
end

return myTaskLinks

end


-- �Ӻ�����ȷ���������ڵ�һ���ȼ����������������еĳ�Ա����
function tl_getlinksforlevel(myTaskLink)

local i,j = 0,0
local myTaskLevel, myTaskLinksNum

-- ����ȷ��������������ĸ��ȼ���
for i=1,getn(Task_MainTaskLink) do
	for j=Task_MainTaskLink[i][2],Task_MainTaskLink[i][3] do
		if (myTaskLink==j) then
			myTaskLevel = i
		end
	end
end

myTaskLinksNum = Task_MainTaskLink[myTaskLevel][3] - Task_MainTaskLink[myTaskLevel][2] + 1

return myTaskLevel, myTaskLinksNum

end


-- �Ӻ������������һ���������˼��Ρ�����������
function tl_counttasklinknum(myCountType)

local i,j = 0,0
local myTaskTimes = tl_gettaskstate(1) -- ��ҽ��е��Ĵ���
local myTaskLinks = tl_gettaskstate(2) -- ��ҽ��е�������
local myTaskLoops = tl_gettaskstate(3) -- ��ҽ��е��Ļ���
local myTaskCancel = tl_gettaskstate(4) -- ��ҿ���ȡ���Ĵ���

local myCountLoops = tl_gettaskstate(3) -- ��ȡ��ҵĻ���

local nTaskLevel,nTaskNum = tl_getlinksforlevel(myTaskLinks) -- ��ȡ�������ڵڼ����Լ��ü��ĳ�Ա��

if (myTaskLinks==Task_MainTaskLink[nTaskLevel][2]) then -- ��������������ǳ�ʼ������ֱ��ȡ��ֵ
	myCountLinks = tl_gettaskstate(6)
else
	for i=Task_MainTaskLink[nTaskLevel][2],myTaskLinks - 1 do
		j = j + tl_gettasklinknum(i)
	end
	myCountLinks = j + tl_gettaskstate(6)
end


if (myCountLinks==0) then
	myCountTimes = myTaskTimes + (myCountLoops * 400)
else
	myCountTimes = (myCountLinks * TL_MAXTIMES) + myTaskTimes + (myCountLoops * 400)
end


if (tl_gettaskcourse()==3) or (tl_gettaskcourse()==2) then
	myCountTimes = myCountTimes + 1
end


if (myCountType==1) then
	return myCountTimes
elseif (myCountType==2) then
	return myCountLinks
elseif (myCountType==3) then
	return myCountLoops
end

end


-- �Ӻ�����ȡ��������Ӧ��˵��������һ���ַ���
function tl_gettaskinfo()

local myTaskMainInfo,myTaskOrder,myTaskInfo1,myTaskInfo2,myTaskInfo3

local myWhen, myWhere, myWho, myWhy1, myWhy2, myWhat, myMainTalk

	local myTaskType = tl_getplayertasktype()
	
	if (myTaskType == 1) then
		
		-- ��Ʒ����
		myTaskOrder = TabFile_GetCell(TL_BUYGOODS,tl_gettasktablecol(),"TaskInfo1")
		-- Ŀ�ĵ�����
		myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS,tl_gettasktablecol(),"TaskInfo")
		
		myWhen = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(1), "When")
		myWho = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(3), "Who")
		myWhat = TabFile_GetCell(TL_TASKBUYTALK, tl_gettalkvalue(6), "What")
		
		myMainTalk = "H�y �i <color=yellow>"..myTaskInfo1.."<color> Mua gi�p ta <color=yellow>"..myTaskOrder.."<color> v� ��y!";
		
		myTaskMainInfo = myMainTalk
		
	elseif (myTaskType == 2) then
	 
		-- ħ������
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"MagicCnName")
		-- ������������
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"TaskInfo")
		-- ��Сħ������
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"MinValue")
		-- ���ħ������
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS,tl_gettasktablecol(),"MaxValue")
		
		myWhen = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(1), "When")
		myWhere = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(2), "Where")
		myWho = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(3), "Who")
		myWhy1 = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(4), "Why1")
		myWhy2 = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(5), "Why2")
		myWhat = TabFile_GetCell(TL_TASKGOODSTALK, tl_gettalkvalue(6), "What")		
		
		if (myTaskOrder=="n") then
			myTaskMainInfo = "1 c�i <color=yellow>"..myTaskInfo1.."<color>"
			myMainTalk = "H�y gi�p ta �i t�m m�n n�y: <color=yellow>"..myTaskMainInfo.."<color>.";
		else		
			myMainTalk = "H�y gi�p ta �i t�m m�n n�y: <color=yellow>"..myTaskInfo1.."<color>, <color=yellow>"..myTaskOrder.."<color>, nh� nh�t: <color=yellow>"..myTaskInfo2.."<color>, l�n nh�t: <color=yellow>"..myTaskInfo3.."<color>.";
		end

		myTaskMainInfo = myMainTalk
		
	elseif (myTaskType == 3) then 
	
		myWhen = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(1), "When")
		myWhy1 = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(4), "Why1")
		myWhat = TabFile_GetCell(TL_TASKSHOWTALK, tl_gettalkvalue(6), "What")
		
		-- ħ������������
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS,tl_gettasktablecol(),"MagicCnName")
		-- ħ�����Ե���Сֵ
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS,tl_gettasktablecol(),"MinValue")
		-- ħ�����Ե����ֵ
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS,tl_gettasktablecol(),"MaxValue")

		myMainTalk = "H�y gi�p ta �i t�m m�n n�y: <color=yellow>"..myTaskOrder.."<color>, nh� nh�t: <color=yellow>"..myTaskInfo1.."<color>, l�n nh�t: <color=yellow>"..myTaskInfo2.."<color>! Xem xong ta s� tr� l�i cho ng��i";
		
		myTaskMainInfo = myMainTalk
		
	elseif (myTaskType == 4) then 
		
		-- ��ͼ������
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS,tl_gettasktablecol(),"TaskInfo1")
		-- ��Ҫ�ĵ�ͼ����
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS,tl_gettasktablecol(),"Num")
		-- ��ͼ������
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS,tl_gettasktablecol(),"MapType")
		
		myWhen = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(1), "When")
		myWhy1 = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(4), "Why1")
		myWhat = TabFile_GetCell(TL_TASKFINDMAPS, tl_gettalkvalue(6), "What")
		
		if (tonumber(myTaskInfo2) == 1) then
			myTaskInfo3 = "��a �� ch� "
		else
			myTaskInfo3 = "M�t ch� "
		end

		myTaskMainInfo = "Ng��i h�y ��n <color=yellow>"..myTaskOrder.."<color> t�m gi�p ta <color=yellow>"..myTaskInfo1.."<color> quy�n <color=yellow> "..myTaskInfo3.." <color>.";
		
	elseif (myTaskType == 5) then

		myWhen = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(1), "When")
		myWho = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(3), "Who")
		myWhy1 = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(4), "Why1")
		myWhat = TabFile_GetCell(TL_TASKUPGROUNDTALK, tl_gettalkvalue(6), "What")

		
		-- ��Ҫ��������ֵ����
		myTaskOrder = TabFile_GetCell(TL_UPGROUND,tl_gettasktablecol(),"NumericType")
		-- ��Ҫ��������ֵ����
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND,tl_gettasktablecol(),"NumericValue")
		
		if (tonumber(myTaskOrder) == 1) then
			myTaskInfo2 = "��ng c�p"
			myTaskInfo3 = "��ng c�p"
		elseif (tonumber(myTaskOrder) == 2) then
			myTaskInfo2 = "Tr� kinh nghi�m"
			myTaskInfo3 = "Tr� kinh nghi�m"
		elseif (tonumber(myTaskOrder) == 3) then
			myTaskInfo2 = "Danh v�ng"
			myTaskInfo3= "Danh v�ng"
		elseif (tonumber(myTaskOrder) == 4) then
			myTaskInfo2 = "Ph�c Duy�n"
			myTaskInfo3 = "Ph�c Duy�n"
		elseif (tonumber(myTaskOrder) == 5) then
			myTaskInfo2 = "�i�m PK"
			myTaskInfo3 = "�i�m PK"
		elseif (tonumber(myTaskOrder) == 6) then
			myTaskInfo2 = "�i�m t�ch l�y T�ng Kim "
			myTaskInfo3 = "�i�m t�ch l�y T�ng Kim "
		end
		
		myTaskMainInfo = "H�y �i n�ng c�p <color=yellow>"..myTaskInfo3.." "..myTaskInfo1.."<color>.";
		
	elseif (myTaskType == 6) then

		myWhen = TabFile_GetCell(TL_TASKWORLDTALK, tl_gettalkvalue(1), "When")
		myWho = TabFile_GetCell(TL_TASKWORLDTALK, tl_gettalkvalue(3), "Who")
		
		-- ��Ҫ�ռ���ɽ�����ͼ��Ƭ
		myTaskOrder = TabFile_GetCell(TL_WORLDMAPS,tl_gettasktablecol(),"Num")
		
		myTaskMainInfo = "H�y �i t�m gi�p ta <color=yellow>"..myTaskOrder.."<color> m�nh b�n �� S�n H� X� T�c";
	end

	return myTaskMainInfo
 
end

-- ���������� DEBUG ��Ϣ��ӡ�Ĺ���
function tl_print(myPrintText)
--	print ("�����������Ϣ��"..myPrintText);
end


-- �Ӻ��������Ի�ȡ��ҵ��Ա�ֱ�ӷ����ַ���
function GetPlayerSex()
local mySex -- ������ʾ�����Ա���ַ�

	if (GetSex() == 0) then
		mySex = "C�ng t� "
	else
		mySex = "N� hi�p"
	end
	
return mySex
end


function AssignValue(myTaskVariable,myTaskTextID)

local i,j,k = 0,0,0
local myTaskIndex = {}
myTaskVariable = {}
myTaskVariable[1] = {}
myTaskVariable[1][1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)
local myColText
local myReadRate

--	tl_print (format("%s%s%s",myTaskTextID,"  :  ",myTableRow))
	
	for i = 1,20 do
		myTaskVariable[i]={}
		for j=1,myTableRow - 1 do
			myTaskVariable[i][j] = {0,0}
		end
	end

	for i = 1,20 do
		myTaskIndex[i] = 0
	end

	for i = 1,20 do  -- �ӵ�һ�����ڶ�ʮ��������ѭ��
		for j = 2,myTableRow do
			myColText = format("%s%s","TaskRate",i)
			myReadRate = tonumber(TabFile_GetCell(myTaskTextID,j,myColText))
			
			if (myReadRate ~= nil) then -- ������������ȼ�Ȩ����������ֵ�Ļ�������������ȼ�

					myTaskIndex[i] = myTaskIndex[i] + 1
					myTaskVariable[i][myTaskIndex[i]] = {j,myReadRate}
			end
		end
	end
	
return myTaskVariable

end


-- ����������
function AssignValue_TaskLink(myTaskVariable,myTaskTextID)

local myTaskLevel,myTaskStart,myTaskEnd
local i,j = 0,0

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)

	for i = 1,myTableRow - 1 do
		myTaskVariable[i] = {0,0,0}
	end
	
	for i = 2,myTableRow do
		
		j = j + 1
		
		-- ��¼��һ�ȼ���������ȼ�����ʼֵ�����ֵ
		if (i<myTableRow) then
			
			myTaskLevel = tonumber(TabFile_GetCell(myTaskTextID,i,1))
			myTaskStart = tonumber(TabFile_GetCell(myTaskTextID,i,2))
			myTaskEnd = tonumber(TabFile_GetCell(myTaskTextID,i+1,2)) - 1
			
			myTaskVariable[j] = {myTaskLevel,myTaskStart,myTaskEnd}
			
		elseif (i==myTableRow) then
		
			myTaskLevel = tonumber(TabFile_GetCell(myTaskTextID,i,1))
			myTaskStart = tonumber(TabFile_GetCell(myTaskTextID,i,2))
			myTaskEnd = TL_MAXLINKS
			
			myTaskVariable[j] = {myTaskLevel,myTaskStart,myTaskEnd}
			
		end
		
--		tl_print("����ȼ�����"..j.."ʱ��ʼֵΪ��"..myTaskVariable[j][2].."  ���ֵΪ��"..myTaskVariable[j][3].."  ����ȼ�Ϊ��"..myTaskVariable[j][1]);
	
	end
	
	return myTaskVariable
	
end


-- ��������������ÿ���ȼ��б��ʵ�����
function AssignValue_TaskRate(myTaskVariable,myTaskTextID)

local i,j,k

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID) -- ��ȡTABLE�ļ���������
local myTableCol -- �ϲ��ַ����������ͷ��ʶ��"level20"
local myRate

	for i = 1,TL_MAXLINKS do
		myTaskVariable[i]={}
		for j=1,6 do
			myTaskVariable[i][j] = 0
		end
	end
	
	k = 0
	
	for i = 1,TL_MAXLINKS do
		for j = 2,myTableRow do
			k = j - 1 
			myTableCol = format("%s%s","level",i)
			myRate = tonumber(TabFile_GetCell(myTaskTextID,j,myTableCol))
			myTaskVariable[i][k] = myRate
		end
	end

return myTaskVariable

end


-- ���콱���ڴ���
function AssignValue_Award(myTaskVariable,myTaskTextID)

local i,j = 0,1

myTaskVariable = {}
myTaskVariable[1] = {}

local myTableRow = TabFile_GetRowCount(myTaskTextID)

	for i = 1,myTableRow - 1 do
		myTaskVariable[i]={}
	end
	
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTaskVariable[i] = {j,tonumber(TabFile_GetCell(myTaskTextID,j,"TaskValue"))}
--		tl_print ("�� "..myTaskTextID.."  �� ".."  �� "..i.." ��Ԫ�أ�".." ��  "..j.."  �еļ�ֵ����  "..tonumber(TabFile_GetCell(myTaskTextID,j,"TaskValue")))
	end
	
return myTaskVariable
	
end


-- ����Ѱ����Ʒ����Ի����ڴ�����
function AssignValue_TaskTalk(myTaskVariable,myTaskTextID)

local i,j = 0,0
local myTextValue

myTaskVariable = {{0},{0},{0},{0},{0},{0}} -- ����Ԫ�طֱ�Ϊ��ʱ�䡢�ص㡢���ԭ��һ�Ͷ����¼�

local myTableRow = TabFile_GetRowCount(myTaskTextID)
	
	tl_print ("S� h�ng t�m ���c l�:"..myTableRow);
	
	-- ����ʱ������
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"When")
		if (myTextValue ~= "n") then
			myTaskVariable[1][i] = j
		end	
	end
	
	-- ����ص�����
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Where")
		if (myTextValue ~= "n") then
			myTaskVariable[2][i] = j
		end	
	end

	-- ������������
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Who")
		if (myTextValue ~= "n") then
			myTaskVariable[3][i] = j
		end	
	end

	-- ����ԭ��һ����
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Why1")
		if (myTextValue ~= "n") then
			myTaskVariable[4][i] = j
		end	
	end
	
	-- ����ԭ�������
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"Why2")
		if (myTextValue ~= "n") then
			myTaskVariable[5][i] = j
		end	
	end
	
	-- �����¼�����
	for i = 1,myTableRow - 1 do
		j = i + 1
		myTextValue = TabFile_GetCell(myTaskTextID,j,"What")
		if (myTextValue ~= "n") then
			myTaskVariable[6][i] = j
		end	
	end
	
	for i=1,6 do
		tl_print("��i tho�i nhi�m v� hi�n t�i  "..i.."  T�ng s� ch� s� nguy�n t� l�: "..getn(myTaskVariable[i]));
	end
	
return myTaskVariable

end
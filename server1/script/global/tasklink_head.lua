
-- Ұ���������ű�ͷ�ļ�
-- Edited by peres
-- 2004/12/25 ʥ��������

IncludeLib("FILESYS");

TL_MAXTIMES = 20 -- ÿ������ 20 ������
TL_MAXLINKS = 20 -- ÿ������ 20 ����
TL_MAXLOOPS = 10 -- ����ܹ������� 10 ��������
TL_MAXLINKSCOUNT = 4 -- ÿ�������ֻ���� 4 ��

TL_UPLEVELEXP = "TaskLink_UpLevel"


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


-- ������ TABLE FILE ��Ԥ����
TabFile_Load("\\settings\\task\\tasklink_buygoods.txt",TL_BUYGOODS)
TabFile_Load("\\settings\\task\\tasklink_findgoods.txt",TL_FINDGOODS)
TabFile_Load("\\settings\\task\\tasklink_showgoods.txt",TL_SHOWGOODS)
TabFile_Load("\\settings\\task\\tasklink_findmaps.txt",TL_FINDMAPS)
TabFile_Load("\\settings\\task\\tasklink_upground.txt",TL_UPGROUND)
TabFile_Load("\\settings\\task\\tasklink_worldmaps.txt",TL_WORLDMAPS)
TabFile_Load("\\settings\\task\\levellink.txt",TL_LEVELLINK) -- ÿ���ȼ����Ӧ�ĳ�ʼ�ȼ�
TabFile_Load("\\settings\\task\\tasklink_mainlink.txt",TL_MAINTASKLEVEL) -- ÿ��������������Ӧ�ĵȼ�������ֵļ���
TabFile_Load("\\settings\\npc\\player\\level_exp.txt",TL_UPLEVELEXP) -- ��������ľ����

TabFile_Load("\\settings\\task\\award_basic.txt",TL_AWARDBASIC)
TabFile_Load("\\settings\\task\\award_link.txt",TL_AWARDLINK)
TabFile_Load("\\settings\\task\\award_loop.txt",TL_AWARDLOOP)



-- ȷ����ҵ�ǰ������״̬Ӧ�������ڵڼ���
function GetFirstLoop()
	-- ������ʱû�л��Ĳ������ֻ��Ϊ 1 
	return 1
end


-- ���յ������������������������������������
function DealTask()

-- ����ȷ����ҵ�����ȼ�
local myTaskLevel = GetTaskState(2)

print ("Get The TaskLevel:  "..myTaskLevel)

-- Ȼ���������õȼ�Ӧ�ý���ʲô���͵�����
local myTaskType = GetTaskType(myTaskLevel)

SetPlayerTaskTpye(myTaskType)

print ("Get The TaskType:  "..myTaskType)

-- ����ٶ���Ӧ�ı�ȷ������������ڱ���е��к� 
local myTaskID = GetTaskLink(myTaskType,myTaskLevel)

SaveTaskTableCol(myTaskID)

print ("Get The TaskColID:  "..myTaskID)

-- ������ռ���ͼ����Ļ����¼��ͼ�ı�ź�Ҫ�ռ��ľ�������
local myTaskMapID = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapID"))
local myMapType = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"MapType"))
local myMapNum = tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))

-- ��5��������ж�����
local myTaskValueType

-- ��¼�������
-- ��¼��ҵ���������
SetPlayerTaskTpye(myTaskType)

-- ��¼��ҵ��������������
SaveTaskTableCol(myTaskID)

-- ��Ӧ��ͬ����������ͬ�ı����洢����

	if ( myTaskType == 1 ) then
	elseif ( myTaskType == 2 ) then
	elseif ( myTaskType == 3 ) then
	elseif ( myTaskType == 4 ) then
		SetTask(1031,myTaskMapID)
		SetTask(1032,SetByte(GetTask(1032),1,myMapType))
		SetTask(1032,SetByte(GetTask(1032),2,myMapNum))
		SetTask(1025,0) -- ���ԭ���ĵ�ͼ־����
	elseif ( myTaskType == 5 ) then -- �����������ֵ����������Ļ������ж���������ֵ
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		
		if (myTaskValueType == 2) then
			print("Nh�n ���c nhi�m v� t�ng kinh nghi�m!")
			SetTask(1033,GetLevel())
			SetTask(1034,GetExp())
		elseif (myTaskValueType == 3) then
			print("Nh�n ���c nhi�m v� t�ng danh v�ng!")
			SetTask(1026,GetRepute())
		elseif (myTaskValueType == 4) then
			print("Nh�n ���c nhi�m v� t�ng ph�c duy�n!")
			SetTask(1026,FuYuan_Get())
		elseif (myTaskValueType == 5) then
			print("Nh�n ���c nhi�m v� t�ng PK!")
			SetTask(1026,GetPK())
		end
		
	elseif ( myTaskType == 6 ) then
	end
	
	SetTaskCourse(1) -- ���������չ����Ϊ 1 

end


-- �����ѭ������һ��
function TaskProcess()

local myTaskTimes = GetTaskState(1) -- ��ҽ��е��Ĵ���
local myTaskLinks = GetTaskState(2) -- ��ҽ��е�������
local myTaskLoops = GetTaskState(3) -- ��ҽ��е��Ļ���
local myTaskCancel = GetTaskState(4)
local myTaskLinksCount = GetTaskState(6) -- �������ڵ�ǰ�������Ѿ������˼���

if (myTaskTimes ~= 0) then
	myTaskTimes = myTaskTimes + 1
	if (myTaskTimes >= TL_MAXTIMES + 1) then
		myTaskTimes = 1
		myTaskLinksCount = myTaskLinksCount + 1
		myTaskCancel = 0 -- ȡ������Ϊ0
		if (myTaskLinksCount >= TL_MAXLINKSCOUNT + 1) then
			myTaskLinks = myTaskLinks + 1
			myTaskLinksCount = 0
		end
			
	end
	
	if (myTaskLinks >= TL_MAXLINKS + 1) then
		myTaskLinks = GetFirstLink()
		myTaskLoops = myTaskLoops + 1
	end
end

SetTaskState(1,myTaskTimes)
SetTaskState(2,myTaskLinks)
SetTaskState(3,myTaskLoops)
SetTaskState(4,myTaskCancel)
SetTaskState(6,myTaskLinksCount)

DealTask()

main()

end



-- ��⺯��������ȷ������Ƿ��Ѿ����������
-- ����ֵ
-- 1���Ѿ��������
-- 0����δ�����
-- ������� nTaskGoods �ж����﷽ʽ
-- ��������� 1 �Ļ������ࡢ���ϸ�ࡢ���С��ȼ�
-- ��������� 2 �Ļ������ࡢ���ϸ�ࡢ���С��ȼ���ħ������ID��ħ���������ޡ�ħ����������
-- ��������� 3 �Ļ���ħ������ID��ħ���������ޡ�ħ����������
function CheckTask(nTaskGoods)

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
local myTaskValue,myTaskValueType

-- ������Ҫ���ɽ�����ͼ����
local myWorldMaps,nWorldMaps

-- ��ȡ��ҵ�ǰ���ӵ���������
local myTaskType = GetPlayerTaskType()
local myTaskID = GetTaskTableCol()

	if ( myTaskType == 1) then
		
		myGenre = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Particular"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"GoodsFive"))
		myLevel = tonumber(TabFile_GetCell(TL_BUYGOODS,myTaskID,"Level"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myGoodsFive,myLevel}
		
		print("V�t ph�m nhi�m v� c�n:"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
		if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 2) then
	
		myGenre = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Particular"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"GoodsFive"))
		myLevel = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"Level"))
		myMagicID = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MagicEnName"))
		myMagicMax = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MaxValue"))
		myMagicMin = tonumber(TabFile_GetCell(TL_FINDGOODS,myTaskID,"MinValue"))
		
		myTaskGoods = {myGenre,myDetail,myParticular,myGoodsFive,myLevel,myMagicID,myMagicMin,myMagicMax}
		myGoodsClean = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5]} -- ��������ж�ħ��������ȡ��ֵ
		myGoodsMagic = {nTaskGoods[1],nTaskGoods[2],nTaskGoods[3],nTaskGoods[4],nTaskGoods[5],nTaskGoods[6],nTaskGoods[7],nTaskGoods[8]}
		
		if (myMagicID == "n") then
			print("V�t ph�m nhi�m v� c�n:"..myGenre..myDetail..myParticular..myLevel..myGoodsFive)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[4] == myTaskGoods[4]) and (nTaskGoods[5] == myTaskGoods[5]) then
				return 1
			else
				return 0
			end			
		else
			print("V�t ph�m nhi�m v� c�n:"..myGenre..myDetail..myParticular..myLevel..myGoodsFive.."Thu�c t�nh ma ph�p:"..myMagicID.." Tr� nh� nh�t:"..myMagicMin.." Tr� l�n nh�t:"..myMagicMax)
			if (nTaskGoods[1] == myTaskGoods[1]) and (nTaskGoods[2] == myTaskGoods[2]) and (nTaskGoods[3] == myTaskGoods[3]) and (nTaskGoods[6] == myTaskGoods[6]) and (tonumber(nTaskGoods[7]) >= myTaskGoods[7]) then
				return 1
			else
				return 0
			end
		end 
		
	elseif ( myTaskType == 3) then
	
		myMagicID = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MagicEnName"))
		myMagicMin = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MinValue"))
		myMagicMax = tonumber(TabFile_GetCell(TL_SHOWGOODS,myTaskID,"MaxValue"))
		
		print("V�t ph�m nhi�m v� c�n:"..myMagicID..myMagicMin..myMagicMax)
		
		if ( nTaskGoods[1] == myMagicID) and ( nTaskGoods[2] >= myMagicMin ) then
			return 1
		else
			return 0
		end
		
	elseif ( myTaskType == 4) then
	
		myTaskMapNum = GetTask(1025)

		print ("S� l��ng ��a �� nhi�m v� c�n:"..tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num")));

		if (myTaskMapNum>=tonumber(TabFile_GetCell(TL_FINDMAPS,myTaskID,"Num"))) then
			myTaskMapNum = 0
			SetTask(1025,myTaskMapNum) -- ������ 0
			return 1
		else
			return 0
		end
		
	elseif (myTaskType == 5) then
	
		myTaskValueType = tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericType"))
		
		if (myTaskValueType == 2) then
		
		print("Nhi�m v� hi�n t�i l� t�ng kinh nghi�m")
			if (CountUpLevelExp(GetTask(1033),GetTask(1034)) >= tonumber(TabFile_GetCell(TL_UPGROUND,myTaskID,"NumericValue"))) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 3) then -- ����ֵ
		
		print("Nhi�m v� hi�n t�i l� t�ng danh v�ng")
			if (GetRepute() >= GetTask(1026)) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 4) then -- ��Եֵ
		
		print("Nhi�m v� hi�n t�i l� t�ng ph�c duy�n")
			if (FuYuan_Get() >= GetTask(1026)) then
				return 1
			else
				return 0
			end
		elseif (myTaskValueType == 5) then -- PK ֵ
		
		print("Nhi�m v� hi�n t�i l� t�ng PK")
			if (GetPK() >= GetTask(1026)) then
				return 1
			else
				return 0
			end
		end
		
	elseif (myTaskType == 6) then
		myWorldMaps = tonumber(TabFile_GetCell(TL_WORLDMAPS,myTaskID,"Num"))
		if (GetTask(1027) >= myWorldMaps) then
			nWorldMaps = GetTask(1027) - myWorldMaps -- ������ɾ����Ҫ��ɽ�����ͼ��Ƭ
			SetTask(1027,nWorldMaps)
			return 1
		else
			return 0
		end
	end
	
end



-- ����ҷ��������ܺ���
function GivePlayerAward()

	-- �����������Ĳ�����
	-- �������Ʒ�Ļ�������Ϊ���������ͣ�Quality��Genre��Detail��Particular��Level��GoodsFive��Magiclevel����˵������
	-- ����ǽ�Ǯ�Ļ�������Ϊ���������ͣ���Ǯ������
	-- ����Ǿ���Ļ�������Ϊ���������ͣ����������
	-- �����������������ȡ��������ֻ��¼��һλΪ��������
	local myAwardArry = {
							{0,0,0,0,0,0,0,0,""}, 
						 	{0,0,0,0,0,0,0,0,""},
						 	{0,0,0,0,0,0,0,0,""}
				        }
	
	-- ���������飬�ֱ�Ϊ���ֽ�����Ȩ��
	-- ����Ϊ����Ǯ�����顢��Ʒ�������һ�εĻ��ᡢȡ������Ļ���
	-- 0 �����ĸ����������Ѿ���ѡ��
	local myMainAwardRate = {30,30,30,9,1}
	
	local myTaskValue1,myTaskValue2,myMainValue -- ��ʱ���������Լ�¼��������ֵ
	-- ���ڽ���������ַ���
	local myAwardGoods,myAwardExp,myAwardMoney,myAwardCancal,myAwardChange = "","","","",""
	
	local myArawdGoods = {0,0,0,0,0,0} -- ������Ʒ���Ӧ������
	
	local myAwardType
	
	local myAwardArryIndex = 1 -- ���Լ�¼�����������Ѿ���¼�˶��ٸ�
	
	local myRandomNum,myRandomSeed -- ��������������
	
	myTimes = GetTaskState(1)
	myLinks = GetTaskState(2)
	
	myTaskType = GetPlayerTaskType()
	
	local _nSeed = SetRandSeed(GetTask(1037))
	
	
	print("B�t ��u ch�n h�nh th�c ph�t th��ng!")
	
	for i=1,3 do -- ѭ��ѡ��������������
		
		myAwardType,myMainAwardRate = GetAwardTypeForRate(myMainAwardRate)
		
		print("v�ng quay th�  "..i.."�� ch�n ���c lo�i h�nh gi�i th��ng: "..myAwardType);
		
		if (myAwardType==1) then -- �������������Ǯ
		
			print ("Lo�i nhi�m v� hުn t�i l�:"..GetTaskTextID(myTaskType)..", s� h�ng (ID) c�a nhi�m v� hi�n t�i l�:"..GetTaskTableCol());
			
			myTaskValue1 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue1"))
			myTaskValue2 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue2"))
			-- �����ӳ�ֵ��������������ֵ
			myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myLinks+myTimes)*0.1))
			
			myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- �����ó���ʵ�ʽ�Ǯ��
			
			myAwardMoney = format("%s%s",myMainValue," ti�n ");
			
			myAwardArry[myAwardArryIndex] = {1,myMainValue,0,0,0,0,0,0,myAwardMoney}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("Nh�n ���c  ti�n th��ng: "..myAwardMoney);
			
		elseif (myAwardType==2) then -- ����������Ǿ���
		
			myTaskValue1 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue1"))
			myTaskValue2 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue2"))
			-- �����ӳ�ֵ��������������ֵ
			myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myLinks+myTimes)*0.1))
			
			myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- �����ó���ʵ�ʾ���ֵ��
			
			myAwardExp = format("%s%s",myMainValue," �i�m kinh nghi�m")
			
			myAwardArry[myAwardArryIndex] = {2,myMainValue,0,0,0,0,0,0,myAwardExp}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("Nh�n ���c m�t ph�n th��ng �i�m kinh nghi�m:"..myAwardExp);
			
		elseif (myAwardType==3) then -- �������������Ʒ
			
			myTaskValue1 = GivePlayerAward_Goods(1) -- ���ȵõ�������Ʒ������
			
			myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
			myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
			myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
			myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
			myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
			myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
			
			
			myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Name")
			
			myAwardArry[myAwardArryIndex] = {3,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("Nh�n ���c m�t ph�n th��ng: "..myArawdGoods);
			
		elseif (myAwardType==4) then -- ������������������һ�εĻ���
			
			myAwardChange = "Ch�n l�i t� ��u"
			myAwardArry[myAwardArryIndex] = {4,0,0,0,0,0,0,0,myAwardExp}
			myAwardArryIndex = myAwardArryIndex + 1
			
			print("Nh�n ���c c� h�i");
		
		elseif (myAwardType==5) then -- �����������һ��ȡ������Ļ���
		
			myAwardChange = "1 l�n  h�y b� nhi�m v� "
			myAwardArry[myAwardArryIndex] = {5,0,0,0,0,0,0,0,myAwardExp}
			myAwardArryIndex = myAwardArryIndex + 1	
			
			print("Nh�n ���c c� h�i 1 l�n h�y b� nhi�m v� ");	
		
		end
	end
	
	SetRandSeed(_nSeed)
	-- �����Ѿ�����õĽ�������
	return myAwardArry

end


-- �Ӻ��������ݽ�����ʣ�������ȡ������
function GetAwardTypeForRate(myAwardRate)

local i,j,k = 0,0,0
local myAwardMainRate = 0

for i=1,getn(myAwardRate) do
	myAwardMainRate = myAwardMainRate + myAwardRate[i]
end

j=C_Random(1,myAwardMainRate)

for i=1,getn(myAwardRate) do
	k = k + myAwardRate[i]
	if (i<k) then
		myAwardRate[i] = 0 -- ��ȫ�ֱ��� TL_MainAwardRate �м�ȥһ��ֵ
		return i,myAwardRate
	end
end

print ("Ch�n ph�n th��ng xu�t hi�n s� c�!!!");

end


-- ��Ѱ�����б��õ���Ӧ�Ľ���
-- myAwardType������������
-- 1������������� 2����������ɽ��� 3:������ɽ���
function GivePlayerAward_Goods(myAwardType)

local myTaskValue1,myTaskValue2 -- �����������ȡ����������ֵ
local myLinks,myTimes -- ������ɵĴ���������
local myMainValue -- �����ӳ�ֵ��������������ֵ
local myTaskType = GetPlayerTaskType()
local myAwardTextID

local myAwardTable

local FinalAward -- ���շ��صĽ���
	
	if (myAwardType == 1) then
		myAwardTextID = TL_AWARDBASIC
	elseif (myAwardType == 2) then
		myAwardTextID = TL_AWARDLINK
	elseif (myAwardType == 3) then
		myAwardTextID = TL_AWARDLOOP
	end
	
	myTimes = GetTaskState(1)
	myLinks = GetTaskState(2)
	
	myTaskValue1 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue1"))
	myTaskValue2 = tonumber(TabFile_GetCell(GetTaskTextID(myTaskType),GetTaskTableCol(),"TaskValue2"))
	
	-- �����ӳ�ֵ��������������ֵ
	myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myLinks+myTimes)*0.1))
	
	myAwardTable = AssignValue_AwardRate(Task_AwardBasic,myMainValue)
	
	FinalAward = TabFile_GetCell(myAwardTextID,GetAward(myAwardTable),"Name")
	
--	print ("��ȡ�� "..myTaskTextID.." ���������е� "..FinalAward.."����")
	
return GetAward(myAwardTable) -- ���ؽ������ڵ�����

end


-- ���Ѿ��γ�Ȩ���б�Ľ�������ѡ��һ������������ֵΪ�������ڵı������
function GetAward(myAwardVariable)

local i,j,k = 0,0,0
local myMainRate = 0 -- �ܵĽ���Ȩ��
	
	for i=1,getn(myAwardVariable) do
		myMainRate = myMainRate + myAwardVariable[i][2]
	end
	
	j = C_Random(1,myMainRate)
	
	for i=1,getn(myAwardVariable) do
		k = k + myAwardVariable[i][2]
		if (j<k) then
			return i
		end
	end

end


-- �Ӻ���������ȷ����ǰ������ӵ��������������һ�����͵�����
-- ����ֵΪ 1~6�����Ϊ 0 ����һ�û�д���������
function GetPlayerTaskType()

local myTaskType

--	myTaskType = strsub(format("%d",GetTask(1021),1,1))
myTaskType = GetTask(1021)

return myTaskType

end


-- �Ӻ����������趨��ǰ������ӵ��������������һ�����͵�����
function SetPlayerTaskTpye(myTaskType)
	SetTask(1021,myTaskType)
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


-- �Ӻ��������Լ�¼��ҵ�ǰ�����������Ӧ�ı������
function SaveTaskTableCol(myTaskCol)
	SetTask(1030,myTaskCol)
end


-- �Ӻ��������Զ�ȡ��ҵ�ǰ��������Ӧ�ľ���������
function GetTaskTableCol()
	return GetTask(1030)
end


-- �Ӻ�������������״̬
-- 1����ǰ���еĴ���
-- 2����ǰ���е�����
-- 3����ǰ���еĻ���
-- 4��ʣ��ȡ���Ĵ���
-- 5����ҵ�ǰ���ӵ�����Ŵ����� 1021 ��
-- 6�������ÿһ���ĸ������Ѿ����˼��Σ����Ϊ 4
function GetTaskState(myTaskState)

local n

if ( myTaskState <= 4) then
	n = GetByte(GetTask(1020),myTaskState)
elseif ( myTaskState == 5) then
	n = GetTask()
elseif ( myTaskState == 6) then
	n = GetTask(1035)
end

return n

end


-- �Ӻ��������������״̬
-- 1����ǰ���еĴ���
-- 2����ǰ���е�����
-- 3����ǰ���еĻ���
-- 4��ʣ��ȡ���Ĵ���
-- 5����ҵ�ǰ���ӵ�����Ŵ����� 1021 ��
-- 6�������ÿһ���ĸ������Ѿ����˼��Σ����Ϊ 4
function SetTaskState(myTaskState,myTaskValue)

local n

	if ( myTaskState <= 4) then
		n = GetTask(1020)
		SetTask(1020,SetByte(n,myTaskState,myTaskValue))
	elseif ( myTaskState == 5) then -- ����� 5 �Ļ����Ǽ�¼��ҵ�ǰ���ӵ�������� 1021 ��
		SetTask(1021,myTaskValue)
	elseif ( myTaskState == 6) then
		SetTask(1035,myTaskValue)
	end

end


-- �Ӻ��������õ�ǰ����Ľ���״̬��1��2��3
function SetTaskCourse(myTaskCourse)
	SetTask(1028,myTaskCourse)
end


-- �Ӻ�������ȡ��ǰ����Ľ���״̬��1��2��3
function GetTaskCourse()
	return GetTask(1028)
end



--  //////////////////////////////////////////////////////////////
-- //                  �������������ֵ����                    //
--//////////////////////////////////////////////////////////////

-- ��Ѱ�ȼ����Ӧ�����ȷ����ҵ�ǰ����������һ�ȼ���������һ��
function GetFirstLink()

	local i
	local myLevel = GetLevel()
	local myTotalCol = tonumber(TabFile_GetRowCount(TL_LEVELLINK))
	
	for i = 2,myTotalCol do
		if (myLevel > tonumber(TabFile_GetCell(TL_LEVELLINK,i,"level"))) then
			
		elseif (myLevel <= tonumber(TabFile_GetCell(TL_LEVELLINK,i,"level"))) then
			if (i == 2) then
				return tonumber(TabFile_GetCell(TL_LEVELLINK,2,"task"))
			end
			return tonumber(TabFile_GetCell(TL_LEVELLINK,i-1,"task"))
		end
	end
	
--	return tonumber(TabFile_GetCell(TL_LEVELLINK,j,"task"))
end


-- ��Ѱ�������ܱ���ȡ��Ӧ�ȼ��������������
-- ������� myTaskLevel Ϊ�������ĵȼ� 1~20
-- ����ֵΪ 1~6 1����Ʒ���� 2����ƷѰ�� 3����Ʒչʾ 4����ͼ�ռ� 5����ֵ���� 6��ɽ�����
function GetTaskType(myTaskLevel)

	local i,j,k = 0,0,0
	local myMainRate = 0 -- ��������������һ���ȼ�����ܱ���
	local myTaskType -- ���ص���������
	
	print("mylevel:   "..myTaskLevel)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		myMainRate = myMainRate + Task_MainLevelRate[myTaskLevel][i]
	end
	
	print ("T�ng c�p b�c c�a nhi�m v� l�:"..myMainRate)
	
	
	-- ����Ȩ�ع�ʽ�������������������
	j = C_Random(1,myMainRate)
	
	print ("S� c�p b�c ng�u nhi�n c�a nhi�m v� l�:"..j)
	
	for i = 1,getn(Task_MainLevelRate[myTaskLevel]) do
		k = k + Task_MainLevelRate[myTaskLevel][i]
		if ( j < k) then
		print ("K�t th�c tu�n ho�n, ch�n lo�i nhi�m v�:"..i)
			return i
		end
		print ("Hi�n t�i tu�n ho�n ch�a ch�n lo�i nhi�m v�. T�ng c�p b�c c�a nhi�m v� l�:"..k)
	end
	
	-- �쳣���������Ҷ�ѡ�����������͵Ļ���ѡ 4
	
	print("Ch�n lo�i nhi�m v� b� s� c�!");
	
	return 0

end


-- ��Ѱ��������ȡ����Ӧ������
-- ����ֵ�Ǹ������ڱ��е��к�
function GetTaskLink(myTaskType,myTaskLevel)

	local myTaskCol -- ��¼������к�

	if ( myTaskType == 1 ) then -- ����ǹ�����Ʒ������
		myTaskCol = SelectTask(Task_BuyGoods,myTaskLevel)
	elseif ( myTaskType == 2 ) then
		myTaskCol = SelectTask(Task_FindGoods,myTaskLevel)	
	elseif ( myTaskType == 3 ) then
		myTaskCol = SelectTask(Task_ShowGoods,myTaskLevel)	
	elseif ( myTaskType == 4 ) then
		myTaskCol = SelectTask(Task_FindMaps,myTaskLevel)
	elseif ( myTaskType == 5 ) then
		myTaskCol = SelectTask(Task_UpGround,myTaskLevel)
	elseif ( myTaskType == 6 ) then
		myTaskCol = SelectTask(Task_WorldMaps,myTaskLevel)
	end

	return myTaskCol

end







-- ���������б����Ȩ������������񣬷���ֵΪ��Ӧ��������к�
function SelectTask(myTaskTable,myTaskLevel)

local i,j,k = 0,0,0
local myMainRate  = 0 -- �������Ȩ��

	print ("Ch�n ��ng c�p nhi�m v�:"..myTaskLevel.."  ")
	
	print ("Trong ��ng c�p nhi�m v� t�ng c�ng c� "..getn(myTaskTable[myTaskLevel]).."  nhi�m v� ")

	for i=1,getn(myTaskTable[myTaskLevel]) do
		myMainRate = myMainRate + myTaskTable[myTaskLevel][i][2]
	end
	
	print ("Ch�n t�ng c�p b�c nhi�m v� c� th�:"..myMainRate)
	
	-- ����Ȩ�ع�ʽ��������������������
	j = C_Random(1,myMainRate)
	
--	print ("�������Ȩ��:  "..myMainRate)
--	print ("�����������Ȩ��  :  "..j)
	
	for i=1,getn(myTaskTable[myTaskLevel]) do
	
		k = k + myTaskTable[myTaskLevel][i][2]
		
		if ( j < k ) then
--			print ("ѡ���˱���еĵ�  "..myTaskTable[myTaskLevel][i][1].."  �С�")
			return myTaskTable[myTaskLevel][i][1]
		end
			
	end
	
	-- �쳣����������ѡ�����Ļ��򷵻� 0
	print ("Ch�n nhi�m v� c� th� b� s� c�!")
	return 0
	
end



-- �Ӻ���������һ��������������Ӧ�����ַ���ʶ
function GetTaskTextID(myTaskType)

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
function CountTaskRate(myTableName,myTaskRate,myTableCol)

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
function CountUpLevelExp(myOldLevel,myOldExp)

local i
local myLevel = GetLevel()
local myExp = GetExp()

local myTotalExp = 0

if (myOldLevel<myLevel) then


	for i=myOldLevel,myLevel do
		myTotalExp = myTotalExp + tonumber(TabFile_GetCell(TL_UPLEVELEXP,i+1,2))
	end
	
	myTotalExp = (myTotalExp - myOldExp) - myExp

	return myTotalExp
else
	return myExp - myOldExp
end

end



-- �Ӻ�����ȡ��������Ӧ��˵��������һ���ַ���
function GetTaskInfo()

local myTaskMainInfo,myTaskOrder,myTaskInfo1,myTaskInfo2,myTaskInfo3

	local myTaskType = GetPlayerTaskType()
	
	if (myTaskType == 1) then
		
		print("Nh�n ���c ID:"..GetTaskTableCol())
		
		-- ��Ʒ����
		myTaskOrder = TabFile_GetCell(TL_BUYGOODS,GetTaskTableCol(),"TaskInfo1")
		
		print("Thuy�t minh nhi�m v�:"..TabFile_GetCell(TL_BUYGOODS,GetTaskTableCol(),"TaskInfo1"))
		
		-- Ŀ�ĵ�����
		myTaskInfo1 = TabFile_GetCell(TL_BUYGOODS,GetTaskTableCol(),"TaskInfo")
		
		myTaskMainInfo = format("%s%s%s%s%s","��n  ",myTaskInfo1," mua  ",myTaskOrder," gi�p ta.");
		
	elseif (myTaskType == 2) then
	 
		-- ħ������
		myTaskOrder = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"MagicCnName")
		-- ������������
		myTaskInfo1 = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"TaskInfo")
		-- ��Сħ������
		myTaskInfo2 = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"MinValue")
		-- ���ħ������
		myTaskInfo3 = TabFile_GetCell(TL_FINDGOODS,GetTaskTableCol(),"MaxValue")
		
		if (myTaskOrder=="n") then
		
			myTaskMainInfo = format("%s%s%s","�i t�m <color=red>",myTaskInfo1,"<color> gi�p ta.");
		else
			myTaskMainInfo = format("%s%s%s%s%s%s%s","�i t�m <color=red>",myTaskOrder,"<color> t�i thi�u",myTaskInfo2," ",myTaskInfo1," gi�p ta.");
		end
		
	elseif (myTaskType == 3) then 
		
		-- ħ������������
		myTaskOrder = TabFile_GetCell(TL_SHOWGOODS,GetTaskTableCol(),"MagicCnName")
		-- ħ�����Ե���Сֵ
		myTaskInfo1 = TabFile_GetCell(TL_SHOWGOODS,GetTaskTableCol(),"MinValue")
		-- ħ�����Ե����ֵ
		myTaskInfo2 = TabFile_GetCell(TL_SHOWGOODS,GetTaskTableCol(),"MaxValue")
		
		myTaskMainInfo = format("%s%s%s%s%s%s%s","�i t�m  trang b� ho�c kho�ng th�ch <color=red>",myTaskOrder,"<color> th�p nh�t l� ",myTaskInfo1," cao nh�t l� ",myTaskInfo2," ");
		
	elseif (myTaskType == 4) then 
		
		-- ��ͼ������
		myTaskOrder = TabFile_GetCell(TL_FINDMAPS,GetTaskTableCol(),"TaskInfo1")
		
		-- ��Ҫ�ĵ�ͼ����
		myTaskInfo1 = TabFile_GetCell(TL_FINDMAPS,GetTaskTableCol(),"Num")
		
		-- ��ͼ������
		myTaskInfo2 = TabFile_GetCell(TL_FINDMAPS,GetTaskTableCol(),"MapType")
		
		if (tonumber(myTaskInfo2) == 1) then
			myTaskInfo3 = "��a �� ch� "
		else
			myTaskInfo3 = "M�t ch� "
		end
		
		myTaskMainInfo = format("%s%s%s%s%s%s%s%s","��n <color=red>",myTaskOrder,"<color> t�m gi�p ta",myTaskInfo1," quy�n",myTaskOrder,myTaskInfo3,"v� ��y.")
		
	elseif (myTaskType == 5) then
		
		-- ��Ҫ��������ֵ����
		myTaskOrder = TabFile_GetCell(TL_UPGROUND,GetTaskTableCol(),"NumericType")
		
		-- ��Ҫ��������ֵ����
		myTaskInfo1 = TabFile_GetCell(TL_UPGROUND,GetTaskTableCol(),"NumericValue")
		
		if (tonumber(myTaskOrder) == 1) then
			myTaskInfo2 = " c�p"
		elseif (tonumber(myTaskOrder) == 2) then
			myTaskInfo2 = "�i�m kinh nghi�m "
		elseif (tonumber(myTaskOrder) == 3) then
			myTaskInfo2 = "�i�m danh v�ng"
		elseif (tonumber(myTaskOrder) == 4) then
			myTaskInfo2 = "�i�m ph�c duy�n"
		elseif (tonumber(myTaskOrder) == 5) then
			myTaskInfo2 = "�i�m PK"
		end
		
		myTaskMainInfo = format("%s%s%s%s","�i n�ng c�p   ",myTaskInfo1," ",myTaskInfo2)
		
	elseif (myTaskType == 6) then
		-- ��Ҫ�ռ���ɽ�����ͼ��Ƭ
		myTaskOrder = TabFile_GetCell(TL_WORLDMAPS,GetTaskTableCol(),"Num")
		
		myTaskMainInfo = format("%s%s%s","gi�p ta thu th�p",myTaskOrder," m�nh b�n �� S�n H� X� T�c.")
	end

	return myTaskMainInfo
 
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

--	print (format("%s%s%s",myTaskTextID,"  :  ",myTableRow))
	
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
--		print ("The "..myTaskTextID.." 's Task: "..i.." have: "..getn(myTaskVariable[i]).." members.");
	end
	
--	print (format("%s%s%s",myTaskTextID,"  :  ","finshed!!!"))
	
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
--			print ("MyTaskLevel: "..i.."  MyTaskType: "..k.." MyRate:  "..myRate)
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
		print("Lo�i ph�n th��ng:"..myTaskTextID.."   Ph�n th��ng nhi�m v� ID:"..j.."   Gi� tr� ph�n th��ng:"..myTaskVariable[i][2])
	end
	
return myTaskVariable
	
end


-- ��������Ȩ��������
-- ���������myTaskVariable ��ԭʼ�Ľ�����ֵ�б�myAwardValue �Ǽ�������Ʒ�ܼ�ֵ��
-- ����ֵΪÿ�������ı���ļ��к���������Ȩ��
function AssignValue_AwardRate(myAwardVariable,myAwardValue)

local i,j = 0,0
local myAwardRate = {} -- ת�����Ȩ�ر�
local myAwardNum = getn(myAwardVariable)
	
	for i = 1,myAwardNum do
		myAwardRate[i]={}
	end
	
	for i=1,myAwardNum do
		j=floor((myAwardValue/(myAwardNum*(myAwardVariable[i][2])))*10000000)
		myAwardRate[i] = {i,j}
	end
	
	return myAwardRate
	
end
-- Ұ���������ű�����ͷ�ļ�
-- Edited by peres
-- 2004/12/25 ʥ��������

-- ����Ի�֮�µ�ͷ�ļ�
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua");
Include("\\script\\tong\\tong_award_head.lua");	--by zhishan


-- ����ҷ��������ܺ���
-- ���������myAwardType��1 Ϊ��ͨ������ 2 Ϊ������ 3 Ϊ������
function tl_giveplayeraward(myGiveAwardType)

	-- �����������Ĳ�����
	-- �������Ʒ�Ļ�������Ϊ���������ͣ�Quality��Genre��Detail��Particular��Level��GoodsFive��Magiclevel����˵������
	-- ����ǽ�Ǯ�Ļ�������Ϊ���������ͣ���Ǯ������
	-- ����Ǿ���Ļ�������Ϊ���������ͣ����������
	-- �����������������ȡ��������ֻ��¼��һλΪ��������
	local myAwardArry = {
							{0,0,0,0,0,0,0,0,"",0}, 
						 	{0,0,0,0,0,0,0,0,"",0},
						 	{0,0,0,0,0,0,0,0,"",0}
				        }
	
	-- �����������ͻ������ķ��ش���
	local myAwardSingle = {0,0,0,0,0,0,0,0,"",0}
	
	-- ���������飬�ֱ�Ϊ���ֽ�����Ȩ��
	-- ����Ϊ����Ǯ�����顢��Ʒ�������һ�εĻ��ᡢȡ������Ļ���
	-- 0 �����ĸ����������Ѿ���ѡ��
	local myMainAwardRate = {20,33,34,8,5}
	
	local myTaskValue1,myTaskValue2,myMainValue -- ��ʱ���������Լ�¼��������ֵ
	-- ���ڽ���������ַ���
	local myAwardGoods,myAwardExp,myAwardMoney,myAwardCancal,myAwardChange = "","","","",""
	
	local myArawdGoods = {0,0,0,0,0,0} -- ������Ʒ���Ӧ������
	
	local myAwardType = 0
	
	local myAwardArryIndex = 1 -- ���Լ�¼�����������Ѿ���¼�˶��ٸ�
	
	local myRandomNum,myRandomSeed -- ��������������
	
	local myCountLinks -- Ŀǰ������ɵ�����
	
	local myTimes = tl_gettaskstate(1)
	local myLinks = tl_gettaskstate(2)
	local myLoops = tl_gettaskstate(3)
	
	myCountLinks = tl_counttasklinknum(2)
	
	myTaskType = tl_getplayertasktype()
		
	local _nSeed = SetRandSeed(nt_getTask(1037))
	local nTongValue = 0;
	
	if (myGiveAwardType==1) then -- ������������ͨ������

		for i=1,3 do -- ѭ��ѡ��������������
			
			myAwardType,myMainAwardRate = tl_getawardtypeforrate(myMainAwardRate)
			
			tl_print("v�ng quay th�  "..i.."�� ch�n ���c lo�i h�nh gi�i th��ng: "..myAwardType);
			
			if (myAwardType==1) then -- �������������Ǯ
				
				myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				
				-- �����ӳ�ֵ��������������ֵ
				myMainValue = myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2
				
				-- 2005/9/20 ���޸��˽�Ǯ�Ĳ���������Ϊ 60% ~ 100% ����
				-- 2006/8/23 ΪԽ���޸���Ұ������Ľ�Ǯ��ֵ������ 15%
				myMainValue = floor((myMainValue * 0.05 * 1.15) * (C_Random(60,100) * 0.01)) + myTaskValue1 -- �����ó���ʵ�ʽ�Ǯ��
				
				--=======================================
				
				myMainValue = TireReduce(myMainValue);  -- ����ƣ��ϵͳ����
				myMainValue = CountDoubleMode(myMainValue);  -- ����˫����Ĵ���
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --��¼��ֵ��
				
				myAwardMoney = format("%s%s",myMainValue," ti�n ");
				
				myAwardArry[myAwardArryIndex] = {1,myMainValue,0,0,0,0,0,0,myAwardMoney,0}
				myAwardArryIndex = myAwardArryIndex + 1
				
				tl_print("Nh�n ���c  ti�n th��ng: "..myAwardMoney);
				
			elseif (myAwardType==2) then -- ����������Ǿ���
			
				myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				-- �����ӳ�ֵ��������������ֵ
				myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
				-- 2006/8/23 ΪԽ���޸���Ұ������ľ����ֵ������ 10%
				myMainValue = floor((myMainValue * 0.36) * (C_Random(80,120) * 0.01)) -- �����ó���ʵ�ʾ���ֵ��
				
				--=======================================
				myMainValue = TireReduce(myMainValue);--����ƣ��ϵͳ����
				myMainValue = CountDoubleMode(myMainValue);  -- ����˫����Ĵ���
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --��¼��ֵ��
				
				-- 2007/7/11 ΪԽ�Ϸ������޸���Ұ�ž��齱��,���Ϊƣ��״̬,��������뵽��Ʒ
				-- Ұ�Ż�����,�ڷ�ƣ��ʱʹ�ÿ��Ի�þ���
				if (GetTiredDegree() == 2) then
					local nTemExp = floor(myMainValue / 1000);
					if (nTemExp < 0) then
						nTemExp = 1;
					end;
					myMainValue = nTemExp * 1000;
					myAwardExp = format("%s%s",myMainValue," �i�m t�ch l�y D� T�u")
					
					myAwardArry[myAwardArryIndex] = {3,myMainValue,0,6,1,1475,1,0,myAwardExp,0}
					myAwardArryIndex = myAwardArryIndex + 1
					SetTask(TSK_TASKLINK_SEANSONPOINT, nTemExp);
					
					tl_print("Nh�n ���c m�t ph�n th��ng �i�m kinh nghi�m:"..myAwardExp);
				else
					myAwardExp = format("%s%s",myMainValue," �i�m kinh nghi�m")
					
					myAwardArry[myAwardArryIndex] = {2,myMainValue,0,0,0,0,0,0,myAwardExp,0}
					myAwardArryIndex = myAwardArryIndex + 1
					
					tl_print("Nh�n ���c m�t ph�n th��ng �i�m kinh nghi�m:"..myAwardExp);
				end;
				
			elseif (myAwardType==3) then -- �������������Ʒ
				
				myTaskValue1 = tl_giveplayeraward_goods(1,Task_AwardBasic) -- ���ȵõ�������Ʒ������
				
				myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
				myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
				myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
				myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
				myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
				myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
				
				-- LLG_ALLINONE_TODO_20070802
				
				myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
				-- �����ӳ�ֵ��������������ֵ
				myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
				SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --��¼��ֵ��
				
				
				myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Name")
				
				myAwardArry[myAwardArryIndex] = {3,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}
				myAwardArryIndex = myAwardArryIndex + 1
				
				tl_print("Nh�n ���c m�t ph�n th��ng: "..myArawdGoods);
				
			elseif (myAwardType==4) then -- ������������������һ�εĻ���
				
				myTaskValue1 = tl_getawardagin() -- �õ������˽�Ǯ�;�����б�������
				
				if (myTaskValue1<=getn(Task_AwardBasic) + 1) then
				
					myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Quality"))
					myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Genre"))
					myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Detail"))
					myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Particular"))
					myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"Level"))
					myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,myTaskValue1,"GoodsFive"))
				
					myAwardChange = "C� mu�n th� xem ��y l� g� kh�ng?"
					
					--=======================================
					myMainValue = TireReduce(myMainValue);--����ƣ��ϵͳ����
					myMainValue = CountDoubleMode(myMainValue);  -- ����˫����Ĵ���
					
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --��¼��ֵ��
					
					if (0 == myMainValue)then
						myMainValue = 1;
					end
	
					myAwardArry[myAwardArryIndex] = {4,myMainValue,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myAwardChange,1}
				
				elseif (myTaskValue1 == (getn(Task_AwardBasic) + 2)) then
				
					myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
					myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
					-- �����ӳ�ֵ��������������ֵ
					myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
				
					myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- �����ó���ʵ�ʾ���ֵ��
					
					--=======================================
					myMainValue = TireReduce(myMainValue);--����ƣ��ϵͳ����
					myMainValue = CountDoubleMode(myMainValue);  -- ����˫����Ĵ���
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --��¼��ֵ��
					
					myAwardChange = "C� mu�n th� xem ��y l� g� kh�ng?"
					myAwardArry[myAwardArryIndex] = {4,myMainValue,0,0,0,0,0,0,myAwardChange,2}
					
				elseif (myTaskValue1 == (getn(Task_AwardBasic) + 3)) then
	
					myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
					myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
					-- �����ӳ�ֵ��������������ֵ
					myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
					
					--=======================================
					myMainValue = TireReduce(myMainValue); --����ƣ��ϵͳ����
					myMainValue = CountDoubleMode(myMainValue);  -- ����˫����Ĵ���
					
					SetTaskTemp(TASKID_TONG_TASKLINKTEMP, myMainValue); --��¼��ֵ��
					
					myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- �����ó���ʵ�ʽ�Ǯ��
				
					myAwardChange = "C� mu�n th� xem ��y l� g� kh�ng?"
					myAwardArry[myAwardArryIndex] = {4,myMainValue,0,0,0,0,0,0,myAwardChange,3}
									
				end
				
				myAwardArryIndex = myAwardArryIndex + 1
			
			elseif (myAwardType==5) then -- �����������һ��ȡ������Ļ���
			
				myAwardCancal = "m�t c� h�i h�y b� nhi�m v� "
				myAwardArry[myAwardArryIndex] = {5,0,0,0,0,0,0,0,myAwardCancal,0}
				myAwardArryIndex = myAwardArryIndex + 1	
			
			end
		end
	
		SetRandSeed(_nSeed)
		-- �����Ѿ�����õĽ�������
		return myAwardArry, nTongValue;

	elseif (myGiveAwardType==2) then -- ����������������
	
		myTaskValue1 = tl_giveplayeraward_goods(2,Task_AwardLink) -- ���ȵõ�������Ʒ������
		
		myQuality = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Quality"))
		myGenre = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Particular"))
		myLevel = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Level"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"GoodsFive"))
		
		
		myArawdGoods = TabFile_GetCell(TL_AWARDLINK,myTaskValue1,"Name")
		
		myAwardSingle = {3,0,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}

		tl_print("B�n �� ch�n cho m�nh ph�n th��ng l�: "..myArawdGoods);
		SetRandSeed(_nSeed)
		return myAwardSingle
			
	elseif (myGiveAwardType==3) then -- ���������ǻ�����
	
		tl_print ("B�t ��u l�a ch�n ph�n th��ng: ");

		myTaskValue1 = tl_giveplayeraward_goods(3,Task_AwardLoop) -- ���ȵõ�������Ʒ������
		
		myQuality = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Quality"))
		myGenre = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Genre"))
		myDetail = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Detail"))
		myParticular = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Particular"))
		myLevel = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Level"))
		myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"GoodsFive"))
		
		myArawdGoods = TabFile_GetCell(TL_AWARDLOOP,myTaskValue1,"Name")
		
		myAwardSingle = {3,0,myQuality,myGenre,myDetail,myParticular,myLevel,myGoodsFive,myArawdGoods,0}

		tl_print("B�n �� ch�n cho m�nh ph�n th��ng l�: "..myArawdGoods);
		SetRandSeed(_nSeed)
		return myAwardSingle

	end
	SetRandSeed(_nSeed)
end


-- �Ӻ��������ݽ�����ʣ�������ȡ������
function tl_getawardtypeforrate(myAwardRate)

	local i,j,k = 0,0,0
	local myAwardMainRate = 0
	
	for i=1,getn(myAwardRate) do
		myAwardMainRate = myAwardMainRate + myAwardRate[i]
	end
	
	j=C_Random(1,myAwardMainRate)
	
	tl_print ("Hi�n t�i lo�i h�nh ph�n th��ng g�m: "..myAwardMainRate);
	
	tl_print ("Ch�n cho m�nh ph�n th��ng ng�u nhi�n l�: "..j);
	
	for i=1,getn(myAwardRate) do
		k = k + myAwardRate[i]
		if (j<=k) then
			myAwardRate[i] = 0 -- ��ȫ�ֱ��� TL_MainAwardRate �м�ȥһ��ֵ
			tl_print ("B�n �� ch�n ph�n th��ng � h�ng th�: "..i.." ");
			return i,myAwardRate
		end
	end

	tl_print ("Ch�n ph�n th��ng xu�t hi�n s� c�!!!");

end


-- ��Ѱ�����б��õ���Ӧ�Ľ���
-- myAwardType������������
-- myAwardOrgTable�������ԭʼ���������б�
-- 1������������� 2����������ɽ��� 3:������ɽ���
function tl_giveplayeraward_goods(myAwardType,myAwardOrgTable)

local myTaskValue1,myTaskValue2 -- �����������ȡ����������ֵ
local myLinks,myTimes,myLoops,myCountLinks -- ������ɵĴ���������
local myMainValue -- �����ӳ�ֵ��������������ֵ
local myTaskType = tl_getplayertasktype()

local myAwardTable

local FinalAward,n -- ���շ��صĽ���
	
	myTimes = tl_gettaskstate(1)
	myLinks = tl_gettaskstate(2)
	myLoops = tl_gettaskstate(3)
	
	myCountLinks = tl_counttasklinknum(2)
	
	myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
	myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
	
	-- �����ӳ�ֵ��������������ֵ
	if (myAwardType==1) then
		myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1 + myLoops * 0.2))
		myMainValue = myMainValue * (tl_getplayerlucky() * 0.001 + 1)
	elseif (myAwardType==2) or (myAwardType==3) then
		myMainValue = 2000000
	end
	
	--=======================================
	myMainValue = TireReduce(myMainValue);--����ƣ��ϵͳ����
	myMainValue = CountDoubleMode(myMainValue);  -- ����˫����Ĵ���
	
	if (0 == myMainValue)then
		myMainValue = 1;
	end
	
	myAwardTable = AssignValue_AwardRate(myAwardOrgTable,myMainValue)

n = tl_getaward(myAwardTable)

return n -- ���ؽ������ڵ�����

end


-- ���ѡ�����������һ�εĻ�����ô˺���
function tl_getawardagin()

tl_print ("B�t ��u th�ng k� s� l�n ch�n ph�n th��ng ng�u nhi�n");

local myMainValue,myTaskValue1,myTaskValue2,myOrgValue
local myTaskType = tl_getplayertasktype()
local myAwardExp,myAwardMoney
local myAwardAddTable = {{0,0},{0,0}}

local myReAwardTable = {}
myReAwardTable[1] = {}

local myTimes = tl_gettaskstate(1)
local myLinks = tl_gettaskstate(2)
local myLoops = tl_gettaskstate(3)

local n

	for i = 1,getn(Task_AwardBasic) + 2 do
		myReAwardTable[i]={}
	end
	
	myCountLinks = tl_counttasklinknum(2)

	myTaskValue1 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue1"))
	myTaskValue2 = tonumber(TabFile_GetCell(tl_gettasktextID(myTaskType),tl_gettasktablecol(),"TaskValue2"))
	-- �����ӳ�ֵ��������������ֵ
	myMainValue = myTaskValue1 + (myTaskValue2 * (1+(myCountLinks+myTimes)*0.1) + myLoops * 0.2)
	myMainValue = myMainValue * (tl_getplayerlucky() * 0.03 + 1)
	myOrgValue = myMainValue; -- �������ڴ���ȥѡ����Ʒ�Ļ�����ֵ��
	
	tl_print ("B�t ��u th�ng k� s� l�n ch�n ph�n th��ng ng�u nhi�n, t�ng gi� tr� ph�n th��ng nhi�m v� l�: "..myMainValue);
	
	myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- �����ó���ʵ�ʾ���ֵ��
	myAwardExp = myMainValue
	
	myMainValue = floor((myMainValue / 2) * (C_Random(80,120) * 0.01)) -- �����ó���ʵ�ʵĽ�Ǯ��
	myAwardMoney = myMainValue
	
	myAwardAddTable[1][1] = getn(Task_AwardBasic) + 1
	myAwardAddTable[1][2] = myAwardExp
	
	myAwardAddTable[2][1] = getn(Task_AwardBasic) + 2
	myAwardAddTable[2][2] = myAwardMoney
	
	for i = 1,getn(Task_AwardBasic) do
		myReAwardTable[i][1] = Task_AwardBasic[i][1]
		myReAwardTable[i][2] = Task_AwardBasic[i][2]
	end
	
	myReAwardTable[(getn(Task_AwardBasic) + 1)] = {myAwardAddTable[1][1],myAwardAddTable[1][2]}
	myReAwardTable[(getn(Task_AwardBasic) + 2)] = {myAwardAddTable[2][1],myAwardAddTable[2][2]}
	
	tl_print ("nh�p gi� tr� ph�n th��ng "..myMainValue);
	
	myReAwardTable = AssignValue_AwardRate(myReAwardTable,myOrgValue * 1.2)
	
	tl_print ("Sau khi th�ng k�, t�ng s� h�ng l�: "..getn(myReAwardTable));
	
	n = tl_getaward(myReAwardTable)
	
	return n

end


-- ���Ѿ��γ�Ȩ���б�Ľ�������ѡ��һ������������ֵΪ�������ڵı������
function tl_getaward(myAwardVariable)

local i,j,k = 0,0,0
local myMainRate = 0 -- �ܵĽ���Ȩ��

	tl_print ("Sau khi th�ng k�, t�ng s� nguy�n t� nh�p tr�n c�c h�ng l�: "..getn(myAwardVariable));

	for i=1,getn(myAwardVariable) do
		myMainRate = myMainRate + myAwardVariable[i][2]
	end

	j = C_Random(1, 100)/100 * myMainRate
	
	tl_print ("S� l�n ch�n l�a qu� th��ng ng�u nhi�n l�:"..j);
	
	for i=1,getn(myAwardVariable) do
		k = k + myAwardVariable[i][2]
		
		tl_print ("S� l�n xu�t hi�n tr� s� k trong qu� tr�nh l�a ch�n ph�n th��ng l�:"..k);
		
		if (j<k) then
			return myAwardVariable[i][1]
		end
	end

end


-- ������ҹ̶������Ľ�����ֱ�ӷ������
-- �������Ϊԭʼ���ݱ���ǰ��ɵĴ���
function tl_getlinkaward(orgLinkAward, nTask)

local i,j,nAward = 0,0,0;
local decLinkAward = {}; -- ������Ȩ��

local k,nRate = 0,0; -- ���ڼ���Ȩ�ص�������

local nAwardCol = 0; -- ��ȡ���ı������

local nGoods = {"",0,0,0,0,0,0,0};

	for i=1, getn(orgLinkAward) do
	
		if (nTask == orgLinkAward[i][1]) then -- �����˷��Ϸ����Ĵ���
			nAward = nAward + 1;
			--decLinkAward[nAward][1] = orgLinkAward[i][2];
			--decLinkAward[nAward][2] = orgLinkAward[i][3];
			tinsert(decLinkAward, nAward, {orgLinkAward[i][2], orgLinkAward[i][3]});
		end;
	
	end;
	
	if (nAward==0) then -- һ��������û�еĻ��ͷ��ؿ�
		-- storm_ask2start(4, 1)	--Storm ��ʼ��ս
		return
	end
	
	if (getn(decLinkAward)>0) then
	
		for i=1, getn(decLinkAward) do
			nRate = nRate + decLinkAward[i][2];
		end;
		
		j = C_Random(1, nRate);
		
		for i=1, getn(decLinkAward) do
			k = k + decLinkAward[i][2];
			if (j<=k) then
				nAwardCol = decLinkAward[i][1];
				break;
			end;
		end;
		
		nGoods[1] = TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Name");
		nGoods[2] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Quality"));
		nGoods[3] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Genre"));
		nGoods[4] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Detail"));
		nGoods[5] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Particular"));
		nGoods[6] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Level"));
		nGoods[7] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "GoodsFive"));
		nGoods[8] = tonumber(TabFile_GetCell(TL_AWARDLINK, nAwardCol, "Magiclevel"));
		
		if (nGoods[2]==1) then
			AddGoldItem(0, nGoods[3]);
			Msg2Player("Ch�c m�ng b�n! Ho�n th�nh nhi�m v� l�n n�y  "..nTask.." b�n nh�n ���c"..nGoods[1].."!!!");
			Say("B�n tr� l�m t�t l�m, t�ng ng��i <color=yellow>"..nGoods[1].."<color> n�y, sau n�y h�y c� g�ng th�m nh�!", 0);
			AddGlobalCountNews("Ng��i ch�i "..GetName().."B�n ho�n th�nh nhi�m v� n�y  "..nTask.." D� T�u, nh�n ���c 1 b� Trang b� Ho�ng Kim "..nGoods[1].." m�t c�i!!!", 3);
			
			WriteLog(date("%H%M%S")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."l�n, nh�n ���c 1 b� Trang b� Ho�ng Kim "..nGoods[1])
			
		else
			AddItem(nGoods[3],nGoods[4],nGoods[5],nGoods[6],nGoods[7],nGoods[8],0);
			Msg2Player("Ch�c m�ng b�n! Ho�n th�nh nhi�m v� l�n n�y  "..nTask.." b�n nh�n ���c"..nGoods[1].."!!!");
			
			if (nTask >= 100) then -- �������������� 100 ��д LOG
				TaskLink_WriteLog(nTask, nGoods[1]);
			end;
			
			Say("B�n tr� l�m t�t l�m, t�ng ng��i <color=yellow>"..nGoods[1].."<color> n�y, sau n�y h�y c� g�ng th�m nh�!", 0);
		end;
		
	else
	
		-- storm_ask2start(4, 1)	--Storm ��ʼ��ս
		return
	
	end;

end


-- ��ȡ��ҵ�����ֵ
function tl_getplayerlucky()

local nLucky = GetLucky(0);

	if (nLucky~=nil) and (nLucky~=0) then
		return nLucky
	else
		return 1
	end;
	
end;


-- ��������Ȩ��������
-- ���������myTaskVariable ��ԭʼ�Ľ�����ֵ�б�myAwardValue �Ǽ�������Ʒ�ܼ�ֵ��
-- ����ֵΪÿ�������ı���ļ��к���������Ȩ��
function AssignValue_AwardRate(myAwardVariable,myAwardValue)

local i,j,k = 0,0,0
local myAwardRate = {{}} -- ת�����Ȩ�ر�
local myAwardNum = getn(myAwardVariable)
	
	for i = 1,myAwardNum do
		myAwardRate[i]={}
	end
	
	for i=1,myAwardNum do
	
		k = i + 1 -- Ϊ���ֱ�������Ķ�Ӧ������ k 
	
		myAwardRate[i][2] = myAwardVariable[i][2]
		
		if (myAwardValue > myAwardVariable[i][2]) then
			myAwardRate[i][2] = myAwardValue
		end
		
		j = myAwardValue / ( myAwardNum * (myAwardRate[i][2]) ) 
		
		myAwardRate[i] = {k,j}
		
	end
	
	return myAwardRate
	
end

-- ����̶������������ڴ��б�
function AssignValue_LinkAward(myTaskTextID)

local i,j = 0,0;
local myLinkAward = {{0,0,0}}; -- �ڴ��б�������������������Ȩ��

local myTableRow = TabFile_GetRowCount(myTaskTextID)
local nTaskNum = 0;

	for i=1,myTableRow - 1 do
		myLinkAward[i] = {0,0,0};
	end;

	for i=2, myTableRow do
		j = j + 1;
		nTaskNum = tonumber(TabFile_GetCell(myTaskTextID, i, "Num"));
		myLinkAward[j][1] = nTaskNum;
		myLinkAward[j][2] = i;
		myLinkAward[j][3] = tonumber(TabFile_GetCell(myTaskTextID, i, "TaskValue"));
	end;
	
	return myLinkAward;
	
end


-- ������д�� LOG 
function TaskLink_WriteLog(nTask, strGoods)

	WriteLog(" [Ghi nh� nh�n ph�n th��ng]"..date(" [%y n�m %m th�ng %d ng�y  %H gi� %M ph�t]")..": T�i kho�n"..GetAccount()..", nh�n v�t"..GetName().."B�n ho�n th�nh nhi�m v� n�y  "..nTask.."  l�n, nh�n ���c ph�n th��ng"..strGoods);

end

-- ��ƣ��ϵͳ˥������
function TireReduce(myMainValue)
--	Msg2Player("ԭʼ��ֵ����"..myMainValue);
	if (nil == myMainValue) 
		then return 0; 
	end
	local Value = myMainValue;
	local TireDegree = GetTiredDegree();
	TireDegree = 0;
	if (1 == TireDegree) then
		Value = floor(Value / 2);
	elseif (2 == TireDegree) then
		Value = 0;
	end
	
--	Msg2Player("�����Դ�����ֵ����"..Value);
	return Value;
end


-- ˫�����ģʽ
-- ���������int:nValue ��Ҫ����ļ�ֵ��
function CountDoubleMode(nValue)

local nDoubleMode = greatnight_huang_event(4);

	if nDoubleMode~=0 or nDoubleMode~=nil then
		return nValue*nDoubleMode;
	else
		return nValue;
	end;

end;

-- ��ȡ�������,ÿ�ζ��ֶദ����,д��һ������
function getawardgoodsdata(nIndex)
	local	myQuality = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Quality"))
	local	myGenre = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Genre"))
	local	myDetail = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Detail"))
	local	myParticular = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Particular"))
	local	myLevel = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"Level"))
	local	myGoodsFive = tonumber(TabFile_GetCell(TL_AWARDBASIC,nIndex,"GoodsFive"))
	local	myArawdGoods = TabFile_GetCell(TL_AWARDBASIC,nIndex,"Name")
	return myQuality, myGenre, myDetail, myParticular, myLevel, myGoodsFive, myArawdGoods;
end;

--function GetTiredDegree()
--	return 1;
--end
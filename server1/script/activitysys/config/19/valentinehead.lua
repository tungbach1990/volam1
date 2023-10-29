Include("\\script\\activitysys\\config\\19\\config.lua")
Include("\\script\\activitysys\\config\\19\\head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")


TASK_VALENTINENUMBER = 1


TREE_GROWSTEP        = 1
TREE_OWNER					 = 10
TREE_PICKSTEP				 = 3
TREE_TASKSTEP				 = 4
TREE_TASKTIME        = 5
TREE_TASKRANDTIME    = 6
TREE_TASKSTARTTIME   = 7
TREE_TASKNAME				 = 8
TREE_TASKSCORE       = 9
TREE_TYPE						 = 2

XIANGSI 						 = 1
MEIGUIHUAZI					 = 2


ACTIVITY_NPC_ID 			= {1252, 1253, 1254, 1255} 	-- NPC��ID

ACTIVITY_STARTTIME = 20110213
ACTIVITY_ENDTIME   = 20110223
ACTIVITY_MAP = {1,11,37,176,162,78,80, 174,121,153,101,99,100,20,53}

NPC_DATA = {}

ACTIVITY_TREE_NAME_XIANGSI = {
											"M�m C�y T��ng T�",
											"C�y T��ng T� Nh�",
											"C�y T��ng T� N� Hoa",
											"C�y T��ng T� n� ��y ��u T��ng T�",
											}
ACTIVITY_TREE_TALK_XIANGSI			= {
											"H�ng ��u Sinh Nam Qu�c, Xu�n Lai Ph�t K� Chi",
											"Nguy�n Qu�n �a Th�i Hi�t, Th� V�t T�i T��ng T�.",
											"T�nh Nh�n O�n Dao, C�nh T�ch Kh�i T��ng T�.",
											"Tr��ng T��ng T�, Tr��ng T��ng T�, Nh��c V�n T��ng T� Th�m Li�u K�, Tr� Phi T��ng Ki�n Th�i.",
											"Tr��ng T�ng T�, Tr��ng T��ng T�, D�c B� T��ng T� Thuy�t T� Th�y, Thi�n T�nh Nh�n B�t Tri.",
											"Tr��ng T��ng T� H� Tr��ng T��ng �c, �o�n T��ng T� H� V� C�ng C�c.",
										  }
ACTIVITY_TREE_NAME_ROSE =	{
											"M�m hoa h�ng",
											"C�y Hoa H�ng Non",
											"C�y hoa h�ng ch�a tr� hoa",
											"C�y hoa h�ng n� ��y hoa",
											}
ACTIVITY_TREE_TALK_ROSE			= {
											"Qu�n T�m T� Ng� T�m",
											"Ch�p T� Chi Th�, D� T� Giai L�o.",
											"Th� T�nh V� K� Ti�u Tr�,T�i H� Mao ��u, Kh��c Th��ng T�m ��u.",
											"Ng� Nguy�n D� Qu�n T��ng Tri",
											"Nguy�n Thi�n H� H�u T�nh Nh�n Chung Th�nh Tr��c Thu�c.",
										  }
ACTIVITY_TREE_NAME_QINGREN =	{
											"M�m C�y T�nh Nh�n",
											"C�y T�nh Nh�n �ang sinh tr��ng",
											"C�y T�nh Nh�n �ang sinh tr��ng",
											"C�y t�nh nh�n",
											}
										  
ACTIVITY_TREE_TASK_NAME	= {"T��i n��c", "B�n ph�n", "C�t c� d�i", "B�t s�u",}


function AddMeiGuiOrXiangSiTree(tb, nNpcIndex)
	NPC_DATA[nNpcIndex] = tb.szTmpPlayerName
	AddTimer(1*18, "MeiGuiOrXiangSiOnTimer", nNpcIndex)
	if GetNpcParam(nNpcIndex, TREE_GROWSTEP) == 4 then
		AddNpcSkillState(nNpcIndex, 662,1, 1, 30*60*18)
	end
end

function MeiGuiOrXiangSiOnTimer(nNpcIdx)
	
	local nTaskStart = GetNpcParam(nNpcIdx, TREE_TASKTIME)
	local nCurTime = GetCurServerTime()
	local nCheckPoint  = nCurTime - nTaskStart -- ����
	
	local nTreeStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	if nTreeStep == 4 then
		if nCheckPoint > 10*60 then
			DelNpc(nNpcIdx)
			return 0, nNpcIdx
		end		
		return 18, nNpcIdx
	else
		if nCheckPoint > 10*60 then
			DelNpc(nNpcIdx)
			return 0, nNpcIdx
		end			
	end
	
	local nTaskStartTime = GetCurServerTime() - GetNpcParam(nNpcIdx, TREE_TASKSTARTTIME)
	local nNowStep = floor(nTaskStartTime/300)
	if nNowStep ~= 0 then
		ValentineMeGuiAndXiangSiTreeGrow(nNpcIdx)
		return 0, nNpcIdx
	end
	
	if 270 < nTaskStartTime then
		AddNpcSkillState(nNpcIdx, 764,1, 1, 0)
		SetNpcParam(nNpcIdx, TREE_TASKSTEP, -1)
		return 18, nNpcIdx
	end 
	
	local nTreeTaskStep = GetNpcParam(nNpcIdx, TREE_TASKSTEP)

	if nCheckPoint >= 90 then
		AddNpcSkillState(nNpcIdx, 764,1, 1, 0)
		SetNpcParam(nNpcIdx, TREE_TASKTIME, GetCurServerTime())
		SetNpcParam(nNpcIdx, TREE_TASKSTEP, 0)
		SetNpcParam(nNpcIdx, TREE_TASKNAME, -1)
		return 18, nNpcIdx
	end
	
	if nCheckPoint >= 60 and nTreeTaskStep <= 1 then
		SetNpcParam(nNpcIdx, TREE_TASKSTEP, -1)
		return 18, nNpcIdx
	end
	
	if nCheckPoint <= 30 and nTreeTaskStep == 0 then
		local nRandTime = GetNpcParam(nNpcIdx, TREE_TASKRANDTIME)
		if nCheckPoint >= nRandTime then
			AddNpcSkillState(nNpcIdx, 662,1, 1, (60 - nCheckPoint )*18) -- ���������̾��
			SetNpcParam(nNpcIdx, TREE_TASKSTEP, nTreeTaskStep + 1)
			SetNpcParam(nNpcIdx, TREE_TASKRANDTIME, random(1, 30))
		end
		return 18, nNpcIdx
	end
	
	return 18, nNpcIdx
end


function ValentineMeGuiAndXiangSiTreeGrow(nNpcIdx)
	
	local nX32, nY32, nMapIndex = GetNpcPos(nNpcIdx)
	local szPlayerName = NPC_DATA[nNpcIdx]
	local nTreeGrowStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	local nType = GetNpcParam(nNpcIdx, TREE_TYPE)
	local tbNpcName = {}
	if nType == XIANGSI then 
		tbNpcName = ACTIVITY_TREE_NAME_XIANGSI
	else 
		tbNpcName = ACTIVITY_TREE_NAME_ROSE
	end
	local tbNpc = {
		szName = format("%s[%s]", tbNpcName[nTreeGrowStep+1], szPlayerName), 
		nLevel = 95,
		nMapId = SubWorldIdx2ID(nMapIndex),
		nPosX = nX32,
		nPosY = nY32,
		nNpcId = ACTIVITY_NPC_ID[nTreeGrowStep+1],
		nIsBoss = 0,
		tbNpcParam = {},
		szScriptPath = "\\script\\activitysys\\config\\19\\tree.lua",
		pCallBack = AddMeiGuiOrXiangSiTree,
		szTmpPlayerName = szPlayerName,
	}
		
	tbNpc.tbNpcParam[TREE_GROWSTEP] = GetNpcParam(nNpcIdx, TREE_GROWSTEP)+1
	tbNpc.tbNpcParam[TREE_OWNER] = 1
	tbNpc.tbNpcParam[TREE_PICKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKTIME] = GetCurServerTime()
	tbNpc.tbNpcParam[TREE_TASKRANDTIME] = random(1, 30)
	tbNpc.tbNpcParam[TREE_TASKSTARTTIME] = GetCurServerTime()
	tbNpc.tbNpcParam[TREE_TASKNAME] = -1
	tbNpc.tbNpcParam[TREE_TASKSCORE] = GetNpcParam(nNpcIdx, TREE_TASKSCORE)
	tbNpc.tbNpcParam[TREE_TYPE] = GetNpcParam(nNpcIdx, TREE_TYPE)
	
	NPC_DATA[nNpcIdx] = nil
	
	DelNpc(nNpcIdx)
	basemission_CallNpc(tbNpc)
	
end

function AddQingRenTree(tb, nNpcIndex)
	NPC_DATA[nNpcIndex] = tb.szTmpPlayerName
	AddTimer(1*18, "QingRenOnTime", nNpcIndex)
	if GetNpcParam(nNpcIndex, TREE_GROWSTEP) == 4 then
		AddNpcSkillState(nNpcIndex, 662,1, 1, 30*60*18)
	end
end

function QingRenOnTime(nNpcIdx)
	
	local nTaskStart = GetNpcParam(nNpcIdx, TREE_TASKTIME)
	local nCurTime = GetCurServerTime()
	local nCheckPoint  = nCurTime - nTaskStart -- ����
	
	local nTreeStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	if nTreeStep == 4 then
		if nCheckPoint > 30*60 then
			DelNpc(nNpcIdx)
			return 0, nNpcIdx
		end
		return 18, nNpcIdx	
	else
		if nCheckPoint > 30*60 then
			DelNpc(nNpcIdx)
			return 0, nNpcIdx
		end
	end
	
	local nNowStep = floor(nCheckPoint/30)
	local nTreeGrowStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	if nNowStep ~= 0 then
		ValentineQingRenTreeGrow(nNpcIdx)
		return 0, nNpcIdx
	end
		
	return 18, nNpcIdx
end

function ValentineQingRenTreeGrow(nNpcIdx)
	
	local nX32, nY32, nMapIndex = GetNpcPos(nNpcIdx)
	local szPlayerName = NPC_DATA[nNpcIdx]
	local nTreeGrowStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	local tbNpc = {
		szName = format("%s[%s]", ACTIVITY_TREE_NAME_QINGREN[nTreeGrowStep+3], szPlayerName), 
		nLevel = 95,
		nMapId = SubWorldIdx2ID(nMapIndex),
		nPosX = nX32,
		nPosY = nY32,
		nNpcId = ACTIVITY_NPC_ID[nTreeGrowStep+3],
		nIsBoss = 0,
		tbNpcParam = {},
		szScriptPath = "\\script\\activitysys\\config\\19\\qingrentree.lua",
		pCallBack = AddQingRenTree,
		szTmpPlayerName = szPlayerName,
		}
	tbNpc.tbNpcParam[TREE_GROWSTEP] = GetNpcParam(nNpcIdx, TREE_GROWSTEP)+3
	tbNpc.tbNpcParam[TREE_OWNER] = 1
	tbNpc.tbNpcParam[TREE_PICKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKSTEP] = 0
	tbNpc.tbNpcParam[TREE_TASKTIME] = GetCurServerTime()

	NPC_DATA[nNpcIdx] = nil
	DelNpc(nNpcIdx)
	basemission_CallNpc(tbNpc)	
	
end

function ValentineResetTask()
end

function IsInValentine()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))	
	if ACTIVITY_STARTTIME <= nDate and nDate <= ACTIVITY_ENDTIME then
		return 1
	end
	Msg2Player("Kh�ng ph�i trong th�i gian di�n ra ho�t ��ng, ��o c� kh�ng c� hi�u l�c")
	return 0
end

function CheckValentineLevel()
	if GetLevel() < 150 and ST_IsTransLife() ~= 1 then
		Msg2Player("��ng c�p kh�ng ��!")
		return 0
	end
	return 1
end

function NumberIsEven(nNumber)
	local nMid = floor(nNumber/2)
	if nMid * 2 == nNumber then
		return 1
	end
	return 0
end

function CheckPlantConditionMeiGui()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		lib:ShowMessage("C�n ph�i c� 2 ng��i t� ��i m�i c� th� tr�ng H�t Gi�ng Hoa h�ng")
		return 0
	end
	
	local nPlayer1Index = GetTeamMember(1)
	local nPlayer2Index = GetTeamMember(2)
	
	local nPlayer1Sex = DynamicExecuteByPlayer(nPlayer1Index, "", "GetSex")
	local nPlayer2Sex = DynamicExecuteByPlayer(nPlayer2Index, "", "GetSex")
	if (nPlayer1Sex + nPlayer2Sex ~= 1) or (nPlayer1Sex * nPlayer2Sex ~= 0) then
		lib:ShowMessage("C�n ph�i nam n� t� ��i v�i nhau m�i c� th� tr�ng H�t Gi�ng Hoa H�ng")
		return 0
	end
	
	local nMapId = SubWorldIdx2ID(SubWorld)
	local nIsInMap = 0

	for i = 1, getn(ACTIVITY_MAP) do
		if nMapId == ACTIVITY_MAP[i] and GetFightState() == 1 then
			nIsInMap = 1
			break	
		end
	end
	if nIsInMap == 0 then
		lib:ShowMessage("C�n ph�i tr�ng H�t Gi�ng hoa H�ng � ngo�i Th�t ��i Th�nh Th� v� B�t ��i T�n Th� Th�n")
		return 0
	end

	local nValentinePlayerIdx = ((nPlayer1Index == PlayerIndex) and nPlayer2Index or nPlayer1Index)
	local szLoverName = DynamicExecuteByPlayer(nValentinePlayerIdx, "", "GetMateName")
	local szCurPlayerName = GetName()
	if szCurPlayerName == szLoverName then
		return 1
	end
	
	
	local nFlag1 = CallPlayerFunction(nPlayer1Index, PlayerFunLib.CheckItemInBag, PlayerFunLib, {tbProp={6,1,2696,1,0,0},}, 1, "")
 	if nFlag1 ~= 1 then
		lib:ShowMessage("Xin h�y x�c nh�n ng��i c� duy�n v�i ng��i c�ng c� D�y H�ng r�i h�y ��n tr�ng H�t Gi�ng Hoa H�ng!")
		return 0
	end
	
	local nFlag2 = CallPlayerFunction(nPlayer2Index, PlayerFunLib.CheckItemInBag, PlayerFunLib, {tbProp={6,1,2696,1,0,0},}, 1, "")
 	if nFlag2 ~= 1 then
		lib:ShowMessage("Xin h�y x�c nh�n ng��i c� duy�n v�i ng��i c�ng c� D�y H�ng r�i h�y ��n tr�ng H�t Gi�ng Hoa H�ng!")
		return 0
	end

	local nPlayer1ValentineNumber = DynamicExecuteByPlayer(nPlayer1Index, "", "pActivity.TaskGroup:GetTask", TASK_VALENTINENUMBER)
	local nPlayer2ValentineNumber = DynamicExecuteByPlayer(nPlayer2Index, "", "pActivity.TaskGroup:GetTask", TASK_VALENTINENUMBER)
	if NumberIsEven(nPlayer1ValentineNumber + nPlayer2ValentineNumber) ~= 1 then
		lib:ShowMessage("S� Nh�n Duy�n c�a 2 ng��i ph�i l� s� c�p ch�n ho�c l� b�n ��i c�a ng��i !")
		return 0
	end
	
	return 1
	
end

function CheckPlantConditionXiangSi()
	local nMapId = SubWorldIdx2ID(SubWorld)
	
	for i = 1, getn(ACTIVITY_MAP) do
		if nMapId == ACTIVITY_MAP[i] and GetFightState() == 1 then
			return 1
		end
	end
	
	lib:ShowMessage("C�n ph�i tr�ng ��u T��ng T� � ngo�i Th�t ��i Th�nh Th� v� B�t ��i T�n Th� Th�n")
	return 0
end

function CheckPlantConditionQingRen()
	local nMapId = SubWorldIdx2ID(SubWorld)
	
	for i = 1, getn(ACTIVITY_MAP) do
		if nMapId == ACTIVITY_MAP[i] and GetFightState() == 1 then
			return 1
		end
	end
	
	lib:ShowMessage("C�n ph�i s� d�ng � ngo�i Th�t ��i Th�nh Th� v� B�t ��i T�n Th� Th�n m�i c� th� tr�ng H�t C�y T�nh Nh�n")
	return 0
end
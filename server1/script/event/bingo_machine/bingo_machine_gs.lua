if MODEL_GAMESERVER ~= 1 then
	return 
end
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\bingo_machine\\bingo_machine_def.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\event\\bingo_machine\\gambler.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

INT_MAX = 2147483647
INPOOLPENCENT = 0.02
BINGO_MAX_RATE = 10000
-- ��ͬ�Ǽ��ĵý�����
BINGO_AWARD_RATE =
{	
	--Change flag rate - Modified By DinhHQ - 20120524
	{2205, 205, 80}, -- 0��, ������֮�������Ʒ�ĸ�����ͬ
	{2100, 150, 10}, -- 1��, ���ϴ��е���Ʒ��,������Ʒ�ĸ�����ͬ
	{2100, 100, 10}, -- ...
	{2400, 100, 10},
	{2500, 100, 1},
	{2750, 7, 	3},
}
--Change box rate - Modified By DinhHQ - 20120524
BINGO_AWARD_BOX_RATE = {15, 25}
BINGO_AWORD_TYPE_COUNT = 3 * 4 + 2 --��Ʒ����������, ����ʯ, װ��, ����, ����, ����

function BingoMachine:GetCurRate(nType, nLevel)
	local tbRate = {}
	if nLevel == 0 then -- ��ʼ����һ�εý����ʱ�
		for i = 1, 4 do  
			tinsert(tbRate, BINGO_AWARD_RATE[1])
		end
		tinsert(tbRate, BINGO_AWARD_BOX_RATE)
	else -- ��ʼ����N�εý����ʱ�
		local nRate = 0
		local nRow = nLevel + 1 -- �õ��ϴμ�������Ӧ�ĸ������ڵ�λ��
		for i = 1, getn(BINGO_AWARD_RATE[nRow]) do
			 nRate = nRate + BINGO_AWARD_RATE[nRow][i]
		end
		nRate = ceil((BINGO_MAX_RATE - nRate) / (BINGO_AWORD_TYPE_COUNT - 3))
		for i = 1, 4 do 
			if i == nType then -- �ϴεý�����Ʒ
				tinsert(tbRate, BINGO_AWARD_RATE[nRow])
			else
				tinsert(tbRate, {nRate, nRate, nRate})
			end			
		end
		tinsert(tbRate, {nRate, nRate}) -- ����
	end
	return tbRate
end

function BingoMachine:CalcResult(nType, nLevel)	

	if nType < 0 or nType > getn(AWARD_TYPE) then
		return
	end
	
	local tbRate = self:GetCurRate(nType, nLevel)
	if not tbRate then
		WriteLog("BingoMachine:CalcResult is nil")
		return
	end
	
	local rcur = random(1, BINGO_MAX_RATE);
	local rstep = 0;
	for i = 1, getn(tbRate) do
		local tbItemRate = tbRate[i]
		for j = 1, getn(tbItemRate) do
			rstep = rstep + tbItemRate[j];
			if(rcur <= rstep) then
				return i, j
			end
		end
	end
	WriteLog("BingoMachine:CalcResult is  rcur = " .. rcur .. " rstep = " .. rstep)
end

function BingoMachine:ProcProtocol(szName, nOpertion, nParam)
	-- do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return
	end
	if nOpertion == C2S_OPERATION_ROTATE then
		CallPlayerFunction(nPlayerIndex, self.OnRotate, self, nParam)
	elseif nOpertion == C2S_OPERATION_AWARD then
		CallPlayerFunction(nPlayerIndex, self.OnGetAward, self, nParam)
	elseif nOpertion == C2S_OPERATION_OPEN then
		CallPlayerFunction(nPlayerIndex, OpenBingoMachine)
	elseif nOpertion == C2S_OPERATION_SHOP then
		CallPlayerFunction(nPlayerIndex, OpenBingoShop)
	end
end

function BingoMachine:OnRotate(nOdds)
	-- 	do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end

	local nLeftTime = Gambler:GetTime() - GetCurServerTime()
	if nLeftTime > 0 then
		return
	end
	
	if ODDS2COIN[nOdds] == nil then
		self:SendResult(ROTATE_ERROR_STATUS, nCount, 0, 0)
	end
	
	local nCount = CalcEquiproomItemCount(6,1,2312,1)
	if Gambler:GetState() ~= STATE_NORMAL then
		self:SendResult(ROTATE_ERROR_STATUS, nCount, 0, 0)
		return
	end

	if nOdds > 0 and ODDS2COIN[nOdds][2] ~= nil then
		local strLogs = "" .. GetAccount().."\t"..GetName().."\tBingoMachine\tDeduct_refining_count\t" .. ODDS2COIN[nOdds][2]			
		WriteLog(strLogs)
	end
	
	local bFirstTime = Gambler:IsFirstTime()
	if bFirstTime == 1 then
		local nCoin = ODDS2COIN[nOdds][2] * INPOOLPENCENT

		if nCount < ODDS2COIN[nOdds][2] or Gambler:PayCoin(ODDS2COIN[nOdds][2]) ~= 1 then -- �۳���Ԫ��¶
			self:SendResult(ROTATE_ERROR_PRINING, nCount, 0, 0)
			return 
		else
			self:Add2PrizePool(nCoin)
		end
		Gambler:SetOdds(nOdds)
	end
	BingoMachine:GetCoin(GetName())
		
	local nFinalType, nFinalLevel = Gambler:GetFinalAward()
	local nNewType, nNewLevel = self:CalcResult(nFinalType, nFinalLevel)
	if not nNewType or not nNewLevel then
		local strLogs = "" .. GetAccount().."\t"..GetName().."\tBingoMachine\CalcResult\t failed"			
		WriteLog(strLogs)
		return 
	end
	
	nFinalType, nFinalLevel = Gambler:UpdateAward(nNewType, nNewLevel)
	
	if nFinalType == KING_TYPE then
		Gambler:SetState(STATE_AWARD)
	elseif nFinalLevel == OVERFLOW_LEVEL then
		Gambler:SetState(STATE_AWARD)
	elseif nFinalLevel > OVERFLOW_LEVEL then
		Gambler:SetState(STATE_WAIT)
	else
		Gambler:SetState(STATE_NORMAL)
	end

	if nFinalLevel > OVERFLOW_LEVEL  then
		self:ApplyBigAward(GetName())
	else
		nCount = CalcEquiproomItemCount(6,1,2312,1)
		self:SendResult(ROTATE_SUCCESS, nCount, nNewType, nNewLevel)		
	end
	Gambler:SetTime(GetCurServerTime() + 6)
end

function BingoMachine:ApplyBigAward(szName)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szName)
	RemoteExecute("\\script\\event\\bingo_machine\\prize_pool.lua", 
		"PrizePool:GetBigAward", handle, "BingoMachine:RecvBigAward")
	OB_Release(handle)
end

function BingoMachine:RecvBigAward(nParam, nResultHandle)
	local szName = ObjBuffer:PopObject(nResultHandle)
	local nCoin = ObjBuffer:PopObject(nResultHandle)
	local nTotalCoin = ObjBuffer:PopObject(nResultHandle)
	if type(szName) ~= "string" or type(nCoin) ~= "number" then
		local strLogs = "" .. GetAccount().."\t"..GetName().."\tBingoMachine\RecvBigAward\t type error"			
		WriteLog(strLogs)
		return 
	end	
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		
		CallPlayerFunction(nPlayerIndex, Gambler.SetBigAward, Gambler, nCoin)
		local strLogs = GetAccount().."\t"..GetName().."\tBingoMachine\tBitAward\t".. nCoin .. "\t" .. nTotalCoin
		WriteLog(strLogs)
		local nType, nLevel = CallPlayerFunction(nPlayerIndex, Gambler.GetResult, Gambler)
		local nCount = CalcEquiproomItemCount(6,1,2312,1)
		self:SendResult(ROTATE_SUCCESS, nCount, nType, nLevel)
		Gambler:SetState(STATE_AWARD)
	else
		WriteLog(format("[bingo_machine] %s offline and Award Coin %d", szName, nCoin))
	end
end

function BingoMachine:GetCoin(szName)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szName)
	RemoteExecute("\\script\\event\\bingo_machine\\prize_pool.lua", 
		"PrizePool:GetCoin", handle, "BingoMachine:SendCoin")
	OB_Release(handle)
end

function BingoMachine:SendCoin(nParam, nResultHandle)
	local szName = ObjBuffer:PopObject(nResultHandle)
	local nCoin = ObjBuffer:PopObject(nResultHandle)
	if type(szName) ~= "string" or type(nCoin) ~= "number" then
		return 
	end	

	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		local nBigAward = CallPlayerFunction(nPlayerIndex, Gambler.GetBigAward, Gambler)
		local handle = OB_Create()
		
		ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nCoin)
		ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nBigAward)
		ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BINGO_COIN", handle)
		OB_Release(handle)
	end
end

function BingoMachine:SendResult(nResult, nRefiningCount, nNewType, nNewLevel)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nResult)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nRefiningCount)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nNewType)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nNewLevel)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BINGO_MACHINE", handle)
	OB_Release(handle)
end

function BingoMachine:OnGetAward(nSelType)
	local nState = Gambler:GetState()
	if nState == STATE_ROTATE then
		self:SendGetAwardResult(S2C_GET_AWARD_ERR_OTHER, 0)
		return
	end
	local nFinalType, nFinalLevel = Gambler:GetFinalAward()
	if not AWARD_TYPE[nFinalType] then
		self:SendGetAwardResult(S2C_GET_AWARD_ERR_OTHER, 0)
		return
	end
	
	if nFinalLevel > 6 then
		nFinalLevel = 6
	end
	
	if nFinalType == 5 and nSelType ~= 1 then
		return
	end
	
	local nOdds = Gambler:GetOdds()
	local nCoin = Gambler:GetBigAward()
	local strAwardDesc = ""
	local strAward = ""
	if nSelType == 1 then -- ��Ӧ�ȼ��Ľ���
		-- �����ռ���
		local nWidth = tbBingoMachineAwardSpace[nFinalType].nWidth
		local nHeight = tbBingoMachineAwardSpace[nFinalType].nHeight
		local nCount = tbBingoMachineAward[nFinalType][1][nFinalLevel].nCount * ODDS2COIN[nOdds][1]
			
		if nWidth > 0 and nHeight > 0  then
			local nFreeItemCellLimit = tbBingoMachineAwardSpace[nFinalType].nFreeItemCellLimit * nCount

			if CountFreeRoomByWH(nWidth, nHeight) < nFreeItemCellLimit then
				-- ���ر����ռ䲻��
				self:SendGetAwardResult(S2C_GET_AWARD_ERR_NO_SPACE, 0)
				return
			end
		end
	
	  local tbAward = {tbProp=tbBingoMachineAward[nFinalType][1][nFinalLevel].tbProp}
	  --set award expired time if necessary - Modified By DinhHQ - 20120419
	  if tbBingoMachineAward[nFinalType][1][nFinalLevel].nExpiredTime then
	  	tbAward.nExpiredTime = tbBingoMachineAward[nFinalType][1][nFinalLevel].nExpiredTime
	  end
		PlayerFunLib:GetItem(tbAward,nCount,"","")
		strAwardDesc = nCount .. "c�i" .. tbBingoMachineAward[nFinalType][1][nFinalLevel].szName
		strAward = "Equip\t" .. nCount .. "x" .. tbBingoMachineAward[nFinalType][1][nFinalLevel].szName
	  if nFinalType == 5 then -- ����
			local _,nTongID = GetTongName()
			if (nTongID ~= 0)then
				Msg2Tong(nTongID, format("Th�nh vi�n bang h�i %s Phong V�n B�o �i�n nh�n ���c m�t b�o r��ng ��ng ��y b�o v�t!", GetName()))
			end			
		end
	else  -- ��Ԫ��¶
		local nCount = tbBingoMachineAward[nFinalType][2][nFinalLevel] * ODDS2COIN[nOdds][1]
		local nFreeItemCellLimit = ceil(nCount / 200)
		if nCoin > 0 then
			nFreeItemCellLimit = nFreeItemCellLimit + 1
		end
		if CountFreeRoomByWH(1, 1) < nFreeItemCellLimit then
			-- ���ر����ռ䲻��
			self:SendGetAwardResult(S2C_GET_AWARD_ERR_NO_SPACE, 0)
			return
		end
		local tbAward = {szName = "H�n Nguy�n Linh L�", tbProp = {6,1,2312,1,0,0}}
		PlayerFunLib:GetItem(tbAward, nCount, "", "")
		strAwardDesc = nCount .. "H�n Nguy�n Linh L�"
		strAward = "Refining\t" .. nCount
	end

	local strLogs = GetAccount().."\t"..GetName().."\tBingoMachine\tGetAward\t".. strAward
	WriteLog(strLogs)
	
	if nCoin > 0 then
		local nItemIndex = AddItem(6,1,3060,1,0,0);	
		SetSpecItemParam(nItemIndex, 1, nCoin)
		SyncItem(nItemIndex)	
		Say(format("Ng��i nh�n ���c 1 L� Bao ch�a %d H�n Nguy�n Linh L�!", nCoin), 0);			
		AddGlobalNews(format("Ng��i ch�i:  <color=green>%s<color> nh�n ���c %d H�n Nguy�n Linh L� trong Th�i Kim Tr� c�a Phong V�n B�o �i�n !!!", GetName(), nCoin))
		Msg2SubWorld(format("Ng��i ch�i:  <color=green>%s<color> nh�n ���c %d H�n Nguy�n Linh L� trong Th�i Kim Tr� c�a Phong V�n B�o �i�n !!!", GetName(), nCoin))
	end
	Gambler:SetBigAward(0)
	Gambler:SetState(STATE_NORMAL)
	Gambler:SetFinalAward(0, 0)
	local nCount = CalcEquiproomItemCount(6,1,2312,1)
	self:SendGetAwardResult(S2C_GET_AWARD_SUCCESS, nCount)
end

function BingoMachine:SendGetAwardResult(nResult, nRefiningCount)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nResult)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nRefiningCount)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BINGO_GET_AWARD_RESULT", handle)
	OB_Release(handle)
end
function BingoMachine:Add2PrizePool(nCoin)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nCoin)
	RemoteExecute("\\script\\event\\bingo_machine\\prize_pool.lua", 
		"PrizePool:AddCoin", handle)
	OB_Release(handle)
end

function OpenBingoShop()
	-- 		do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end
	CreateStores()
	AddShop2Stores(176, "Ti�m Long L�nh K�", 17, 100, "")
	AddShop2Stores(177, "Ti�m L�n L�nh K�", 18, 100, "")
	AddShop2Stores(179, "Ti�m Quy L�nh K�", 19, 100, "")
	AddShop2Stores(180, "Ti�m Ph�ng L�nh K�", 20, 100, "")
	AddShop2Stores(181, "Ti�m Ng� H�nh Th�ch", 21, 100, "")
	OpenStores()
end

function OpenBingoMachine()
	local nLeftTime = Gambler:GetTime() - GetCurServerTime()
	if nLeftTime < 0 then
		nLeftTime = 0
	end
	local nCount = CalcEquiproomItemCount(6,1,2312,1)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, Gambler:GetState())
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, Gambler:GetOdds())
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, Gambler:GetAword())
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, Gambler:GetCurAword())
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nLeftTime)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nCount)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_BINGO_OPENWINDOW", handle)
	OB_Release(handle)
end

pEventType:Reg("L� Quan", "Phong V�n B�o �i�n", OpenBingoMachine, {})

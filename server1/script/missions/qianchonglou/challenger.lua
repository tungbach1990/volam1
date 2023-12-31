Include("\\script\\missions\\qianchonglou\\common.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local DEFAULT_GAME_TIME = 60*60*2   -- 副本游戏时间
local DEFAULT_BASE_POINT = 200      -- 初始的基础分
local DEFAULT_AWARD_POINT_MAX = 800 -- 初始的奖励分上限
local DEFAULT_AWARD_POINT_ADD = 200 -- 使用一个弩炮令符增加的奖励分上限值

-- 单个玩家

-- 获取弩炮令牌的使用数量
function tbPlayerHandle:GetDailyLimit()
	return GetTask(%TSK_DAILY_LIMIT)
end

-- 设置弩炮令牌的使用数量
function tbPlayerHandle:SetDailyLimit(nCount)
	SetTask(%TSK_DAILY_LIMIT, nCount)
end

-- 增加弩炮令牌的使用数量
function tbPlayerHandle:AddDailyLimit(nCount)
	self:SetDailyLimit(self:GetDailyLimit() + nCount)
end

-- 获取奖励分上限
function tbPlayerHandle:GetAwardPointMax()
	-- 每使用一个弩炮令牌，奖励分上限增加200
	return tonumber(self:GetDailyLimit()) * %DEFAULT_AWARD_POINT_ADD + %DEFAULT_AWARD_POINT_MAX
end

-- 检查游戏日期
function tbPlayerHandle:CheckDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	return GetTask(%TSK_DATE) == nCurDate
		
end

-- 更新函数：到了第二天，任务变量恢复默认值
function tbPlayerHandle:Update()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if GetTask(%TSK_DATE) ~= nCurDate then
		SetTask(%TSK_DATE, nCurDate)
		self:SetBasePoint(%DEFAULT_BASE_POINT)
		self:SetPlayTime(%DEFAULT_GAME_TIME)
		self:SetDailyLimit(0)
		self:SetAwardPoint(0)
		self:SetAwardPointExchange(0)
	end
end

-- 设置基础分
function tbPlayerHandle:SetBasePoint(nPoint)
	return SetTask(%TSK_BASE_POINT, nPoint)
end

-- 增加基础分
function tbPlayerHandle:AddBasePoint(nPoint)
	self:SetBasePoint(self:GetBasePoint() + nPoint)
end

-- 设置奖励分
function tbPlayerHandle:SetAwardPoint(nPoint)
	return SetTask(%TSK_AWARD_POINT, nPoint)
end

-- 增加奖励分
function tbPlayerHandle:AddAwardPoint(nPoint)
	self:SetAwardPoint(self:GetAwardPoint() + nPoint)
end

-- 设置奖励分的兑换值
function tbPlayerHandle:SetAwardPointExchange(nPoint)
	SetTask(%TSK_AWARD_POINT_EXCHANGE, nPoint)
end

-- 增加奖励分的兑换值
function tbPlayerHandle:AddAwardPointExchange(nPoint)
	self:SetAwardPointExchange(self:GetAwardPointExchange() + nPoint)
end

-- 设置副本时间
function tbPlayerHandle:SetPlayTime(nTime)
	return SetTask(%TSK_PLAY_TIME, nTime)
end

-- 射击
function tbPlayerHandle:UseGun(nGunRank, nX,  nY)
	if nGunRank > 0 then
		local nLeftBasePoint = self:GetBasePoint() - nGunRank
		
		if nLeftBasePoint < 0 then
			local nLeftAwardPoint = self:GetAwardPoint() + nLeftBasePoint
			if nLeftAwardPoint < 0 then
				return Msg2Player("S� 甶觤 kh玭g ")
			else
				self:SetBasePoint(0)
				self:SetAwardPoint(nLeftAwardPoint)
			end
		else
			self:AddBasePoint(-nGunRank)
		end
		
		CastSkill(1202, nGunRank, nX,  nY)
	end
end

-- 打开副本的提示面板
function tbPlayerHandle:OpenFisherUi(nEndTime)
	if not nEndTime then
		return
	end
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, self.OPERATION_OPEN_UI)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nEndTime)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_QIANCHONGLOU", nHandle)
	OB_Release(nHandle)
end

-- 关闭副本的提示面板
function tbPlayerHandle:CloseFisherUi()
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, self.OPERATION_CLOSE_UI)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 0)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_QIANCHONGLOU", nHandle)
	OB_Release(nHandle)
end

-- 设置额外的大炮
function tbPlayerHandle:SetExtraGun()
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, self.OPERATION_EXTRA_GUN)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 1)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_QIANCHONGLOU", nHandle)
	OB_Release(nHandle)
end

-- 副本中的消息响应：退出、设计
function tbPlayerHandle:ProcessProtocol(nOption, tbParam)
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		self:CloseFisherUi()
		return 
	end
	if self.OPERATION_QUIT == nOption then
		pDungeon:close()
	elseif self.OPERATION_USE_GUN == nOption then
		local nGunRank, nX,  nY = unpack(tbParam)
		pDungeon:UseGun(nGunRank, nX,  nY)
	end
end

-- 挑战者：存储副本中所有的玩家
tbChallenger = {}
-- 增加新的挑战者
function tbChallenger:new()
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb.szName = GetName()
	local nMapId, nX, nY = GetWorldPos()
	tb.tbLastPos = {nMapId, nX, nY}
	tb.nExtraPower = 0
	
	return tb
end

-- 更新当前玩家
function tbChallenger:Update()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.Update, %tbPlayerHandle)
	end
end

-- 添加奖励分
function tbChallenger:AddAwardPoint(nPoint)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.AddAwardPoint, %tbPlayerHandle, nPoint)
	end
end

-- 进入地图，设置玩家状态
function tbChallenger:OnEnterMap()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, SetFightState, 1)
		CallPlayerFunction(nPlayerIndex, SetMoveSpeed, 0)
		CallPlayerFunction(nPlayerIndex, ForbitSkill, 1)
		
		CallPlayerFunction(nPlayerIndex, DisabledStall, 1)
		CallPlayerFunction(nPlayerIndex, LeaveTeam)
		CallPlayerFunction(nPlayerIndex, DisabledUseTownP, 1)
		CallPlayerFunction(nPlayerIndex, ForbitAura, 1)
		
		CallPlayerFunction(nPlayerIndex, ChangeOwnFeature, 0,0, 1906)
	end
end

-- 离开地图，设置玩家状态
function tbChallenger:OnLeaveMap()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, SetMoveSpeed, -1)
		CallPlayerFunction(nPlayerIndex, SetFightState, 0)
		CallPlayerFunction(nPlayerIndex, ForbitSkill, 0)
		
		CallPlayerFunction(nPlayerIndex, DisabledStall, 0)
		CallPlayerFunction(nPlayerIndex, LeaveTeam)
		CallPlayerFunction(nPlayerIndex, DisabledUseTownP, 0)
		CallPlayerFunction(nPlayerIndex, ForbitAura, 0)	
		CallPlayerFunction(nPlayerIndex, RestoreOwnFeature)	
	end
end

-- 获取玩家时间
function tbChallenger:GetPlayTime()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		return CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.GetPlayTime, %tbPlayerHandle)
	end
end

-- 设置玩家时间
function tbChallenger:SetPlayTime(nTime)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		return CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.SetPlayTime, %tbPlayerHandle, nTime)
	end
end

-- 退出副本时，回到原来位置
function tbChallenger:GoToLastPos()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, NewWorld, self.tbLastPos[1], self.tbLastPos[2], self.tbLastPos[3])
	end
end

-- 设置特殊大炮
function tbChallenger:SetExtraGun()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.SetExtraGun, %tbPlayerHandle)
	end
end

-- 使用普通的炮射击
function tbChallenger:UseGun(nGunRank, nX,  nY)
	
	
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.UseGun, %tbPlayerHandle, nGunRank, nX,  nY)
	end
end

-- 使用特殊的大炮射击
function tbChallenger:UseExtraGun(nX,  nY)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, CastSkill, 1203, 1, nX,  nY)
	end
end

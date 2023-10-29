Include("\\script\\missions\\qianchonglou\\common.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local DEFAULT_GAME_TIME = 60*60*2   -- ������Ϸʱ��
local DEFAULT_BASE_POINT = 200      -- ��ʼ�Ļ�����
local DEFAULT_AWARD_POINT_MAX = 800 -- ��ʼ�Ľ���������
local DEFAULT_AWARD_POINT_ADD = 200 -- ʹ��һ������������ӵĽ���������ֵ

-- �������

-- ��ȡ�������Ƶ�ʹ������
function tbPlayerHandle:GetDailyLimit()
	return GetTask(%TSK_DAILY_LIMIT)
end

-- �����������Ƶ�ʹ������
function tbPlayerHandle:SetDailyLimit(nCount)
	SetTask(%TSK_DAILY_LIMIT, nCount)
end

-- �����������Ƶ�ʹ������
function tbPlayerHandle:AddDailyLimit(nCount)
	self:SetDailyLimit(self:GetDailyLimit() + nCount)
end

-- ��ȡ����������
function tbPlayerHandle:GetAwardPointMax()
	-- ÿʹ��һ���������ƣ���������������200
	return tonumber(self:GetDailyLimit()) * %DEFAULT_AWARD_POINT_ADD + %DEFAULT_AWARD_POINT_MAX
end

-- �����Ϸ����
function tbPlayerHandle:CheckDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	return GetTask(%TSK_DATE) == nCurDate
		
end

-- ���º��������˵ڶ��죬��������ָ�Ĭ��ֵ
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

-- ���û�����
function tbPlayerHandle:SetBasePoint(nPoint)
	return SetTask(%TSK_BASE_POINT, nPoint)
end

-- ���ӻ�����
function tbPlayerHandle:AddBasePoint(nPoint)
	self:SetBasePoint(self:GetBasePoint() + nPoint)
end

-- ���ý�����
function tbPlayerHandle:SetAwardPoint(nPoint)
	return SetTask(%TSK_AWARD_POINT, nPoint)
end

-- ���ӽ�����
function tbPlayerHandle:AddAwardPoint(nPoint)
	self:SetAwardPoint(self:GetAwardPoint() + nPoint)
end

-- ���ý����ֵĶһ�ֵ
function tbPlayerHandle:SetAwardPointExchange(nPoint)
	SetTask(%TSK_AWARD_POINT_EXCHANGE, nPoint)
end

-- ���ӽ����ֵĶһ�ֵ
function tbPlayerHandle:AddAwardPointExchange(nPoint)
	self:SetAwardPointExchange(self:GetAwardPointExchange() + nPoint)
end

-- ���ø���ʱ��
function tbPlayerHandle:SetPlayTime(nTime)
	return SetTask(%TSK_PLAY_TIME, nTime)
end

-- ���
function tbPlayerHandle:UseGun(nGunRank, nX,  nY)
	if nGunRank > 0 then
		local nLeftBasePoint = self:GetBasePoint() - nGunRank
		
		if nLeftBasePoint < 0 then
			local nLeftAwardPoint = self:GetAwardPoint() + nLeftBasePoint
			if nLeftAwardPoint < 0 then
				return Msg2Player("S� �i�m kh�ng ��")
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

-- �򿪸�������ʾ���
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

-- �رո�������ʾ���
function tbPlayerHandle:CloseFisherUi()
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, self.OPERATION_CLOSE_UI)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 0)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_QIANCHONGLOU", nHandle)
	OB_Release(nHandle)
end

-- ���ö���Ĵ���
function tbPlayerHandle:SetExtraGun()
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, self.OPERATION_EXTRA_GUN)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, 1)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_QIANCHONGLOU", nHandle)
	OB_Release(nHandle)
end

-- �����е���Ϣ��Ӧ���˳������
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

-- ��ս�ߣ��洢���������е����
tbChallenger = {}
-- �����µ���ս��
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

-- ���µ�ǰ���
function tbChallenger:Update()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.Update, %tbPlayerHandle)
	end
end

-- ��ӽ�����
function tbChallenger:AddAwardPoint(nPoint)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.AddAwardPoint, %tbPlayerHandle, nPoint)
	end
end

-- �����ͼ���������״̬
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

-- �뿪��ͼ���������״̬
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

-- ��ȡ���ʱ��
function tbChallenger:GetPlayTime()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		return CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.GetPlayTime, %tbPlayerHandle)
	end
end

-- �������ʱ��
function tbChallenger:SetPlayTime(nTime)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		return CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.SetPlayTime, %tbPlayerHandle, nTime)
	end
end

-- �˳�����ʱ���ص�ԭ��λ��
function tbChallenger:GoToLastPos()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, NewWorld, self.tbLastPos[1], self.tbLastPos[2], self.tbLastPos[3])
	end
end

-- �����������
function tbChallenger:SetExtraGun()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.SetExtraGun, %tbPlayerHandle)
	end
end

-- ʹ����ͨ�������
function tbChallenger:UseGun(nGunRank, nX,  nY)
	
	
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %tbPlayerHandle.UseGun, %tbPlayerHandle, nGunRank, nX,  nY)
	end
end

-- ʹ������Ĵ������
function tbChallenger:UseExtraGun(nX,  nY)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, CastSkill, 1203, 1, nX,  nY)
	end
end

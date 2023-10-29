-- ���Ϸ��ų���19����ɢ��ѩ���飬Ҫ���ռ�10��ѩ���飬�������һ�����ѩ����꣬���ѩ�������߲����ٻ���BOSS���������BOSS���ء�
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\global\\playerlist.lua")
IL("ITEM")

pTask = Task:New(3)
pTask.m_NpcId 		= 1697	-- ѩ����
pTask.m_BarEvent 	= GetProgressBarMaskEvent()
pTask.m_ItemTimeout = 30

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_bead = self:GetPosition().t3_bead
	self.m_BossIndex = 0
	self.m_Timers = {}
	self.m_Pearls = {}
	for i = 1, 19 do
		local tb = {}
		tb.NpcIndex = DlgNpcManager:AddNpc("Tuy�t Linh Ch�u", self.m_NpcId, mapid, pos_bead[i].x, pos_bead[i].y, self, tb)
		tb.Bars = {}
		tb.Index = i
		tinsert(self.m_Pearls, tb)
	end
end

function pTask:OnDestroy()
	if (self.m_Pearls) then
		for i = 1, getn(self.m_Pearls) do
			local tb = self.m_Pearls[i]
			if (tb.NpcIndex > 0) then
				DlgNpcManager:DelNpc(tb.NpcIndex)
			end
			for j = 1, getn(tb.Bars) do
				if (tb.Bars[j] > 0) then
					ProgressBarList:Close(tb.Bars[j])
				end
			end
		end
		self.m_Pearls = nil
	end
	if (self.m_BossIndex > 0) then
		FightNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	if (self.m_Timers) then
		for nId, _ in self.m_Timers do
			TimerList:DelTimer(nId)
		end
		self.m_Timers = nil
	end
end

-- �˺�������Ʒʹ�ýű�����
function pTask:CallBoss(player)
	if (self.m_BossIndex > 0) then
		player:Say("�� tri�u h�i ra L�nh B�ng.")
		return 0
	end
	local pos = self:GetPosition().t3_boss
	self.m_BossIndex = FightNpcManager:AddNpc("L�nh B�ng", 1642, self:GetMapId(), pos.x, pos.y, self, 0, 1, 1)
	if (self.m_BossIndex > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(self.m_BossIndex)
		SyncNpc(nNpcIndex)
		NpcChat(nNpcIndex, "Ai d�m ��nh c�p b�o b�i c�a ta?")
		return 1
	else
		return 0
	end
end

function pTask:OnDeath()
	self.m_BossIndex = 0
	self:Proceed()
end

function pTask:Say(pPlayer, tb)
	if (tb.NpcIndex <= 0) then
		return
	end
	local nBarId = ProgressBarList:Open("H�i ���c r�i", pPlayer, 3, self, tb)
	tinsert(tb.Bars, nBarId)
end

function pTask:OnTime(tb, nId)
	local pos = self:GetPosition().t3_bead[tb.Index]
	tb.NpcIndex = DlgNpcManager:AddNpc("Tuy�t Linh Ch�u", self.m_NpcId, self:GetMapId(), pos.x, pos.y, self, tb)
	self.m_Timers[nId] = nil
end

function pTask:OnProgressbarTimeout(nId, tb, player)
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
	if (tb.NpcIndex > 0) then
		local nId = TimerList:AddTimer(self, 180, tb)
		self.m_Timers[nId] = 1
		DlgNpcManager:DelNpc(tb.NpcIndex)
		tb.NpcIndex = 0
		-- ����ѩ������߲����ó�ʱʱ��
		local nItemIndex = player:AddItem(6, 1, 2634, 1, 0, 0)
		if (nItemIndex > 0) then
			ITEM_SetExpiredTime(nItemIndex, self.m_ItemTimeout)
			player:SyncItem(nItemIndex)
			player:Say("Ng��i thu th�p ���c 1 Tuy�t Linh Ch�u.")
			self:BroadCast(format("%s thu th�p ���c 1 Tuy�t Linh Ch�u", player:GetName()))
		else
			self:LogError("TASK3: failed to add pearl item")
		end
	end
end

function pTask:OnProgressbarBreak(nId, tb)
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
end

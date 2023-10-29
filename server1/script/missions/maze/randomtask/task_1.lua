-- 1.	4�����������1������
-- ��Ҫ4����ͬʱ����4������������ϣ�������ϣ���ʱ���ܳ���1�룬�Ż����BOSS����.������Ҫ����3�롣
-- ÿ����ʧ��һ�ξͻ�ˢ��4���ܴ�Ͽ�����С������������ֱ���ɹ����ܳ���BOSS������BOSS�͹��ء�

Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
IL("NPCINFO")

pTask = Task:New(1)
pTask.m_TreeCount 	= 4
pTask.m_Timeout		= 1
pTask.m_BarEvent 	= GetProgressBarMaskEvent()

function pTask:OnStart()
	local tbPos = self:GetPosition()
	self.m_Trees = {}
	self.m_Monsters = {}
	self.m_BossIndex = 0
	for i = 1, self.m_TreeCount do
		local nNpcIndex = DlgNpcManager:AddNpc("C�y", 1694, self:GetMapId(), tbPos.t1_tree[i].x, tbPos.t1_tree[i].y, self, i)
		local tb = {}
		tb.NpcIndex = nNpcIndex
		tb.Timeout = 0
		tb.BarId = 0
		tinsert(self.m_Trees, tb)
	end
end

function pTask:OnClose()
end

function pTask:OnDestroy()
	-- ɾ����
	if (self.m_Trees) then
		for i = 1, getn(self.m_Trees) do
			local tree = self.m_Trees[i]
			DlgNpcManager:DelNpc(tree.NpcIndex)
			if (tree.BarId > 0) then
				ProgressBarList:Close(tree.BarId)
				tree.BarId = 0
			end
		end
		self.m_Trees = nil
	end
	-- ɾ��boss
	if (self.m_BossIndex > 0) then
		FightNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	-- ɾ����������
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			local nIndex = self.m_Monsters[i]
			if (nIndex > 0) then
				FightNpcManager:DelNpc(nIndex)
			end
		end
		self.m_Monsters = nil
	end
end

function pTask:Say(player, nIndex)
	if (self.m_BossIndex > 0) then
		player:Say("C� quan �� ���c m�, kh�ng c�n ph�i m� l�i")
		return
	end
	local tb = self.m_Trees[nIndex]
	if (tb.BarId > 0) then
		player:Say("C� quan �ang ���c m�, kh�ng c�n ph�i m� l�i")
		return
	end
	tb.BarId = ProgressBarList:Open("�ang ��n c�y", player, 3, self, tb)
end

function pTask:OnProgressbarBreak(nId, tb, player)
	tb.BarId = 0
	self:AddMonsters()
end

function pTask:OnProgressbarTimeout(nId, tb, player)
	tb.BarId = 0
	tb.Timeout = GetCurServerTime()
	
	local nLeftCount = 0	-- ��û��������������
	local timeout = 0
	for i = 1, self.m_TreeCount do
		local tree = self.m_Trees[i]
		if (tree.Timeout == 0) then
			nLeftCount = nLeftCount + 1
		elseif (timeout == 0) then
			timeout = tree.Timeout
		elseif (abs(tree.Timeout - timeout) > self.m_Timeout) then
			self:AddMonsters()
			return 0
		end
	end
	if (nLeftCount == 0) then
		self:BroadCast("M� th�nh c�ng.")
		self:AddBoss()
	end
	return 0
end

function pTask:AddMonsters()
	self:BroadCast("M� th�t b�i.")
	local pos = self:GetPosition().t1_tree
	for i = 1, self.m_TreeCount do
		local param = getn(self.m_Monsters) + 1
		local nNpcIndex = FightNpcManager:AddNpc("Ng�c Long Th� V�", 1695, self:GetMapId(), pos[i].x, pos[i].y, self, param, 1, 1)
		tinsert(self.m_Monsters, nNpcIndex)
		self.m_Trees[i].Timeout = 0
	end
end

function pTask:AddBoss()
	local tbPos = self:GetPosition()
	-- ����BOSS����
	self.m_BossIndex = FightNpcManager:AddNpc("Tr�n Ti�u", 1696, self:GetMapId(), tbPos.t1_boss.x, tbPos.t1_boss.y, self, 0, 1, 1)
end

function pTask:OnDeath(nKilledIndex, pPlayerKiller, nIndex)
	if (nIndex == 0) then
		self.m_BossIndex = 0
		self:Proceed()
	else
		self.m_Monsters[nIndex] = 0
	end
end

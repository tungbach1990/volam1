-- ����һ��BOSS�����ף����3����������Ӳ�ͣ���ͷ����̻�ǽ���ܣ�
-- ���վ�Ų������ܴܺ��˺���Ҫ�����ƶ���ܻ�ǽ�ſ��Ա����˺�������BOSS����ء�
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(20)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_boss = self:GetPosition().t20_boss
	local pos_pillar = self:GetPosition().t20_pillar
	self.m_BossIndex = FightNpcManager:AddNpc("Ho�c Vi�m Vi�m", 1722, mapid, pos_boss.x, pos_boss.y, self, 0, 1, 1)
	local nNpcIndex = FightNpcManager:GetNpcIndex(self.m_BossIndex)
	SyncNpc(nNpcIndex)
	NpcChat(nNpcIndex, "Ta ��t! ta ��t! ta ��t n�y! ��t ��t ��t")
	self.m_Pillars = {}
	for i = 1, 3 do
		local nNpcIndex = FightNpcManager:AddNpc("Tr� T�", 1723, mapid, pos_pillar[i].x, pos_pillar[i].y, self, i, 1, 1)
		tinsert(self.m_Pillars, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_BossIndex > 0) then
		FightNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	if (self.m_Pillars) then
		for i = 1, getn(self.m_Pillars) do
			if (self.m_Pillars[i] > 0) then
				FightNpcManager:DelNpc(self.m_Pillars[i])
			end
		end
		self.m_Pillars = nil
	end
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	if (nIndex == 0) then
		self.m_BossIndex = 0
		self:Proceed()
	else
		self.m_Pillars[nIndex] = 0
	end
end

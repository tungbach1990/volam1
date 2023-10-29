-- �и��뺷��NPC·����·��Ҫ����Ҫ����50����������������ٻ���·�����£�Ҫ����NPC��30��С�ֲ��ܹ��ء�
-- �������Ǯ�򻹻�Ҫ���Ͻ�ĳ�������Ʒ���ν�گ�顢�廨��¶�衢��ɽ��¶������3-8����3��ˮ��������1��װ������������أ����������ս��NPC��ɱ�����ܹ��ء�
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(9)
pTask.m_BossId = 1701
pTask.m_MonsterId = 1702
pTask.m_Items = {
	"T�ng Kim Chi�u Th� ",
	"Ng� Hoa Ng�c L� Ho�n",
	"Thi�n s�n  B�o L� ",
	"Huy�n Tinh c�p 3-8",
	"M�t trong 3 lo�i Th�y Tinh",
	"Trang b� c�p 1"
}

function pTask:OnStart()
	local pos_boss = self:GetPosition().t9_boss
	local nIndex = DlgNpcManager:AddNpc("L� B�u", m_BossId, task:GetMapId(), pos_boss.x, pos_boss.y, self)
	if (nNpcIndex <= 0) then
		self:LogError("TASK9: failed to create dialog npc")
		return
	end
	local nNpcIndex = DlgNpcManager:GetNpcIndex(nIndex)
	SetNpcKind(nNpcIndex, 3)
	SyncNpc(nNpcIndex)
	self.m_DlgBossIndex = nIndex
	self.m_FightBossIndex = 0
	self.m_Step = 1
	self.m_Want = 0
end

function pTask:OnDestroy()
	if (self.m_DlgBossIndex > 0) then
		DlgNpcManager:DelNpc(self.m_DlgBossIndex)
		self.m_DlgBossIndex = 0
	end
	if (self.m_FightBossIndex > 0) then
		FightNpcManager:DelNpc(self.m_FightBossIndex)
		self.m_FightBossIndex = 0
	end
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

function pTask:Say(player)
	if (self.m_Step == 1) then
		return "H�y giao n�p <color=red> 50 v�n <color> l��ng", {"Giao n�p", "Kh�ng giao n�p", "�� ta suy ngh� l�i ��!"}
	elseif (self.m_Step == 2) then
		return format("H�y cho ta<color=red>%s<color>.", self.m_Items[self.m_Want]), {"Cho ", "Kh�ng cho! ", "�� ta suy ngh� l�i ��!"}
	end
end

function pTask:BossChange()
	local pos_boss = self.m_Task:GetPosition().t9_boss
	DlgNpcManager:DelNpc(self.m_DlgBossIndex)
	self.m_DlgBossIndex = 0
	self.m_FightBossIndex = FightNpcManager:AddNpc("L� B�u", self.m_Task.m_BossId, self:GetMapId(), pos_boss.x, pos_boss.y, self, 0, 1, 1)
end

function pTask:OnAnswer(player, sel)
	if (self.m_Step == 1) then
		return self:OnAnswer1(player, sel)
	elseif (self.m_Step == 2) then
		return self:OnAnswer2(player, sel)
	end
end

function pTask:OnAnswer1(player, sel)
	local pos_monster = self.m_Task:GetPosition().t9_monster
	if (sel == 1) then
		if (player:Pay(500000) == 1) then
			self.m_Want = random(1, getn(self.m_Items))
			self.m_Step = 2
			return self:Say(player)
		else
			player:Say("N�y n�y, ti�n ��u?")
		end
	elseif (sel == 2) then
		self:BossChange()
		self.m_Monsters = {}
		for i = 1, 30 do
			local nNpcIndex = FightNpcManager:AddNpc("Th� H� L� B�u", self.m_Task.m_MonsterId, self:GetMapId(), pos_monster.x, pos_monster.y, self, i, 1, 1)
			tinsert(self.m_Monsters, nNpcIndex)
		end
	end
end

function pTask:OnAnswer2(player, sel)
	if (sel == 2) then
		self:BossChange()
	elseif (sel == 1) then
		local item =  self:FindItem(player)
		if (not item) then
			player:Say(format("Ng��i kh�ng c�<color=red>%s<color>.", self.m_Items[self.m_Want]))
		elseif (self:DelItem(player, item) ~= 1) then
			player:Say(format("N�y, <color=red>%s<color> c�a ng��i c� v�n ��.", self.m_Items[self.m_Want]))
		else
			self:Proceed()
		end
	end
end

function pTask:FindItem(player)
	-- TODO
end

function pTask:DeleteItem(player, item)
	-- TODO
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	if (nIndex == 0) then
		self.m_FightBossIndex = 0
	else
		self.m_Monsters[nIndex] = 0
	end
	if (self:IsAllDead() == 1) then
		self.m_Task:Finish()
	end
end

function pTask:IsAllDead()
	if (self.m_FightBossIndex > 0) then
		return 0
	end
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return 0
		end
	end
	return 1
end

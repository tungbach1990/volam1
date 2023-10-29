-- 34.	�ĸ����ӣ�ÿ��������Χ��4��С�֣�������Χ��С����������ɱ������Կ����ӣ�3��������������ӵ�������һ���֣�
-- 4�����ӵ����ּ�������һ�����Ҫ����˳�������ܹ��أ�����ͻ��г����Ѵ��BOSS����������BOSS���߰�˳�����ӹ���
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(34)

tbTASK34_IDIOM = {
	{"Ki�m ", "<<δ����>>", "<<δ����>>", "<<δ����>>"},
	{"Phong ", "V�n", "t�i ", "Kh�i"},
	{"Giang", "H�", "H�o", "ki�t "},
	{"C�n", "qu�c ", "Anh", "<<δ����>>"},
}

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_pillar = self:GetPosition().t34_pillar
	local pos_monster = self:GetPosition().t34_monster
	self.m_Pillars = {}
	self.m_Index = 1
	self.m_BossIndex = 0
	local idiom = tbTASK34_IDIOM[random(1, 4)]
	for i = 1, 4 do
		local nNpcIndex = DlgNpcManager:AddNpc(idiom[1], 1653, mapid, pos_pillar[i].x, pos_pillar[i].y, self, i)
		tinsert(self.m_Pillars, nNpcIndex)
	end
	self.m_Monsters = {}
	for i = 1, 16 do
		local nNpcIndex = FightNpcManager:AddNpc("Ng�c Long �� T�", 1654, mapid, pos_monster[i].x, pos_monster[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nNpcIndex)
	end
	self.m_BarId = 0
end

function pTask:OnDestroy()
	if (self.m_Pillars) then
		for i = 1, getn(self.m_Pillars) do
			DlgNpcManager:DelNpc(self.m_Pillars[i])
		end
		self.m_Pillars = nil
	end
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
	if (self.m_BarId > 0) then
		ProgressBarList:Close(self.m_BarId)
		self.m_BarId = 0
	end
	if (self.m_BossIndex > 0) then
		FightNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
end

function pTask:Say(player, nIndex)
	if (self.m_BarId > 0) then
		return
	end
	self.m_BarId = ProgressBarList:Open("�ang m�", player, 3, self, nIndex)
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	if (nIndex > 0) then
		self.m_Monsters[nIndex] = 0
	else
		self.m_BossIndex = 0
		self:Proceed()
	end
end

function pTask:OnProgressbarTimeout(nId, nIndex)
	self.m_BarId = 0
	if (nIndex == self.m_Index) then
		if (nIndex == 4) then
			self:Proceed()
		else
			self.m_Index = self.m_Index + 1
		end
	elseif (self.m_BossIndex == 0) then
		local mapid = self:GetMapId()
		local pos = self:GetPosition().t34_boss
		self.m_BossIndex = FightNpcManager:AddNpc("L�u Tu�n", 1655, mapid, pos.x, pos.y, self, 0, 1, 1)
	end
end

function pTask:OnProgressbarBreak(nId, nIndex)
	self.m_BarId = 0
end

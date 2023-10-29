-- 11.	�и���������Ů������������кܶ໨����ŮҪ����ҽ���1�������ӣ�����ɼ�����һ�仨��
-- ���۲����Ķ䣬�������������Ҫ�ɼ����Ͻ�3�Σ�Ȼ����������ǲ����⣬�ٻ���11��С���������������С�����������Ͻ�1�������ӹ��ء�
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\missions\\maze\\progressbar.lua")

pTask = Task:New(11)

function pTask:OnStart()
	local pos_boss = self:GetPosition().t11_boss
	local pos_flower = self:GetPosition().t13_lamp
	local mapid = self:GetMapId()
	self.m_BossIndex = DlgNpcManager:AddNpc("Ph� O�n Nhi", 1704, mapid, pos_boss.x, pos_boss.y, self, 0)
	self.m_Step = 1
	self.m_Collections = {}
	self.m_GiveCount = 0
	self.m_Monsters = {}
	self.m_Flowers = {}
	for i = 1, 10 do
		local nNpcIndex = DlgNpcManager:AddNpc("hoa", 1706, mapid, pos_flower[i].x, pos_flower[i].y, self, i)
		local tb = {}
		tb.NpcIndex = nNpcIndex
		tb.Bars = {}
		tinsert(self.m_Flowers, tb)
	end
end

function pTask:OnDestroy()
	if (self.m_BossIndex > 0) then
		DlgNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	if (self.m_Flowers) then
		for i = 1, getn(self.m_Flowers) do
			local tb = self.m_Flowers[i]
			if (tb.NpcIndex > 0) then
				DlgNpcManager:DelNpc(tb.NpcIndex)
			end
			for j = 1, getn(tb.Bars) do
				if (tb.Bars[j] > 0) then
					DelTimer(tb.Bars[j])
				end
			end
		end
		self.m_Flowers = nil
	end
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
end

function pTask:CallMonsters()
	local pos = self:GetPosition().t11_monster
	local mapid = self:GetMapId()
	for i = 1, 11 do
		local nIndex = FightNpcManager:AddNpc("Ti�u Ph� O�n Nhi", 1705, mapid, pos[i].x, pos[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nIndex)
	end
end

function pTask:OnDeath(nKilledIndex, player, nIndex)
	self.m_Monsters[nIndex] = 0
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return
		end
	end
	self:Proceed()
end

function pTask:Say(player, nIndex)
	if (nIndex == 0) then
		return self:BossSay(player)
	else
		return self:FlowerSay(player, nIndex)
	end
end

function pTask:BossSay(player)
	if (self.m_Step == 1) then
		return "Mu�n v��t �i kh�ng? V�y th� ��a ��y 500 v�n l��ng ti�n m�i l� ph� �i.", {"��a", "Kh�ng ��a", "�� ta suy ngh�"}
	elseif (self.m_Step < 5) then
		local name = player:GetName()
		local count = self.m_Collections[name]
		if (not count or count == 0) then
			player:Say("��i ng��i h�i ���c lo�i hoa m� ta c�n r�i h�y ��n t�m ta nh�.")
			return
		end
		if (self.m_Step == 2) then
			player:Say("��a hoa n�y kh�ng ���c �� cho l�m, c�c ng��i l�i h�i v�i c�i �i.")
			self.m_Collections[name] = count - 1
			self.m_Step = 3
		elseif (self.m_Step == 3) then
			player:Say("C�i n�y m� c�ng n�i l� m�u �� �? Ti�p t�c h�i �i! b�ng kh�ng ��ng c� m� m� v��t �i .")
			self.m_Collections[name] = count - 1
			self.m_Step = 4
		elseif (self.m_Step == 4) then
			player:Say("�i ta th�t l� th�t v�ng v�i c�c ng��i qu�, c�c ch� em, h�y l�i h� ra m� ��no cho ta m�t tr�n!")
			self:CallMonsters()
			self.m_Step = 5
		end
	else
		player:Say("C�c ch� em, h�y l�i h� ra m� ��no cho ta m�t tr�n!")
	end
end

function pTask:FlowerSay(player, nIndex)
	if (self.m_Step >= 2) then
		local tb = self.m_Flowers[nIndex]
		local nId = ProgressBarList:Open("H�i ���c r�i", player, 3, self, tb)
		tinsert(tb.Bars, nId)
	end
end

function pTask:OnAnswer(player, sel, nIndex)
	if (self.m_Step == 1) then
		if (sel == 1) then
			-- ������
			if (player:Pay(5000000) == 0) then
				player:Say("��i gom �� ti�n r�i ��n t�m ta nh�.")
			else
				self:Proceed()
			end
		elseif (sel == 2) then
			player:Say("Kh�ng ��a �? V�y th� gi�p ta h�i m�t ��a hoa c� m�u �� nh�t �em v� ��y.")
			self.m_Step = 2
		end
	end
end

function pTask:OnProgressbarTimeout(nId, tb, player)
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
	if (tb.NpcIndex > 0) then
		local name = player:GetName()
		player:Say("Ng��i h�i ���c m�t ��a hoa m�u ��")
		self:BroadCast(format("%s h�i ���c m�t ��a hoa m�u ��", name))
		DlgNpcManager:DelNpc(tb.NpcIndex)
		tb.NpcIndex = 0
		local count = self.m_Collections[name] or 0
		self.m_Collections[name] = count + 1
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

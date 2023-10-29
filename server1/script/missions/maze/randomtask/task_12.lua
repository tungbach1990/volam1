-- �н�ľˮ�����������5���ص�������ԣ���Ҫ����˳����������3�룩�����ٻ�������ַ�����ʮ��ͭ�ˣ�18������
-- �����һ������˳�򲻶Ծ�Ҫ���´ӽ�ʼ����������ʮ��ͭ�˺����BOSSͯ�ʣ�����BOSS����ء�
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

tbTASK12_SERIESNAME = {"Kim", "M�c", "Th�y ", "H�a", "Th� "}

pTask = Task:New(12)
pTask.m_Series = {0, 1, 2, 3, 4}	-- �ֱ�Ϊ���е�ID����ľˮ����

function pTask:OnStart()
	self.m_Joss = {}
	local joss = {
		{1707, 1},
		{1708, 2},
		{1709, 3},
		{1710, 4},
		{1711, 5}
	}
	local mapid = self:GetMapId()
	local pos_joss = self:GetPosition().t12_joss
	for i = 1, 5 do
		local nIndex = random(1, getn(joss))
		local tb = joss[nIndex]
		tremove(joss, nIndex)
		local name = format("T��ng Ph�t (%s)", tbTASK12_SERIESNAME[tb[2]])
		local nNpcIndex = DlgNpcManager:AddNpc(name, tb[1], mapid, pos_joss[i].x, pos_joss[i].y, self, i)
		local param = {}
		param.Series = self.m_Series[tb[2]]
		param.NpcIndex = nNpcIndex
		tinsert(self.m_Joss, param)
	end
	self.m_BarId = 0
	self.m_BossIndex = 0
	self.m_SeriesIndex = 1
	self.m_Monsters = {}
end

function pTask:OnDestroy()
	if (self.m_Joss) then
		for i = 1, getn(self.m_Joss) do
			DlgNpcManager:DelNpc(self.m_Joss[i].NpcIndex)
		end
		self.m_Joss = nil
	end
	if (self.m_BarId > 0) then
		ProgressBarList:Close(self.m_BarId)
		self.m_BarId = 0
	end
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
	if (self.m_BossIndex > 0) then
		FightNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
end

function pTask:Say(player, nIndex)
	if (self.m_BarId > 0) then
		player:Say("C� quan �ang ���c m�, kh�ng c�n ph�i m� l�i")
		return
	elseif (getn(self.m_Monsters) > 0) then
		player:Say("C� quan �� ���c m�, kh�ng c�n ph�i m� l�i")
		return
	end
	self.m_BarId = ProgressBarList:Open("�ang m�", player, 3, self, nIndex)
end

function pTask:OnProgressbarTimeout(nId, nIndex)
	self.m_BarId = 0
	local tb = self.m_Joss[nIndex]
	if (tb.Series ~= self.m_Series[self.m_SeriesIndex]) then
		self:BroadCast("M� kh�ng ��ng th� t�, xin h�y m� l�i")
		self.m_SeriesIndex = 1
	else
		self:BroadCast("M� th�nh c�ng.")
		self.m_SeriesIndex = self.m_SeriesIndex + 1
		if (self.m_SeriesIndex > getn(self.m_Series)) then
			local mapid = self:GetMapId()
			local pos = self:GetPosition().t12_monster
			for i = 1, 18 do
				local nNpcIndex = FightNpcManager:AddNpc("��ng Nh�n ", 1712, mapid, pos[i].x, pos[i].y, self, i, 1, 1)
				tinsert(self.m_Monsters, nNpcIndex)
			end
		end
	end
end

function pTask:OnProgressbarBreak(nId, nIndex)
	self.m_BarId = 0
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	if (nIndex > 0) then
		self.m_Monsters[nIndex] = 0
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				return
			end
		end
		local pos_boss = self:GetPosition().t12_boss
		if (self.m_BossIndex > 0) then
			FightNpcManager:DelNpc(self.m_BossIndex)
		end
		self.m_BossIndex = FightNpcManager:AddNpc("��ng Nh�n", 1713, self:GetMapId(), pos_boss.x, pos_boss.y, self, 0, 1, 1)
	else
		self.m_BossIndex = 0
		self:Proceed()
	end
end

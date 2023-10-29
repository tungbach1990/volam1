-- ������ˢ��10�������ιƵĸ߿����ӣ��ɹ���20�Ļ����ӵ㣬����Ҫ��鲼�����ڣ�ֻ���Ľ����н�Ϊ���״��Ŀյ��㣩��
-- ������5���ӣ����������û����ֹͣ��ʱ�����ܹ���

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\timerlist.lua")

pTask = Task:New(23)
pTask.m_Timeout = 300

function pTask:OnStart()
	self.m_Pillars = {}
	local poss = self.m_Pos.pillars
	for i = 1, getn(poss) do
		local index = FightNpcManager:AddNpc("Tr� T�", 1672, self.m_Maze.m_MapId, poss[i].x, poss[i].y, self, i, 1, 1)
		tinsert(self.m_Pillars, index)
	end
	self.m_TimerId = TimerList:AddTimer(self, 18 * self.m_Timeout)
	self:BroadCast("T�nh th�i gian b�y gi� b�t ��u.")
end

function pTask:OnDestroy()
	for i = 1, getn(self.m_Pillars) do
		local index = self.m_Pillars[i]
		if (index > 0) then
			FightNpcManager:DelNpc(self.m_Pillars[i])
		end
	end
	self.m_Pillars = nil
	if (self.m_TimerId > 0) then
		TimerList:DelTimer(self.m_TimerId)
		self.m_TimerId = 0
	end
end

function pTask:OnDeath(killed, player_killer, param)
	self.m_Pillars[param] = 0
end

function pTask:OnTime()
	self:BroadCast(format("T�nh th�i gian %d ph�t k�t th�c.", floor(self.m_Timeout / 60)))
	self.m_TimerId = 0
	self:Proceed()
	return 0
end

function pTask:OnEnter(player, count)
	-- DEBUG
	print(format("enter room: player(%s), count(%d)", player:GetName(), count))
	if (count == 1 and self.m_TimerId > 0) then
		player:Msg2Player("Th�i gian ph�c h�i.")
		TimerList:ResumeTimer(self.m_TimerId)
	end
end

function pTask:OnLeave(player, count)
	-- DEBUG
	print(format("leave room: player(%s), count(%d)", player:GetName(), count))
	if (count == 0 and self.m_TimerId > 0) then
		self:BroadCast("Th�i gian t�m d�ng.")
		TimerList:SuspendTimer(self.m_TimerId)
	end
end

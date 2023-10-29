-- ����һ���Ի�NPC���⣬Ҫ�����ж��Ѳ����֣�1-100��������ͬʱ�£�1-100�����һ�����������֣��¶��˹��ز��¶Ե����н��������һ���ǵ�ù���֣��������������֣������е�ù���ֵĻᱻ�����򻨳أ���һ����������

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\playerlist.lua")

CallbackList = {m_Index = 0}

pTask = Task:New(42)

function pTask:OnStart()
	local pos = self.m_Pos.gujuesha
	self.m_NpcIndex = DlgNpcManager:AddNpc("Ph�ng Quang Quang", 1656, self.m_Maze.m_MapId, pos.x, pos.y, self)
	self.m_Players = {}
	self.m_LuckNumber = random(1, 100)
	self.m_LoseNumber = random(1, 100)
	while (self.m_LoseNumber == self.m_LuckNumber) do
		self.m_LoseNumber = random(1, 100)
	end
end

function pTask:OnClose()
	if (self.m_NpcIndex > 0) then
		DlgNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	self.m_Players = nil
end

function pTask:Say(player)
	player:AskClientForNumber("guess_number", 1, 100, "H�y �o�n m�t con s� (1-100)")
end

function pTask:Guess(num, player)
	if (num == self.m_LuckNumber) then
		-- TODO: here
	elseif (num == self.m_LoseNumber) then
		-- TODO: here
	else
		player:Say("Ng��i �o�n s� kh�ng ��ng.")
	end
end

function guess_number(num)
	local player = PlayerList:GetPlayer(PlayerIndex)
	-- TODO: here
end

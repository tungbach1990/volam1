-- �ռ�����
do return end
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
IL("NPCINFO")

NPCID_YULONGHUFA 	= 1628	-- ��������
NPCID_YULONGBOY		= 1629	-- �����е���
NPCID_YULONGGIRL	= 1630	-- ����Ů����
NPCID_DIALOGBOSS	= 1625	-- �����죨�Ի���
NPCID_CUP			= 1627	-- �Ʊ�	
NPCID_FIGHTBOSS		= 1657	-- �����죨ս����
NPCID_FENGLINGLONG	= 1626	-- ������
DEATH_YULONGDIZI	= 1

STR_YULONGHUFA = "Mu�n g�p ���c Trang Ch� b�t bu�c ph�i b��c qua c�a c�a ta tr��c, xin h�y ra tay �i!"

Task = {
	m_Steps = {},
	m_Index = 0,
}

function Task:New()
	local tb = clone(Task)
	tb:AddStep(clone(Step1))
	tb:AddStep(clone(Step2))
	tb:AddStep(clone(Step3))
	tb:AddStep(clone(Step4))
	tb:AddStep(clone(Step5))
	tb:AddStep(clone(Step6))
	return tb
end

function Task:Start(maze, room)
	self.m_Maze = maze
	self.m_Room = room
	self.m_Pos = PositionList:GetPosition(room.m_Row, room.m_Col)
	self:Proceed()
end

function Task:Close(maze, room)
end

function Task:Destroy()
	if (self.m_Steps ~= nil) then
		for i = 1, getn(self.m_Steps) do
			self.m_Steps[i]:Destroy()
		end
		self.m_Steps = nil
		self.m_Index = 0
	end
end

function Task:IterPlayers(obj, func)
	self.m_Room:IterPlayers(obj, func)
end

function Task:AddStep(step)
	tinsert(self.m_Steps, step)
end

function Task:Proceed()
	if (self.m_Index > 0) then
		self.m_Steps[self.m_Index]:Close(self)
	end
	self.m_Index = self.m_Index + 1
	local step = self.m_Steps[self.m_Index]
	if (step ~= nil) then
		step:Start(self)
	else
		self.m_Room:FinishTask()
		-- DEBUG
		print("Task finished!")
	end
end

function Task:GetPosition()
	return PositionList:GetPosition(self.m_Room.m_Row, self.m_Room.m_Col)
end

function Task:GetMapId()
	return self.m_Maze.m_MapId
end

function Task:GetPlayerList()
	return self.m_Maze:GetPlayerList()
end

-- ��һ��
-- ��ʼ������������������Ů��������
-- ��ɣ�����������Ů��������
Step1 = {
	m_Yulongdizi = {},
	m_DiziCount = 0
}

function Step1:Start(task)
	local pos = task:GetPosition()
	local index = DlgNpcList:AddNpc("Ng�c Long H� Ph�p",
		NPCID_YULONGHUFA,
		task:GetMapId(),
		pos.yulonghufa.x,
		pos.yulonghufa.y,
		self)
	if (index > 0) then
		SetNpcKind(index, 3)
		self.m_NpcIndex = index
	end
	self.m_Task = task
	self.m_SayOnce = 0
end

function Step1:Close(task)
	self:ClearNpc()
end

function Step1:Destroy()
	self:ClearNpc()
end

function Step1:ClearNpc()
	if (self.m_NpcIndex > 0) then
		DlgNpcList:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	if (self.m_Yulongdizi ~= nil) then
		for index, flag in self.m_Yulongdizi do
			if (flag ~= nil and index > 0) then
				FightNpcList:DelNpc(index)
			end
		end
		self.m_Yulongdizi = nil
		self.m_DiziCount = 0
	end
end

function Step1:AddYulongdizi(pts, name, npcid)
	local mapid = self.m_Task:GetMapId()
	for i = 1, 10 do
		local pt = pts[i]
		local index = FightNpcList:AddNpc(name, npcid, mapid, pt.x, pt.y, self)
		if (index > 0) then
			self.m_Yulongdizi[index] = 1
			self.m_DiziCount = self.m_DiziCount + 1
			-- DEBUG
			print(format("AddNpc: name(%s), index(%d), total_count(%d)", name, index, self.m_DiziCount))
		end
	end
end

function Step1:Say(player)
	player:Say("Mu�n g�p ���c Trang Ch� b�t bu�c ph�i b��c qua c�a c�a ta tr��c, xin h�y ra tay �i!")
	if (self.m_SayOnce == 0) then
		local pos = self.m_Task:GetPosition()
		self:AddYulongdizi(pos.yulongboys, "Ng�c Long Nam �� T�", NPCID_YULONGBOY)
		self:AddYulongdizi(pos.yulonggirls, "Ng�c Long N� �� T�", NPCID_YULONGGIRL)
		self.m_SayOnce = 1
	end
end

function Step1:OnDeath(killer, npcindex)
	if (self.m_Yulongdizi[npcindex] ~= nil) then
		-- DEBUG
		print(format("DelNpc: name(%s), index(%d), left_count(%d)", GetNpcName(npcindex), npcindex, self.m_DiziCount - 1))
		FightNpcList:DelNpc(npcindex, 1)
		self.m_Yulongdizi[npcindex] = nil
		self.m_DiziCount = self.m_DiziCount - 1
		if (self.m_DiziCount <= 0) then
			self.m_Task:Proceed()
		end
	end
end

-- �ڶ���
-- ��ʼ�����������죨�Ի�NPC����8���Ʊ����Ի�NPC��
-- ��ɣ������˶����˾Ʊ�
Step2 = {
	m_Cups = {},
	m_Boss = 0,
}

function Step2:Start(task)
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local boss = DlgNpcList:AddNpc("Long C�u Thi�n",
					NPCID_DIALOGBOSS,
					mapid,
					pos.boss.x,
					pos.boss.y)
	if (boss > 0) then
		SetNpcKind(boss, 3)
		SyncNpc(boss)
		NpcChat(boss, "<color=yellow>c�c v� qu� nhi�n l� nh�ng anh h�ng ki�t xu�t, qu� nhi�n c� th� v��t qua ���c tr�ng tr�ng l�p l�p nh�ng kh�o nghi�m �� ��n tr��c m�t c�a ta ��y. ��nh Ng�c Long c�a Ng�c Long S�n Trang c� ngu�n t� trong m�y m� xu�ng, Hi�t Thi�n ��a Chi Linh Kh�, ��c Nh�t Nguy�t Chi Thanh Hoa, m�c d� Qu�nh T��ng Ng�c L� kh�ng b�ng m�t ph�n, l�y Nh��ng T�u n�y t�n l� �Long Tuy�n�. Tr��c khi b�t ��u th� luy�n cu�i c�ng, xin h�y cho ta l�y r��u n�y k�nh c�c v� m�t ly, ch�c c�c v� v��t �i thu�n l�i. <color>")
		for i = 1, 8 do
			local pt = pos.cups[i]
			local index = DlgNpcList:AddNpc("Long M�ch T�u",
								NPCID_CUP,
								mapid,
								pt.x,
								pt.y,
								self,
								i)
			if (index > 0) then
				self.m_Cups[i] = index
			end
		end
		self.m_Boss = boss
		self.m_Task = task
		local choices = {}
		local players = self.m_Task:GetPlayerList()
		for i = 1, getn(players) do
			choices[players[i]] = 0
		end
		self.m_Choices = choices
		self.m_ChoiceCount = getn(players)
		-- DEBUG
		print(format("PlayerCount:%d", getn(players)))
	end
end

function Step2:Close(task)
	self:Clear()
	-- TODO
end

function Step2:Destroy()
	self:Clear()
end

function Step2:Clear()
	if (self.m_Cups ~= nil) then
		for i, index in self.m_Cups do
			if (index > 0) then
				DlgNpcList:DelNpc(index)
			end
		end
		self.m_Cups = nil
	end
	if (self.m_Boss > 0) then
		DlgNpcList:DelNpc(self.m_Boss)
		self.m_Boss = 0
	end
end

function Step2:Say(player, i)
	if (not self.m_Choices) then
		return
	end
	local name = player:GetName()
	local flag = self.m_Choices[name]
	if (flag ~= 0) then
		return
	end
	self.m_Choices[name] = 1
	self.m_ChoiceCount = self.m_ChoiceCount - 1
	if (self.m_ChoiceCount <= 0) then
		self.m_Task:Proceed()
	end
	self:DelCup(i)
end

function Step2:DelCup(index)
	if (self.m_Cups ~= nil) then
		local npc = self.m_Cups[index]
		if (npc > 0) then
			DlgNpcList:DelNpc(npc)
			self.m_Cups[index] = 0
		end
	end
end

-- ������
-- ��ʼ���������Ϊս��NPC�����ϻ����ܣ�
-- ��ɣ��򵽵���50%����
Step3 = {}

function Step3:Start(task)
	-- DEBUG
	print("Step3:Start()")
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local boss = FightNpcList:AddNpc("Long C�u Thi�n", NPCID_DIALOGBOSS, mapid, pos.boss.x, pos.boss.y, self, nil, 1, 1)
	if (boss > 0) then
		-- TODO ���ϻ�����
		SyncNpc(boss)
		NpcChat(boss, "<color=yellow>b�y gi� c�c v� �� ��i di�n v�i th� luy�n cu�i c�ng r�i, ch� c�n ��nh b�i ta v� v� c�a ta, c� th� nh�n ���c trang b� cao c�p nh�t v� vinh d� cao qu� nh�t.<color>")
		self.m_Boss = boss
		self.m_Timer = TimerList:AddTimer(self, 9)
		-- TODO: ��ʱ��
	end
	self.m_Task = task
end

function Step3:Close(task)
	self:Clear()
	self.m_Task = nil
end

function Step3:Destroy()
	self:Clear()
end

function Step3:OnDeath()
	self:Clear(1)
	if (self.m_Task ~= nil) then
		self.m_Task:Proceed()
	end
end

function Step3:OnTime()
	if (self.m_Boss ~= nil and self.m_Task ~= nil) then
		local cur_life = NPCINFO_GetNpcCurrentLife(self.m_Boss)
		local max_life = NPCINFO_GetNpcCurrentMaxLife(self.m_Boss)
		if (cur_life < max_life * 0.5) then
			self.m_Timer = nil
			self.m_Task:Proceed()
			return 0
		end
	end
	return 1
end

function Step3:Clear(flag)
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcList:DelNpc(self.m_Boss, flag)
		self.m_Boss = nil
	end
end

-- ���Ĳ�
-- ��ʼ������3��һģһ���������죨���ϻ����ܣ����������һ�������
-- ��ɣ�����Ĵ�40%��Ѫʱ�Ż������һ��
Step4 = {}

function Step4:Start(task)
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local tb = {}
	for i = 1, 3 do
		local idx = self:AddBoss(mapid, pos.bosses[i], i)
		tinsert(tb, idx)
	end
	self.m_Bosses = tb
	self.m_BossIndex = random(1, getn(tb))
	self.m_Timer = TimerList:AddTimer(self, 9)
	self.m_Task = task
	-- DEBUG
	print(format("[MAZE]Step4: boss(%d), index(%d), count(%d)", self.m_Bosses[self.m_BossIndex], self.m_BossIndex, getn(tb)))
end

function Step4:Close(task)
	self:Clear()
end

function Step4:Destroy()
	self:Clear()
end

function Step4:Clear()
	if (self.m_Bosses ~= nil) then
		for _, index in self.m_Bosses do
			if (index > 0) then
				FightNpcList:DelNpc(index)
			end
		end
		self.m_Bosses = nil
	end
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	self.m_BossIndex = nil
end

function Step4:OnTime()
	if (self.m_BossIndex ~= nil) then
		local npc = self.m_Bosses[self.m_BossIndex]
		local cur_life = NPCINFO_GetNpcCurrentLife(npc)
		local max_life = NPCINFO_GetNpcCurrentMaxLife(npc)
		if (cur_life < max_life * 0.4) then
			self.m_Timer = nil
			self.m_Task:Proceed()
			return 0
		end
	end
	return 1
end

function Step4:OnDeath(killer, npc, index)
	-- DEBUG
	print(format("[MAZE]Step4:OnDeath(%d,%d,%d)", killer, npc, index))
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	FightNpcList:DelNpc(self.m_Bosses[index], 1)
	self.m_Bosses[index] = 0
	if (self.m_BossIndex ~= nil and self.m_BossIndex == index) then
		-- DEBUG
		print("[MAZE]real boss is down!")
		self.m_Task:Proceed()
		self.m_BossIndex = nil
	end
end

function Step4:AddBoss(mapid, pt, param)
	local boss = FightNpcList:AddNpc("Long C�u Thi�n", NPCID_DIALOGBOSS, mapid, pt.x, pt.y, self, param, 1, 1)
	if (boss > 0) then
		-- TODO ���ϻ�����
		SyncNpc(boss)
		NpcChat(boss, "<color=yellow>xem ra ta �� ��nh gi� th�p c�c ng��i r�i, h�y xem ta ��y �B�ch Bi�n Ma Th�n�!<color>.")
		return boss
	else
		return 0
	end
end

-- ���岽
-- ��ʼ�������죨�Ի�NPC��˵�������������
-- ��ɣ���ʾ��Ի�N���
Step5 = {}
function Step5:Start(task)
	local pos = task:GetPosition()
	local mapid = task:GetMapId()
	local boss = FightNpcList:AddNpc("Long C�u Thi�n", NPCID_DIALOGBOSS, mapid, pos.boss.x, pos.boss.y, self)
	if (boss > 0) then
		SetNpcKind(boss, 3)
		SyncNpc(boss)
		local delay = 4
		local seconds = 0
		NpcChat(boss, "<color=yellow>c�c v� qu� l� nh�ng cao th� v� l�m tr�m n�m m�i g�p m�t l�n, qu� nhi�n ��nh b�i ���c B�ch Bi�n Ma Th�n c�a ta. N�i th�t v�i c�c v� nh�, ch� nh�n ��ch th�c c�a Ng�c Long S�n Trang v�n l� V��ng Qu�c ��i Kim, T�ng Tri�u b� di�t vong ch� l� chuy�n s�m hay mu�n m� th�i, c�c v� ph�i hy sinh v� �ch chi b�ng gia nh�p v�o B�n S�n Trang v� ��i Kim m� hi�n s�c, sau n�y vinh hoa ph� qu� tha h� m� t�n h��ng, kh�ng bi�t � c�a c�c v� th� n�o? <color>")
		seconds = seconds + delay
		NpcChat(boss, "<color=yellow>C�c v� �� ngoan c� nh� v�y th� ��ng c� tr�ch ta h� th� kh�ng l�u t�nh, v�a r�i c�c v� �� u�ng Long Tuy�n M� T�u ta �� h� Kim T�m Tuy�t M�nh ��c v�o trong ��, ch� c�n v� c�a ta �i�u khi�n ��c C�, th� c�c v� s�ng kh�ng ra s�ng ch�t kh�ng ra ch�t., ha ha ha ha <color>!", seconds)
		seconds = seconds + delay
		NpcChat(boss, "<color=yellow>Lung Linh, ra tay �i, �� cho c�i th� ngoan c� kh�ng ch�u t�nh ng� n�y n�m m�i �au kh�!<color>", seconds)
		seconds = seconds + delay
		NpcChat(boss, "<color=yellow>Lung Linh, Lung Linh, sao ng��i c�n ch�a �i ra n�a h�? Nhanh h�y ho�i ��c tuy�t m�nh c�a ng��i �i, ta ch�u kh�ng n�i n�a r�i!<color>", seconds)
		self.m_Timer = TimerList:AddTimer(self, (seconds + 1) * 18, 1)
		self.m_Boss = boss
		self.m_Task = task
		self.m_MapId = mapid
		self.m_Pos = pos
	end
end

function Step5:Close(task)
	self:Clear()
end

function Step5:Destroy()
	self:Clear()
end

function Step5:Clear()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcList:DelNpc(self.m_Boss)
		self.m_Boss = nil
	end
	if (self.m_Girl ~= nil) then
		DlgNpcList:DelNpc(self.m_Girl)
		self.m_Girl = nil
	end
end

function Step5:OnTime(id)
	if (id == 1) then
		local girl = DlgNpcList:AddNpc("Ph��ng Lung Linh", NPCID_FENGLINGLONG, self.m_MapId, self.m_Pos.fenglinglong.x, self.m_Pos.fenglinglong.y)
		if (girl > 0) then
			SetNpcKind(girl, 3)
			SyncNpc(girl)
			NpcChat(girl, "<color=yellow>��i hi�p, ng��i v� sao c�n ch�a gi�c ng�, ng��i l�y nh�ng trang b� cao c�p �� l�m m�i nh�, l�y vi�c th� luy�n Ki�m Gia �� vang danh, �� s�t h�i bi�t bao nhi�u v� l�m nh�n s� r�i, ng��I h� t�t ph�i l�m ch� d�n ���ng cho bon ng��i Kim kia ch� ? H�m nay ta quy�t kh�ng th� �� cho ng��i ti�p t�c l�m nh�ng chuy�n sai tr�i nh� v�y n�a<color>.")
			NpcChat(self.m_Boss, "<color=yellow>Lung Linh, ng��i, ng��i ��<color>")
			self.m_Girl = girl
		end
		self.m_Timer = TimerList:AddTimer(self, 2 * 18, 2)
		return 0
	elseif (id == 2) then
		FightNpcList:DelNpc(self.m_Boss)
		self.m_Boss = FightNpcList:AddNpc("Long C�u Thi�n", NPCID_FIGHTBOSS, self.m_MapId, self.m_Pos.boss.x, self.m_Pos.boss.y, self)
		-- TODO: ���˼���
		self.m_Timer = TimerList:AddTimer(self, 18 * 5, 3)
		return 0
	elseif (id == 3) then
		-- ����Ҽ�Ѫ
		self.m_Task:IterPlayers(self, self.AddBlood)
		return 1
	else
		return 0
	end
end

function Step5:AddBlood(player)
	-- �Ⱥ��ն�
	player:CastSkill(93, 20)
end

function Step5:OnDeath()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcList:DelNpc(self.m_Boss, 1)
		self.m_Boss = nil
	end
	self.m_Task:Proceed()
end

-- DEBUG
for i = 1, 49 do
	TaskList:RegisterTask(i, Task)
end

-- �ռ�����
Include("\\script\\missions\\maze\\task.lua")
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

pTask = Task:New(49)

function pTask:InitStep()
end


-- ��һ��
-- ��ʼ������������������Ů��������
-- ��ɣ�����������Ů��������
Step1 = Step:New()
Step1.m_Yulongdizi = {}
Step1.m_DiziCount = 0
function Step1:Start(task)
	local pos = task:GetPosition()
	local index = DlgNpcManager:AddNpc("Ng�c Long H� Ph�p",
		NPCID_YULONGHUFA,
		task:GetMapId(),
		pos.yulonghufa.x,
		pos.yulonghufa.y,
		self)
	if (index > 0) then
		local nNpcIndex = DlgNpcManager:GetNpcIndex(index)
		SetNpcKind(nNpcIndex, 3)
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
		DlgNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	if (self.m_Yulongdizi ~= nil) then
		for i = 1, getn(self.m_Yulongdizi) do
			local nIndex = self.m_Yulongdizi[i]
			if (nIndex > 0) then
				FightNpcManager:DelNpc(nIndex)
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
		local nParam = getn(self.m_Yulongdizi) + 1
		local nIndex = FightNpcManager:AddNpc(name, npcid, mapid, pt.x, pt.y, self, nParam, 1, 1)
		tinsert(self.m_Yulongdizi, nIndex)
		if (nIndex > 0) then
			self.m_DiziCount = self.m_DiziCount + 1
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

function Step1:OnDeath(nKilled, pPlayer, nParam)
	self.m_Yulongdizi[nParam] = 0
	self.m_DiziCount = self.m_DiziCount - 1
	if (self.m_DiziCount <= 0) then
		self.m_Task:Proceed()
	end
end

-- �ڶ���
-- ��ʼ���������Ϊս��NPC�����ϻ����ܣ�
-- ��ɣ��򵽵���50%����

Step2 = Step:New()
function Step2:Start(task)
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local boss = FightNpcManager:AddNpc("Long C�u Thi�n", NPCID_DIALOGBOSS, mapid, pos.boss.x, pos.boss.y, self, nil, 1, 1)
	if (boss > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(boss)
		SyncNpc(nNpcIndex)
		NpcChat(nNpcIndex, "<color=yellow>C�c v� qu� l� nh�n trung long ph��ng, qu� nhi�n c� th� v��t qua ���c tr�ng tr�ng nguy hi�m �� ��n ��y g�p ta. Hi�n t�i c�c v� �ang ph�I ��i m�t v�i th� luy�n cu�i c�ng, ch� c�n ��nh b�i ta v� Th� T� c�a ta, th� c� th� nh�n ���c trang b� c�c ph�m nh�t v� c� uy danh cao qu� nh�t. <color>")
		self.m_Boss = boss
		self.m_Timer = TimerList:AddTimer(self, 9)
	end
	self.m_Task = task
	self.m_MapId = mapid
end

function Step2:Close(task)
	self:Clear()
	self.m_Task = nil
end

function Step2:Destroy()
	self:Clear()
end

function Step2:OnDeath()
	self.m_Boss = nil
	self:Clear()
	if (self.m_Task ~= nil) then
		self.m_Task:Proceed()
	end
end

function Step2:OnTime()
	if (self.m_Boss ~= nil and self.m_Task ~= nil) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(self.m_Boss)
		local cur_life = NPCINFO_GetNpcCurrentLife(nNpcIndex)
		local max_life = NPCINFO_GetNpcCurrentMaxLife(nNpcIndex)
		if (cur_life < max_life * 0.5) then
			self.m_Timer = nil
			self.m_Task:Proceed()
			return 0
		end
	end
	return 1
end

function Step2:Clear()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcManager:DelNpc(self.m_Boss)
		self.m_Boss = nil
	end
end

-- ������
-- ��ʼ������3��һģһ���������죨���ϻ����ܣ����������һ�������
-- ��ɣ�����Ĵ�40%��Ѫʱ�Ż������һ��
Step3 = Step:New()

function Step3:Start(task)
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local tb = {}
	self.m_BossIndex = random(1, 3)
	for i = 1, 3 do
		local idx = self:AddBoss("Long C�u Thi�n", mapid, pos.bosses[i], i)
		tinsert(tb, idx)
	end
	self.m_Bosses = tb
	self.m_Timer = TimerList:AddTimer(self, 9)
	self.m_Task = task
	self.m_MapId = mapid
end

function Step3:Close(task)
	self:Clear()
end

function Step3:Destroy()
	self:Clear()
end

function Step3:Clear()
	if (self.m_Bosses ~= nil) then
		for i = 1, getn(self.m_Bosses) do
			local nIndex = self.m_Bosses[i]
			if (nIndex > 0) then
				FightNpcManager:DelNpc(nIndex)
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

function Step3:OnTime()
	if (self.m_BossIndex ~= nil) then
		local npc = self.m_Bosses[self.m_BossIndex]
		local nNpcIndex = FightNpcManager:GetNpcIndex(npc)
		local cur_life = NPCINFO_GetNpcCurrentLife(nNpcIndex)
		local max_life = NPCINFO_GetNpcCurrentMaxLife(nNpcIndex)
		if (cur_life < max_life * 0.4) then
			self.m_Timer = nil
			self.m_Task:Proceed()
			return 0
		end
	end
	return 1
end

function Step3:OnDeath(killed, player, index)
	self.m_Bosses[index] = 0
	if (index == self.m_BossIndex) then
		if (self.m_Timer ~= nil) then
			TimerList:DelTimer(self.m_Timer)
			self.m_Timer = nil
		end
		self.m_BossIndex = nil
		self.m_Task:Proceed()
	end
end

function Step3:AddBoss(name, mapid, pt, param)
	local boss = FightNpcManager:AddNpc(name, NPCID_DIALOGBOSS, mapid, pt.x, pt.y, self, param, 1, 1)
	if (boss > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(boss)
		SyncNpc(nNpcIndex)
		NpcChat(nNpcIndex, "<color=yellow>Xem ra ta b�i d��i tay c�a c�c ng��i r�i, h�y xem ' B�ch Bi�n Ma Th�n' c�a ta ��y ! <color>")
		return boss
	else
		return 0
	end
end

-- ���Ĳ�
-- ��ʼ�������죨�Ի�NPC��˵�������������
-- ��ɣ���ʾ��Ի�N���
Step4 = Step:New()
function Step4:Start(task)
	local pos = task:GetPosition()
	local mapid = task:GetMapId()
	local boss = FightNpcManager:AddNpc("Long C�u Thi�n", NPCID_DIALOGBOSS, mapid, pos.boss.x, pos.boss.y, self, nil, 1, 1)
	if (boss > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(boss)
		SetNpcKind(nNpcIndex, 3)
		SyncNpc(nNpcIndex)
		local delay = 4
		local seconds = 0
		NpcChat(nNpcIndex, "<color=yellow>C�c v� qu� l� nh�ng cao th� m� tr�m n�m ta m�i ���c g�p m�t l�n, qu� nhi�n �� ��nh b�i ���c B�ch Bi�n Ma Th�n c�a ta. Kh�ng gi�u g� c�c v�, Ch� nh�n ��ch th�c c�a Ng�c Long S�n Trang ch�nh l� Qu�c V��ng c�a ��i Kim, Tri�u T�ngs�m mu�n c�ng b� di�t vong ch� l� chuy�n c�a th�i gian m� th�i, c�c v� h� t�t ph�i hy sinh m�t c�ch v� �ch nh� v�y chi b�ng gia nh�p v�o B�n S�n Trang m� gi�p s�c ph� tr� ��i Kim, sau n�y th�nh ��i nghi�p th� ti�n t�i ph� qu� s� thu�c v� c�c v�! Kh�ng bi�t � c�a c�c v� th� n�o? <color>")
		seconds = seconds + delay
		NpcChat(nNpcIndex, "<color=yellow>N�u nh� c�c v� v�n c�ng ��u c� ch�p nh� v�y, th� ��ng c� tr�ch ta h� th� kh�ng l�u t�nh, c�c ng��i �� b� ta h� m�t ��c c� g�i l� Kim T�m Tuy�t M�nh C�, ch� c�n Th� T� c�a ta v�y tay m�t c�i th� C� ��c s� ph�t ra, ��n l�c �� c�c ng��i s�ng kh�ng b�ng s�ng ch�t kh�ng b�ng ch�t, ha ha ha! <color>", seconds)
		seconds = seconds + delay
		NpcChat(nNpcIndex, "<color=yellow>Linh Lung, ra tay �i, h�y cho c�i b�n ng��i ngoan c� n�y n�m m�i l�i h�i c�a ta! <color>", seconds)
		seconds = seconds + delay
		NpcChat(nNpcIndex, "<color=yellow>Lung Linh, Lung Linh, ng��i ��u r�i c�n kh�ng ra tay �i? nhanh ph�t ��ng C� ��c c�a ng��i �i, ta ch�u kh�ng n�i b�n ng��i n�y n�a r�i! <color>", seconds)
		self.m_Timer = TimerList:AddTimer(self, (seconds + 1) * 18, 1)
		self.m_Boss = boss
		self.m_Task = task
		self.m_MapId = mapid
		self.m_Pos = pos
	end
end

function Step4:Close(task)
	self:Clear()
end

function Step4:Destroy()
	self:Clear()
end

function Step4:Clear()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcManager:DelNpc(self.m_Boss)
		self.m_Boss = nil
	end
	if (self.m_Girl ~= nil) then
		DlgNpcManager:DelNpc(self.m_Girl)
		self.m_Girl = nil
	end
end

function Step4:OnTime(id)
	if (id == 1) then
		local girl = DlgNpcManager:AddNpc("Ph��ng Lung Linh", NPCID_FENGLINGLONG, self.m_MapId, self.m_Pos.fenglinglong.x, self.m_Pos.fenglinglong.y)
		if (girl > 0) then
			self.m_Girl = girl
			local nGirlIndex = DlgNpcManager:GetNpcIndex(girl)
			SetNpcKind(nGirlIndex, 3)
			SyncNpc(nGirlIndex)
			NpcChat(nGirlIndex, "<color=yellow>Thi�n Ca, t�i sao huynh c�n ch�a t�nh ng� l�i, bao n�m nay huynh lu�n l�y nh�ng trang b� t�t �� d� d� c�c h�o h�n giang h�, l�y Ki�m Gia �� l�m vang danh thi�n h�, gi�t h�i kh�ng bi�t bao nhi�u v� l�m cao th�, v� sao huynh v�n c� su�t ��i l�m ch� d�n ���ng cho b�n ng��i Kim nh� v�y? H�m nay mu�i kh�ng th� ti�p t�c �� cho huynh ph�i t�i l�i ch�ng l�n t�i ���c n�a<color>")
			local nBoyIndex = FightNpcManager:GetNpcIndex(self.m_Boss)
			NpcChat(nBoyIndex, "<color=yellow>Linh Lung, ng��i, ng��i ! ��<color>")
		end
		self.m_Timer = TimerList:AddTimer(self, 2 * 18, 2)
		return 0
	elseif (id == 2) then
		FightNpcManager:DelNpc(self.m_Boss)
		self.m_Boss = FightNpcManager:AddNpc("Long C�u Thi�n", NPCID_FIGHTBOSS, self.m_MapId, self.m_Pos.boss.x, self.m_Pos.boss.y, self, nil, 1, 1)
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

function Step4:AddBlood(player)
	-- �Ⱥ��ն�
	player:CastSkill(93, 20)
end

function Step4:OnDeath()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	self.m_Boss = nil
	self.m_Task:Proceed()
end

pTask:AddStep(clone(Step1))
pTask:AddStep(clone(Step2))
pTask:AddStep(clone(Step3))
pTask:AddStep(clone(Step4))

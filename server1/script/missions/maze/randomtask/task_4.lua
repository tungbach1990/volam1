--һ��BOSS�������
--ÿ��30����ĳ��������ˢһ��npc֩����
--����BOSS����

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
IL("NPCINFO")


pTask = Task:New(4)

function pTask:InitStep()
	print("task4 init")
end

Step1 = Step:New()

function Step1:Start(task)
	local nMapId = task:GetMapId()
	local tbPos = task:GetPosition()
	self.nNpcIndex = FightNpcManager:AddNpc("Ng� Th�i Long Th�", 1631, nMapId, tbPos.boss.x, tbPos.boss.y, self, 1, 1, 1)
	self.pTask = task
	-- self.pTask.nTimerId = TimerList:AddTimer(self, 30*18)
end

-- function Step1:OnTime()
-- end

function Step1:OnDeath()
	if (self.pTask) then
		self.pTask:Proceed()
	end
	if (self.nNpcIndex) then
		self.nNpcIndex = nil
	end
end

function Step1:OnPlayerDeath(player)
	self.pTask:BroadCast(format("V� kh�ng k�p th�i ��nh tan Th� Ti, %s tr�ng ��c t� vong.", player:GetName()))
end

function Step1:Destroy()
	self.pTask = nil
	if (self.nNpcIndex) then
		FightNpcManager:DelNpc(self.nNpcIndex)
		self.nNpcIndex = nil
	end
end

pTask:AddStep(clone(Step1))

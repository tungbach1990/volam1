-- 17.	����2��һ����NPC��һ���������ӣ�һ��������ӣ����ϳ���5����ͬ���еĵ���
-- �Ⱥ������ӶԻ�������˵һ�����к�һ�����ѵ����֣�Ȼ��Ҫ�������ȥ������������������ĵ��񣬿���������Ѿͻ�������
-- Ȼ������ӶԻ���������˵����С������������ʧ��2��NPCҪ�����Ի����ܹ���ȷ����20�ι��ء�
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(17)
pTask.m_MaxFinishCount = 20

tbTASK17_JOSS = {	-- TODO
	{1647,	"�i�u T��ng ( Kim)"},
	{1648,	"�i�u T��ng (M�c)"},
	{1649,	"�i�u T��ng ( th�y )"},
	{1650,	"�i�u T��ng ( H�a )"},
	{1651,	"�i�u T��ng ( Th�)"},
}

tbTASK17_SERIES = {0, 1, 2, 3, 4}

tbTASK17_SERIESNAME = {
	[0] = "Kim",
	[1] = "M�c",
	[2] = "Th�y ",
	[3] = "H�a",
	[4] = "Th� ",
}

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos = self:GetPosition()
	self.m_AccrueIndex = DlgNpcManager:AddNpc("T��ng Sinh T�", 1645, mapid, pos.t17_accrue.x, pos.t17_accrue.y, self, 1)
	self.m_ConquerIndex = DlgNpcManager:AddNpc("T��ng Kh�c T�", 1646, mapid, pos.t17_conquer.x, pos.t17_conquer.y, self, 2)
	self.m_Statuary = {}
	self.m_TalkIndex = 1
	self.m_AppointPlayer = nil
	self.m_AppointSeries = 0
	self.m_BarId = 0
	self.m_FinishCount = 0
	for i = 1, 5 do
		local nNpcIndex = DlgNpcManager:AddNpc(tbTASK17_JOSS[i][2], tbTASK17_JOSS[i][1], mapid, pos.t12_joss[i].x, pos.t12_joss[i].y, self, i + 2)
		tinsert(self.m_Statuary, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_AccrueIndex > 0) then
		DlgNpcManager:DelNpc(self.m_AccrueIndex)
		self.m_AccrueIndex = 0
	end
	if (self.m_ConquerIndex > 0) then
		DlgNpcManager:DelNpc(self.m_ConquerIndex)
		self.m_ConquerIndex = 0
	end
	if (self.m_Statuary) then
		for i = 1, getn(self.m_Statuary) do
			DlgNpcManager:DelNpc(self.m_Statuary[i])
		end
		self.m_Statuary = nil
	end
	if (self.m_BarId > 0) then
		ProgressBarList:Close(self.m_BarId)
		self.m_BarId = 0
	end
end

function pTask:Say(player, nIndex)
	if (nIndex == 1) then
		return self:Say_Accrue(player, nIndex)
	elseif (nIndex == 2) then
		return self:Say_ConquerIndex(player, nIndex)
	else
		return self:Say_Statuary(player, nIndex)
	end
end

function pTask:Say_Accrue(player, nIndex)
	if (self.m_BarId > 0) then
		player:Say("Xin h�y m� �i�u T��ng ra r�i l�i g�p ta.")
		return
	elseif (self.m_TalkIndex == 2) then
		player:Say("Tr�n n�y ��n l��t T��ng Kh�c T� xu�t ��, ta ngh� ng�i m�t l�t.")
		return
	end
	if (not self.m_AppointPlayer) then
		self.m_AppointPlayer = self:RandomPlayerName() or player:GetName()
		self.m_QuestionSeries = random(0, 4)
		self.m_AppointSeries = GetAccrueSeries(self.m_QuestionSeries)
	end
	local msg = format("%s, Xin h�y m� %s �i�u T��ng Ng� H�nh", self.m_AppointPlayer, tbTASK17_SERIESNAME[self.m_QuestionSeries])
	player:Say(msg)
	self:BroadCast(msg)
end

function pTask:Say_ConquerIndex(player, nIndex)
	if (self.m_BarId > 0) then
		player:Say("Xin h�y m� �i�u T��ng ra r�i l�i g�p ta.")
		return
	elseif (self.m_TalkIndex == 1) then
		player:Say("Tr�n n�y ��n l��t T��ng Kh�c T� xu�t ��, ta ngh� ng�i m�t l�t.")
		return
	end
	if (not self.m_AppointPlayer) then
		self.m_AppointPlayer = self:RandomPlayerName() or player:GetName()
		self.m_QuestionSeries = random(0, 4)
		self.m_AppointSeries = GetConquerSeries(self.m_QuestionSeries)
	end
	local msg = format("%s, Xin h�y m� %s t�t c� �i�u T��ng Ng� H�nh", self.m_AppointPlayer, tbTASK17_SERIESNAME[self.m_QuestionSeries])
	player:Say(msg)
	self:BroadCast(msg)
end

function pTask:Say_Statuary(player, nIndex)
	if (self.m_BarId > 0) then
		return
	end
	self.m_BarId = ProgressBarList:Open("�ang m�", player, 3, self, nIndex - 2)
end

function pTask:OnProgressbarTimeout(nId, nIndex, player)
	self.m_BarId = 0
	if (tbTASK17_SERIES[nIndex] == self.m_AppointSeries and self.m_AppointPlayer == player:GetName()) then
		self:BroadCast("M� th�nh c�ng.")
		self.m_FinishCount = self.m_FinishCount + 1
		if (self.m_FinishCount >= self.m_MaxFinishCount) then
			self:Proceed()
		elseif (self.m_TalkIndex == 1) then
			self.m_TalkIndex = 2
		else
			self.m_TalkIndex = 1
		end
	else
		self:BroadCast("M� th�t b�i.")
		self:KickPlayer(self.m_AppointPlayer)
		self.m_AppointSeries = 0
		self.m_TalkIndex = 1
	end
	self.m_AppointPlayer = nil
end

function pTask:OnProgressbarBreak(nId, nIndex)
	self:BroadCast("M� th�t b�i.")
	self.m_BarId = 0
end

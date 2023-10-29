--======================================================================
--Author:   Tan Qingyu
--Date:     2012-3-30 15:40:52
--Describe: �꾩�ع� ������Ҫʵ��
--======================================================================
Msg2Player("Call to boss Dang Diep")
Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\bianjingdigong\\bianjingdigong_head.lua")
Include("\\script\\global\\login_head.lua")

BJDG = Dungeon:new_type("��a Cung Bi�n Kinh")
BJDG_HEAD:CopyTo(BJDG)

function BJDG:AssociateMap(nMapId)
	self.tbMapList = self.tbMapList or {}
	self.tbMapList[nMapId] = 1
end

function BJDG:_init()
	self:AddAllTrap()
	self:AddAllNpc()
	self:CreateTimer_Dungeon()		-- 10 seconds timer for each player in dungeon.
	self:CreateTimer_CallBoss()		-- 1 hour timer for create boss.
	return 1
end

function BJDG:AddAllTrap()
	for key, value in BJDG_HEAD.tbTrapList do
		self:AddATrap(value.szPosPath, value.szTrapFile)
	end
end

function BJDG:AddATrap(szPosPath, szTrapFile)
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow = 2, nRowCount do
		local nX = TabFile_GetCell(szPosPath, nRow, 1)
		local nY = TabFile_GetCell(szPosPath, nRow, 2)
		for nMapId, bFlag in self.tbMapList do
			if bFlag then
				AddMapTrap(nMapId, nX, nY, szTrapFile)
			end
		end
	end
end

function BJDG:AddAllNpc()
	self:AddEntryNpc()
	for key, value in BJDG_HEAD.tbNpcTypeList do
		self:AddANpc(key, value.szPosPath)
	end
end

function BJDG:AddEntryNpc()
	basemission_CallNpc(BJDG_HEAD.tbEntryNpc, self.tbEntrancePos[1], self.tbEntrancePos[2]*32, self.tbEntrancePos[3]*32)
end

function BJDG:AddANpc(szName, szPosPath)
	local tbNpc = BJDG_HEAD.tbNpcTypeList[szName]
	
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	if not tbNpc then
		assert(0)
		return 
	end
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow=2, nRowCount do
		local nX = TabFile_GetCell(szPosPath, nRow, 1)
		local nY = TabFile_GetCell(szPosPath, nRow, 2)
		for nMapId, bFlag in self.tbMapList do
			if bFlag then
				basemission_CallNpc(tbNpc, nMapId, nX, nY)
			end
		end
	end
end

--�����ǻģ��
----------------------------------------------------------------------------------

--�����ͼ�Ļص�
function BJDG:OnEnterMap()
	self.tbInDungeonPlayerList[GetName()] = 1
	
	DisabledUseTownP(1)
	SetDeathType(-1)
	--SetLogoutRV(1)
	SetPunish(0)
	SetFightState(0)
	
	SetDeathScript("\\script\\missions\\bianjingdigong\\npc_player\\on_death.lua")
	
	AddLoginFileFunction("\\script\\missions\\bianjingdigong\\npc_player\\on_login.lua", "OnLogin")
end

--�뿪��ͼ�Ļص�
function BJDG:OnLeaveMap()
	self.tbInDungeonPlayerList[GetName()] = nil
	
	DisabledUseTownP(0)
	SetDeathType(0)
	--SetLogoutRV(0)
	SetPunish(1)
	SetFightState(0)
	
	SetDeathScript("")
end

--�����ع���Ҷ�ʱ��
function BJDG:CreateTimer_Dungeon()
	self:AddTimer(self.nTimeInterval_Dungeon * 18, self.OnTimer_Dungeon, {self})
end

--�ع���Ҷ�ʱ����ʱ�ص�
function BJDG:OnTimer_Dungeon(TIME)
	local nHour = tonumber(GetLocalDate("%H"))
	--��鲢����ع���Ҷ���
	for k, v in self.tbInDungeonPlayerList do
		local nPlayerIndex = SearchPlayer(k)
		local nInDungeonTime = CallPlayerFunction(nPlayerIndex, GetTask, self.nInDungeonTimeTaskId)
		if nInDungeonTime >= self.nDailyLimitTime or self.tbOpenTime[nHour] ~= 1 then
			CallPlayerFunction(nPlayerIndex, NewWorld, unpack(self.tbLeaveTargetPos))
		else
			CallPlayerFunction(nPlayerIndex, SetTask, self.nInDungeonTimeTaskId, nInDungeonTime + self.nTimeInterval_Dungeon)
		end
	end
	
	return self.nTimeInterval_Dungeon * 18
end

--�����ٻ�BOSS�Ķ�ʱ��
function BJDG:CreateTimer_CallBoss()
	local nFirstExecTime = 3600 - mod(GetCurServerTime(), 3600) + 30
	self:AddTimer(nFirstExecTime * 18, self.OnTimer_CallBoss, {self})
end

--�ٻ�BOSS��ʱ����ʱ�ص�
function BJDG:OnTimer_CallBoss()
	self:CreateEliteMonster()
	local nHour = tonumber(GetLocalDate("%H"))
	if self.tbCallBigBossTime[nHour] == 1 then
		self:CreateBoss()
	end
	return self.nTimeInterval_Boss * 18
end

--������Ӣ��
function BJDG:CreateEliteMonster()
	for i = 1, self.nLitterBossCount do
		local szPosFile = self.tbMonsterPosFile[i]
		local nRow = random(2, TabFile_GetRowCount(szPosFile))
		local nX = tonumber(TabFile_GetCell(szPosFile, nRow, 1))
		local nY = tonumber(TabFile_GetCell(szPosFile, nRow, 2))
		
		basemission_CallNpc(self.tbEliteMonster[i], self.nMapId, nX, nY)
	end
end

--����ص㴴��һ����BOSS��������BOSS
function BJDG:CreateBoss()
	local tbRandom = {1, 2, 3}
	for i = 1, getn(tbRandom) do
		local nIdx = random(getn(tbRandom))
		tbRandom[i], tbRandom[nIdx] = tbRandom[nIdx], tbRandom[i]
	end
	-- Up here is for random shuffle
	
	AddGlobalNews("��ng �i�p �� xu�t hi�n trong M?Cung Bi�n Kinh, xin m�i t�t c?c�c ch?v?��i hi�p nhanh nhanh ��n khi�u chi�n.")
	
	local tbPosA = self.tbBigBossPos[tbRandom[1]]
	self:CreateBigBoss(tbPosA[random(getn(tbPosA))])
	
	local tbPosB = self.tbBigBossPos[tbRandom[2]]
	self:CreateFakeBoss(tbPosB[random(getn(tbPosB))])
	
	local tbPosC = self.tbBigBossPos[tbRandom[3]]
	self:CreateFakeBoss(tbPosC[random(getn(tbPosC))])
end

--������BOSS
function BJDG:CreateBigBoss(tbPos)
	basemission_CallNpc(self.tbBigBoss, self.nMapId, tbPos.x, tbPos.y)
end

--�����ٴ�BOSS
function BJDG:CreateFakeBoss(tbPos)
	basemission_CallNpc(self.tbFakeBigBoss, self.nMapId, tbPos.x, tbPos.y)
end

local StartBJDG = function()
	BJDG:new(BJDG.nMapId)
end

BJDG:AssociateMap(BJDG.nMapId)
AutoFunctions:Add(StartBJDG)

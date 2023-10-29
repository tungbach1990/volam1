Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\missions\\dungeon\\dungeon.lua")
Include("\\script\\missions\\dungeon\\dungeonmanager.lua")

if not sltDungeon then
	sltDungeon = tbDungeonClass:new({});
end

--����ģ����Ϣ,���ݲ����,ÿ��������һ��
sltDungeon.strDungeon = "Th� Luy�n ���ng";
sltDungeon.nMapTemplet = 925;
sltDungeon.nTimerInterval = 10;
sltDungeon.tbTrapPos = {51456,	102848};
sltDungeon.MONSTER_LIMIT = 100;
sltDungeon.TOWER_CALL_DISTANCE_LIMIT = 5;
sltDungeon.PREPARE_TIME = 60*3;
sltDungeon.SPAWN_INTERVAL = 2*18;
sltDungeon.CHECK_POS_INTERVAL = 1*18
sltDungeon.SPAWN_LEVEL_INTERVAL = 1*60*18;
sltDungeon.SERVER_FREE_NPC_LIMIT = 200; --������������ӵ�NPC��������200���ܿ�������
sltDungeon.MONSTER_TEMPLETE = 
{
	1559,
	1560,
	1561,
	1562,
	1563,
	1564,
	1565,
	1566,
	1567,
	1568,
}
sltDungeon.SHOOTER_TEMPLETE = 1557

sltDungeon.REGION_LIMIT = 2;

sltDungeon.tbWayPoint = 
{
	{1651,3168},
	{1628,3186},
	{1609,3179},
	{1597,3177},
	{1585,3198},
	{1582,3213},
	{1582,3231},
	{1592,3245},
	{1604,3259},
	{1617,3257},
	{1632,3234},
	{1632,3214},
	{1628,3186},
	{1651,3168},
}

sltDungeon.tbAwardList = 
{
	[1] = 
	{
		nMin = 100, 
		tbAward=
		{
			{szName="B�o r��ng B�ch Kim", tbProp={6,1,2322,1,0,0}, nBindState = -2},
		}
	},
	[2] = 
	{
		nMin = 90, 
		tbAward=
		{
			{szName="Ho�ng Kim B�o H�p", tbProp={6,1,2321,1,0,0}, nBindState = -2},
		}
	},
	[3] = 
	{
		nMin = 70, 
		tbAward=
		{
			{szName="Ng�n Ch� B�o H�p", tbProp={6,1,2320,1,0,0}, nBindState = -2},
		}
	},
	[4] = 
	{
		nMin = 50, 
		tbAward=
		{
			{szName="��ng Ch� B�o H�p", tbProp={6,1,2319,1,0,0}, nBindState = -2},
		}
	},
	[5] = 
	{
		nMin = 0, 
		tbAward=
		{
			{szName="M�c Ch� B�o H�p", tbProp={6,1,2318,1,0,0}, nBindState = -2},
		}
	},
}

--�����ױ�����,ÿ����������һ��
sltDungeon.tbData = {};

sltDungeon.tbData.tbTower = 
{
	{tbPos = {50528/32,102016/32}, nNpcIdx = 0,},
	{tbPos = {51168/32,102016/32}, nNpcIdx = 0,},
	{tbPos = {50880/32,102976/32}, nNpcIdx = 0,},
	{tbPos = {50720/32,104128/32}, nNpcIdx = 0,},
	{tbPos = {51616/32,101344/32}, nNpcIdx = 0,},
	{tbPos = {51488/32,103904/32}, nNpcIdx = 0,},
	{tbPos = {51840/32,102208/32}, nNpcIdx = 0,},
	{tbPos = {51904/32,103264/32}, nNpcIdx = 0,},
	{tbPos = {52000/32,104448/32}, nNpcIdx = 0,},
	{tbPos = {52480/32,102656/32}, nNpcIdx = 0,},
}

function sltDungeon.getDistance(tbPosOrigin, tbPosTarget)
	local nX	= tbPosOrigin[2] - tbPosTarget[2];
	local nY	= tbPosTarget[1] - tbPosOrigin[1];
	-- ����ľ��룬ȡ����
	local nDistance = floor(sqrt(nX*nX + nY*nY));
	
	return nDistance;
end

function sltDungeon:OnMonsterTimer(nInterval, nNpcIndex)
	local nX, nY,nMapId = GetNpcPos(nNpcIndex);
	local nRetInterval = nInterval;
	-- npc ��ʧ��
	if (nMapId == 0) then
		return 0;
	end
	
	nX = nX/32;
	nY = nY/32;

	nMapId = SubWorldIdx2ID(nMapId);
	
	--���NPC���Ǳ��ŵ�ͼ��
	if (nMapId ~= self.nDungeonId) then
		return 0;
	end
	
	local nNextPos = GetNpcParam(nNpcIndex, 1)

	if (nNextPos == nil or self.tbWayPoint[nNextPos] == nil) then
		nRetInterval = 0;
	else
		local nDistance = self.getDistance({nX, nY}, {self.tbWayPoint[nNextPos][1], self.tbWayPoint[nNextPos][2]});

		if (nDistance <= self.REGION_LIMIT) then --����
			nNextPos = nNextPos + 1;
			if (nNextPos > getn(self.tbWayPoint)) then
				DelNpc(nNpcIndex);
				nRetInterval = 0
				self.nFinishCount = self.nFinishCount + 1;
				RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "AddMonsterCount",1});
				--self.nMonsterOnStage = self.nMonsterOnStage - 1;
				
				--���һ������
				if (self.nFinishCount >= self.MONSTER_LIMIT) then
					self.bPrepareClose = 1;
					self.bBattleOver = 1;
					for i=1,getn(self.tbMember) do
						if (self.tbMember[i].bInDungeon == 1) then
							doFunByPlayer(self.tbMember[i].nIndex, Msg2Player, "T�m th�i ��t th�ch kh�ch n�y �� b� d�p lo�n b�i c�c h�, b�y gi� c� th� ��n tr��ng l�o Th� Luy�n ���ng �� nh�n th��ng.");
						end
					end
				end
				return nRetInterval;
		    end
			SetNpcParam(nNpcIndex, 1, nNextPos);
		end
		if (self.tbWayPoint[nNextPos] ~= nil) then
			NpcWalk(nNpcIndex, self.tbWayPoint[nNextPos][1], self.tbWayPoint[nNextPos][2]);
		else
			nRetInterval = 0;
	    end
	end
	
	return nRetInterval;
end

function sltDungeon:SpawnMonster(nInterval)
	WriteLog(format("[%s] in [%s] dungeon(%0.f) spwan monster timer. total count %d. finish count %d.", self.strOwner, "Th� Luy�n ���ng", self.nDungeonId, self.nSpawnCount, self.nFinishCount));

	local nRetInterval = nInterval;
	local nLevel = floor(self.nSpawnCount/10)+1;
	
	--if (self.bPause == 1 and self.nMonsterOnStage == 0) then
	--	self.bPause = 0;
	--	nRetInterval = self.SPAWN_LEVEL_INTERVAL
	--	for i = 1, getn(self.tbMember) do
	--		if (self.tbMember[i].bInDungeon == 1) then
	--			doFunByPlayer(self.tbMember[i].nIndex, Msg2Player, format("��һ���̿ͽ���<color=green>%d<color>��󹥵�",nRetInterval/18));
	--		end
	--	end
	--	return nRetInterval;
	--end
	
	if(self.bPause == 1) then
		return nRetInterval;
	end
	
	if (self.nSpawnCount < self.MONSTER_LIMIT) then
		--self.nMonsterOnStage = self.nMonsterOnStage + 1;
		self.nSpawnCount = self.nSpawnCount + 1;
		
		local nNpcIdx = AddNpcEx(self.MONSTER_TEMPLETE[nLevel], 95, random(1,5), SubWorldID2Idx(self.nDungeonId),1651*32,3168*32, 1, "Th�ch Kh�ch ", 0)
		
		-- ���NPCʧ���������
		if (nNpcIdx == nil or nNpcIdx <= 0) then
			self.nSpawnCount = self.nSpawnCount - 1;
			WriteLog(format("[%s] in [%s] dungeon(%0.f) spwan monster failed.", self.strOwner, "Th� Luy�n ���ng", self.nDungeonId));
			return self.SPAWN_INTERVAL;
		end
		
		WriteLog(format("[%s] [%s] in [%s] dungeon(%0.f) spwan monster(No.%d) npcidx=%d", GetLocalDate("%Y-%m-%d %H:%M:%S"), self.strOwner, "Th� Luy�n ���ng", self.nDungeonId, self.nSpawnCount, nNpcIdx));

		SetNpcScript(nNpcIdx, "\\script\\missions\\dungeon\\dungeons\\shiliantang\\chuangtangzei.lua");
		SetNpcActiveRegion(nNpcIdx, 1);
		SetNpcParam(nNpcIdx, 1, 2);
		SetNpcParam(nNpcIdx, 2, self.nDungeonId);
		SetNpcParam(nNpcIdx, 3, self.nSpawnCount);
		SetNpcTimer(nNpcIdx, self.CHECK_POS_INTERVAL)
		--local tbMonsterTimer = clone(tbTimerClass);
		--tbMonsterTimer.nDungeonId = self.nDungeonId;
		--tbMonsterTimer.nInterval = self.CHECK_POS_INTERVAL;	--֡
		--tbMonsterTimer.pFunction = self.OnMonsterTimer;
		--tbMonsterTimer.tbParam = {nNpcIdx}
		--tbMonsterTimer.nTimerId = tbTimerList:AddTimer(self.nDungeonId, tbMonsterTimer);

		--AddTimer(1 * 18, "OnMonsterTimer", nNpcIdx)
		
		NpcWalk(nNpcIdx, self.tbWayPoint[2][1], self.tbWayPoint[2][2]);
		
		if (nLevel ~= 10 and mod(self.nSpawnCount,10) == 0) then
			nRetInterval = self.SPAWN_LEVEL_INTERVAL;
			for i = 1, getn(self.tbMember) do
				if (self.tbMember[i].bInDungeon == 1) then
					doFunByPlayer(self.tbMember[i].nIndex, Msg2Player, format("��t th�ch kh�ch ti�p theo s� xu�t hi�n sau <color=green>%d<color> gi�y",nRetInterval/18));
				end
			end
			return nRetInterval;
		else
			if (mod(self.nSpawnCount,10) == 1) then
				for i = 1, getn(self.tbMember) do
					if (self.tbMember[i].bInDungeon == 1) then
						doFunByPlayer(self.tbMember[i].nIndex, Msg2Player, format("L�n t�n c�ng th� <color=green>%d<color>",nLevel));
					end
				end
			end
			nRetInterval = self.SPAWN_INTERVAL;
		end
		
		return nRetInterval;
	end
	
	return 0;
end

-- ����Ҫ����
function sltDungeon:OnEnterMap()
	local strName = GetName();

	if (self.strOwner ~= strName) then
		Talk(1,"","��y kh�ng ph�i <color=red>Th� Luy�n ���ng<color> do c�c h� m�!");
		return 0;
	end
	
	for i = 1, getn(self.tbMember) do
		if (self.tbMember[i].strName == strName) then
			self.tbMember[i].nIndex = PlayerIndex;
			
			if (self.tbMember[i].nKillMonster == nil) then
				self.tbMember[i].nKillMonster = 0;
			end
			
			if (self.tbMember[i].nMedal == nil) then
				self.tbMember[i].nMedal = 0;
			end
			
			if (self.tbMember[i].nCallTower == nil) then
				self.tbMember[i].nCallTower = 1;
				doFunByPlayer(self.tbMember[i].nIndex, Msg2Player, format("Nh�n ���c <color=green>%d<color> l�n c� h�i mi�n ph� tri�u t�p cung ti�n th�.", self.tbMember[i].nCallTower));
				RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "AddShooterCount",1});
			end
			
			-- ��¼������֮ǰ��λ��
			if (self.tbMember[i].tbLastPos == nil) then
				self.tbMember[i].tbLastPos = {};
			end
			
			local nMapId,nPosX16,nPosY16 = GetWorldPos();
			if (nMapId ~= self.nDungeonId) then
				self.tbMember[i].tbLastPos.nMapId = nMapId;
				self.tbMember[i].tbLastPos.nPosX16 = nPosX16; 
				self.tbMember[i].tbLastPos.nPosY16 = nPosY16;
			end
			
		end
	end

	NewWorld(self.nMapId, 1608, 3219)
	SetFightState(0);
	SetTaskTemp(200, 1);		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	ForbidChangePK(1);
	DisabledUseTownP(1);	--��ֹʹ�ûس̣�
	SetPKFlag(0);
	DisabledStall(1);	--��ֹ��̯
	ForbidEnmity(1);	--��ֹ��ɱ
	SetCurCamp(3);
	
	return 1;
end

function sltDungeon:OnLeaveMap()

	self:OnLeaveSetState();
	
	self:OnLeaveTrans();
	
	-- ���꽱����,�����˶����˸���,������رո���
	if (self.bCanClose == 1) then
		local bAnyOneIn = 0;
		for i=1,getn(self.tbMember) do
			if (self.tbMember[i].bInDungeon == 1) then
				bAnyOneIn = 1;
			end
		end
		
		if (bAnyOneIn ~= 1) then
			tbDungeonManager:CloseDungeon(self.nDungeonId);
		end
	end
	return 1;
end

--����뿪ʱ�������״̬Ĭ�ϲ���
function sltDungeon:OnLeaveSetState()

	SetFightState(0);
	SetTaskTemp(200, 0);		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
	ForbidChangePK(0);
	DisabledUseTownP(0);	--��ֹʹ�ûس̣�
	SetPKFlag(0);
	SetCurCamp(GetCamp());
	DisabledStall(0);
	ForbidEnmity(0);
end

--����뿪ʱ�������״̬Ĭ�ϴ���
function sltDungeon:OnLeaveTrans()

	-- Ĭ�Ͻ���Ҵ��ؽ�����֮ǰ��λ��
	local strName = GetName();
	local nMapId , nPosX, nPosY = 0, 0, 0;
	if (self.tbMember ~= nil) then
		for i = 1, getn(self.tbMember) do
			if (self.tbMember[i].strName == strName) then	
				if (self.tbMember[i].tbLastPos == nil or 
					self.tbMember[i].tbLastPos.nMapId == nil or
					self.tbMember[i].tbLastPos.nPosX16 == nil or
					self.tbMember[i].tbLastPos.nPosY16 == nil) then
					nMapId = 0;
					nPosX = 0;
					nPosY = 0;
				else
					nMapId = self.tbMember[i].tbLastPos.nMapId;
					nPosX = self.tbMember[i].tbLastPos.nPosX16;
					nPosY = self.tbMember[i].tbLastPos.nPosY16;
				end
				
				break;
			end
		end
	end
	
	if nMapId == 0 or nPosX == 0 or nPosY == 0 then
		nMapId = 11;
		nPosX = 3143;
		nPosY = 5065;
		WriteLog(format("[%s] cant find last position when [%s] enter the [%s]'s [%s] dungeon(id:[%0.f]).Transport to (11,3143,5065)", 
				GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, self.strOwner or "", self.strDungeon or "Th� Luy�n ���ng", self.nDungeonId or 0));
	end
	
	NewWorld(nMapId, nPosX, nPosY);
end

-- ���������Ƿ��ܿ�һ���µĸ���,������
function sltDungeon:CheckOpenDungeonServerLimit()
	local nFree = GetNpcFreeCount();
	if (nFree < self.SERVER_FREE_NPC_LIMIT) then
		return 0;
	end
	
	local bFreeMap = IsGSHaveFreeMap()
	
	if (bFreeMap ~= 1) then
		WriteLog(format("create [%s] dungeon failed because Game Server have no free map.current %s dungeon count is %d", self.strDungeon, self.strDungeon, getn(tbDungeonInfo:GetDungeonList(self.strDungeon))));
		return 0;
	end
	
	return 1;
end

function sltDungeon:OnDungeonOpen(tbDungeonData)
		-- ����ʣ��ʱ��
		self.nOpenMapId = SubWorldIdx2ID(SubWorld);
		self.nLifeTime = 5 * 60; --5����
		self.nIdelTime = 0;			-- ��ͼ����ʱ��
		self.bPrepareTime = 1;
		self.nSpawnCount = 0;
		self.nFinishCount = 0;
		self.bPause = 0;
		self.bStartLevel = 0;
		self.bBattleOver = 0;
		--self.nMonsterOnStage = 0;
		
		--��Ӵ���ʯ��
		local nnpcidx = AddNpc(309, 1, SubWorldID2Idx(self.nDungeonId), self.tbTrapPos[1], self.tbTrapPos[2],1, "Tr��ng l�o Th� Luy�n ���ng");
		SetNpcScript(nnpcidx, "\\script\\missions\\dungeon\\dungeons\\shiliantang\\zhanglao.lua");
		
		self.tbTimer = clone(tbTimerClass);
		self.tbTimer.nDungeonId = self.nDungeonId;
		self.tbTimer.nInterval = self.nTimerInterval*18;	--֡
		self.tbTimer.pFunction = self.OnTimer;
		self.tbTimer.nTimerId = tbTimerList:AddTimer(self.nDungeonId, self.tbTimer);
		
		if (self.tbTimer.nTimerId == nil or self.tbTimer.nTimerId <= 0) then
			WriteLog(format("[%s]\trole:%s\taccount:%s\tCant Add dungeon timer, open dungeon failed.",self.strDungeon, GetName(), GetAccount()));
			return 0;
		end
		
		if (tbDungeonData ~= nil) then
			if (type(tbDungeonData.nMonsterCount) == "number") then
				self.nSpawnCount = tbDungeonData.nMonsterCount;
				self.nFinishCount = tbDungeonData.nMonsterCount;
				if (self.nFinishCount >= self.MONSTER_LIMIT) then
					self.bPrepareClose = 1;
					self.bBattleOver = 1;
					self.bPrepareTime = 0;
				end
			end
			local tbMember = tbDungeonManager:GetMember(self.nDungeonId, self.strOwner);
			if (tbMember ~= nil) then
				if (type(tbDungeonData.nShooterCount) == "number") then
					tbMember.nCallTower = tbDungeonData.nShooterCount;
				end
				if (type(tbDungeonData.nMedalCount) == "number") then
					tbMember.nMedal = tbDungeonData.nMedalCount;
				end
				if (type(tbDungeonData.nKillCount) == "number") then
					tbMember.nKillMonster = tbDungeonData.nKillCount;
				end
				if (type(tbDungeonData.tbAwardMark) == "table" and tbDungeonData.tbAwardMark[self.strOwner] ~= nil) then
					tbMember.bAward = tbDungeonData.tbAwardMark[self.strOwner];
					if (tbMember.bAward) then
						self.bCanClose = 1;
					end
				end
			end
			Talk(1,"",format("L�n tr��c ng��i ��ng Ph� B�n kh�ng b�nh th��ng, b�y gi� l� ng��i ti�p t�c m� ."));
		else
			if ConsumeEquiproomItem(1, 6, 1, 2317, -1) ~= 1 then
				Talk(1,"","L�n tuy�n ch�n n�y c�c k� quan tr�ng, xin h�y xu�t tr�nh th� luy�n thi�p m�i c� th� tham gia");
				return 0;
			end
			AddStatData("shiliantiexiaohao_kaiqishiliantang", 1)	-- ��������һ��
		end
		return 1;
end

-- ����Ҫ����
function sltDungeon:OnTimer(nInterval)
	RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:DungeonBreath", {self.nMapTemplet, self.nDungeonId, self.strOwner});
	
	self.nTimerCount = self.nTimerCount + nInterval/18;
	
	for i = 1, getn(self.tbMember) do
		if (self.tbMember[i].bInDungeon == 1) then
			self.tbMember[i].nTime = self.tbMember[i].nTime + nInterval/18;
		end
	end
	
	if (self.bPrepareTime == 1 and (self.nTimerCount >= self.PREPARE_TIME or self.bSkipPrepare == 1)) then -- ��Ϊ��λ
		for i=1,getn(self.tbMember) do
			if (self.tbMember[i].bInDungeon == 1) then
				doFunByPlayer(self.tbMember[i].nIndex, Msg2Player, "Th� luy�n b�t ��u.");
			end
		end
		self.bPrepareTime = 0;
		
		-- ˢ�ּ�ʱ��
		self.tbMonsterTimer = clone(tbTimerClass);
		self.tbMonsterTimer.nDungeonId = self.nDungeonId;
		self.tbMonsterTimer.nInterval = self.SPAWN_INTERVAL;	--֡
		self.tbMonsterTimer.pFunction = self.SpawnMonster;
		self.tbMonsterTimer.nTimerId = tbTimerList:AddTimer(self.nDungeonId, self.tbMonsterTimer);
	end
	
	if (self.bPrepareTime == 1) then
		for i=1,getn(self.tbMember) do
			if (self.tbMember[i].bInDungeon == 1) then
				doFunByPlayer(self.tbMember[i].nIndex, Msg2Player, format("Th� luy�n s� b�t ��u sau %0.f gi�y", self.PREPARE_TIME - self.nTimerCount));
			end
		end	
	else
		if (self.bPrepareClose == 1) then
			self.nLifeTime = self.nLifeTime - nInterval/18;
			
			for i=1,getn(self.tbMember) do
				if (self.tbMember[i].bInDungeon == 1) then
					if (self.nLifeTime < 300 and self.nLifeTime > 0) then --��Ҫ�ر�֪ͨ
							doFunByPlayer(self.tbMember[i].nIndex, Msg2Player, format("B�n �� s� ��ng sau %0.f gi�y.", self.nLifeTime));
					end
				end
			end
		end
		
	end
	
	local bAnyOneIn = 0;
	for i=1,getn(self.tbMember) do
		if (self.tbMember[i].bInDungeon == 1) then
			bAnyOneIn = 1;
		end
	end
	
	if (bAnyOneIn ~= 1) then
		self.nIdelTime = self.nIdelTime + self.nTimerInterval;
		if (self.nIdelTime > 900) then --����15�����Զ��ر�
			--tbDungeonManager:CloseDungeon(self.nDungeonId);
		end
	else
		self.nIdelTime = 0;
	end
	
	if (self.nLifeTime <= 0) then
		--ʱ�䵽�رո���
		self.bCanClose = 0;
		tbDungeonManager:CloseDungeon(self.nDungeonId);
	end
	return nInterval;
end

function sltDungeon:OnDungeonClose()
	if (self.tbTimer ~= nil and self.tbTimer.nTimerId ~= nil) then
		tbTimerList:DelTimer(self.tbTimer.nTimerId);
	end
	
	if (self.tbMonsterTimer ~= nil and self.tbMonsterTimer.nTimerId ~= nil) then
		tbTimerList:DelTimer(self.tbMonsterTimer.nTimerId);
	end
end

function sltDungeon:CheckOwnerInDungeon()
	local tbDungeon = tbDungeonManager:GetMineDungeon(self.strDungeon, 1);
	local nMapId = SubWorldIdx2ID(SubWorld);
	if (tbDungeon == nil) then
		Talk(1,"","C�c h� v�n ch�a khai m� <color=red>Th� Luy�n ���ng<color>!");
		return nil;
	end
	if (nMapId ~= tbDungeon.nDungeonId) then
		Talk(1,"","C�c h� kh�ng � trong <color=red>Th� Luy�n ���ng<color>, ho�c ng��i m�<color=red>Th� Luy�n ���ng<color> kh�ng ph�i l� c�c h�, kh�ng th� d�ng thao t�c n�y!");
		return nil;
	end
	return 1;
end

function sltDungeon:MonsterDead(nNpcIndex)
	for i=1,getn(self.tbMember) do
		self.tbMember[i].nKillMonster = self.tbMember[i].nKillMonster + 1;
		self.tbMember[i].nMedal = self.tbMember[i].nMedal + 1;
		if (self.tbMember[i].bInDungeon == 1) then
			doFunByPlayer(self.tbMember[i].nIndex, Msg2Player, format("��y l�i ���c <color=green>%d<color> th�ch kh�ch.", self.tbMember[i].nKillMonster));
		end
		RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "AddkillCount",1});
		RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "AddMedalCount",1});
		RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "AddMonsterCount",1});
	end
	
	self.nFinishCount = self.nFinishCount + 1;
--	self.nMonsterOnStage = self.nMonsterOnStage - 1;
	
	--���һ������
	if (self.nFinishCount >= self.MONSTER_LIMIT) then
		self.bPrepareClose = 1;
		self.bBattleOver = 1;
		for i=1,getn(self.tbMember) do
			if (self.tbMember[i].bInDungeon == 1) then
				doFunByPlayer(self.tbMember[i].nIndex, Msg2Player, "T�m th�i ��t th�ch kh�ch n�y �� b� d�p lo�n b�i c�c h�, b�y gi� c� th� ��n tr��ng l�o Th� Luy�n ���ng �� nh�n th��ng.");
			end
		end
	end
end

function sltDungeon:CallTower()
	if (self:CheckOwnerInDungeon() == 1) then
		local strName = GetName();
		local tbMember = tbDungeonManager:GetMember(SubWorldIdx2ID(SubWorld), strName);
		local tbDungeon = tbDungeonManager:GetMineDungeon(self.strDungeon, 1);
		local mapId, x, y = GetWorldPos();
		local bFound = 0;
		local nNpcIdx = 0;
		local nTowerIdx = 0;
		
		for i=1,getn(tbDungeon.tbTower) do
			local nDistance = self.getDistance({x, y}, {tbDungeon.tbTower[i].tbPos[1], tbDungeon.tbTower[i].tbPos[2]});
			if (nDistance <= self.TOWER_CALL_DISTANCE_LIMIT) then
				nTowerIdx = i;
				bFound = 1;
				nNpcIdx = tbDungeon.tbTower[i].nNpcIdx;
				break;
			end
		end
		
		if (bFound == 0) then
			Talk(1,"","� ��y kh�ng th� tri�u t�p cung ti�n th�!");
			return
		end
		
		if (nNpcIdx ~= 0) then
			Talk(1,"","� ��y �� c� 1 cung ti�n th� r�i!");
			return
		end
		
		if (tbMember == nil or tbMember.nCallTower <= 0) then
			Talk(1,"","C�c h� h�t c� h�i g�i cung ti�n th�!");
			return
		end
				
		nNpcIdx = AddNpcEx(sltDungeon.SHOOTER_TEMPLETE, 95, random(1,5), SubWorldID2Idx(mapId),tbDungeon.tbTower[nTowerIdx].tbPos[1]*32,tbDungeon.tbTower[nTowerIdx].tbPos[2]*32, 1, "cung k� binh", 0);
		if(nNpcIdx == nil or nNpcIdx <= 0) then
			Talk(1,"","Tri�u h�i th�t b�i, xin h�y th� l�i!");
			return
		end
		tbMember.nCallTower = tbMember.nCallTower - 1;
		doFunByPlayer(tbMember.nIndex, Msg2Player, format("Hi�n t�i c�c h� c� <color=green>%d<color> c� h�i tri�u t�p cung ti�n th�", tbMember.nCallTower));
		tbDungeon.tbTower[nTowerIdx].nNpcIdx = nNpcIdx;
		WriteLog(format("[%s] [%s] in [%s] dungeon(%0.f) call tower. Left call chance %d", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, "Th� Luy�n ���ng", tbDungeon.nDungeonId, tbMember.nCallTower));
		SetNpcActiveRegion(nNpcIdx, 1);
	end
end

function sltDungeon:CallBackTower()
	if (self:CheckOwnerInDungeon() == 1) then
		local strName = GetName();
		local tbMember = tbDungeonManager:GetMember(SubWorldIdx2ID(SubWorld), strName);
		local tbDungeon = tbDungeonManager:GetMineDungeon(self.strDungeon, 1);
		local mapId, x, y = GetWorldPos();
		local bFound = 0;
		local nNpcIdx = 0;
		local nTowerIdx = 0;
		
		for i=1,getn(tbDungeon.tbTower) do
			local nDistance = self.getDistance({x, y}, {tbDungeon.tbTower[i].tbPos[1], tbDungeon.tbTower[i].tbPos[2]});
			if (nDistance <= self.TOWER_CALL_DISTANCE_LIMIT) then
				nTowerIdx = i;
				bFound = 1;
				nNpcIdx = tbDungeon.tbTower[i].nNpcIdx;
				break;
			end
		end
		
		if (bFound == 0 or nNpcIdx == 0) then
			Talk(1,"","G�n ��y kh�ng c� cung ti�n th� c� th� tri�u t�p!");
			return
		end
		
		if (tbMember == nil) then
			Talk(1,"","Ng��i kh�ng th� tri�u t�p cung ti�n th�!");
			return
		end
		
		if (tbMember.nMedal < 2) then
			Talk(1,"","Hi�n nay c�c h� kh�ng �� 2 huy ch��ng th� luy�n!");
			return
		end
		
		tbMember.nMedal = tbMember.nMedal - 2;
		tbMember.nCallTower = tbMember.nCallTower + 1;
		doFunByPlayer(tbMember.nIndex, Msg2Player, format("Hi�n t�i c�c h� c� <color=green>%d<color> huy ch��ng th� luy�n ���ng.", tbMember.nMedal));
		doFunByPlayer(tbMember.nIndex, Msg2Player, format("Hi�n t�i c�c h� c� <color=green>%d<color> c� h�i tri�u t�p cung ti�n th�", tbMember.nCallTower));

		tbDungeon.tbTower[nTowerIdx].nNpcIdx = 0;
		DelNpc(nNpcIdx);
		WriteLog(format("[%s] [%s] in [%s] dungeon(%0.f) call back tower. Left call chance %d", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, "Th� Luy�n ���ng", tbDungeon.nDungeonId, tbMember.nCallTower));
	end
end

function sltDungeon:AddCallTowerChance(nCount)
	if (self:CheckOwnerInDungeon() == 1) then
		local strName = GetName();
		local tbMember = tbDungeonManager:GetMember(SubWorldIdx2ID(SubWorld), strName);
		if (tbMember ~= nil) then
			tbMember.nCallTower = tbMember.nCallTower + nCount;
			doFunByPlayer(tbMember.nIndex, Msg2Player, format("Hi�n t�i c�c h� c� <color=green>%d<color> c� h�i tri�u t�p cung ti�n th�", tbMember.nCallTower));
			RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "AddShooterCount",nCount});
		end
	end
end

function sltDungeon:GetMedal()
	local strName = GetName();
	local tbMember = tbDungeonManager:GetMember(self.nDungeonId, strName);
	if (tbMember ~= nil) then
		return tbMember.nMedal;
	end
	
	return 0;
end

function sltDungeon:GetKillCount()
	local strName = GetName();
	local tbMember = tbDungeonManager:GetMember(self.nDungeonId, strName);
	if (tbMember ~= nil) then
		return tbMember.nKillMonster;
	end
	
	return 0;
end

function sltDungeon:AddMedal(nCount)
	if (self:CheckOwnerInDungeon() == 1) then
		local strName = GetName();
		local tbMember = tbDungeonManager:GetMember(SubWorldIdx2ID(SubWorld), strName);
		if (tbMember ~= nil) then
			tbMember.nMedal = tbMember.nMedal + nCount;
			doFunByPlayer(tbMember.nIndex, Msg2Player, format("Hi�n t�i c�c h� c� <color=green>%d<color> huy ch��ng th� luy�n ���ng.", tbMember.nMedal));
			RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "AddMedalCount",nCount});
		end
	end
end

function sltDungeon:AddKill(nCount)
	if (self:CheckOwnerInDungeon() == 1) then
		local strName = GetName();
		local tbMember = tbDungeonManager:GetMember(SubWorldIdx2ID(SubWorld), strName);
		if (tbMember ~= nil) then
			tbMember.nKillMonster = tbMember.nKillMonster + nCount;
			doFunByPlayer(tbMember.nIndex, Msg2Player, format("��y l�i ���c <color=green>%d<color> th�ch kh�ch.", tbMember.nKillMonster));
			RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "AddkillCount",nCount});
		end
	end
end

function sltDungeon:SetKill(nCount)
	if (self:CheckOwnerInDungeon() == 1) then
		local strName = GetName();
		local tbMember = tbDungeonManager:GetMember(SubWorldIdx2ID(SubWorld), strName);
		if (tbMember ~= nil) then
			tbMember.nKillMonster = nCount;
			doFunByPlayer(tbMember.nIndex, Msg2Player, format("��y l�i ���c <color=green>%d<color> th�ch kh�ch.", tbMember.nKillMonster));
			RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "SetkillCount",nCount});
		end
	end
end

function sltDungeon:SetAward(bAward)
	if (self:CheckOwnerInDungeon() == 1) then
		local strName = GetName();
		local tbMember = tbDungeonManager:GetMember(SubWorldIdx2ID(SubWorld), strName);
		if (tbMember ~= nil) then
			tbMember.bAward = bAward;
			RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, SubWorldIdx2ID(SubWorld), strName, "SetAwardMark",{strName,1}});
		end
	end
end

function sltDungeon:BuyChance()
	local strName = GetName();
	local tbMember = tbDungeonManager:GetMember(self.nDungeonId, strName);

	if (tbMember ~= nil) then	
		if (tbMember.nMedal < 5) then
			Talk(1,"","Hi�n t�i c�c h� kh�ng �� 5 huy ch��ng th� luy�n!");
			return 0;
		end
		
		local nEnergy = GetEnergy();
		
		if nEnergy == nil or nEnergy < 100 then
			Talk(1,"",format("�i�m tinh l�c kh�ng �� %d!",100));
			return 0;
		end
		
		if (ReduceEnergy(100) ~= 1) then
			Talk(1,"",format("�i�m tinh l�c kh�ng �� %d!",100));
			return 0;
		end
		
		WriteLog(format("[%s] [%s] in [%s] dungeon Consume %d Energy buy 1 shooter.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, "Th� Luy�n ���ng", 100));
		
		tbMember.nMedal = tbMember.nMedal - 5;
		tbMember.nCallTower = tbMember.nCallTower + 1;
		doFunByPlayer(tbMember.nIndex, Msg2Player, format("Hi�n t�i c�c h� c� <color=green>%d<color> huy ch��ng th� luy�n ���ng.", tbMember.nMedal));
		doFunByPlayer(tbMember.nIndex, Msg2Player, format("Hi�n t�i c�c h� c� <color=green>%d<color> c� h�i tri�u t�p cung ti�n th�", tbMember.nCallTower));
		RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "AddShooterCount",1});
		RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "AddMedalCount",-5});
		return 1;
	end
	
	return 0;
end

function sltDungeon:IsBattleOver()
	if (self.bBattleOver == 1) then
		return 1;
	end
	return 0;
end

function sltDungeon:SetBattleOver(bOver)
	if (self:CheckOwnerInDungeon() == 1) then
		local tbDungeon = tbDungeonManager:GetMineDungeon(self.strDungeon, 1);
		if (tbDungeon ~= nil) then
			tbDungeon.bBattleOver = bOver;
		end
	end
end

function sltDungeon:IsPrepareTime()
	if (self.bPrepareTime == 1) then
		return 1;
	end
	return 0;
end

function sltDungeon:GetAward()
	if (self:IsBattleOver() ~= 1) then
		Talk(1,"","C�c ��t t�n c�ng v�n ch�a k�t th�c, hi�n t�i kh�ng th� nh�n th��ng!");
		return 0;
	end
	
	local strName = GetName();
	local tbMember = tbDungeonManager:GetMember(self.nDungeonId, strName);
	local tbDungeon = tbDungeonManager:GetMineDungeon(self.strDungeon, 1);
	
	if (tbMember ~= nil) then
		if (tbMember.bAward == 1) then
			Talk(1,"","Ng��i �� nh�n th��ng r�i m�.");
			return 0;
		end
		
		local nCallChance = 0;
		
		for i=1,getn(tbDungeon.tbTower) do
			if (tbDungeon.tbTower[i].nNpcIdx ~= 0) then
				nCallChance = nCallChance + 1;
			end
		end
		
		if (PlayerFunLib:CheckFreeBagCell(1, "default") == 1) then
			for i=1,getn(self.tbAwardList) do
				if (tbMember.nKillMonster >= self.tbAwardList[i].nMin) then
					tbAwardTemplet:GiveAwardByList(self.tbAwardList[i].tbAward, "Th� Luy�n ���ng");
					tbMember.bAward = 1;
					tbDungeon.bCanClose = 1;
					nCallChance = nCallChance + tbMember.nCallTower;
					WriteLog(format("[%s] [%s] in [%s] dungeon get award. call shooter chance %d, kill monster %d", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, "Th� Luy�n ���ng", nCallChance, tbMember.nKillMonster));
					RemoteExc("\\script\\mission\\dungeon\\datamanager.lua", "tbDDManager:CallFun", {self.nMapTemplet, self.nDungeonId, self.strOwner, "SetAwardMark",{strName,1}});
					return 1;
				end
			end
		end
	end
	
	return 0;
end

function sltDungeon:SkipPrepare()
	if (self:CheckOwnerInDungeon() == 1) then
		local tbDungeon = tbDungeonManager:GetMineDungeon(self.strDungeon, 1);
		if (tbDungeon.bPrepareTime == 1) then
			self.bSkipPrepare = 1;
			self:OnTimer(0);
		end
	end
end

function sltDungeon:Pause(bPause)
	if (self:CheckOwnerInDungeon() == 1) then
		local tbDungeon = tbDungeonManager:GetMineDungeon(self.strDungeon, 1);
		self.bPause = bPause;
	end
end

function sltDungeon:CloseSlt()
	if (self:CheckOwnerInDungeon() == 1) then
		local tbDungeon = tbDungeonManager:GetMineDungeon(self.strDungeon, 1);
		tbDungeonManager:CloseDungeon(tbDungeon.nDungeonId);
	end
end

function sltDungeon:GetSltId()
	if (self:CheckOwnerInDungeon() == 1) then
		local tbDungeon = tbDungeonManager:GetMineDungeon(self.strDungeon, 1);
		return tbDungeon.nDungeonId;
	end
end
-- ע�ḱ��ģ��
tbDungeonManager:RegDungeon(sltDungeon);
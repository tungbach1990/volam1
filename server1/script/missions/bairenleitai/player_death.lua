-- ====================== �ļ���Ϣ ======================

-- ������Ե������½�� - ������̨��ɫ����
-- �ļ�������player_death.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2011-04-26 16:50:30

-- ��NPCɱ��
-- ��Playerɱ��
-- 	.����������
-- 	.��������ս��
-- ======================================================
Include("\\script\\missions\\bairenleitai\\hundred_arena.lua");

function OnDeath(Launcher)
	local nKilledIndex = PlayerIndex;
	local szKilledName = CallPlayerFunction(nKilledIndex, GetName);
	local szKillerName = CallPlayerFunction(nKilledIndex, GetName);
	local ArenaID = HundredArena.tbPlayerList[szKilledName].nArenaId;
	local nRight = HundredArena.tbPlayerList[szKilledName].nRight;
	SetCurCamp(GetCamp());
	
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	
	if (nKillerIndex <= 0) then
		print(Launcher, GetNpcName(Launcher));
		DelNpc(Launcher);
		HundredArena.tbArenaList[ArenaID]:PlayerDeath(3);		-- ��NPCɱ��
	else
	
		if (nRight == 1) then
			HundredArena.tbArenaList[ArenaID]:PlayerDeath(2);		-- ��ս��ʤ��
		else
			HundredArena.tbArenaList[ArenaID]:PlayerDeath(1);		-- ����ʤ��
		end
	end
	
	--Modified by DinhHQ - 20110714
	ST_StopDamageCounter();
	SetDeathScript("");
	DisabledUseTownP(0)	-- ���ԻسǷ�
	-- SetLogoutRV(0);	-- ֻ���������뿪ʱ ������Ϊ0
	DisabledStall(0)	-- ���԰�̯
	SetFightState(0)	-- ��ս��
	SetCurCamp(GetCamp());
	
	SetRevPos(GetPlayerRev())
	SetPKFlag(0);		
	self:DelPlayer(PlayerIndex)
	local nMapId = GetTask(TSK_LEAVERMAPID);
	local nX = GetTask(TSK_LEAVERPOSX);
	local nY = GetTask(TSK_LEAVERPOSY);
	NewWorld(nMapId, nX, nY);
end

-- ====================== �ļ���Ϣ ======================

-- ������Ե������½�� - ������̨NPC����
-- �ļ�������npc_death.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2011-04-24 15:34:08

-- ======================================================

Include("\\script\\missions\\bairenleitai\\hundred_arena.lua");

-- ���ĸ���̨�� -- > ����������
-- �ǵڼ��ص�
-- 
-- GetNpcKind(nNpcIndex)

function OnDeath(nNpcIndex)
	
	if PlayerIndex <= 0 then
		-- ������
		print("HundredArenaNPC Killed By NoOne!!");
		return
	end
	
	local nArenaID = ArenaNpc:GetNpcArena(nNpcIndex);
	if (HundredArena.tbArenaList[nArenaID]) then
		HundredArena.tbArenaList[nArenaID]:NpcDeath();
	end
	
end

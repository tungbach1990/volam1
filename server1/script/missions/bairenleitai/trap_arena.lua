-- ====================== �ļ���Ϣ ======================

-- ������Ե������½�� - ��̨Trap
-- �ļ�������trap_arena.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2011-04-24 17:22:25

-- ======================================================


function main(index)
	--HundredArena.tbFieldList[index]:InTrap();
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:InTrap", index)	
end

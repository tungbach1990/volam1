-- �ļ�������npctoolitem.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-18 10:42:54
--��������npc
Include ("\\script\\lib\\common.lua")
Include("\\script\\missions\\racegame\\racegame.lua")
function main()
	local nNpcIndex = GetLastDiagNpc();
	local nCount	= getn(racegame_tbMission.tbItemList)
	local nRandId	= random(1, nCount)
	
	local tbItem	= racegame_tbMission.tbItemList[nRandId]
	AddItem(unpack(tbItem.tbProp))
	Msg2Player(format("Nh�n ���c 1 <color=yellow>%s<color>", tbItem.szName))
	DelNpc(nNpcIndex);
end

function add_wulinnpc_2nd()
	oldSubWorld = SubWorld
	n_idx = SubWorldID2Idx(176)
	if (n_idx >= 0) then
		local npcindex = AddNpc(308, 1, n_idx, 1623*32, 3233*32, 1, "���ִ���Ա");
		SetNpcScript(npcindex, "\\script\\event\\wulin_2nd\\master.lua")
	end
end
Include("\\script\\lib\\droptemplet.lua")

function OnDeath(nNpcIndex)
	
	local tbAward = {
		{szName = "C�m nang thay ��i tr�i ��t", tbProp = {6, 1, 1781 , 1, 0 ,0}, nRate = 100, tbParam = {60}},
	}
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "Ti�t tr�ng c�y 2011, M�c Kh�ch r�i ra", 1)
end

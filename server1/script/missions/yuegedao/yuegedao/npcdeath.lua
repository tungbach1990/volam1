Include("\\script\\lib\\awardtemplet.lua")

function OnDeath(nNpcIndex)
	local tbAwardgive = {
		{szName = "�i�m kinh nghi�m", nExp = 5e5},
		{szName = "H� m�ch ��n", tbProp = {6, 1, 3203 , 0, 0 ,0}, nCount=100},
		{szName = "��i h� m�ch ��n", tbProp = {6, 1, 4418 , 0, 0 ,0}, nCount=1},
	}
	tbAwardTemplet:GiveAwardByList(tbAwardgive, "Nvu Nguy�t Ca ��o, KillBossExp")
end

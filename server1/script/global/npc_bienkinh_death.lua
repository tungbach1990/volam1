--Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\awardtemplet.lua")

function OnDeath(nNpcIndex)
	--local tbAward = {
		--{szName = "Ch�n nguy�n ��n", tbProp = {6, 1, 4804 , 0, 0 ,0}, nRate = 20, nCount=1},
		--{szName = "H� m�ch ��n", tbProp = {6, 1, 3203 , 0, 0 ,0}, nRate = 50, nCount=2},
		--{szName = "��i h� m�ch ��n", tbProp = {6, 1, 4418 , 0, 0 ,0}, nRate = 80, nCount=1},
	--}
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "c�a bi�n kinh", 1)
	--local tbExpAward = {szName = "�i�m Kinh Nghi�m", nExp = 10e6}
	--tbAwardTemplet:Give(tbExpAward, 1, {"Nhi�m v� reset kinh m�ch", "KillBossExp"})
	local tbAwardgive = {
		{szName = "�i�m Kinh Nghi�m", nExp = 5e6},
		{szName = "Ch�n nguy�n ��n", tbProp = {6, 1, 4804 , 0, 0 ,0}, },
		{szName = "H� m�ch ��n", tbProp = {6, 1, 3203 , 0, 0 ,0}, nCount=50},
		--{szName = "��i h� m�ch ��n", tbProp = {6, 1, 4418 , 0, 0 ,0}, nCount=1},
	}
	tbAwardTemplet:GiveAwardByList(tbAwardgive, "c�a bi�n kinh, KillBossExp")
end
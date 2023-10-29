Include("\\script\\missions\\datusha\\datusha.lua")
Include("\\script\\lib\\awardtemplet.lua")
function main()
	local tbEgg = {szName="Tr�ng nhi�u m�u may m�n", tbProp={6, 1, 1714, 1, 0, 0}, nCount = 10, nExpiredTime = 30}
	local pDungeon = DungeonList[MAP_ID]
	if not pDungeon then
		return
	end
	local pData = pDungeon.tbPlayer[GetName()]
	if not pData then
		return
	end
	if CalcFreeItemCellCount() < 1 then
		return Talk(1, "", "Xin h�y s�p x�p l�i h�nh trang")
	end
	if not pData.bIsGetEgg then
		tbAwardTemplet:Give(tbEgg, 1, {"Lo�n Chi�n C�u Ch�u C�c","Nh�n Tr�ng May M�n"})
		pData.bIsGetEgg = 1
	else
		Talk(1, "", "Ng��i �� nh�n ph�n th��ng r�i")
	end	
end

function OnCancel()
	
end
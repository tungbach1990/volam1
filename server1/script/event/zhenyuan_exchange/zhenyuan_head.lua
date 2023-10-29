Include("\\script\\lib\\awardtemplet.lua")

local szPrompt_bag = "Xin h�y ki�m tra kh�ng gian h�nh trang v�n c�n �� � tr�ng."
local szPrompt_exp = "�i�m kinh nghi�m hi�n t�i c�a ��i hi�p kh�ng �� �� ��i s� l��ng Ch�n Nguy�n nhi�u nh� v�y."
local tbAwardItem = {tbProp={6,1,30227,1,0,0},}
nMaxNum = 999
local tbExpConsume = {
	[0]=1000000, 
	[1]=1000000, 
	[2]=1000000,
	[3]=2000000, 
	[4]=3000000, 
	[5]=4000000,
}

function Zhenyuan_award(nAvailExp, nCount)
	local nReduceExp = %tbExpConsume[ST_GetTransLifeCount()] * nCount
	if nAvailExp>=nReduceExp then
		if CalcFreeItemCellCount() >= nCount then
			ReduceOwnExp(nReduceExp)
			tbAwardTemplet:Give(%tbAwardItem, nCount, {"zhenyuandan"})
		else
			Msg2Player(%szPrompt_bag)
		end
	else
		Msg2Player(%szPrompt_exp)
	end
end
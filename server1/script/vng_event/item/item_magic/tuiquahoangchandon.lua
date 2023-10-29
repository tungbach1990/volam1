Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

local tbAward = {szName="Ho�ng Ch�n ��n",tbProp={6,1,2264,6,0,0},nCount=37}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 40
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:Give(%tbAward,1, {"SuDungTuiQua","HoangChanDon"})
	return 0
end
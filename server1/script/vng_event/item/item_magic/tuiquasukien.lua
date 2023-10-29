Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

local tbAward = 
{
	{szName = "�i�m Kinh Nghi�m", nExp=800e6},
	{szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=200,nBindState=-2},
	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=2000,nBindState=-2},
	{szName="Huy�t Long ��ng C�p 6",tbProp={6,1,30289,6,0,0},nCount=20,nBindState=-2},
	{szName="Huy�t Long ��ng C�p 9",tbProp={6,1,30289,9,0,0},nCount=20,nBindState=-2},
	{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nBindState=-2},
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 8
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nCount, nWidth, nHeight))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward, "SuDungTuiQuaSuKien", 1)
	return 0
end
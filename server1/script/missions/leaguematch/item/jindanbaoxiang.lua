Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	{szName="Kim ��n Ch�n Kinh", tbProp={6, 1, 2217, 1, 0, 0}, nExpiredTime = 10080},
	{szName="H�ng �nh B�o R��ng", tbProp={6, 1, 2218, 1, 0, 0} , nBindState = -2},
}
function main()
	
	
	if  CountFreeRoomByWH(1, 1, 1) < 1 then
		Talk(1, "", format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", 1, 1, 1))
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(%tbItem, "jindanbaoxiang")
	
end
Include("\\script\\lib\\awardtemplet.lua")
local tbItem = 
{
	{szName="[Ho�n M�] H�ng �nh Tr�m Vi�n V�n T�y", nQuality=1, tbProp={0, 536}, nExpiredTime = 86400, nBindState = -2},
	{szName="[Ho�n M�] H�ng �nh Ki�m Qua T�y Ph��ng", nQuality=1, tbProp={0, 537}, nExpiredTime = 86400, nBindState = -2},
	{szName="[Ho�n M�] H�ng �nh M�c T�c T��ng Vong", nQuality=1, tbProp={0, 538}, nExpiredTime = 86400, nBindState = -2},
	{szName="[Ho�n M�] H�ng �nh H�ng T� Chi�u", nQuality=1, tbProp={0, 539}, nExpiredTime = 86400, nBindState = -2},
}
function main()
	
	if  CountFreeRoomByWH(2, 5, 1) < 1 then
		Talk(1, "", format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", 1, 2, 5))
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(%tbItem, "hongying baoxiang")
	
end
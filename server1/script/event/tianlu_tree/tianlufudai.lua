-- ��»����
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
IncludeLib("ITEM")
local tbAwardItem = {tbProp={6,1,3269,1,0,0}, nExpiredTime=43200}
local nAwardCount = 5

function main(nItemIndex)
--	local nExPiredTime = ITEM_GetExpiredTime(nItemIndex)
--	local nLeftTime = nExPiredTime - GetCurServerTime()
--	if nExPiredTime ~= 0 and nLeftTime <= 60 then
--		Msg2Player("V�t ph�m �� qu� h�n s� d�ng")
--		return 0
--	end
	if CalcFreeItemCellCount() < 5 then
		CreateTaskSay({"��i hi�p ng��i h�y s�p x�p l�i h�nh trang! �t nh�t c�n 5 � tr�ng!",  "���c r�i./Cancel",})
		return 1
	end
	--nLeftTime = floor((nLeftTime)/60);
	tbAwardTemplet:Give(%tbAwardItem, %nAwardCount, {"PlantTrees", "TianlufudaiAward"})
	return 0
end

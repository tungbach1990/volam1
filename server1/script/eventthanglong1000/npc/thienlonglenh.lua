Include("\\script\\lib\\awardtemplet.lua")
--Include("\\script\\EventThangLong1000\\head.lua")
tbTTLDai= 
{
	{szName = "Th�ng Thi�n L�nh(��i)", tbProp = {6,1, 30051,1,0,0}, nExpiredTime = 20101025, nCount = 2},
}

function main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate > nItemData then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end

	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "H�nh trang kh�ng �� 5 � tr�ng.");
			return 1
	end
	tbAwardTemplet:GiveAwardByList(tbTTLDai, "Event 1000 N�m Th�ng Long, Use Th�ng Long L�nh");
	Msg2Player("��i hi�p nh�n 2 Th�ng Thi�n L�nh (��i)")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N�m Th�ng Long"..GetAccount().."\t"..GetName().."\t".."S� d�ng th�nh c�ng Thi�n Long L�nh ")
end

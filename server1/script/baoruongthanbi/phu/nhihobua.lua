Include("\\script\\lib\\awardtemplet.lua")
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	if (CalcFreeItemCellCount() < 5) then
		Talk(1,"","H�nh trang kh�ng �� 5 � tr�ng")
		return 1
	end
	for i=1, 4 do
		local ItemIndex = AddItem(6,1,30038,1,0,0)
		ITEM_SetExpiredTime(ItemIndex, 10080);
		SyncItem(ItemIndex);
	end
	Msg2Player("B�n nh�n ���c 4  Nh� H� B�a")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."M� Nh� H� B�a L� Bao nh�n ���c 4 Nh� H� B�a ")
	
end
Include("\\script\\lib\\awardtemplet.lua")
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	if (CalcFreeItemCellCount() < 3) then
		Talk(1,"","H�nh trang kh�ng �� 3 � tr�ng")
		return 1
	end
	for i=1, 2 do
		local ItemIndex = AddItem(6,1,30041,1,0,0)
		ITEM_SetExpiredTime(ItemIndex, 10080);
		SyncItem(ItemIndex);
	end
	Msg2Player("B�n nh�n ���c 2 ��a Linh Ph�")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."M� ��i Linh Ph� L� Bao nh�n ���c 2 ��a Linh Ph� ")
	
end
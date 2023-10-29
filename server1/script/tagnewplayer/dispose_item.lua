function DisposeItem()
	GiveItemUI("H�y v�t ph�m", "��i hi�p h�y c�n tr�ng trong vi�c h�y v�t ph�m!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "M�i l�n ch� c� th� h�y ���c m�t v�t ph�m!!");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	
	if (nBindState ~= -2) then
		Talk(1, "", "V�t ph�m c�n h�y ph�i l� v�t ph�m kh�a v�nh vi�n!");
		return
	end
	local strItem = GetItemName(nItemIndex)
	RemoveItemByIndex(nItemIndex)
	Talk(1, "", "��i hi�p c� th� s�p x�p l�i r��ng ch�a �� r�i!");
	Msg2Player("��i hi�p v�a h�y v�t ph�m th�nh c�ng")
	WriteLog(date("%Y%m%d %H%M%S").."\t".." H�y item ABHKLB "..GetAccount().."\t"..GetName().."\t".." Hu� item "..strItem)
end

function OnCancel()

end


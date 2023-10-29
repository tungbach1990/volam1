Include("\\script\\tagnewplayer\\func_check.lua");
function GetItemAnBang()
	if (CheckObject() < 1) then
		Talk(1, "", "Xin h�y ki�m tra l�i �i�u ki�n tham gia.");
		return
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang) ~= 1) then
			Talk(1, "", "Ph�n th��ng n�y ch� nh�n 1 l�n !");
			return
	end
	if CalcFreeItemCellCount() < 60 then
			Talk(1, "", "H�nh trang kh�ng �� 60 � tr�ng.");
			return
	end
	SetBit2GetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang, 1)
	-- add chieu da ngoc su tu
		local ndx = AddItem(0,10,5,10,0,0)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("B�n nh�n ���c "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."nh�n ���c AB "..strItem)
	-- An bang bang tinh thach h�ng li�n
		local ndx = AddGoldItem(0,164)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("B�n nh�n ���c "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."nh�n ���c AB "..strItem)
	-- add item an bang cuc hoa thach chi hoan
		local ndx = AddGoldItem(0,165)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("B�n nh�n ���c "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."nh�n ���c AB "..strItem)
	-- an bang dien hoang thach ngoc boi
		local ndx = AddGoldItem(0,166)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("B�n nh�n ���c "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."nh�n ���c AB "..strItem)
	-- an bang ke huyet thach gioi chi
		local ndx = AddGoldItem(0,167)
		SetItemBindState(ndx, -2)
		SyncItem(ndx);
		local strItem = GetItemName(ndx)
		Msg2Player("B�n nh�n ���c "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."An Bang Ho�ng Kim L�nh"..GetAccount().."\t"..GetName().."\t".."nh�n ���c AB "..strItem)
end
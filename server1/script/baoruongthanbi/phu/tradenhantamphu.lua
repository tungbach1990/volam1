function TradeNhanTamPhu_main()
	 AskClientForNumber("DoTaskYes_main",1,20,"<#>Nh�p s� l��ng c�n mua")
end

function DoTaskYes_main(nCount)
	if (nCount == 0 or nCount == nil) then
		nCount = 1
	end
	local nSumMoney = nCount * 200000
	if (CalcFreeItemCellCount() < nCount +2) then
		Talk(1,"",format("H�nh trang kh�ng �� %d � tr�ng", nCount + 2))
		return
	end
	if (GetCash() < nSumMoney ) then
		Talk(1,"","Kh�ng �� ng�n l��ng, Xin ��i hi�p ki�m tra l�i !")
		return
	end
	if (Pay(nSumMoney)==1) then
		for i=1, nCount do
			local ItemIndex = AddItem(6,1,30040,1,0,0)
			ITEM_SetExpiredTime(ItemIndex, 10080);
			SyncItem(ItemIndex);
			Msg2Player("B�n nh�n ���c  Nh�n T�m Ph�")
		end
		WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Mua Nh�nT�m Ph� s� l��ng "..nCount)
	else
		WriteLog(date("%Y%m%d %H%M%S").."\t".."B�o R��ng Th�n B�"..GetAccount().."\t"..GetName().."\t".."Mua Nh�nT�m Ph� Th�t B�i, s� l��ng "..nCount)
	end
end
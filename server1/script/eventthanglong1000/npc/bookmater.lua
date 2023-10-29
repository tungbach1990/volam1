Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\EventThangLong1000\\npc\\exchangitem\\exchangeitem.lua")
Include("\\script\\vng_event\\event_thang_long\\Event_1000_ThangLong.lua") --1000 nam Thang Long
Include("\\script\\EventThangLong1000\\head.lua")
function main()
	if (Event1000_ActiveDate() ~= 1) then
 		Talk(1,"","Ho�t ��ng 1000 n�m Th�ng Long �� k�t th�c r�i !")
 		return
 	end
	local tbOpp = {}
	local str = "<#> Xin h�i, Ta c� th� gi�p g� cho ��i hi�p ?";
	--tinsert(tbOpp,"Ta mu�n giao n�p c� v�t/DeliverPro");
	tinsert(tbOpp,"Ta ��n gh�p v�t ph�m/Event1000_ExChangeItem_main");
	tinsert(tbOpp,"Ta ��n mua Th�ng Thi�n L�nh (trung)/ShopTrungLong");
	
	local nHour = tonumber(GetLocalDate("%H%M"))
	if (nHour >= 1200 and nHour <= 1400) then
		tinsert(tbOpp, "Ta mu�n nh�n ph�n th��ng 1000 n�m Th�ng Long/#EventThangLong:GetAward(1)")
	end
	
	if (nHour >= 2000 and nHour <= 2200) then
		tinsert(tbOpp, "Ta mu�n nh�n ph�n th��ng 1000 n�m Th�ng Long/#EventThangLong:GetAward(2)")
	end
	tinsert(tbOpp, "Ta mu�n giao n�p 10 C�ng Tr�ng L�nh/#EventThangLong:GiveItem()")
	tinsert(tbOpp, "Ta mu�n xem s� l��ng C�ng Tr�ng L�nh �� giao n�p/#EventThangLong:ViewTotalDragonItem()")	
	
	
	
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end


function ShopTrungLong()
	AskClientForNumber("GetTrungLong",1,50,"<#>Nh�p s� l��ng c�n mua")
end
function GetTrungLong(nCount)
	local nSum = nCount * 50000
	if (GetCash() < nSum) then
		Talk(1,"","��i hi�p kh�ng �� ng�n l��ng, xin ki�m tra l�i !")
		return
	end
	Pay(nSum)
	local nItemIndex = AddStackItem(nCount, 6, 1, 30050, 1, 0, 0)
	ITEM_SetExpiredTime(nItemIndex, 20101025);
	SyncItem(nItemIndex)
	Msg2Player(format("��i hi�p nh�n ���c %d Th�ng Thi�n L�nh (trung)", nCount))
	WriteLog(format(date("%Y%m%d %H%M%S").."\t".."Event 1000 N�m Th�ng Long"..GetAccount().."\t"..GetName().."\t".."Mua th�nh c�ng %d Trung Long ",nCount))
end

function OnCancel()
end 
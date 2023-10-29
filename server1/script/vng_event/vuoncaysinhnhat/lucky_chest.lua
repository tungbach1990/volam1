Include("\\script\\vng_event\\VuonCaySinhNhat\\vng_award.lua")

function main(nItemIdx)
	local nItemParam = GetItemParam(nItemIdx, 1)

	if nItemParam == 1 then
		tbSpecialAward:NguyetThan2(nItemIdx)		
	elseif nItemParam == 2 then
		tbSpecialAward:BatTu2(nItemIdx)
	elseif nItemParam == 3 then
		tbSpecialAward:BachKim2(nItemIdx, 3)	
	elseif nItemParam == 4 then
		tbSpecialAward:BachKim2(nItemIdx, 4)
	elseif nItemParam == 5 then
		tbSpecialAward:BachKim2(nItemIdx, 5)	
	elseif nItemParam == 6 then
		tbSpecialAward:BachKim2(nItemIdx, 6)
	else 
		return
	end
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[1] = "�� ph� T� M�ng",
		[2] = "�� ph� T� M�ng Gi�i Ch�",
		[3] = "T� M�ng H�ng Li�n",
		[4] = "T� M�ng Th��ng Gi�i Ch�",
		[5] = "T� M�ng H� Gi�i Ch�",
		[6] = "T� M�ng Kh� Gi�i",
	}
	szDesc = szDesc..format("\nB�o r��ng th�n b� ch�a v�t ph�m: <color=yellow>%s<color>", tbItemName[n_param]);
	return szDesc;
end
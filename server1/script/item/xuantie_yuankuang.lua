Include("\\script\\lib\\string.lua")

function GetDesc(nItem)
	local _, _, _, _, series = GetItemProp(nItem)
	return "<color=blue>Ph�i h�p Huy�n Tinh Kho�ng Th�ch c� th� k�ch ho�t"..toSeries(series).."<color=blue>thu�c t�nh hi�n<color> 1 tr�n trang b� m�u xanh "
end

function main(nItem)
	return 1
end

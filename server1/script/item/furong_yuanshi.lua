
Include("\\script\\lib\\string.lua")

function GetDesc(nItem)
	local series = GetItemSeries(nItem)
	return "<color=blue>Ph�i h�p Huy�n Tinh Kho�ng Th�ch c� th� k�ch ho�t"..toSeries(series).."<color=blue> <color=dblue>thu�c t�nh �n<color> th� 4 tr�n trang b� m�u xanh"
end

function main(nItem)
	return 1
end

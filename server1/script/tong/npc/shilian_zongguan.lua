Include("\\script\\tong\\workshop\\ws_shilian.lua")
function main()
	local szTongName, nTongID = GetTongName()
	if nTongID == 0 then
		Say("<#>T�ng qu�n Th� luy�n ph��ng: Ng��i ch�a gia nh�p bang, t�m ta c� vi�c g�?", 0)
		return
	end	
	local nTypeID = wsGetTypeID(NAME_SHILIAN)
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID, nTypeID)
	USE_G_1(nTongID, nWorkshopID)
end

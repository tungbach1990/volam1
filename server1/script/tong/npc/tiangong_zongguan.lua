Include("\\script\\tong\\workshop\\ws_tiangong.lua")
function main()
	local szTongName, nTongID = GetTongName()
	if nTongID == 0 then
		Say("<#>Ng��i ch�a gia nh�p bang, t�m ��n ta c� vi�c g�?", 0)
		return
	end	
	local nTypeID = wsGetTypeID(NAME_TIANGONG)
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID, nTypeID)
	USE_G_1(nTongID, nWorkshopID)
end
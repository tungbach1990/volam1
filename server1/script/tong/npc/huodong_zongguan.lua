Include("\\script\\tong\\workshop\\ws_huodong.lua")
function main()
	local szTongName, nTongID = GetTongName()
	if nTongID == 0 then
		Say("<#>T�ng qu�n ho�t ��ng: Ng��i ch�a gia nh�p bang, ��n t�m ta c� vi�c g�?", 0)
		return
	end	
	local nTypeID = wsGetTypeID(NAME_HUODONG)
	local nWorkshopID = TWS_GetFirstWorkshop(nTongID, nTypeID)
	USE_G_1(nTongID, nWorkshopID)
end
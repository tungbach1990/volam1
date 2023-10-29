--Open Storebox 1 -by thanhld 30032015
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")

tbOpenStoreBox = {}
function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "C�c h� mu�n m� r�ng r��ng ch�?."
	local tbOpt = {}
	tinsert(tbOpt,format("M� r�ng r��ng s� 1/#tbOpenStoreBox:Open_Store_1(%d)",nItemIdx))
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "Tho�t/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end

function tbOpenStoreBox:Open_Store_1(nItemIdx)
	if CheckStoreBoxState(1) > 0 then
			Msg2Player("C�c h� �� m� r��ng 1 r�i, kh�ng th� m� n�a.")
			return
		end
	if IsMyItem(nItemIdx) ~=1 then
		return
	end
	RemoveItemByIndex(nItemIdx)
	OpenStoreBox(1)
	Msg2Player("Ch�c m�ng c�c h� �� m� r�ng r��ng 1.")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."VNG_LOG_FEATURE_MoRongRuong_1"..GetAccount().."\t"..GetName().."\t".."KichHoatRuong1_ThanhCong")
end

Include("\\script\\event\\wulin_final_match\\createleague.lua")IncludeLib("ITEM")
function main( nItemIdx )
	local curzoneid = wl_zonename2zoneid(GetTong())
	local zoneid =  ITEM_GetItemExParam(nItemIdx,1)
	if ( zoneid ~= curzoneid or zoneid == 0 ) then
		Say("T�m phi�u n�y h�nh nh� kh�ng ph�i khu v�c b�n �ang �, kh�ng th� s� d�ng.", 0)
		return 1
	end
	local matchtype = ITEM_GetItemExParam(nItemIdx,2)
	Say("B�n mu�n b�o danh tham gia thi ��u �?", 2, "Ta mu�n l�p nh�m "..TAB_TICKETINFO[matchtype][1].."/#wl_createleague("..matchtype..")", "T�m th�i kh�ng b�o danh, �� khi kh�c v�y!/OnCancel")
	return 1;
end
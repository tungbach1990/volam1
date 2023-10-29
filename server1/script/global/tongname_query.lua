Include("\\script\\global\\rename_head.lua")

function QueryTongNameResult(tong, result)
	local msg = "<color=red>" .. tong .. "<color>"
	if (result == TONGNAMERES_FREE) then
		msg = msg .. "<#> T�n nh�n v�t n�y ch�a ���c s� d�ng"
	elseif (result == TONGNAMERES_USED) then
		msg = msg .. "<#> T�n nh�n v�t n�y �� c� ng��i s� d�ng"
	elseif (result == TONGNAMERES_APPLY) then
		msg = msg .. "<#> T�n nh�n v�t n�y �� c� ng��i ��ng k� "
	else
		msg = msg .. "<#> T�n nh�n v�t n�y v� hi�u, kh�ng th� s� d�ng"
	end
	Say(msg, 1, "<#> Bi�t r�i!/cancel")
end

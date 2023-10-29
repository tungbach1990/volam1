Include("\\script\\global\\rename_head.lua")

function ChangeTongNameResult(old_tong, new_tong, result)
	local msg = "<color=red>" .. new_tong .. "<color>"
	if (result == TONGNAMERES_SUCCESS) then
		local value = GetTask(TASKVALUE_BLEND)
		value = SetBit(value, 2, 0)
		SetTask(TASKVALUE_BLEND, value)
		msg = msg .. "<#> Thay ��i t�n th�nh c�ng, s� hi�u qu� sau khi b�o tr� "
	elseif (result == TONGNAMERES_USED) then
		msg = msg .. "<#> T�n nh�n v�t n�y �� c� ng��i s� d�ng"
	elseif (result == TONGNAMERES_APPLY) then
		msg = msg .. "<#> T�n nh�n v�t n�y �� c� ng��i ��ng k� "
	else
		msg = msg .. "<#> T�n nh�n v�t n�y v� hi�u, kh�ng th� s� d�ng"
	end
	Say(msg, 1, "<#> Bi�t r�i!/cancel")
end

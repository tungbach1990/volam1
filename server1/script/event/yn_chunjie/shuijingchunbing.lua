CHUNBING_MAX_EXP = 300000000
TSK_XIANGJIAO = 1310
function main()
	local eatexp = GetTask(TSK_XIANGJIAO)
	if (eatexp >= CHUNBING_MAX_EXP) then
		Msg2Player("<#> B�n �� �n qu� nhi�u b�nh r�i! Kh�ng th� �n th�m ���c n�a!")
		return 1
	end
	
	local ran_exp = 3000000
	if ( ran_exp + eatexp > CHUNBING_MAX_EXP ) then
		ran_exp = CHUNBING_MAX_EXP - eatexp
	end
	AddOwnExp(ran_exp)
	Msg2Player("<#> B�n nh�n ���c "..ran_exp.."�i�m kinh nghi�m.")
	SetTask(TSK_XIANGJIAO, eatexp + ran_exp)
	
	if(GetTask(TSK_XIANGJIAO) >= CHUNBING_MAX_EXP) then
		Msg2Player("<#> B�n �� �n qu� nhi�u b�nh r�i! Kh�ng th� �n th�m ���c n�a!")
	else
		Msg2Player("<#> B�n c�n c� th� �n th�m b�nh �� b� sung "..(CHUNBING_MAX_EXP-GetTask(TSK_XIANGJIAO)).."�i�m kinh nghi�m.")
	end
end
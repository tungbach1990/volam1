Include([[\script\item\chrismas\chrismasitem.lua]]);

function main()
	local tabidx = itemmapcheck(TAB_ACTION);
	if (0 == tabidx) then
		return 1;
	end;
	if (TAB_ACTION[tabidx][7][1] ~= 0 and TAB_ACTION[tabidx][7][2] ~= 0) then
		SetTask(TAB_ACTION[tabidx][7][1], 2)
		SetTask(TAB_ACTION[tabidx][7][2], GetCurServerTime() + 30)
	end;
	Msg2Player("<#> B�n s� d�ng 1<color=0xB5FDD7> L�nh b�i �i�m kinh nghi�m<color>, trong 30 gi�y �i�m kinh nghi�m t�ng l�n 2 l�n.")
end;

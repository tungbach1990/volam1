Include([[\script\item\vnchristmas2006\xmas_head.lua]])
function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H"));
	if (nDate >= 2007013124) then
		Say("B�nh �� qu� h�n, kh�ng d�ng ���c n�a!", 0);
		return 0;
	end;
	if (isAddExp_Xmasgift(100000) == 1) then
		Msg2Player("B�n �� �n m�t b�nh b� ��.");
	else
		Msg2Player("T�ng kinh nghi�m kh�ng ���c qu� 300 tri�u. B�n kh�ng th� d�ng ti�p n�a.");
		return 1;
	end;
end;

function GetDesc(nItemIdx)
	local szDesc = "\nTh�i h�n s� d�ng: <color=blue>0 gi� ng�y 31 th�ng 1 n�m 2007<color>"
	return szDesc;
end
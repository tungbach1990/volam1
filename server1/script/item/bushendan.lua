--����
--2007-04-05
--By С�˶��

function main(nItemIdx)
	local ng, nd, np = GetItemProp(nItemIdx);
	local nexp = 1;
	if ( np == 1398) then
		nexp = 1000000;
	elseif (np == 1399 ) then
		nexp = 10000000;
	end
	AddOwnExp(nexp);
	Msg2Player("Ch�c m�ng b�n nh�n ���c "..nexp.."kinh nghi�m ");
	WriteLog(format("[Item Use]\t Data:%s\t Account:%s\t Name:%s UseItem:%s\t Effect:Exp Add %d",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nItemIdx),nexp));

end
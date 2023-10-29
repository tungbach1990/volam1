Include("\\script\\battles\\battlehead.lua")

TOWNPORTAL_MAXCOUNT = 1000

function main(nItemIdx)
	if (GetFightState() == 0 or IsDisabledUseTownP() == 1 or GetTaskTemp(200) == 1 ) or ( SubWorldIdx2ID( SubWorld ) >= 387 and SubWorldIdx2ID( SubWorld ) <= 395)then
		Msg2Player("Hi�n t�i b�n kh�ng th� s� d�ng b�a v� th�nh!");
		return 1
	end
	
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("L�c n�y b�n kh�ng th� s� d�ng v�t ph�m n�y");
			return 1;
		end
	end
	local n_param = tonumber(GetItemParam(nItemIdx,1)) + 1
	local itemname = "<color=yellow>"..GetItemName(nItemIdx).."<color>"
	SetSpecItemParam(nItemIdx,1,n_param)
	SyncItem(nItemIdx)
	if (n_param >= TOWNPORTAL_MAXCOUNT) then
		RemoveItemByIndex(nItemIdx)
		Msg2Player("<#> "..itemname.."<#> �� s� d�ng"..TOWNPORTAL_MAXCOUNT.."<#> l�n, kh�ng th� d�ng ���c n�a!")
	else
		Msg2Player("<#> "..itemname.."<#> c�n c� th� s� d�ng"..(TOWNPORTAL_MAXCOUNT - n_param).."<#> l�n")
	end
	UseTownPortal();
	return 1	
end;

function GetDesc( nItemIdx )
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItemIdx, 1 ))
	szDesc = szDesc..format("\nC� th� s� d�ng<color=yellow>%d<color>l�n", (TOWNPORTAL_MAXCOUNT - n_param));
	return szDesc;
end
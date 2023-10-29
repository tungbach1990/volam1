function  main(nItem)
	Say("<#>M�t n� t� ��i gi�p cho t�t c� th�nh vi�n trong ��i tr� n�n gi�ng nhau trong 2 gi�, mu�n s� d�ng kh�ng?", 2, "T� ��i ta s� c�i trang gi�ng nhau./#yes("..nItem..")", "T�m th�i kh�ng/no");
	return 1
end

function yes(nItem)
	if(GetTeamSize() <= 0) then
		Msg2Player("Kh�ng c� trong ��i ng�, kh�ng th� s� d�ng ��o c� n�y");
		return 1
	end
	local teamid = GetTeam();
	local name = GetName()
	local nfeature = GetItemParam(nItem, 1);
	if RemoveItemByIndex(nItem) ~= 1 then
		return
	end	
	ChangeTeamFeature(teamid, nfeature, 129600);
	Msg2Team(name.."S� d�ng m�t n� ��i ng�, ��i vi�n c�i trang gi�ng nhau, k�o d�i trong 2 gi�.");
end

function GetDesc(nItem)
	local nNpcSettingIdx = GetItemParam(nItem, 1)
	local nAction = random(0, 13)
	local szSpr = GetMaskActionSpr(nNpcSettingIdx, nAction)
	if (not szSpr)then 
		return ""
	end
	return "<spr="..szSpr..">"
end

function no()
end
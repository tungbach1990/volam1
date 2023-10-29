if MODEL_GAMESERVER == 1 then
	IncludeLib("TONG")
	Include("\\script\\tong\\tong_header.lua")
end

function  main(nItem)
	local _Name, nTongID = GetTongName()
	if(nTongID == 0) then
		Msg2Player("Kh�ng � trong bang h�i, kh�ng th� s� d�ng ��o c� n�y.");
		return 1
	end
	local figure = TONGM_GetFigure(nTongID, GetName())
	if (figure == TONG_MASTER or figure == TONG_ELDER)then
		Say("<#>M�t n� bang h�i c� th� gi�p cho to�n th� th�nh vi�n c�i trang gi�ng nhau trong v�ng 3 gi�, c� mu�n s� d�ng kh�ng?", 2, "T� ��i ta s� c�i trang gi�ng nhau./#yes("..nItem..")", "T�m th�i kh�ng/no");
		return 1
	else
		Msg2Player("Ch� c� bang ch� ho�c tr��ng l�o m�i c� th� s� d�ng ��o c� n�y.");
		return 1
	end
end

function yes(nItem)
	local a,b = GetTongName();
	if(b == 0) then
		Msg2Player("Kh�ng � trong bang h�i, kh�ng th� s� d�ng ��o c� n�y.");
		return 1
	end
	local figure = TONGM_GetFigure(b, GetName())
	if (figure ~= TONG_MASTER and figure ~= TONG_ELDER)then
		Msg2Player("Ch� c� bang ch� ho�c tr��ng l�o m�i c� th� s� d�ng ��o c� n�y.");
		return 1
	end	
	local name = GetName();
	local nfeature  = GetItemParam(nItem, 1);
	if RemoveItemByIndex(nItem) ~= 1 then
		return
	end
	TONG_ChangeAllMemberFeature(b,nfeature,194400)
	Msg2Tong(b, name.."S� d�ng m�t n� bang h�i, th�nh vi�n tr�n m�ng c�i trang gi�ng nhau, k�o d�i trong 3 gi�.");
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
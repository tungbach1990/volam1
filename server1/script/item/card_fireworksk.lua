IL("LEAGUE");
Include("\\script\\lib\\gb_modulefuncs.lua")
ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 1054
function main()
	if (gb_GetModule("Ph�c duy�n ph�o hoa") == 1) then
		Say("Thi�p ph�o hoa n�y c� th� b�n ph�o hoa xung quanh ng��i m�nh ch�c ph�c.", 2, "B�t ��u ch�c ph�c/want2fireworks", "H�y b� /OnCancel")
	end
	return 1
end

function OnCancel()
end

function want2fireworks()
	AskClientForString("PlayerSelect", "", 1, 16, "Xin nh�p t�n ��i ph��ng");
end

function PlayerSelect(rolename)
	QueryWiseManForSB("BlessPlayerOnline", "BlessPlayerOffline", 1000, rolename);
end

function BlessPlayerOffline(TargetName)
	Say("Xin l�i! "..TargetName.."Hi�n t�i kh�ng c� tr�n m�ng.",0)
end;

function BlessPlayerOnline(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local nposx = nPosX * 32
		local nposy = nPosY * 32
		local szParam = TargetName.." "..nSubWorldID.." "..nPosX.." "..nPosY.." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "fireworks_bless_anywhere", szParam, "", "")
		Msg2Player("L�i ch�c ph�c c�a b�n �� g�i �i th�nh c�ng!")
	else
		Say("Kh�ng t�m ���c th�! Xin th� l�i 1 l�n!.", 0)
	end
end


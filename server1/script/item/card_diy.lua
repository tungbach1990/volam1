-- Created by firefox
-- ���⿨
-- �����Լ��༭ף��
IL("SETTING")
IL("LEAGUE");
Include("\\script\\lib\\gb_modulefuncs.lua")

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=1016
STSK_OTHERNAME = 3
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}
function main(nIndex)
	if (gb_GetModule("Thi�p th�ng b�o ch�c m�ng m�u") == 1) then
		Say("��y l� 1 Nh� � Thi�p. Tr��c ti�n h�y nh�p ��i t��ng c�n ch�c ph�c r�i sau �� m�i nh�p n�i dung c�n ch�c.", 
			2, 
			"B�t ��u ch�c ph�c/want2bless",
			"L�t n�a m�i g�i/OnCancel")
	end
	return 1
end

function want2bless(nIndex)
	AskClientForString("PlayerSelect", "", 1, 16, "Xin nh�p t�n ��i ph��ng");
end

function PlayerSelect(rolename)
	if (ST_CheckTextFilter(rolename) ~= 1) then
		Say("Xin l�i! T�n b�n nh�p v�o c� ch� kh�ng h�p l�, h�y th� l�i l�n n�a!", 0)
		return
	end
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(rolename, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin l�i! T�n b�n nh�p v�o c� ch� kh�ng h�p l�, h�y th� l�i l�n n�a!", 0)
			return
		end
	end
	SetStringTask(STSK_OTHERNAME,rolename)
	AskClientForString("BlessPlayer", "", 1, 100, "Xin nh�p l�i ch�c ph�c v�o");
end

function BlessPlayer(szBless)
	if (ST_CheckTextFilter(szBless) ~= 1) then
		Say("Xin l�i! T�n b�n nh�p v�o c� ch� kh�ng h�p l�, h�y th� l�i l�n n�a!", 0)
		return
	end
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szBless, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin l�i! T�n b�n nh�p v�o c� ch� kh�ng h�p l�, h�y th� l�i l�n n�a!", 0)
			return
		end
	end
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg
		szMsg = GetName().."<#> n�i v�i "..GetStringTask(STSK_OTHERNAME).."<#> "..szBless
		AddGlobalCountNews(szMsg,3);
	else
		Msg2Player("Kh�ng t�m ���c th�! Xin th� l�i 1 l�n!.")
	end
end


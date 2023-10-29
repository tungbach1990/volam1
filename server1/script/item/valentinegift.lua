--���˽����
--2006��2��14��~2006��2��21�� 50�������� ��ֵ��ҿ��Ի��
--��ʿֻ�ܸ���Ů���͡���Ũõ�廨��
--��Ůֻ�ܸ���ʿ���͡������ɿ�����
--�Ա�������
--����������ף����
IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 1058
STSK_OTHERNAME = 4
TEMPSK_MAPID = 192
TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}

Bless=
{
	"<#> M�ng nh� gi� xu�n, l�n gi� qua �i kh�ng �� l�i d�u v�t, ch� v� n�i nh� trong l�ng, xin g�i m�t l�i ch�c ph�c n�ng n�n.",
	"<#> D� t��ng lai c� th� n�o �i n�a t�i c�ng s� y�u n�ng cho ��n h�i th� cu�i c�ng.",
	"<#> Ng�y r�nh r�i c� b�n ��n h�n huy�n, d� cu�c s�ng c� th� n�o t�i c�ng ��u th�ch.",
	"<#> Con ���ng t�i �i c� b�n ��ng h�nh d� ch�ng gai t�i c�ng cam l�ng.",
	"<#> K�t duy�n th�nh phu th�, m�i b�n nhau tr�n ��i.  ",
	"<#> Ch�c l� t�nh nh�n vui v�! C�u mong nh�ng �i�u t�t l�nh nh�t s� ��n v�i b�n!!",
	--"<#>������ȥ���ĵ�ף������׺�����۵��Σ�Ը��ӵ��һ���Ҹ����ֵ����꣡",
}

function main()
if (gb_GetModule("L� v�t t�nh nh�n") == 1) then
	if (GetSex() == 0) then	--��
		Say("<#>  S� d�ng 'L� v�t t�nh nh�n' c� th� t�ng cho <color=yellow>'ng��i �y'<color> m�t ��a <color=yellow>'Hoa h�ng t�nh �'<color> ��ng th�i n�i l�n l�i ch�c ph�c c�a b�n.", 2, "<#> T�ng hoa h�ng/want2present", "<#> H�y b� /OnCancel")
	elseif (GetSex() == 1) then	--Ů
		Say("<#>  S� d�ng 'L� v�t t�nh nh�n' c� th� t�ng cho <color=yellow>'ng��i �y'<color> m�t mi�ng <color=yellow>'S� c� la t�nh y�u'<color> ��ng th�i n�i l�n l�i ch�c ph�c c�a b�n.", 2, "<#> T�ng S� c� la/want2present", "<#> H�y b� /OnCancel")
	end
end
	return 1
end

function want2present()
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
	QueryWiseManForSB("BlessPlayerOnline", "BlessPlayerOffline", 1000, rolename);
end

function BlessPlayerOnline(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	if (nSex == GetSex()) then
		if (nSex == 0) then
			Say("<#> 'Hoa h�ng t�nh �' ch� c� th� t�ng cho hi�p n� th�i!", 0)
		elseif (nSex == 1) then
			Say("<#> 'S� c� la t�nh y�u' ch� c� th� t�ng cho tr�ng s� th�i!", 0)
		end
		return
	end
	SetTaskTemp(TEMPSK_MAPID, nSubWorldID)
	Say("<#> Xin nh�p l�i ch�c ph�c c�a b�n v�o ho�c ch�n nh�ng l�i ch�c ph�c c� s�n:", 3, "Nh�p l�i ch�c ph�c v�o/inputmsg", "Ch�n l�i ch�c ph�c c� s�n/selectmsg", "H�y b� /OnCancel")
end

function inputmsg()
	AskClientForString("BlessPlayer", "", 1, 100, "Xin nh�p l�i ch�c ph�c v�o");
end

function selectmsg()
	local tbOpp = {}
	for  i = 1, getn(Bless) do
		tbOpp[i] = Bless[i].."/BlessPlayer"
	end
	tbOpp[getn(tbOpp) + 1] = "H�y b� /OnCancel"
	Say("<#> H�y ch�n c�u ch�c:", getn(tbOpp), tbOpp)
end

function BlessPlayer(szBless)
	if (type(szBless) == "number") then
		szBless = Bless[szBless + 1]
	end
	if (ST_CheckTextFilter(szBless) ~= 1) then
		Say("Xin l�i! L�i ch�c ph�c c�a b�n c� ch� kh�ng h�p l�, h�y th� l�i l�n n�a!", 0)
		return
	end
	
	for i = 1, getn(TB_FORBIDWORD) do
		local bp = strfind(szBless, TB_FORBIDWORD[i])
		if (bp ~= nil) then
			Say("Xin l�i! T�n b�n nh�p v�o c� ch� kh�ng h�p l�, h�y th� l�i l�n n�a!", 0)
			return
		end
	end
	if (GetStringTask(STSK_OTHERNAME) == nil or GetStringTask(STSK_OTHERNAME) == "" or GetTaskTemp(TEMPSK_MAPID) == 0) then
		return
	end
	
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg = ""
		szMsg = GetName().." <#> n�i "..GetStringTask(STSK_OTHERNAME).." <#> r�ng:"..szBless
		AddGlobalNews(szMsg)
		local szParam = GetStringTask(STSK_OTHERNAME).." "..GetTaskTemp(TEMPSK_MAPID).." "..GetName()
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "valentine_bless_anywhere", szParam, "", "")
	else
		Say("<#> Kh�ng t�m ra l� v�t t�nh nh�n, xin h�y th� l�i.", 0)
	end
end

function BlessPlayerOffline(TargetName)
	Say("<#> Xin l�i! "..TargetName.."Hi�n t�i c� �y (anh �y) kh�ng c� tr�n m�ng.",0)
end

function OnCancel()
end
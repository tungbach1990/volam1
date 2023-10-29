IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

COLOR_BLESS = {
	{"Tr�ng","color=White"},	--��ɫ
	{"��","color=Red"},		--��ɫ
	{"Xanh l� c�y","color=Green"},	--��ɫ
	{"Xanh bi�n","color=Water"},		--��ɫ
	{"M�u v�ng kim","color=Orange"},	--��Gold
	{"Cam","color=0xff5040"},	--��ɫ
	{"M�u t�m","color=Pink"},		--�Ϻ�
	{"T�m ��m","color=Violet"},	--��
	{"�� s�ng","bclr=Red><color=Yellow"},		--����ɫ
	{"Xanh s�ng","bclr=Blue><color=White"},		--����ɫ
	{"�� ��m s�ng","bclr=Pink><color=Yellow"},	--���Һ�
}

TB_FORBIDWORD = {
	"<item=",
	"<link=",
	"<pic=",
	"<color=",
	"<bclr=",
	"<enter",
}

STSK_OTHERNAME = 1
STST_COLOR = 2
ITEM_GENRE = 6
ITEM_DETAIL = 1
ITEM_PARTI = 1053

function main()
	if (gb_GetModule("Thi�p th�ng b�o ch�c m�ng m�u") == 1) then
		Say("��y l� t�m thi�p m�u th� hi�n nh�ng l�i ch�c g�i �i. M�i b�n nh�p t�n ng��i c�n ch�c, sau �� ch�n m�u cho n�n ch� c�n ch�c", 
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
	local tbOpp = {}
	for i = 1, getn(COLOR_BLESS) do
		tbOpp[i] = COLOR_BLESS[i][1].."/ColorSelect"
	end
	tbOpp[ getn(tbOpp) + 1 ] = "H�y b� /OnCancel"
	Say("M�i b�n ch�n m�u ch� ch�c ph�c:", getn(tbOpp), tbOpp )
end

function ColorSelect(nSel)
	local stcolor = nSel + 1
	SetStringTask(STST_COLOR,COLOR_BLESS[stcolor][2])
	AskClientForString("BlessPlayer", "", 1, 100, "Xin nh�p l�i ch�c ph�c v�o");
end

function BlessPlayer(szBless)
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

	if (GetStringTask(STSK_OTHERNAME) == nil or GetStringTask(STSK_OTHERNAME) == "" or GetStringTask(STST_COLOR) == nil or GetStringTask(STST_COLOR) == "") then
		return
	end
	if (CalcEquiproomItemCount(ITEM_GENRE,ITEM_DETAIL,ITEM_PARTI,-1) >= 1) then
		ConsumeEquiproomItem(1, ITEM_GENRE, ITEM_DETAIL, ITEM_PARTI, -1)
		local szMsg = ""
		szMsg = "<color=yellow>"..GetName().."<color><#> n�i v�i <color=yellow>"..GetStringTask(STSK_OTHERNAME).."<color><#>:<"..GetStringTask(STST_COLOR)..">"..szBless
		--AddGlobalCountNews(szMsg,2);
		LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "")
	else
		Say("Kh�ng t�m ���c th�! Xin th� l�i 1 l�n!.", 0)
	end
end

function OnCancel()
end
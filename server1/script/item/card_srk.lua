-- Created by tsh 2004-12-09
-- ���տ�
-- ���������ſ�

szTitle="<#> H�y ch�n c�u ch�c:"
Bless=
{
	"<#> M�t ng�y m�i l�i b�t ��u, ch�c b�n n�m m�i ��y th�nh c�ng 'Ch�c sinh nh�t vui v�'.",
	"<#> Nguy�n ch�c b�n trong ��m sinh nh�t lu�n vui v�, h�nh ph�c b�n nh�ng ng��i b�n y�u qu� nh�t.",
	"<#> D�ng t�ng b�n nh�ng ��a hoa xinh ��p nh�t trong ng�y sinh nh�t.",
	"<#> T�ng b�n m�n qu� v� ch�c b�n sinh nh�t vui v�, lu�n ��t th�nh c�ng trong con ���ng h�c t�p.",
	"<#> Nguy�n nh�ng �i�u t�t l�nh, may m�n nh�t ��n v�i b�n 'Ch�c sinh nh�t vui v�'.",
	"<#> B�t ch�t nh� ra ng�y sinh nh�t c�a b�n, kh�ng bi�t n�i g� h�n ngo�i l�i ch�c ch�n t�nh nh�t trong ng�y sinh nh�t c�a b�n.",
}

ITEM_TASK_TEMP=27
UNIQUE_USE_TASK_TEMP=20
--��֤һ��ף��û����ǰ����ʹ�õڶ�����

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=137

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("B�n hi�n �ang ph�t c�u ch�c! Xin vui l�ng ��i m�t l�t!");
		return 1
	end
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Bless);
	for i=1, nSelectCount do
		FuncBless[i] = Bless[i].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "H�y b� /QueryWiseManCancel"

	Say(szTitle, getn(Bless), FuncBless);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
--�Ȳ�ɾ����ҵĿ�Ƭ����ʵ�ʷ�����ף��ʱ��ɾ����ʱ��¼����װ����ţ�
	return 1;

end

function PlayerSelect(nSelect)
	QueryWiseMan("BlessPlayerOnline", "BlessPlayerOffline", nSelect);
end

function BlessPlayerOnline(TargetName, nSelect, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank)
	local ItemIdx
	ItemIdx = GetTaskTemp(ITEM_TASK_TEMP);
	local ItemGenre
	local DetailType
	local ParticularType
	local Level
	local Series
	local Luck
	ItemGenre,DetailType,ParticularType,Level,Series,Luck = GetItemProp(ItemIdx)
	if (ItemIdx > 0 and ItemGenre == ITEM_GENRE and DetailType == ITEM_DETAIL and ParticularType == ITEM_PARTI) then
		if (RemoveItemByIndex(ItemIdx) == 1) then
			local szMsg
			szMsg = GetName().."<#> n�i v�i "..TargetName.."<#> "..Bless[nSelect + 1]
			AddGlobalCountNews(szMsg,1);
		else
			Msg2Player("Kh�ng t�m ���c th�! Xin th� l�i 1 l�n!.")
		end
	else
		Msg2Player("S� d�ng th� th�t b�i, xin th� l�i 1 l�n.")
	end
	SetTaskTemp(ITEM_TASK_TEMP,0)
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function BlessPlayerOffline(TargetName, nSelect)
	Msg2Player("Ng��i m� b�n mu�n ch�c ph�c hi�n kh�ng c� tr�n m�ng! ��i l�c sau th� l�i!.");
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end

function QueryWiseManCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end
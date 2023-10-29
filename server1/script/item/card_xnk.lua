-- Created by tsh 2004-12-09
-- ���꿨
-- ���������ſ�

szTitle="<#> H�y ch�n c�u ch�c:"
Bless=
{
	"<#> Nguy�n nh�ng l�i ch�c t�t ��p nh�t theo gi� bay ��n b�n b�n 'Ch�c b�n n�m m�i vui v�'!",
	"<#> M�ng n�m m�i, ch�c b�n s�c kh�e d�i d�o, v�n s� nh� �.",
	"<#> Ch�c b�n n�m m�i vui v�, ph�t t�i ph�t l�c, an khang th��ng l�c.",
	"<#> Kh�ng bi�t n�i g� h�n ngo�i l�i ch�c b�n c� ���c m�t n�m m�i vui v� tr�n ��y h�nh ph�c b�n ng��i th�n gia ��nh.",
	"<#> Ng�n l�i n�i trong l�ng kh�ng bi�t n�i g� h�n 'Ch�c b�n n�m m�i vui v�'.",
	"<#> N�m m�i ch�c b�n lu�n vui v� h�nh ph�c!",
}

ITEM_TASK_TEMP=23
UNIQUE_USE_TASK_TEMP=20
--��֤һ��ף��û����ǰ����ʹ�õڶ�����

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=140

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
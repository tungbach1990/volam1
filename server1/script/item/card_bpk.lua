-- Created by tsh 2004-12-09
-- ���ɿ�
-- ���������ſ�

szTitle="<#> H�y ch�n c�u ch�c:"
Bless=
{
	"<#> �i�m kinh nghi�m ng�n ng�n v�n, Kim Nguy�n B�o, Tinh H�ng Th�ch b� ��y m�t r��ng.",
	"<#> Kh�ng c� g� qu� gi� h�n t�nh b�n h�u trong bang ph�i, c�c anh ch� em trong bang r�t ��ng tr�n tr�ng. ",
	"<#> Huynh �� t� mu�i l� nh�ng ng��i an �i b�n trong l�c �au l�ng, chia s� ni�m vui c�ng b�n trong l�c g�t h�i ���c th�nh c�ng.",
	"<#> Ch�c huynh �� t� mu�i trong bang vui v� su�t ��i, sung t�c c� n�m. ",
	"<#> Ch�c huynh �� trong bang s�c kh�e d�i d�o, ti�n v� nh� n��c.",
	"<#> Bang h�i l� n�i che ch� v� gi�p �� ta tr�n b��c ���ng giang h�! Xin ch�n th�nh g�i l�i c�m �n v� ch�c s�c kh�e ��n t�t c� c�c huynh �� t� mu�i trong bang h�i!",
}

ITEM_TASK_TEMP=25
UNIQUE_USE_TASK_TEMP=20
--��֤һ��ף��û����ǰ����ʹ�õڶ�����

ITEM_GENRE=6
ITEM_DETAIL=1
ITEM_PARTI=136

FuncBless={}

function main(sel)
	if (GetTaskTemp(UNIQUE_USE_TASK_TEMP) > 0) then
		Msg2Player("B�n hi�n �ang ph�t c�u ch�c! Xin vui l�ng ��i m�t l�t!");
		return 1
	end

	local TongName
	local Result
	TongName, Result = GetTong();
	if (TongName == "") then
		Msg2Player("B�n ch�a gia nh�p bang ph�i, kh�ng th� s� d�ng 'Thi�p Bang ph�i'")
		SetTaskTemp(ITEM_TASK_TEMP,0);
		SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
		return 1;
	end

	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 1);

	local nSelectCount = getn(Bless);
	for i=1, nSelectCount do
		FuncBless[i] = Bless[i].."/PlayerSelect"
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "H�y b� /QueryWiseManCancel"

	Say(szTitle, getn(Bless) + 1, FuncBless);
	SetTaskTemp(ITEM_TASK_TEMP,sel);
--�Ȳ�ɾ����ҵĿ�Ƭ����ʵ�ʷ�����ף��ʱ��ɾ����ʱ��¼����װ����ţ�
	return 1;
end

function PlayerSelect(nSelect)
	local TongName
	local Result
	TongName, Result = GetTong();
	if (TongName == "") then
		Msg2Player("B�n ch�a gia nh�p bang ph�i, kh�ng th� s� d�ng 'Thi�p Bang ph�i'")
		SetTaskTemp(ITEM_TASK_TEMP,0);
		SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
		return
	end
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
			szMsg = GetName().."<#> n�i v�i "..TongName.."<#> ch�c Bang ph�i"..Bless[nSelect + 1]
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

function QueryWiseManCancel()
	SetTaskTemp(ITEM_TASK_TEMP,0);
	SetTaskTemp(UNIQUE_USE_TASK_TEMP, 0);
end
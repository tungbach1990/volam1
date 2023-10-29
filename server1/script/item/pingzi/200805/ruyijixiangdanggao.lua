Include("\\script\\lib\\awardtemplet.lua")
Include ("\\script\\lib\\pay.lua")
Include("\\script\\event\\pingzi\\200805\\head.lua")
ruyijixiangdangao_tbItemList= 

{
	[1761] = {szName="B�nh Kem Nh� �", nExp = 1500000 },
	[1762] = {szName="B�nh Kem C�t T��ng", nExp = 3000000 },

}

function main(nItemIndex)
	pingzi0805:ResetTask()
	local nItemData	= 20080731;	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nCurExp = GetTask(pingzi0805.TSK_ExpLimit)
	if nDate > nItemData then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	
	local _, _, nId	= GetItemProp(nItemIndex);

	if GetLevel() < 50 or IsCharged() == 0 then
		Say("Ng��i ch�i c�p tr�n 50 �� n�p th� m�i c� th� s� d�ng.", 0)
		return 1;
	end
	
	if nCurExp >= pingzi0805.nMaxExpLimit then
		Say("�� ��t ��n gi�i h�n kinh nghi�m c�a l�n ho�t ��ng n�y, kh�ng th� ti�p t�c s� d�ng.", 0)
		return 1
	end
	local tbItem = ruyijixiangdangao_tbItemList[nId]
	tbAwardTemplet:GiveAwardByList(tbItem, "B�nh kem ch�c m�ng VLTK tr�n 3 tu�i.")
	SetTask(pingzi0805.TSK_ExpLimit, nCurExp + tbItem.nExp)
	return 0
end

function GetDesc(nItemIndex)
	local nYear		= 2008
	local nMonth	= 07
	local nDay		= 31
	if nYear == 0 and nMonth == 0 and nDay == 0 then
		return "<color=red>V�t ph�m n�y �� qu� h�n s� d�ng<color>"
	end
	return format("<color=green>Th�i h�n s� d�ng: %d-%d-%d<color>",nDay, nMonth, nYear)
end
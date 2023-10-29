--������������

Include("\\script\\activitysys\\playerfunlib.lua");

local tbFantasygoldValue = {
	[1] = 1,
	[2] = 3,
	[3] = 9,
	[4] = 27,
	[5] = 81,
	[6] = 243,
	[7] = 729,
	[8] = 2187,
	[9] = 6561,
	[10] = 19683,
};

function main(nItemIdx)
	--SetTaskTemp(254, nItemIdx);
	Talk(1, "GiveFantasyGold", "H�p th�nh Huy�n Kim cao c�p:m�i l�n cho nhi�u nh�t <color=yellow>60<color>c�i<color=yellow>c�ng m�t c�p<color>Huy�n Kim l� c� th� h�p th�nh Huy�n Kim cao h�n m�t c�p,cao nh�t ch� c� th� h�p th�nh c�p<color=yellow>10<color>Huy�n Kim,��u t� s� l��ng Huy�n Kim ph�i l� b�i c�a ba")
	
	return 1;

end

function GiveFantasyGold()
	GiveItemUI("Huy�n Kim h�p th�nh", "Cho nhi�u nh�t 60 c�i Huy�n Kim c�ng c�p,Huy�n Kim c� th� n�ng cao h�n m�t c�p.S� l��ng Huy�n Kim cho v�o ph�i l� b�i s� c�a 3", "upgrade_fantasygold_process", "cancel",1, "upgrade_fantasygold_check");
	SetUiGiveItemMsg("Cho Huy�n Kim v�o:");
end

function upgrade_fantasygold_process(nItemCount)
	local tbResult = upgrade_fantasygold_check(nItemCount);
	if tbResult.nRetValue == 0 then
		ShowNotice(1, tbResult.szErrorMsg);
		return 0;
	end

	--local nItemIdx = GetTaskTemp(254);	

	if RemoveItemByIndex(tbResult.nItemIndex) == 1 then

		PlayerFunLib:GetItem({tbProp={6,1,3151,tbResult.nRetLevel,-1,0},nBindState = tbResult.nItemBindState,},tbResult.nRetCount,"S� d�ng B� k�p N�ng C�p Huy�n Kim �� n�ng c�p Huy�n Kim")

		--local nIdx = AddItem(6, 1, 3151, tbResult.nRetLevel, 0, 0);
		--SetItemStackCount(nIdx, tbResult.nRetCount)
		--SetItemBindState(nIdx, tbResult.nItemBindState);

		Pay(tbResult.nNeedMoney);
		--RemoveItemByIndex(nItemIdx);
		ConsumeItem(-1, 1, 6, 1, 3270, -1)

		WriteLog(format("[B� k�p N�ng C�p Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tn�ng c�p[%d]#[%d]c�p Huy�n Kim th�nh c�ng?ti�u hao[%d]hai ti�n v�n?nh�n[%d]c�i[%d]c�p Huy�n Kim.", GetAccount(), GetName(), tbResult.nStackCount, tbResult.nRetLevel, tbResult.nNeedMoney, tbResult.nRetCount, tbResult.nRetLevel));
	else
		WriteLog(format("[B� k�p N�ng C�p Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tn�ng c�p[%d]#[%d]c�p Huy�n Kim th�t b�i", GetAccount(), GetName(), tbResult.nStackCount, tbResult.nRetLevel));
	end

	
	ShowNotice(1, format("H�p th�nh ra<color=yellow>%d<color>c�i<color=yellow>%d<color>c�p Huy�n Kim?", tbResult.nRetCount, tbResult.nRetLevel));
end

function upgrade_fantasygold_check(nItemCount)
	local tbResult = {};
	tbResult.nRetValue = 0;
	tbResult.szErrorMsg = "";
	tbResult.nItemIndex = 0;
	tbResult.nLevel = 0;
	tbResult.nStackCount = 0;
	tbResult.nRetCount = 0;
	tbResult.nRetLevel = 0;
	tbResult.nNeedMoney = 0;
	tbResult.nItemBindState = 0;

	if nItemCount <= 0 then
		tbResult.szErrorMsg = "Cho Huy�n Kim v�o!";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	if nItemCount ~= 1 then
		tbResult.szErrorMsg = "Huy�n Kim cho v�o r�i qu�,ch� c� th� cho m�t nh�m!";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	tbResult.nItemIndex = GetGiveItemUnit(1);

	local tItemProp = pack(GetItemProp(tbResult.nItemIndex));

	if tItemProp[1] ~= 6 or tItemProp[2] ~= 1 or tItemProp[3] ~= 3151 then--��������
		tbResult.szErrorMsg = "Ng��i cho v�o kh�ng ph�i Huy�n Kim!";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	tbResult.nLevel = tItemProp[4];
	if tbResult.nLevel >= 10 then
		tbResult.szErrorMsg = "Ng��i cho Huy�n Kim c�p cao qu�!";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	tbResult.nStackCount = GetItemStackCount(tbResult.nItemIndex)
	if tbResult.nStackCount > 60 then
		tbResult.szErrorMsg = "Ng��i cho Huy�n Kim nhi�u qu�,ta kh�ng c�n nhi�u v�y!";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	if tbResult.nStackCount <= 0 then
		tbResult.szErrorMsg = "Ng��i cho Huy�n Kim �t qu�,ta kh�ng c�n �t v�y!";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	if mod(tbResult.nStackCount, 3) ~= 0 then
		tbResult.szErrorMsg = "Huy�n Kim kh�ng ph�i b�i s� c�a 3 s� l�ng ph� ��";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	tbResult.nItemBindState = GetItemBindState(tbResult.nItemIndex);

	tbResult.nRetCount = floor(tbResult.nStackCount / 3);
	tbResult.nRetLevel = tbResult.nLevel + 1;
	tbResult.nNeedMoney = tbResult.nStackCount * 1000 * %tbFantasygoldValue[tbResult.nLevel];

	if GetCash() < tbResult.nNeedMoney then
		tbResult.szErrorMsg = format("Huy�n Kim h�p th�nh c�n %d ng�n l��ng,ti�n c�a ng��i kh�ng ��!", tbResult.nNeedMoney);
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	if PlayerFunLib:CheckFreeBagCell(1, "") == nil then
		tbResult.szErrorMsg = "C�n �t nh�t m�t t�i ��";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	ShowNotice(2, format("C�n ti�n v�n:%d", tbResult.nNeedMoney));
	tbResult.nRetValue = 1;
	return tbResult;
end

function ShowNotice(nType, szNotice)
	if nType == 1 then
		Talk(1, "", szNotice);
	elseif nType == 2 then
		SetUiGiveItemMsg(szNotice);
	end
end

function onCancel()
end

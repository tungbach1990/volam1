--zhongchaolong

--ս��
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_ItemEndTime then
		Say("V�t ph�m n�y �� qu� h�n.",0)
		return 0;
	end
	if zhongqiu0808_PlayerLimit() ~= 1 then
		
		Say("Y�u c�u ��ng c�p ph�i tr�n 50 v� �� qua n�p th�.", 0)
		return 1
	end
	
	if nCellFreeLimit ~= nil and  CalcFreeItemCellCount() < nCellFreeLimit then
		Say(format("�� tr�nh m�t m�t t�i s�n, h�y b�o ��m h�nh trang c�n �� %d � tr�ng.", nCellFreeLimit),0)
		return 1
	end
	
	local nCurExp = GetTask(zhongqiu0808_TSK_ZhangGongExp)
	
	if nCurExp >= zhongqiu0808_TSKV_ZhangGongMaxExp then
		Say(format("S� d�ng v�t ph�m n�y �� ��t gi�i h�n %d kinh nghi�m.", zhongqiu0808_TSKV_ZhangGongMaxExp), 0)
		return 1
	end
	
	
	tbAwardTemplet:GiveAwardByList(tbItemAward, format("%s", GetItemName(nItemIndex)) )
	SetTask(zhongqiu0808_TSK_ZhangGongExp, nCurExp + tbItemAward[1].nExp)
end
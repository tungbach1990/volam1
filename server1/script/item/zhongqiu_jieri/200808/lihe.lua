--���� ����



Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main(nItemIndex)
	-- H�p V�n Du
	local tbItem = 
	{
	{szName="L�ng ��n b��m b��m", tbProp={6, 1, 1796, 1, 0, 0}, nRate = 1},
	{szName="L�ng ��n ng�i sao", tbProp={6, 1, 1797, 1, 0, 0}, nRate = 33},
	{szName="L�ng ��n �ng", tbProp={6, 1, 1798, 1, 0, 0}, nRate = 33},
	{szName="L�ng ��n tr�n", tbProp={6, 1, 1799, 1, 0, 0}, nRate = 33},
	}
	-- H�p Ti�n V�
	local tbItem2 = 
	{
	{szName="L�ng ��n b��m b��m", tbProp={6, 1, 1796, 1, 0, 0}, nRate = 97},
	{szName="L�ng ��n ng�i sao", tbProp={6, 1, 1797, 1, 0, 0}, nRate = 1},
	{szName="L�ng ��n �ng", tbProp={6, 1, 1798, 1, 0, 0}, nRate = 1},
	{szName="L�ng ��n tr�n", tbProp={6, 1, 1799, 1, 0, 0}, nRate = 1},
	}
	
	zhongqiu0808_ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > zhongqiu0808_liheEndTime then
		Say("V�t ph�m n�y �� qu� h�n.",0)
		return 0;
	end
	if zhongqiu0808_PlayerLimit() ~= 1 then		
		Say("Y�u c�u ��ng c�p ph�i tr�n 50 v� �� qua n�p th�.", 0)
		return 1
	end
	local nG, nD, nP = GetItemProp(nItemIndex)
	--local nCount = getn(tbItem)
	--if nP == 1795 then
		--for i=1, nCount do
			--tbItem[i].nRate =  (nCount - i + 1)*10
		--end
	--end
	
	if nP == 1794 then
		tbAwardTemplet:GiveAwardByList(tbItem, format("%s", GetItemName(nItemIndex)))
	elseif nP == 1795 then
		tbAwardTemplet:GiveAwardByList(tbItem2, format("%s", GetItemName(nItemIndex)))
	else
		return 1
	end		
end


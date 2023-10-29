Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailog.lua")
IncludeLib("SETTING");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\meridian\\vnmeridan_head.lua")
tbMeridanExp2Material = {}
tbMeridanExp2Material.tbExpRequire = {
	[0] = 1000000,
	[1] = 1000000,
	[2] = 1000000,
	[3] = 2000000,
	[4] = 3000000,
	[5] = 4000000,
}

function tbMeridanExp2Material:Main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDialog = DailogClass:new(szNpcName)
	tbDialog.szTitleMsg = format("<npc>\t%s%s%s%s%s", 
										"Mu�n ��i <color=yellow>Ch�n Nguy�n ��n (ti�u)<color> y�u c�u ph�i c� tr�n <color=red>5,000,000<color> �i�m kinh nghi�m, m�i l�n ��i s� ti�u hao l��ng �i�m kinh nghi�m t�y thu�c v�o s� l�n tr�ng sinh, c� th� nh� sau:",
										"\nTr�ng sinh 2 tr� xu�ng: ��i <color=yellow>1 Ch�n Nguy�n ��n (ti�u)<color> ti�u hao <color=red>1,000,000<color> �i�m kinh nghi�m",
										"\nTr�ng sinh 3: ��i <color=yellow>1 Ch�n Nguy�n ��n (ti�u)<color> ti�u hao <color=red>2,000,000<color> �i�m kinh nghi�m",
										"\nTr�ng sinh 4: ��i <color=yellow>1 Ch�n Nguy�n ��n (ti�u)<color> ti�u hao <color=red>3,000,000<color> �i�m kinh nghi�m",
										"\nTr�ng sinh 5: ��i <color=yellow>1 Ch�n Nguy�n ��n (ti�u)<color> ti�u hao <color=red>4,000,000<color> �i�m kinh nghi�m")
	tbDialog:AddOptEntry("Ta mu�n ��i", tbMeridanExp2Material.ExchangeAskClient4Numb, {tbMeridanExp2Material})
	tbDialog:Show()
end

function tbMeridanExp2Material:GetMaxCount()
	local nTranslifecount = ST_GetTransLifeCount()
	local nCurExp = GetExp()
	local nExpReq = self.tbExpRequire[nTranslifecount]
	if not nExpReq or nExpReq <= 0 then
		return
	end
	local nRet = floor(nCurExp/nExpReq)
	if nRet > 500 then
		nRet = 500
	end
	return nRet
end

function tbMeridanExp2Material:GetExpRequire(nCount)
	local nTranslifecount = ST_GetTransLifeCount()
	local nCurExp = GetExp()
	local nExpReq = self.tbExpRequire[nTranslifecount] * nCount
	if not nExpReq or nExpReq <= 0 or nExpReq > nCurExp then
		return nil
	end
	return nExpReq
end

function tbMeridanExp2Material:ExchangeConfirm(nInput)
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "�� b�o ��m t�i s�n, xin vui l�ng ch�a �t nh�t 1 � tr�ng trong h�nh trang.")
		return
	end
	local nExchangeCount = 0
	local nMaxCount = self:GetMaxCount()
	if nInput > nMaxCount then
		Talk(1, "", "S� l��ng kinh nghi�m hi�n t�i c�a c�c h� kh�ng ��, xin h�y nh�p s� kh�c!")
		tbMeridanExp2Material:ExchangeAskClient4Numb()
		return
	end
	local nBitTskIdx = %tbVnMeridanHead.nMAX_EXP_EXCHANGE_TSK_IDX
	local nLimitCount = %tbVnMeridanHead.tbBitTask[nBitTskIdx].nMaxValue
	local nCurCount = %tbVnMeridanHead:GetDailyTaskCount(nBitTskIdx)
	if nCurCount >= nLimitCount then		
		return
	end
	if nCurCount + nInput > nLimitCount then
		nExchangeCount = nLimitCount - nCurCount
	else
		nExchangeCount = nInput
	end
	local nExpReduce = self:GetExpRequire(nExchangeCount)
	if not nExpReduce then		
		return
	end
	%tbVnMeridanHead:AddTaskDaily(nBitTskIdx, nExchangeCount)
	ReduceOwnExp(nExpReduce)
	local tbItemAward = {szName="Ch�n Nguy�n ��n (ti�u)",tbProp={6,1,30227,1,0,0},nCount=nExchangeCount,nBindState=-2}
	%tbAwardTemplet:Give(tbItemAward, 1, {"KinhMach", "ExpDoiChanNguyen", nExchangeCount})
end

function tbMeridanExp2Material:ExchangeAskClient4Numb()
	local nBITTSK_IDX = tbVnMeridanHead.nMAX_EXP_EXCHANGE_TSK_IDX
	if tbVnMeridanHead:CheckTaskLimit(nBITTSK_IDX) ~= 1 then
		Talk(1, "", format("M�i ng�y ch� c� th� ��i t�i �a %d v�t ph�m Ch�n Nguy�n ��n (ti�u)", tbVnMeridanHead.tbBitTask[nBITTSK_IDX].nMaxValue))
		return
	end
	if GetExp() < 5000000 then
		Talk(1, "", "<color=red>S� �i�m kinh nghi�m hi�n t�i qu� th�p, kh�ng th� ��i v�t ph�m. Y�u c�u ph�i c� �t nh�t 5000000 �i�m<color>")
		return
	end
	local nMaxCount = self:GetMaxCount()
	g_AskClientNumberEx(1, nMaxCount, "Nh�p s� l��ng", {self.ExchangeConfirm, {self}})
end

local pEventType = EventSys:GetType("AddNpcOption")
nId = pEventType:Reg("Th�n B� Th��ng Nh�n", "��i <Ch�n Nguy�n ��n (ti�u)>", tbMeridanExp2Material.Main,{tbMeridanExp2Material})
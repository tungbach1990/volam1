Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main(nItemIdx)
	if PlayerFunLib:VnCheckInCity ("default") ~= 1 then
		return 1
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "�� b�o ��m t�i s�n, y�u c�u ch�a �t nh�t <color=red>2<color> � tr�ng trong h�nh trang r�i m�i s� d�ng v�t ph�m n�y.")
		return 1
	end
	local tbBitTskLimitUse = {
		nTaskID = 2930,
		nStartBit = 15,
		nBitCount = 3,
		nMaxValue = 3,
	}
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBitTskLimitUse, tbBitTskLimitUse.nMaxValue, "S� d�ng v�t ph�m �� ��t ��n gi�i h�n, kh�ng th� s� d�ng th�m", "<") ~= 1 then
		return 1
	end
	tbVNG_BitTask_Lib:addTask(tbBitTskLimitUse, 1)
	local tbTmpAward = {
		[0] = {
			--{szName="X�ch L�n T�nh",tbProp={6,1,3396,1,0,0},nCount=1, nRate = 0},
			{szName = "�i�m kinh nghi�m", nExp =600e6, nCount = 1},
			--{szName="M�nh X�ch L�n",tbProp={6,1,3391,1,0,0},nCount=2, nRate = 0},
		},
		[1] = {
			{szName="X�ch L�n T�nh",tbProp={6,1,3396,1,0,0},nCount=1, nRate = 15},
			{szName = "�i�m kinh nghi�m", nExp =600e6, nCount = 1, nRate = 65},
			{szName="M�nh X�ch L�n",tbProp={6,1,3391,1,0,0},nCount=2, nRate = 20},
		},
	}
	local nItemParam = GetItemParam(nItemIdx, 1)	
	tbAwardTemplet:Give(tbTmpAward[nItemParam], 1, {"HopQuaPromotion", "SuDungHopQuaMayMan"})
end
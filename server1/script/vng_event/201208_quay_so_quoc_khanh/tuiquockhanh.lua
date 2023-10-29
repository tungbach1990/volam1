--item nh�n ���c t� promotion quay s� th�ng 8 - Created by DinhHQ - 20120821
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
_pExpAward = function(nItemCount, szLogTitle) 
	local tbBitTskExpLimit = {
		nTaskID = 2950,
		nStartBit = 1,
		nBitCount = 9,
		nMaxValue = 400
	}
	if tbVNG_BitTask_Lib:IsMaxValue(tbBitTskExpLimit) == 1 then
		Msg2Player("�� ��t gi�i h�n kinh nghi�m s� d�ng T�i M�ng Qu�c Kh�nh")
		return
	end
	local nCurTSKValue = tbVNG_BitTask_Lib:getBitTask(tbBitTskExpLimit)
	tbVNG_BitTask_Lib:addTask(tbBitTskExpLimit, 3)
	local nExp2Add = tbVNG_BitTask_Lib:getBitTask(tbBitTskExpLimit) - nCurTSKValue
	if nExp2Add > 0 then
		local tb = {szName = "�i�m Kinh Nghi�m", nExp=nExp2Add*1e7,}
		tbAwardTemplet:Give(tb, 1, {"QuaySoMungQuocKhanh", "SuDungTuiMungQuocKhanh"})	
	end	
end
function main(nItemIdx)
	if CalcFreeItemCellCount() < 3 then
		Talk(1, "", "�� tr�nh m�t m�t t�i s�n, xin h�y ch�a 3 �  tr�ng trong h�nh trang r�i m�i s� d�ng v�t ph�m")
		return 1
	end
	local tbTmpAward = {
		[1] = {
			[1] = {
				{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=2, nBindState = -2},
				{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=5,},
			},
			nRate = 50
		},
		[2] =	{pFun = function (nItemCount, szLogTitle) %_pExpAward() end, nRate = 50},	
	}
	tbAwardTemplet:Give(tbTmpAward, 1, {"QuaySoMungQuocKhanh", "SuDungTuiMungQuocKhanh"})
end
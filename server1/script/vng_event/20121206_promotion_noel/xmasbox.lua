Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main()
	if PlayerFunLib:VnCheckInCity ("default") ~= 1 then
		return 1
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "�� b�o ��m t�i s�n, y�u c�u ch�a �t nh�t <color=red>2<color> � tr�ng trong h�nh trang r�i m�i s� d�ng v�t ph�m n�y.")
		return 1
	end
	local tbBitTskLimitUse = {
		nTaskID = 2930,
		nStartBit = 2,
		nBitCount = 13,
		nMaxValue = 5000,
	}
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBitTskLimitUse, tbBitTskLimitUse.nMaxValue, "S� d�ng v�t ph�m �� ��t ��n gi�i h�n, kh�ng th� s� d�ng th�m", "<") ~= 1 then
		return 1
	end
	tbVNG_BitTask_Lib:addTask(tbBitTskLimitUse, 1)
	local tbTmpAward = {
		[1] = {szName = "�i�m kinh nghi�m", nExp =30e6, nCount = 1, nRate = 50},
		[2] = {
			nRate = 50,
			[1] = {szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=1, nBindState = -2},
			[2] = {szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=10},
		},
	}
	tbAwardTemplet:Give(tbTmpAward, 1, {"QuaySoNoel", "SuDungHopQuaGiangSinh"})
end
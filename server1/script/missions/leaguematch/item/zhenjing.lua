Include("\\script\\missions\\leaguematch\\head.lua")
Include("\\script\\lib\\pay.lua")

local tbData = 
{
	["6,1,2213"] = {nTaskId = 1803, nExp = 50000000},
	["6,1,2214"] = {nTaskId = 1804, nExp = 120000000},
	["6,1,2215"] = {nTaskId = 1805, nExp = 200000000},
	["6,1,2216"]= {nTaskId = 1806, nExp = 280000000},
	["6,1,2217"] = {nTaskId = 1807, nExp = 400000000},

}

--TaskId �÷��� 0~15λ��¼�ڼ���������16~32λ��¼ʹ�ô���
local _AddBitTask = function (nTaskId, nBitPos, nBitCount, nValue)
	local nOldValue = GetBitTask(nTaskId, nBitPos, nBitCount)
	SetBitTask(nTaskId, nBitPos, nBitCount, nOldValue + nValue)
end

function main(nItemIndex)
	local nG,nD,nP = GetItemProp(nItemIndex)
	local nMaxCount = 5
	local szKey = format("%d,%d,%d", nG,nD,nP)
	
	local Data = %tbData[szKey]
	local nWLLSId = GetGlbValue(GLB_WLLS_SID)
	if GetGlbValue(GLB_WLLS_PHASE) == 1 then
		nWLLSId = nWLLSId + 1
	end
	
	if GetBitTask(Data.nTaskId, 0, 15) ~= nWLLSId then
		SetBitTask(Data.nTaskId, 0, 15, nWLLSId)
		SetBitTask(Data.nTaskId, 16, 16, 0)
	end
	
	if GetBitTask(Data.nTaskId, 16, 16) >= nMaxCount then
		Talk(1, "", format("M�i m�a li�n ��u m�i nh�n v�t ch� ���c s� d�ng %d ��o c� n�y.", nMaxCount))
		return 1
	end
	
	if GetLevel() < 120 or IsCharged() ~= 1 then
		Talk(1, "", "C�p 120 tr� l�n v� �� n�p th� m�i c� th� s� d�ng ���c.")
		return 1
	end
	
	
	AddOwnExp(Data.nExp)
	%_AddBitTask(Data.nTaskId, 16, 16, 1)
	
end
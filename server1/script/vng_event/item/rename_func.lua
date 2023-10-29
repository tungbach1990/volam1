Include("\\script\\global\\rename_head.lua")
Include("\\script\\lib\\log.lua")
TSK_RENAME_FUNC_LIMIT = 3060
TIME_TO_NEXT_USE = 604800 -- 7*24*60*60

function main(nIdx)
	if (GetBit(GetTask(TASKVALUE_BLEND), 1) == 1) then
		Talk(1, "", "C�c h� hi�n c� 1 l�n ��i t�n, xin h�y ��n g�p S� Gi� � c�c th�n tr�n �� ��i sang t�n m�i.")
		return 1;
	end
	local nCurTime = GetCurServerTime()
	if nCurTime < (GetTask(TSK_RENAME_FUNC_LIMIT) + TIME_TO_NEXT_USE) then
		Talk(1, "", "C�n ph�i sau 7 ng�y t� l�n s� d�ng tr��c m�i c� th� d�ng v�t ph�m n�y.")
		return 1
	end
	SetTask(TSK_RENAME_FUNC_LIMIT, nCurTime)
	local nVal = SetBit(GetTask(TASKVALUE_BLEND), 1, 1)
	SetTask(TASKVALUE_BLEND, nVal)	
	Msg2Player("S� d�ng v�t ph�m th�nh c�ng, xin h�y ��n g�p S� Gi� � c�c th�n tr�n �� ti�n h�nh ��i t�n.")
	tbLog:PlayerActionLog("SuDungTinhDanhChiLenhThanhCong")
end
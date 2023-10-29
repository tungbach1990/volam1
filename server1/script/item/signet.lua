Include("\\script\\tong\\tong_award_head.lua");
Include("\\script\\global\\signet_head.lua")

function main(nItemIndex)
	local nItemTime = GetItemParam(nItemIndex,1);
	
	if (signet_clude_use(nItemIndex) == 0) then
		return 1
	end
	
	if (GetWeeklyOffer() >= MAX_WEEK_CONTRIBUTION)	then
		Say("�i�m c�ng hi�n �� ��t gi�i h�n tu�n, ch� c� th� b� sung v�o ng�n s�ch ki�n thi�t v� ng�n s�ch chi�n b�. C� mu�n s� d�ng ��o c� n�y kh�ng?", 
		2,
		"S� d�ng /#signet_sure_use("..nItemIndex..")",
		"H�y b� /cancel")
		return 1
	end
	--���Ӹ��˹��׶ȼ�������
	tongaward_fenglingdui()
end


function GetDesc(nItemIndex)
	local nYear = GetItemParam(nItemIndex, 2)
	local nMonth = GetItemParam(nItemIndex, 3)
	local nDate = GetItemParam(nItemIndex, 4)

	return "Th�i h�n s� d�ng: <color=blue>"..nYear.."n�m"..nMonth.."nguy�t "..nDate.."nh�t "
end

function PickUp( nItemIndex, nPlayerIndex )
	local _, nTongID = GetTongName()
	if (nTongID > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEYBOX_DROPMAX, 1)
	end
	return 1
end

function signet_sure_use(nItemIndex)
	if (signet_clude_use(nItemIndex) == 0) then
		return 0
	end
	
	if (RemoveItemByIndex(nItemIndex) == 1) then
		tongaward_fenglingdui()
	else
		print("Thao t�c h�y b� S�t gi� �n g�p l�i!")
	end
end

function signet_clude_use(nItemIndex)
	local nParam1 = GetItemParam(nItemIndex, 1)
	local nCurTime = GetCurServerTime()	--/��
	local szItemName = GetItemName(nItemIndex)
	if (nCurTime >= nParam1) then
		Msg2Player(szItemName.." �� h�o m�n, kh�ng th� s� d�ng!")
		RemoveItemByIndex(nItemIndex)
		return 0
	end
	local _, nTongID = GetTongName()

	if (nTongID == 0) then
		Msg2Player("Kh�ng c� trong bang h�i, kh�ng th� s� d�ng ��o c� n�y.")
		return 0
	end

	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE) then
		Msg2Player("�n s� kh�ng th� s� d�ng ��o c� n�y.")
		return 0
	end	
	return 1
end
--����������

Include("\\script\\missions\\leaguematch\\head.lua")

WLLS_HONOUR_ITEM_TB	= {
	[1254]	= {500, "L�nh b�i vinh d� Ho�ng Kim"},
	[1255]	= {100, "L�nh b�i vinh d� B�ch Ng�n"},
	[1256]	= {50, "L�nh b�i vinh d� Thanh ��ng"},
	[1257]	= {10, "L�nh b�i vinh d� H�n thi�t"},
}

--���Ի���
function main(nItemIndex)
	local nG, nD, nP	= GetItemProp(nItemIndex)
	local tbItem	= WLLS_HONOUR_ITEM_TB[nP]
	if (not tbItem) then
		Say("C�n th��ng d��c g� kh�ng?",0)
		return 1
	end
	SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + tbItem[1])
	SyncTaskValue(WLLS_TASKID_HONOUR)
	local szlog = format("�� s� d�ng %s, �i�m vinh d� t�ng th�m <color=yellow>%d<color> �i�m.", 
									tbItem[2], tbItem[1])
	Msg2Player(szlog)
	wlls_award_log(format("%s, t�ng c�ng c� %d �i�m", szlog, GetTask(WLLS_TASKID_HONOUR)))
end

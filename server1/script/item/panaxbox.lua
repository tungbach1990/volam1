--��ȡ�ؼ�ʱ�������ιޣ��Ӽ��ܣ�
--��ʾ����ιޣ��������ιޣ��رղι޼���ʹ���������������
TASKID_PANAXBOX_OPEND = 1577
TASKID_PANAXBOX_LASTIME = 1578
LINGSHENLI_TIME = 7 * 60 * 60

function main(nItemIndex)
	local nParam1 = GetItemParam(nItemIndex, 1)
	if (nParam1 == 0 and GetTask(TASKID_PANAXBOX_OPEND) == 0) then
		Say("Mu�n s� d�ng Linh s�m l�c?", 2, "m� /#lingshenli_want2open("..nItemIndex..")", "H�y b� /OnCancel")
	elseif (nParam1 == 1 and GetTask(TASKID_PANAXBOX_OPEND) == 1) then
		Say("Mu�n l�m h�p linh s�m kh�ng?", 2, "��ng/#lingshenli_want2close("..nItemIndex..")", "H�y b� /OnCancel")
	elseif (nParam1 == 1 and GetTask(TASKID_PANAXBOX_OPEND) == 0) then
		SetTask(TASKID_PANAXBOX_OPEND, 1)
	else
		Say("�� c� 1 nh�n s�m tr�m n�m ph�t huy t�c d�ng", 0)
	end
	return 1
end

function lingshenli_confirm(nItemIndex)
	if (RemoveItemByIndex(nItemIndex) == 1) then
		AddSkillState(735, 5, 1, LINGSHENLI_TIME * 18, 1);
		Msg2Player("Nh�n ���c linh l�c c�a nh�n s�m ng�n n�m, gi�p t�ng sinh l�c 20%, n�i l�c 20% v� kh�ng t�t c� 10 �i�m trong v�ng 7 gi�.");
	else
		print("ERROR!! ADD LINGSHENLI FAILED! NO ITEMINDEX");
	end;
end;

function OnCancel()
end

function lingshenli_want2open(nItemIndex)
	local nParam2 = GetItemParam(nItemIndex, 2)
	local nParam3 = GetItemParam(nItemIndex, 3)

	if (nParam2 == 0) then
		SetSpecItemParam(nItemIndex, 2, LINGSHENLI_TIME)
		nParam2 = LINGSHENLI_TIME
	elseif (nParam2 == -1) then
		RemoveItemByIndex(nItemIndex)
		SetTask(TASKID_PANAXBOX_OPEND, 0)
		Msg2Player("H�p nh�n s�m n�y �� m�t h�t linh l�c!")
	end
	SetSpecItemParam(nItemIndex, 3, GetGameTime())
	SetSpecItemParam(nItemIndex, 1, 1)
	SyncItem(nItemIndex)
	SetTask(TASKID_PANAXBOX_OPEND, 1)
	AddSkillState(735, 5, 1, nParam2 * 18, 1)
	local nMin, nSec = GetTimeSec2Min(nParam2)
	if (nMin <= 0) then
		Msg2Player("H�p nh�n s�m n�y c� th� ph�t huy t�c d�ng trong "..nSec.." gi�y.")
	else
		Msg2Player("H�p nh�n s�m n�y c� th� ph�t huy t�c d�ng trong "..nMin.."ph�t")
	end
end

function lingshenli_want2close(nItemIndex)
	local nParam2 = GetItemParam(nItemIndex, 2)
	local nParam3 = GetItemParam(nItemIndex, 3)
	local nGameTime = GetGameTime()
	local nlast = nParam2 - (nGameTime - nParam3)
	if (nlast <= 0) then
		SetSpecItemParam(nItemIndex, 2, -1)
		RemoveItemByIndex(nItemIndex)
		Msg2Player("H�p nh�n s�m n�y �� m�t h�t linh l�c!")
		AddSkillState(735, 5, 0, 0)
	else
		SetSpecItemParam(nItemIndex, 3, GetGameTime())
		SetSpecItemParam(nItemIndex, 2, nlast)
		SetSpecItemParam(nItemIndex, 1, 0)
		SyncItem(nItemIndex)
		local nMin, nSec = GetTimeSec2Min(nlast)
		if (nMin <= 0) then
			Msg2Player("H�p nh�n s�m n�y v�n c�n linh l�c"..nSec.." gi�y.")
		else
			Msg2Player("H�p nh�n s�m n�y v�n c�n linh l�c"..nMin.."ph�t")
		end
		AddSkillState(735, 5, 0, 0)
	end
	SetTask(TASKID_PANAXBOX_OPEND, 0)
end

function GetTimeSec2Min(nlast)
	return floor(nlast / 60), mod(nlast, 60)
end

function GetDesc(nItem)
	local nParam1 = GetItemParam(nItem, 1)
	if (nParam1 <= 0) then
		return "<color=blue>Tr�ng th�i ��ng<color>"
	else
		return "<color=blue>Tr�ng th�i m�<color>"
	end
end
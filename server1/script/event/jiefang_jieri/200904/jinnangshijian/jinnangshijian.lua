Include("\\script\\lib\\awardtemplet.lua");

function jf0904_getjinnangshijian()
	jf0904_InitTaskctrl();
	
	if (GetTask(jf0904_TSK_jinnangsj) >= 1) then
		Say("Ng��i �� nh�n v�t ph�m c�m nang s� ki�n r�i m�.", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("L� Quan: H�nh trang kh�ng �� ch� tr�ng, h�y �� th�a �t nh�t 1 ch� tr�ng!", 0);
		return
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("C�p b�c c�a ��i hi�p kh�ng �� 50 ho�c ch�a n�p th� n�n kh�ng th� nh�n ���c c�m nang s� ki�n.", 0);
		return
	end
	
	local nIndex = AddItem(6, 1, 1833, 1, 0, 0);
	ITEM_SetExpiredTime(nIndex, jf0904_item_expiredtime);
	SyncItem(nIndex);
	Say("L� Quan: Xin nh�n l�y!", 0);
	SetTask(jf0904_TSK_jinnangsj, 1);
end
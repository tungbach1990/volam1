IncludeLib("TIMER")

TIMER_XINNIANLIHUA = 83	--��ʱ��;��settings\timertask.txt����
XINNIANLIHUA_TIMES = 5*60	--��ȼ��5����
XINNIAN_MAXEXP = 100000000
TB_XINNIANLIHUA_SKILL = {757, 760};

TSK_XINNIANLIHUA_MAXEXP = 1587;
TSK_XINNIANNIANGAO_MAXEXP = 1588;

function isTakeXinNianItem(nItemIdx)
	if (GetLevel() < 80) then
		Say("B�n ph�i sau c�p 80 m�i c� th� s� d�ng!", 0);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (nDate > 20070306) then
		Say(GetItemName(nItemIdx).."�� qu� h�n s� d�ng, n�u ti�p t�c s� d�ng s� g�y h�i, c�n ph�i v�t b�!", 0);
		RemoveItemByIndex(nItemIdx);
		return 0;
	end;
	return 1;
end;


IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\task\\system\\task_string.lua")

function main()
	GiveItemUI("S�a trang b� b�ch kim", "H�y b� trang b� b�ch kim c�n s�a v�o", "repair_platina", "OnCancel", 1);
	return 1;
end

function repair_platina(nCount)

	if nCount ~= 1 then
		CreateTaskSay({"S� l��ng v�t ph�m b� v�o kh�ng ��ng y�u c�u", "Th�nh th�t xin l�i, ta s� s�p x�p l�i/main", "Th�t ng�i qu�, ta s� quay l�i sau./onCancel"});
		return
	end
	
	local nItemIndex	= GetGiveItemUnit(1)
	local nQuality		= GetItemQuality(nItemIndex);			--Ʒ��
	
	if (nQuality ~= 4) then
		CreateTaskSay({"H�y b� trang b� b�ch kim c�n s�a.", "Th�nh th�t xin l�i, ta s� s�p x�p l�i/main", "Th�t ng�i qu�, ta s� quay l�i sau./onCancel"});
		return
	end

	
	if (GetPlatinaLevel(nItemIndex) < 6) then
		CreateTaskSay({"Ch� c� th� s�a trang b� b�ch kim +6 tr� l�n.", "Th�nh th�t xin l�i, ta s� s�p x�p l�i/main", "Th�t ng�i qu�, ta s� quay l�i sau./onCancel"});
		return
	end
	
	if (GetCurDurability(nItemIndex) == GetMaxDurability(nItemIndex)) then
		CreateTaskSay({"Trang b?n�y c?�� �� b�n l�n nh�t r�i, kh�ng c�n ph�i s�a th�m", "Th�nh th�t xin l�i, ta s� s�p x�p l�i/main", "Th�t ng�i qu�, ta s� quay l�i sau./onCancel"});
		return
	end
		
	if (ConsumeItem(3, 1, 6, 1, 2163, 1) ~= 1) then	-- ɾ�������е���Ѫ��
		WriteLog("[Thi�t huy�t ��n s�a  �� b�n hi�n t�i]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\tX�a thi�t huy�t ��n th�t b�i");
		return
	end
	
	Msg2Player("S�a ch�a th�nh c�ng!");
	
	SetCurDurability(nItemIndex, GetMaxDurability(nItemIndex));
end
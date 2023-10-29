--------------------------------------------------------------------
-- ��Ҳ����ű�����Ҫ��Ӧ�������
--------------------------------------------------------------------
TIME_2000_1_1 = 946656000;
function BIND_ITEM(itemIdx)
	local g = GetItemProp(itemIdx)
	--������װ�����𻵵�װ��
	if g ~= 0 and g ~= 7 then
		Say("Ch� c� th� kh�a b�o hi�m cho trang b�!", 0)
		return
	end
	--���ɻص�����
	local szFunStep2 = "/#BIND_ITEM_2("..itemIdx..","..GetItemGenTime(itemIdx)..")"
	local nBindState = GetItemBindState(itemIdx)
	if nBindState < 0 then
		Say("V�t ph�m n�y �� � tr�ng th�i kh�a b�o hi�m, kh�ng c�n ph�i kh�a n�a!", 0)
	elseif nBindState > 0 then
		
		if (nBindState > (floor((GetCurServerTime() - TIME_2000_1_1) / 3600)) ) then
			Say("Th�i gian ��i kh�a c�a v�t ph�m n�y <color=green> v��t qua 168 ti�ng <color>, t�m th�i kh�ng th� m� kh�a l�i!", 0)
			return
		end
		
		Say("V�t ph�m n�y �ang trong giai �o�n �� m� kh�a b�o hi�m, c� mu�n kh�a ti�p t�c kh�ng?", 2, "��ng �"..szFunStep2, "Kh�ng mu�n/cancel")
	else
		Say("Khi trang b� ���c kh�a th� kh�ng th� giao d�ch, b�y b�n, v�t b� ho�c ��t v�o h�p ��i tho�i. ��ng th�i kh�ng cho ph�p ch� t�o, kh�m n�m, ��c bi�t l� khi PK s� kh�ng b� r�i ra. Trang b� ���c kh�a b�o hi�m v�n c� t�c d�ng nh� b�nh th��ng, vi�c m�c v�o, c�i b�, s�a ch�a ph�i th�ng qua vi�c <color=yellow>m� kh�a b�o hi�m<color> (n�t 'Th�o' tr�n giao di�n trang b�). Tuy nhi�n, sau <color=green>168 gi� <color> m�i c� th� ho�n to�n ���c m� kh�a.", 
			2, "Ta mu�n kh�a b�o hi�m trang b� n�y"..szFunStep2, "�� ta xem l�i/cancel")
	end
end

function BIND_ITEM_2(itemIdx, nGenTime)
	--У���Ƿ���ǰ����Ʒ
	if GetItemGenTime(itemIdx) ~= nGenTime then
		return
	end
	if IsMyItem(itemIdx) ~= 1 then
		
		return 
	end
	if BindItem(itemIdx) == 1 then
		WriteLog("ITEM_BIND\t"..date("%Y-%m-%d %X\t")..GetItemName(itemIdx).."\tBind\t"..GetAccount().."\t"..GetName())
		Msg2Player("B�n �� kh�a b�o hi�m th�nh c�ng m�t trang b�!")
	end
end

function UNBIND_ITEM(itemIdx)
	--���ɻص�����
	local szFunStep2 = "/#UNBIND_ITEM_2("..itemIdx..","..GetItemGenTime(itemIdx)..")"
	local nBindState = GetItemBindState(itemIdx)
	if nBindState == 0 then
		Say("V�t ph�m n�y ch�a ���c kh�a b�o hi�m!", 0)
	elseif nBindState > 0 then
		Say("V�t ph�m n�y �ang � tr�ng th�i m� kh�a b�o hi�m, kh�ng c�n ph�i m� kh�a n�a!", 0)
	elseif nBindState == -1 then
		Say("Sau khi nh�p n�t 'Th�o' �� m� kh�a b�o hi�m, c�n ph�i ��i <color=green>168 gi�<color> sau th� kh�a m�i c� th� ho�n to�n ���c m�.", 
			2, "Ta ��ng � m� kh�a b�o hi�m"..szFunStep2, "�� ta xem l�i/cancel")
	else
		Say("V�t ph�m n�y ���c kh�a b�o hi�m v�nh vi�n, kh�ng th� m� kh�a!", 0)
	end
end

function UNBIND_ITEM_2(itemIdx, nGenTime)
	--У���Ƿ���ǰ����Ʒ
	if GetItemGenTime(itemIdx) ~= nGenTime then
		return
	end
	if IsMyItem(itemIdx) ~= 1 then
		return 
	end
	if UnBindItem(itemIdx) == 1 then
		WriteLog("ITEM_BIND\t"..date("%Y-%m-%d %X\t")..GetItemName(itemIdx).."\tUnBind\t"..GetAccount().."\t"..GetName())
		Msg2Player("Y�u c�u m� kh�a b�o hi�m �� ���c g�i �i. Sau 168 gi� kh�a s� t� ��ng ���c m� ho�n to�n.")
	end
end

function cancel()
end
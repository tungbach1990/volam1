
function talk_yulongtie()
	Say("��y l� thi�p m�i m� Ng�c Long Trang Ch� ��a cho c�c anh h�ng h�o ki�t  trong thi�n h�, kh�ng ph�i ai c�ng c� th� c� ���c n�.",
		2,
		"Ta s� d�ng Nh�c V��ng H�n Th�ch �� ��i/get_yulongtie",
		"�� ta suy ngh� l�i/Cancel")
end

-- ��������֮ʯ��ȡ����Ӣ����
function get_yulongtie()
	if (CalcEquiproomItemCount(4, 507, 1, -1) < 1) then
		Say("Ng��i kh�ng c� Nh�c V��ng H�n Th�ch, ti�p t�c �i luy�n th�m r�i h�y ��n nh�.")
	else
		Say("Ng��i x�c ��nh d�ng Nh�c V��ng H�n Th�ch �� ��i l�y Ng�c Long anh H�ng Thi�p �� �i v�o Ki�m Gia M� Cung ch�?",
			2,
			"Mu�n/exchange_yulongtie",
			"�� ta suy ngh� l�i/Cancel")	
	end
end

function exchange_yulongtie()
	if (CalcFreeItemCellCount() == 0) then
		Say("Ch� tr�ng h�nh trang kh�ng ��.")
	elseif (CalcEquiproomItemCount(4, 507, 1, -1) >= 1 and 
		ConsumeEquiproomItem(1, 4, 507, 1, -1) == 1) then
		AddItem(6, 1, 2622, 1, 0, 0)
		Msg2Player("Ng��i nh�n ���c 1 Ng�c Long Anh H�ng Thi�p.")
	end
end

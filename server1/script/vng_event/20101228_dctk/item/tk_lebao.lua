IncludeLib("ITEM")
function main(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0
	end
	if(CalcFreeItemCellCount() < 5) then
		Talk(1, "", "�� b�o v� t�i s�n, xin vui l�ng ch�a 5 � tr�ng trong h�nh trang r�i m�i s� d�ng v�t ph�m n�y!")
		return 1
	end
	for i =1, 5 do
		local nItemIdx = AddItem(6,1,30083,1,0,0)		
		ITEM_SetExpiredTime(nItemIdx, 24*60)
		SyncItem(nItemIdx)
	end
	Msg2Player("B�n nh�n ���c <color=yellow>5 ..Phong V�n Chi�u Binh L�nh")
	return 0
end
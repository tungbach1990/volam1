function main()
	if ( GetTask(1201) == 10 ) then
		SetPos(1563,3118);
		Msg2Player("Tr��c ti�n ph�i ��i tho�i tr��c v�i D�ch Quan trong khu v�c")
	elseif ( GetTask(1201) == 20 ) then
		SetPos(1559,3113);
	elseif ( GetTask(1201) == 30 or GetTask(1201) == 25 or GetTask(1201) == 0 ) then
		SetPos(1563,3118);
		Msg2Player("Xin l�i! Hi�n t�i b�n kh�ng th� v�o �i ���c.")
	end
end;
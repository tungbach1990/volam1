function main()
	if ( GetTask(1202) == 10 ) then
		SetPos(1337,3154);
		Msg2Player("Tr��c ti�n ph�i ��i tho�i tr��c v�i D�ch Quan trong khu v�c")
	elseif ( GetTask(1202) == 20 ) then
		SetPos(1340,3148);
	elseif ( GetTask(1202) == 30 or GetTask(1202) == 25 or   GetTask(1202) == 0 ) then
		SetPos(1337,3154);
		Msg2Player("Xin l�i! Hi�n t�i b�n kh�ng th� v�o �i ���c.")
	end
end;
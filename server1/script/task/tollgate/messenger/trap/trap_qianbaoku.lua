function main()
	if ( GetTask(1203) == 10 ) then
		SetPos(1414,3197);
		Msg2Player("Tr��c ti�n ph�i ��i tho�i tr��c v�i D�ch Quan trong khu v�c")
	elseif ( GetTask(1203) == 21 ) then
		SetPos(1414,3197);
		Msg2Player("H�y ��i tho�i v�i D�ch Quan trong b�n �� tr��c �� ti�p t�c nhi�m v�.")
	elseif ( GetTask(1203) == 20 ) then
		SetPos(1414,3191);
		Msg2Player("Mu�n ra kh�i b�n �� n�y h�y �i t�m Ti�u Tr�n")
	elseif ( GetTask(1203) == 30 or GetTask(1203) == 25 or   GetTask(1203) == 0 ) then
		SetPos(1414,3197);
		Msg2Player("Xin l�i! Hi�n t�i b�n kh�ng th� v�o �i ���c.")
	end
end
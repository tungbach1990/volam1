function OnDeath ()
	Uworld128 = GetTask(128)
	Uworld134 = GetTask(134)
	if (Uworld128 == 30) then
		Uworld134 = SetBit(Uworld134,10,1)
		if (Uworld134 == 1023) then
			SetTask(128,40)
			Msg2Player("B�n tho�t ra kh�i ��m S�t Th� Th�n b� v� c� th� �i gi�i c�u Gi�i V� T� ")
			AddNote("B�n tho�t ra kh�i ��m S�t Th� Th�n b� v� c� th� �i gi�i c�u Gi�i V� T� ")
		elseif (Uworld134 ~= GetTask(134)) then
			SetTask(134,Uworld134)
			Msg2Player("B�n gi�t ���c 1 t�n Th�n B� S�t th� ")
		else
			-- �ظ�ɱ��ͬһֻNPC��������ʾ
		end
	end
end

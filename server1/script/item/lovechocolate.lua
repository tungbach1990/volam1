function main()
	local eatexp = GetTask(1563)
	local randomexp = {500000, 1000000, 1500000}
	if(eatexp > 100000000)  then   --ʹ�þ������20,000,000�������ٳ�
		Msg2Player("B�n �� �n qu� nhi�u S�c�la, coi ch�ng b� s�u r�ng ��!")
		return 1
	else			
		local i = random(1, 3)
		AddOwnExp(randomexp[i]) 
		SetTask(1563,eatexp+randomexp[i])
		if(GetTask(1563) >= 100000000) then
		Msg2Player("B�n �� �n qu� nhi�u S�c�la, coi ch�ng b� s�u r�ng ��!")
		end
		return 0	
	end
end
MONEY_ADDLIFETIME = 1000000

function Checkup()
	-- ��Ϊͨ��ʹ����Ʒ����������ʱ�䣬����Ǯ�Ĵ���ŵ�\\item\\chatroom\\pay.lua��
	return 1
end

function Consume()
	if (DelCommonItem(6,1,1062) == 1) then
		Msg2Player("<#><color=green>Th�m gi� th�nh c�ng<color>!")
		return 1
	end
	return 0
end

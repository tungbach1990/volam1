MONEY_CREATECHATROOM = 50000

function Checkup()
	if (GetCash() < MONEY_CREATECHATROOM) then
		Msg2Player(format("H�nh trang kh�ng ��  <color=yellow>%d<color> l��ng!", MONEY_CREATECHATROOM))
		return 0
	end
	return 1
end

function Consume()
	return Pay(MONEY_CREATECHATROOM)
end


function main()
	local UserDefineTask_TK = 747
	local nAdd =10000
	local nScoreTK = GetTask(UserDefineTask_TK)
	SetTask(UserDefineTask_TK,  nScoreTK + nAdd)
	Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c 10000 �i�m t�ch l�y t�ng kim")
	return 0
end
function main()
	local szTitle = "��i hi�p nh�n ph�n th��ng n�o?"
	local tbOpt={}
	tinsert(tbOpt, "Nh�n ��i th�nh b� k�p 150/daithanh150")
	tinsert(tbOpt, "Nh�n 10 000 Ch�n Nguy�n/channguyen")
	tinsert(tbOpt, "Nh�n 400 Tinh Ng�c/tinhngoc")
	tinsert(tbOpt, "Tho�t/no")
	Say(szTitle, getn(tbOpt), tbOpt)
	return 1
end

function daithanh150()
	ConsumeItem(3, 1, 6, 1, 2922, -1)
	AddItem(6,1,30446,0,0,0)
	Msg2Player("M� c�m h�p, nh�n ���c <color=yellow> ��i th�nh b� k�p 150<color>.")
end

function channguyen()
	ConsumeItem(3, 1, 6, 1, 2922, -1)
	local m = 10000
	SetTask(4000, GetTask(4000) + m)
	Msg2Player("M� c�m h�p, nh�n ���c <color=yellow>"..m.." Ch�n Nguy�n<color>")
end

function tinhngoc()
	ConsumeItem(3, 1, 6, 1, 2922, -1)
	AddStackItem(200,6,1,4546,1,0,0)
	AddStackItem(200,6,1,4546,1,0,0)
	Msg2Player("M� c�m h�p, nh�n ���c <color=yellow>400 Tinh Ng�c")
end
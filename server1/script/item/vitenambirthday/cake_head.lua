CAKE_ITEM = 
{
{"B�nh sinh nh�t",200000},
{"B�nh Sinh nh�t th��ng h�n",1000000},
}

MAX_EXP_CAKE = 50000000
TASK_CAKE_EXP = 1743

function main()
	if (GetTask(TASK_CAKE_EXP) < MAX_EXP_CAKE) then
		Msg2Player("B�n �� �n 1 "..CAKE_ITEM[caketype][1]..", nh�n ���c ph�n th��ng"..CAKE_ITEM[caketype][2].."�i�m kinh nghi�m.")
		AddOwnExp(CAKE_ITEM[caketype][2])
		SetTask(TASK_CAKE_EXP,GetTask(TASK_CAKE_EXP) + CAKE_ITEM[caketype][2]) 
		if (GetTask(TASK_CAKE_EXP) >= MAX_EXP_CAKE) then
			Msg2Player("B�n ch� c� th� nh�n ���c 50 tri�u �i�m kinh nghi�m t� b�nh sinh nh�t m� th�i!")
		else
			Msg2Player("B�n c� th� �n th�m b�nh sinh nh�t �� nh�n "..(MAX_EXP_CAKE-GetTask(TASK_CAKE_EXP)).."�i�m kinh nghi�m.")
		end
		return 0
	else
		Say("B�n ch� c� th� nh�n ���c 50 tri�u �i�m kinh nghi�m t� b�nh sinh nh�t m� th�i!",0)
		return 1
	end
end
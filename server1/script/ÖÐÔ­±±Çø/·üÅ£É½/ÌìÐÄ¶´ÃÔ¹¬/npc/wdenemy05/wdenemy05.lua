--description: 伏牛山 天心洞迷宫敌人　武当50级任务
--author: yuanlan	
--date: 2003/5/16
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5)
	if (UTask_wd == 50*256+20) and (random(0,99) < 33) then
		SetTask(5, 50*256+50)
		Earn(10000)
		Msg2Player("Цnh b筰 t猲 u m鬰 th� ph� Thi誸 C鴆, l蕐 頲 1 v筺 lng b鋘 ch髇g cp 頲. ")
		AddNote("T筰 Thi猲 T﹎ ng Ph鬰 Ng璾 s琻, nh b筰 t猲 u m鬰 th� ph� Thi誸 C鴆, l蕐 頲 1 v筺 lng. ")
	end
end;

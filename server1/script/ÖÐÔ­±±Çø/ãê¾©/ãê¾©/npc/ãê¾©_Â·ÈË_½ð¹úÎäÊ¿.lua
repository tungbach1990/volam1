-- 汴京 路人NPC 武士（少林入门任务）
-- by：Dan_Deng(2003-08-01)

function main()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(218) == 0)) then		--入门任务进行中
		Say("Thi誹 L﹎? Th﹏ 產ng � trong l穘h a c馻 i Kim qu鑓 n祔 m� v蒼 c遪 t﹎ tr� ngh� n b鋘 Thi誹 L﹎ x秓 quy謙 kia �? ",2,"Ki猲 tr� /enroll_S3_step2","Ti誴 t鬰 suy ngh� /enroll_S3_wrong")
	else
		Talk(1,"","Ch� c� ngi n祇 c� 頲 ph萴 ch蕋 ki猲 tr� b蕋 bi課 th� m韎 c� th� th鵦 hi謓 l� tng c馻 m譶h.")
	end
end;

function enroll_S3_step2()
	Talk(1,"enroll_S3_step3","H秓 ti觰 t�, c遪 d竚 ng ng筺h �?")
	Msg2Player("Цnh cho ngi m玹 tr薾 th藅 產u n ")
end;

function enroll_S3_step3()
	Say("Ta cho ngi th猰 m閠 c� h閕. N鉯! Ngi c� gh衪 c竔 b鋘 Thi誹 L﹎  kh玭g?",2,"V蒼 c� ki猲 tr� /enroll_S3_correct","Ti誴 t鬰 suy ngh� /enroll_S3_wrong")
end;

function enroll_S3_correct()
	Talk(1,"","Kh� l緈! Ch� c� ngi n祇 c� 頲 ph萴 ch蕋 ki猲 tr� b蕋 bi課 th� m韎 c� t� c竎h l祄 n猲 i s�. T苙g ng璷i m鉵 n祔. ")
	AddEventItem(218)
	Msg2Player("Nh﹏ 頲 Ki猲 Tinh Th筩h ")
	AddNote("Ch鴑g minh 頲 s� ki猲 quy誸 c馻 m譶h, nh薾 頲 Ki猲 Tinh Th筩h ")
end;

function enroll_S3_wrong()
	Talk(1,"","C竔 t猲 ngu ng鑓 n祔! ng c� l祄 � nh鬰 b鑞 ch� 'Ki猲 nh蒼 b蕋 b箃'  nh�!")
end;

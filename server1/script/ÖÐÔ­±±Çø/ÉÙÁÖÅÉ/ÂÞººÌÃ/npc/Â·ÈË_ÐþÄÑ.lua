-- 少林 路人NPC 罗汉堂首座玄难 少林出师任务
-- by：Dan_Deng(2003-08-04)
-- update by xiaoyang(2004\4\15) 少林90级任务

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	if allbrother_0801_CheckIsDialog(206) == 1 then
		allbrother_0801_FindNpcTaskDialog(206)
		return 0;
	end
	UTask_sl = GetTask(7)
	Uworld122 = GetTask(122)
--	if (UTask_sl == 70*256) and (Uworld122 == 245) then		-- 白名做完90级任务后又入了门派的，直接给技能
--		Talk(1,"","玄难：阿陀陀佛，施主果然英雄出众，这里有少林绝艺一部，望你勤加练习，不仅要成为本寺，更要成为中原武林的栋梁。")
--		AddMagic("金龙探爪")
--		AddMagic("横扫千军")
--		AddMagic("无相斩")
--		Msg2Player("学会少林技能金龙探爪、横扫千军、无相斩")
--		SetTask(122,255)
	if(GetSeries() == 0) and (GetFaction() == "shaolin") then
		if((UTask_sl == 60*256+10) and (HaveItem(217) == 1) and (HaveItem(215) == 1) and (HaveItem(216) == 1) and (HaveItem(214) == 1)) then		-- 任务完成
			L60_prise()
		elseif((UTask_sl == 60*256) and (GetLevel() >= 50)) then		--出师任务启动
			Say("Theo quy t綾 b鎛 m玭, ph祄  t� mu鑞 xu蕋 s� c馻 b鎛 m玭 u ph秈 tr秈 qua th� nghi謒 108 La H竛 Tr薾, ngi c� mu鑞 x玭g 秈 kh玭g?",2,"уng � /L60_get_yes","Kh玭g mu鑞 luy謓 /L60_get_no")
		else							-- 常规对话
			Talk(1,"","Thi誹 L﹎ th﹏ t筰 Kim qu鑓, h錸 hng Nam tri襲. Phng trng s� huynh u u蕋 nh� v藋 c騨g ng th玦!")
		end
	elseif (Uworld122 == 20) then
		Talk(4,"Uworld122_censure","Huy襫 Nh﹏ i s�! е t� Thi誹 L﹎ 產ng nh l玦 i t筰 Hoa S琻, nh� v藋 s� l祄 t鎛 h筰 danh ti課g c馻 Thi誹 L﹎ .","Ti觰 t� n祇 n y v藋? Chuy謓 c馻 Thi誹 L﹎ kh玭g c莕 ngi xen v祇 u.  甶!","T筰 h� ngang qua Hoa S琻 th蕐 b鉵g d竛g c馻 cao th� Kim Qu鑓, e r籲g qu� ph竔 b� mai ph鬰 .","е t� t鬰 gia c馻 Thi誹 L﹎ tr秈 d礽 kh緋 Kim Qu鑓, Qu﹏ Kim n誹 c� ng th� trc kh玭g l� ta kh玭g bi誸 sao? ng n鉯 nh鱪g l阨 s祄 b藋 n鱝 n誹 kh玭g 甶 ta kh玭g kh竎h s竜 u !")
   elseif (Uworld122 >= 30) and (Uworld122 < 60) then
   	Talk(1,"","C遪 ng y n鱝 �! Mu鑞 ta ra tay h�?") 
   elseif (Uworld122 == 70) then
   	Talk(7,"U122_prise","Чi s瓍厖","厖","Чi s�?","Th玦 th玦! L� ta sai r錳! Huy襫 Nan x璦 nay kh玭g c骾 u v韎 ai! Nay xin nh薾 l鏸 v韎 ti觰 huynh  y!","Ai da! Чi s�! Ta kh玭g d竚 nh薾 u!","Sao l筰 kh玭g? C竎 h�  c� c玭g c鴘 c竎  t� trong l骳 d莡 s玦 l鯽 b醤g, th藅 c� 琻 t竔 t筼.","Чi s� d竚 l祄 d竚 nh薾, ti觰 t� y b竔 ph鬰.")
	else
		Talk(1,"","Ngi bi誸 th� n祇 l� 'Thi襫 Quy襫 Quy Nh蕋' kh玭g? с l� ch� v� h鋍 Thi誹 L﹎ b竧 i tinh th玭g, l蕐 v� tu thi襫!")
	end
end;

function L60_get_yes()
	Talk(1,"","L鑙 v祇 La H竛 Tr薾 n籱 ph輆 sau tng Ph藅, h穣 v祇  l蕐: tr祅g h箃, thi襫 trng, M閏 ng�, b竧 nh� s� 4 t輓 v藅 n祔 sau  theo l鑙 v祇 tr� ra. T� m譶h lo li謚 nh�!")
	SetTask(7,60*256+10)
	AddNote("Nh薾 nhi謒 v� xu蕋 s� Thi誹 L﹎: V祇 La H竛 Tr薾 t譵 4 m鉵 t輓 v藅: Ni謒 Ch﹗, Thi襫 trng, M閏 Ng�, B竧 Vu. ")
	Msg2Player("Nh薾 nhi謒 v� xu蕋 s� Thi誹 L﹎: V祇 La H竛 Tr薾 t譵 4 m鉵 t輓 v藅: Ni謒 Ch﹗, Thi襫 trng, M閏 Ng�, B竧 Vu. ")
end;

function L60_get_no()
end;

function L60_prise()
	Talk(2,"","Ch骳 m鮪g ngi  x玭g qua 頲 108 La H竛 Tr薾, ngi c� th� xu蕋 s�, v� sau h祅h t萿 giang h�, c鴘 t� gi髉 ngi, h祅h hi謕 trng ngh躠, kh玭g 頲 c� v� sanh ki猽, nh� l蕐 !","е t� xin ghi nh�!")
	DelItem(217)
	DelItem(215)
	DelItem(216)
	DelItem(214)
	SetRank(62)
	SetTask(7,70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Trong La H竛 Tr薾 t譵 頲 4 m鉵 t輓 v藅 giao cho Huy襫 Nan, ho祅 th祅h nhi謒 v� xu蕋 s�. Th╪g ch鴆 V� Lng Th輈h T玭, thu薾 l頸 xu蕋 s�. ")
	Msg2Player("Ch骳 m鮪g B筺 xu蕋 s�! B筺  頲 phong l祄 V� Lng Th輈h T玭 ")
end;

function Uworld122_censure()
	SetTask(122,30)  --设置任务变量为30
	Msg2Player("Huy襫 Nan kh玭g ch� � n b筺, b筺 ch� c� th� 甶 t譵 Huy襫 Bi. ")
	AddNote("Huy襫 Nan kh玭g ch� � n b筺, b筺 ch� c� th� 甶 t譵 Huy襫 Bi. ")
end

function U122_prise()
   if(GetTask(7) >= 70*256) and (GetTask(7) ~= 75*256) then			-- 是天王弟子或出师弟子
		Talk(2,"Huy襫 Nan: Kim qu鑓 產ng ti誴 t鬰 ng binh, v� l﹎ Trung Nguy猲 s� l筰 c� m閠 phen kinh thi猲 ng a. � y l穙 t╪g c� m閠 quy觧 'Thi誹 L﹎ Tuy謙 k�', t苙g cho ti觰 h鱱, hy v鋘g ngi ch╩ ch� luy謓 c玭g, kh玭g ch� tr� th祅h  t� c馻 b鎛 t� m� c� c� th� l� ","S� r╪ d箉 c馻 i s�, ti觰 t� sao kh玭g d竚 tu﹏ theo!")
		if (HaveMagic(318) == -1) then		-- 必须没有技能的才给技能
			AddMagic(318,1)
		end
		if (HaveMagic(319) == -1) then		-- 必须没有技能的才给技能
			AddMagic(319,1)
		end
		if (HaveMagic(321) == -1) then		-- 必须没有技能的才给技能
			AddMagic(321,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("H鋍 頲 k� n╪g Thi誹 L﹎: Чt Ma ч Giang, Ho祅h T秓 Thi猲 Qu﹏, V� Tng Tr秏. ")
		SetTask(122,255)
	else
	   SetTask(122,245)  --获得声望的设置变量245
	end
   add_repute = ReturnRepute(30,100,4)			-- 声望奖励：最大30点，从100级起每级递减4%
   AddRepute(add_repute)
   Msg2Player("")
   Msg2Player("C鴘 Thng, L� hai ngi, h頿 gi秈 c飊g thi襫 t╪g, ho祅 th祅h nhi謒 v� Thi誹 L﹎. Danh v鋘g c馻 b筺 t╪g th猰. "..add_repute.."甶觤.")
   AddNote("C鴘 xu蕋 Thng, L� hai ngi, h頿 gi秈 c飊g thi襫 t╪g, ho祅 th祅h nhi謒 v� Thi誹 L﹎. ")
end

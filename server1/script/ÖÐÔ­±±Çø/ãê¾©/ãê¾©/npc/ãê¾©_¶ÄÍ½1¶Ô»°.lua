--description: 中原北区 汴京府 赌徒1对话 天忍教出师任务
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) and (HaveItem(129) == 0) then
		Talk(8, "select", "H玬 tay ta th藅 l� xui x蝟! t v竛 n祇 thua v竛 ! B﹜ gi� b猲 ngi ch� c遪 c﹜ ki誱 c飊 n祔 th玦!", "筺 Ki誱! L穙 huynh! C﹜ ki誱 n祔 huynh c� b竛 kh玭g?", "B竛! B竛 ch�! Ng璷i th藅 c� m総 tinh tng ! Nhi襲 ngi h醝 r錳 m� ta ch璦 b竛, v� h� kh玭g bi誸 nh譶!", "C莕 bao nhi猽 ti襫?", "Kh玭g m綾! Ch� c莕 500 lng!", "C� ng gi� v藋 kh玭g?", "Ngi xem ta  t� t琲 th� n祔 r錳! Th玦 th� xem nh� ngi gi髉  k� kh鑞 kh� v藋!", "Th玦 c騨g 頲! (D� sao ta c騨g 產ng c莕 n�) ")
	elseif (UTask_tr > 60*256+20) then 
		Talk(1,"","Ta kh玭g c遪 th� g� ng gi�  b竛 n鱝!")
	else
		Talk(1,"","M蕐 ng祔 nay ta kh玭g c� g� v祇 b鬾g! L莕 n祔 v� th� n祇 c騨g b� con s� t� � nh� x� x竎!")
	end
end;

function select()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(129)
		Msg2Player("L蕐 頲 畂秐 ki誱 Chuy觧 H錸 ")
		AddNote(" n s遪g b筩 � Bi謓 Kinh, mua m閠 thanh 畂秐 ki誱 m蕋 500 lng ")
	else
		Talk(1,"","Ch� l� ngi c騨g ngh蘯 m箃 gi鑞g ta v藋 sao?")
	end
end;

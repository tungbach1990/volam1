--description: 唐门耿子奇 40级任务 
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(7) == 1 then
		allbrother_0801_FindNpcTaskDialog(7)
		return 0;
	end
	UTask_tm = GetTask(2)
	if (UTask_tm == 40*256+20) then
		if (GetTaskTemp(4) == 31) then  --已经打败五只宠物
			Talk(7, "L40_step42", "V穘 b鑙 l�  t� Л阯g M玭,  t鮪g nghe qua C秐h T� K� i hi謕! ", "Л阯g D� l� ai?", "L� s� th骳 c馻 v穘 b鑙.", "H�! H緉 kh玭g c遪 m苩 m騣 n祇 n y g苝 ta, hay ch糿g d竚 n g苝 ta? L筰 ph竔 m閠 t猲 ti觰 b鑙 nh� ngi n l祄 g�?", "Ti襫 b鑙 hi觰 l莔 r錳! N╩ x璦 s� th骳 kh玭g ph秈 th蕐 ch誸 kh玭g c鴘, m� l� b鎛 m玭 v鑞 c� m玭 quy, kh玭g 頲 tr� b謓h cho ngi ngo礽 n猲 th骳 th骳 m韎 b蕋 c d� th玦! Х nhi襲 n╩ nay 玭g c� m穒 ray r鴆 trong l遪g!", "Nh鱪g duy猲 c� n祔 sao h緉 kh玭g ch th﹏ n gi秈 b祔 c飊g ta?", "Ti襫 b鑙 bi誸 s� th骳 v蒼 c遪 hi觰 l莔, e r籲g v鮝 g苝 m苩 kh玭g k辮 m� mi謓g th讌�.")
		else
			Talk(1,"","M芻 k� ngi l� ai, chuy謓 g� th� c騨g ph秈 h� g鬰 5 con gia s骳 c馻 ta <color=Red>S鉯 x竚, M穘h h�, Kim Ti襫 b竜, Heo r鮪g, G蕌 n﹗ <color> r錳 m韎 n鉯!")
--			AddNote("在青城山西部找到耿子奇，需要先打败他的五只家畜才会被耿子奇理会。")
		end
	elseif (UTask_tm == 40*256+60) then
		if (HaveItem(43) == 1) and (HaveItem(44) == 1) and (HaveItem(45) == 1) and (HaveItem(46) == 1) and (HaveItem(47) == 1) then		--已经得到五种药材
			Talk(2, "", "Ti課 b鑙, 5 lo筰 n祔 l� thu鑓 ch鱝 b謓h l�, ch� c莕 u鑞g 3 l莕 l� c� th� ch鱝 頲 b謓h!", " T鑤 l緈! Con g竔 ta 頲 c鴘 r錳!  t� ngi, c祅g 產 t� s� th骳 c馻 ngi, ta  hi觰 l莔 r錳!")
			DelItem(43)
			DelItem(44)
			DelItem(45)
			DelItem(46)
			DelItem(47)
			SetTask(2, 40*256+80)
			AddNote("Giao phng thu鑓 cho C秐h T� K�,  h鉧 gi秈 th祅h c玭g ﹏ o竛 gi鱝 玭g ta v� Л阯g D� ")
			Msg2Player("Ki誱  5 lo筰 dc li謚 甧m cho C秐h T� K�,  h鉧 gi秈 th祅h c玭g ﹏ o竛 gi鱝 玭g ta v� s� th骳 ")
		else
			Talk(3, "", "Ngi qu� th藅 c� c竎h c鴘 con g竔 ta sao?", "Л阯g D� s� th骳  n鉯 cho v穘 b鑙 phng thu鑓 n祔! V穘 b鑙 產ng t譵 5 lo筰 dc li謚 c莕 thi誸  ch鱝 b謓h l�!", "Th藅 c竚 琻 ngi! ")
		end
	elseif (UTask_tm >= 40*256+40) and (UTask_tm < 40*256+80) then					--尚未完成40级任务
		Talk(1,"","Ngi qu� th藅 c� c竎h c鴘 con g竔 ta sao?")
	elseif (UTask_tm >= 40*256+80) and (UTask_tm < 70*256) then					--已经完成40级任务，尚未出师
		Talk(1,"","Ta  tr竎h l莔 s� th骳 ngi, ta th藅 l蕐 l祄 h� th裯!")
	else									--尚未完成40级任务（缺省对话）
		Talk(1,"","襲 m� ta 產u l遪g nh蕋 tr猲 i l� ngi b筺 th﹏ nh蕋 c馻 ta l筰 l� k� v� t譶h v� ngh躠!")
	end
end;

function L40_step42()
	SetTask(2, 40*256+40)
	AddNote("Цnh b筰 5 lo筰 gia s骳 c馻 C秐h T� K�, bi誸 con g竔 玭g ta m綾 c╪ b謓h k� qu竔, mu鑞 t譵 уng D� s� th骳  ngh� c竎h ch鱝 tr� ")
	Talk(4,"","K� th鵦, ta gi誸 h緉 li謚 c� 輈h g�? Th� t� c馻 ta c騨g kh玭g th� s鑞g l筰 頲, v鑞 ta  kh玭g c遪 h鴑g th�, ch� mong 頲 s鑞g b猲 a con g竔 b� b醤g c馻 ta. N祇 ng�, a con g竔 duy nh蕋 c騨g m綾 ph秈 ch鴑g b謓h l� nh� v藋. N誹 c� con g竔 c騨g r阨 b� ta m� 甶, ta s鑞g tr猲 i c遪 c� � ngh躠 g�!", "Ti襫 b鑙, ng n玭 n鉵g! Con g竔 c馻 ngi nh蕋 nh 頲 c鴘!", "C遪 c� c竎h g� sao? S� th骳 c馻 ngi l� thi猲 h�  nh蕋 th莕 y. Ngo礽 h緉, c遪 ai c� th� c鴘 頲 con g竔 ta!", "Ta c� c竎h! в ta 甶 t譵 S� th骳!")
end;

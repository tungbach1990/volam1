--description: 天王帮渔妇荷嫂
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(205) == 1 then
		allbrother_0801_FindNpcTaskDialog(205)
		return 0;
	end
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then 		--40级任务
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 3) then		-- 子任务启动
			Talk(1,"","Ch錸g ta  ra s玭g b総 c� r錳, g莕 s緋 tr� v�. g ta th輈h ╪ canh Ng﹏ Nh� Li猲 T� nh蕋. Nh璶g kh玭g may l� h箃 sen trong ng祔 ta  d飊g h誸 c� r錳, ta 產ng b薾 gi苩 , ngic� th� 甶 n ti謒 t筽 ho� � Ba L╪g huy謓 mua v� m閠 輙 h箃 sen kh玭g 頲 kh玭g?")
			SetTask(14, 5)
			AddNote("T筰 Thu� Tr筰 � o Thi猲 Vng g苝 頲 ng� ph� H� T萿 gi髉 b� ta n ti謒 t筽 ho� � Ba L╪g huy謓, mua v� m閠 輙 Li猲 T� ")
			Msg2Player("T筰 Thu� Tr筰 � o Thi猲 Vng g苝 頲 ng� ph� H� T萿 gi髉 b� ta n ti謒 t筽 ho� � Ba L╪g huy謓, mua v� m閠 輙 Li猲 T� ")
		elseif (UTask_tw40sub == 5) then
			if (HaveItem(148) == 1) then		-- 子任务完成
				Talk(1,"","C秏 琻 ngi mua gi髉 ta mua h箃 sen v�, 3 qua tr鴑g g� n祔 t苙g xin t苙g ngi")
				DelItem(148)
				AddEventItem(149)
				Msg2Player("Nh薾 頲 3 qu� tr鴑g ")
				SetTask(14, 7)
				AddNote("Mang Li猲 T� giao cho H� t萿, nh薾 頲 3 qu� tr鴑g ")
			else
				Talk(1,"","H穞 sen c� b竛 t筰 ti謒 t筽 ho� � Ba L╪g huy謓")
			end
		elseif (UTask_tw40sub == 7) then
			if (HaveItem(149) == 0) then
				AddEventItem(149)
				Talk(2,"","H� t萿! Ta kh玭g c萵 th薾  nh r琲 m蕋 nh鱪g qu� tr鴑g c馻 t萿 r錳, t萿 c� th� cho ta l筰 m蕐 qu� n鱝 頲 kh玭g?","Xem th蕐 ngi r蕋 lo l緉g, � y c遪 c� 3 qu� tr鴑g, ta t苙g ngi!")
			else
				Talk(1,"","Canh Ng﹏ Nh� Li猲 T� n蕌 g莕 xong r錳, sao v蒼 ch璦 th蕐 l穙 ta v� ch�?")
			end
		elseif (UTask_tw40sub == 0) then
			Talk(1,"","Ai c� th� gi髉 ta 甶 mua h箃 sen v� th� t鑤 qu� ")
		else
			Talk(1,"","Ch錸g ta sao b﹜ gi� v蒼 ch璦 v� n鱝?")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","Ch錸g ta l� m閠 ngi ch蕋 ph竎, n b﹜ gi� v蒼 c遪 l� m閠 ph� o l躰h. Kh玭g bi誸 khi n祇 m韎 c� th� n� m祔 n� m苩!")
		else
			Talk(1,"","Trong c竎 h� ph竝 c馻 b鎛 bang, L� l穙 h� ph竝 i v韎 c竎 thu閏 h� l�  lng nh蕋, H� h� ph竝 l� 輙 n鉯 nh蕋, Vng ti襫 s� l� ngi b閏 tr鵦 nh蕋, Dng H鱱 s� l� ngi th玭g minh s竛g su鑤 nh蕋,")
		end
	end
end;

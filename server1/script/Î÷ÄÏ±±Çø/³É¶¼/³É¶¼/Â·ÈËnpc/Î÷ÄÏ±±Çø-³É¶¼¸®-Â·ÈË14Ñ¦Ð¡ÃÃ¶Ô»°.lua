--西南北区 成都府 路人14薛小妹对话  峨嵋派40级任务
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)
-- 修改Dan_Deng 的错误：QBJ(2003-10-3)

function main(sel)
	UTask_em = GetTask(1)
	UTask_emsub01 = GetByte(GetTask(29),1)
	if (UTask_em == 40*256+50) then		-- 40级任务中
		if (UTask_emsub01 == 0) then
			Talk(5, "", "V� i t� n祔, � c飊g v韎 mu閕, c� phi襫 kh玭g? ", "Kh玭g ti謓! V� tr猲 ngi mu閕 c� m閠 m飅 k� l�,n猲� ", "A! T� ng鰅 頲 �? Mu閕 d飊g Linh X� Hng Nan, hng li謚 n祔 ch� � T﹜ V鵦 m韎 c�!", "Th� ra l� Linh X� Hng Nang! Th秓 n祇 m飅 th琺 quy課 r�! Mu閕 c� th� b竛 cho ta t骾 Linh X� Hng Nang n祔 頲 kh玭g? Ta 產ng c莕  c鴘 ngi!", "B竛 th� kh玭g b竛! Nh璶g mu閕 nghe n鉯 ti謒 t筽 ho� � trong th祅h g莕 y c� m閠 c﹜ tr﹎ b筩 p, t� l蕐 c﹜ tr﹎  n i v韎 ta")
			SetTask(29,SetByte(UTask_emsub01,1,1))			-- 设置task(29)第1个字节为1
--			SetTask(29, 2)	
			AddNote("G苝 Ti誸 Ti觰 mu閕 (383, 315) t譵 頲 Linh X� Hng Nang, nh璶g ph秈 l蕐 Ng﹏ Tr﹎ i. ")
			Msg2Player("Ti誸 Ti觰 mu閕 xin  ngh� l蕐 Ng﹏ Tr﹎  i l蕐 Linh X� Hng Nang ")
		elseif ((UTask_emsub01 == 1) and (HaveItem(63) == 1)) then
			Say("Tr﹎ b筩 n祔 p qu�! Hng nang n祔 i cho t� y!", 1, "T譵 頲 Linh X� Hng Nang /get")
			DelItem(63)
			AddEventItem(166)
			SetTask(29,SetByte(UTask_emsub01,1,10))
--			SetTask(29, 2)
			AddNote("Nh薾 頲 Linh X� Hng Nang t� ch� Ti誸 Ti觰 mu閕 ")
			Msg2Player("T譵 頲 Linh X� Hng Nang ")
		elseif (UTask_emsub01 == 10) and (HaveItem(166) == 0) then
			AddEventItem(166)
			Talk(1,"","C莔 l蕐 n祔! Hng Nang ch璦 l蕐  v閕 v祅g ch箉 甶!")
		else
			Talk(1,"","Чi t�! ng c� c秐 tr� vi謈 l祄 ╪ c馻 mu閕 c� 頲 kh玭g?")
		end
	else
		Talk(1,"","Чi t�! ng c� c秐 tr� vi謈 l祄 ╪ c馻 mu閕 c� 頲 kh玭g?")
	end
end;

function get()
end;

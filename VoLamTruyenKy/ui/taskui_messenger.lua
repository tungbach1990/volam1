
--将开箱序号转换成字符串
function get_task_string(nCode)
	local szRet = ""
	local nCount = 0
	if nCode then
		while(nCode > 0) do
			local nDigit = mod(nCode, 10)
			nCode = floor(nCode/10)
			if 0==nCount then
				szRet = format("%d",nDigit)
			else
				szRet = format("%d,%s",nDigit,szRet)
			end
			nCount = nCount+1
		end
	end
	return szRet,nCount
end

function showmessengerdesc(nTaskIdx, nTaskGenre) --闯关任务之信使任务
	Uworld1201 = GetTask(1201)
	Uworld1202 = GetTask(1202)
	Uworld1203 = GetTask(1203)
	Uworld1204 = GetTask(1204)
--	Uworld1205 = GetTask(1205)
--	Uworld1206 = GetTask(1206)
--	Uworld1207 = GetTask(1207)
--	Uworld1208 = GetTask(1208)
--	Uworld1209 = GetTask(1209)
--	Uworld1210 = GetTask(1210)
--	Uworld1211 = GetTask(1211)
--	Uworld1212 = GetTask(1212)
--	Uworld1213 = GetTask(1213)
--	Uworld1214 = GetTask(1214)
--	Uworld1215 = GetTask(1215)
--	Uworld1216 = GetTask(1216)
--	Uworld1218 = GetTask(1218)
	
	NewTask_TaskTextOut(nTaskGenre, "<color=red>Ch祇 m鮪g b筺 v祇 giao di謓 nhi謒 v�:<color>")
--	NewTask_TaskTextOut(nTaskGenre, "你在风之骑地图中累积触碰的标志为："..Uworld1208)
--	NewTask_TaskTextOut(nTaskGenre, "你在山神庙地图中累积干掉的刀妖为："..Uworld1209)
--	NewTask_TaskTextOut(nTaskGenre, "你在千宝库地图中累积开启的宝箱为："..Uworld1210)
--	NewTask_TaskTextOut(nTaskGenre, "你目前的信使积分为："..Uworld1205)
	NewTask_TaskTextOut(nTaskGenre, "  <enter>")
	
	if ( Uworld1204 ~= 0 ) then
		NewTask_TaskTextOut(nTaskGenre, "Ngi  nh薾 頲 nhi謒 v� T輓 S� Thi猲 B秓 Kh�.")
			
--		if ( Uworld1201 ~= 0 ) then -- 风之骑任务
--			if ( Uworld1201 == 10 ) then
--				NewTask_TaskTextOut(nTaskGenre, "你可以去找<color=red>车夫<color>，从他那里经过进入快捷地图<color=red>风之骑<color>到达送信地点。")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1201 == 20 ) then
--				NewTask_TaskTextOut(nTaskGenre, "你在该关卡需要触碰<color=red>5枚斥候标志<color>便可顺利通过。当然，你可以自由选择留在本关的时间，只要在规定时限内通过，并将信笺交到目标城市驿官处即可。")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1201 == 30 ) then
--				NewTask_TaskTextOut(nTaskGenre, "你已<color=red>达到<color>本关的过关要求，请尽快与信使联系。")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			end
--			NewTask_TaskTextOut(nTaskGenre, "你需要触碰<color=red>5枚斥候标志<color>，目前你已触发了<color=red>"..Uworld1207.."<color>枚")
--		end
--		
--		if ( Uworld1202 ~= 0 ) then -- 山神庙任务
--			if ( Uworld1202 == 10 ) then
--				NewTask_TaskTextOut(nTaskGenre, "你可以去找<color=red>车夫<color>，从他那里经过进入快捷地图<color=red>山神庙<color>到达送信地点。")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1202 == 20 ) then
--				NewTask_TaskTextOut(nTaskGenre, "你在该关卡需要干掉<color=red>两名刀妖<color>便可顺利通过。当然，你可以自由选择留在本关的时间，只要在规定时限内通过，并将信笺交到目标城市驿官处即可。")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			elseif ( Uworld1202 == 30 ) then
--				NewTask_TaskTextOut(nTaskGenre, "你已<color=red>达到<color>本关的过关要求，请尽快与信使联系。")
--				NewTask_TaskTextOut(nTaskGenre, "<enter>")
--			end
--			NewTask_TaskTextOut(nTaskGenre, "你需要干掉<color=red>两名刀妖<color>，目前你已杀死了<color=red>"..Uworld1207.."<color>名")
--		end
		
		if ( Uworld1203 ~= 0 ) then -- 千宝库任务
			if ( Uworld1203 == 10 ) then
				NewTask_TaskTextOut(nTaskGenre, "Ngi c� th� 甶 t譵<color=yellow> Xa Phu <color>, t� ch� c馻 玭g ta 甶 qua b秐  Kho竔 Ti謕<color=yellow>Thi猲 B秓 Kh�<color> n a 甶觤 a tin.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 20 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				NewTask_TaskTextOut(nTaskGenre, "T筰 nhi謒 v� c鯽 秈 n祔 ngi c╪ c� <color=yellow>["..szTask.."]<color>Th� t� m� 5 B秓 Rng")
				NewTask_TaskTextOut(nTaskGenre, "Ngi  m� B秓 Rng: <color=yellow>["..szFinish.."]<color>.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 21 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				NewTask_TaskTextOut(nTaskGenre, "Ngi c� th� t譵<color=yellow> Xa Phu<color> a ngi 甶 n b秐  nhi謒 v� Thi猲 B秓 Kh�.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
				NewTask_TaskTextOut(nTaskGenre, "T筰 nhi謒 v� c鯽 秈 n祔 ngi c╪ c� <color=yellow>["..szTask.."]<color>Th� t� m� 5 B秓 Rng")
				NewTask_TaskTextOut(nTaskGenre, "Hi謓 t筰 ngi  m� B秓 Rng: <color=yellow>["..szFinish.."]<color>.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 25 ) then
				local szTask,_ = get_task_string(Uworld1201)
				local szFinish,_ = get_task_string(Uworld1202)
				NewTask_TaskTextOut(nTaskGenre, "Ch骳 m鮪g ngi  ho祅 th祅h nhi謒 v�, nhanh ch鉵g 甶 t譵<color=yellow>Ti猽 Tr蕁<color>甶.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			elseif ( Uworld1203 == 30) then
				NewTask_TaskTextOut(nTaskGenre, "Ngi <color=yellow>t n <color>y猽 c莡 vt 秈 c馻 秈 n祔, h穣 nhanh ch鉵g li猲 h� v韎 T輓 S�.")
				NewTask_TaskTextOut(nTaskGenre, "<enter>")
			end
		end
	else
		NewTask_TaskTextOut(nTaskGenre, "Ngi v蒼 ch璦 nh薾 nhi謒 v� T輓 S� Thi猲 B秓 Kh�, c� th� n Чi L� ho芻 Th祅h Й t譵<color=yellow>D辌h Quan<color>nh薾 nhi謒 v�.")
	end
end
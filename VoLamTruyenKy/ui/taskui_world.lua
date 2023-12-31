-- 显示世界任务的过程
function showworldtaskdesc(nTaskIdx, nTaskGenre)
	local Uworld1066  = GetTask(1066)
	local Uworld1065  = GetTask(1065)
	
	local myWorldText = {
			[0]="B筺 nghe n T躰h S� (205, 199) �<color=red> T﹜ S琻 th玭<color> r蕋 am hi觰 v� T﹜ S琻 t�.",
			[1]="T躰h S� cho b筺 bi誸 v礽 甶襲 v� T﹜ S琻 L躰h, nh璶g 玭g b秓 b筺 甶 thu th藀 500 quy觧 <color=red>M藅  th莕 b�<color> ",
			[2]="B筺 giao 500 quy觧 M藅 t辌h giao cho T躰h S�, T躰h S� b秓 b筺 v祇 th玭 (214, 195) t譵 <color=red>T﹜ S琻 Ti觰 Nh�<color>, Y s� d蒼 b筺 甶 T﹜ S琻 L躰h."
			}
			
	local CollectMeatText = {
			[0]="Nhi謒 v� T﹏ Th� th玭 l蕐 th辴 ti",
			[1]="B筺 n g苝 V� s� ti誴 nh薾 nhi謒 v� n T﹏ Th� th玭 ho芻 ngo礽 th祅h nh qu竔 l蕐 th辴 ti, V� s� y猽 c莡 b筺 l蕐 頲"..Uworld1066.."mi課g th辴 ti."
	}
	
	--local myTaskValue = GetTask(1064)

	--if (GetLevel()>=100) then		
	--	if (myTaskValue < 2) then
	--		NewTask_TaskTextOut(nTaskGenre, myWorldText[myTaskValue])
	--	else
	--		NewTask_TaskTextOut(nTaskGenre, myWorldText[2])			
	--	end
	--	NewTask_TaskTextOut(nTaskGenre, "<enter>")
	--end
	
	if ( Uworld1066 ~= 0 ) then
		NewTask_TaskTextOut(nTaskGenre, CollectMeatText[0])
		NewTask_TaskTextOut(nTaskGenre, CollectMeatText[1])
		NewTask_TaskTextOut(nTaskGenre, "<enter>")
	end
	
	NewTask_TaskTextOut(nTaskGenre, "B筺 hi謓 c� "..Uworld1065.."mi課g th辴 ti. m th辴 ti t譵 V� s� ti誴 nh薾 nhi謒 v� mua b竛 th辴  nh薾 ph莕 thng.")

	--storm_task(nTaskIdx, nTaskGenre)		--Storm 任务面版
	--zq_mooncake_task(nTaskIdx, nTaskGenre)	--中秋月饼
end


--Storm 任务面版 ----------------------------------------------------------------------------------------------
function storm_task(nTaskIdx, nTaskGenre)
	--得到最后一次触发积分系统的日期
	local n_date = GetTask(1678)
	local str_date = floor(n_date/10000).."."..floor(mod(n_date,10000)/100).."."..mod(n_date,100)
	str_date = "<color=white>("..str_date..")<color>"
	
	if (GetTask(1661) > 275) then
		NewTask_TaskTextOut(nTaskGenre, "<enter>'<color=red>Phong ba th竛g 9<color>' ho箃 ng  k誸 th骳!")
	else
		NewTask_TaskTextOut(nTaskGenre, "<enter>'<color=red>Phong ba th竛g 9<color>' t譶h h譶h ho箃 ng h玬 nay"..str_date..":<enter>")
		NewTask_DetailTextOut(nTaskGenre, " t猲 ho箃 ng   s� l莕   tr筺g th竔   甶觤 t輈h l騳 cao nh蕋<enter>")
		storm_gamedetail("Chi課 trng T鑞g Kim", 1, 1681, 1682, 1685)
		storm_gamedetail("s竧 th� ", 2, 1687, 1688, 1691)
		--storm_gamedetail("信使任务", 1, 1693, 1694, 1697)
		storm_gamedetail("Nhi謒 v� D� T萿", 1, 1699, 1700, 1703)
	end
	NewTask_TaskTextOut(nTaskGenre, "<enter>'<color=red>Phong ba th竛g 9<color>'   t譶h h譶h 甶觤 t輈h l騳 g莕 y"..str_date..":<enter>")
	NewTask_DetailTextOut(nTaskGenre, " 觤 t輈h l騳 h玬 nay:"..point2str(GetTask(1662)).."     觤 t輈h l騳 h玬 qua:"..point2str(GetTask(1663)).."<enter>")
	NewTask_DetailTextOut(nTaskGenre, " 觤 t輈h l騳 tu莕 n祔:"..point2str(GetTask(1667)).."     觤 t輈h l騳 tu莕 trc:"..point2str(GetTask(1668)).."<enter>")
	NewTask_DetailTextOut(nTaskGenre, " 觤 t輈h l騳 th竛g n祔:"..point2str(GetTask(1672)).."     觤 t輈h l騳 th竛g trc:"..point2str(GetTask(1673)).."<enter>")
end

--显示指定活动的风暴积分参与情况
function storm_gamedetail(nTaskIdx, nTaskGenre, name, max_count, task_start, task_count, task_point)
	local trycount = GetTask(task_count)
	local str = "[<color=green>"..name.."<color>]   "..point2str(trycount,1).."/"..max_count.."   "
	if (GetTask(task_start) > 0) then
		str = str.."<color=red>ng ti課 h祅h<color>"
	elseif (trycount <= 0) then
		str = str.."<color=blue>Ch璦 ti課 h祅h<color>"
	elseif (trycount < max_count) then
		str = str.."<color=green>Х ti課 h祅h<color>"
	else
		str = str.."<color=8947848>Х k誸 th骳<color>"
	end
	str = str.."   "..point2str(GetTask(task_point)).."<enter>"
	NewTask_DetailTextOut(nTaskGenre, str)
end


--中秋 月饼面版 --------------------------------------------------------------------------------------------------
ZQ_MOONCAKE_TYPE = {"B竛h Trung Thu th藀 c萴", "B竛h Trung Thu Qu� Nh﹏", "B竛h Trung thu sen tr鴑g", "B竛h Trung Thu u Tr鴑g", "B竛h Trung thu h箃 sen ", "B竛h Trung Thu u Xanh"}
ZQ_MOONCAKE_LIFE = {10, 5, 3, 3, 3, 3}
ZQ_MOONCAKE_STAT = {{3,"nh祇 b閠",98}, {5,"l祄 nh﹏ b竛h",77}, {7,"nng b竛h",104}}

function zq_mooncake_task(nTaskIdx, nTaskGenre)
	local n_taskvalue = GetTask(1569)
	local n_cake_type = floor(n_taskvalue/1000)
	local n_cake_stat = mod(n_taskvalue, 1000)
	NewTask_TaskTextOut(nTaskGenre, "<enter>Ho箃 ng l祄 b竛h Trung thu:<enter>")
	if (n_cake_type == 0) then
		NewTask_DetailTextOut(nTaskGenre, "   v蒼 ch璦 b総 u!~~~<pic=5><enter>"
			.."     Mau n y l祄! <pic=59>!<enter>")
	else
		NewTask_DetailTextOut(nTaskGenre, "  <color=green><bclr=dgreen>"..ZQ_MOONCAKE_TYPE[n_cake_type].."<bclr><color>")
		if (n_cake_stat == 1 or n_cake_stat == 2) then
			NewTask_DetailTextOut(nTaskGenre, "   Chao 玦! Chi誧 b竛h n祔  b� nng kh衪 r錳!~~<pic=10><enter>")
		else
			NewTask_DetailTextOut(nTaskGenre, "      <Tr譶h t�>     <Tr筺g th竔><enter>")
			local str = ""
			for _, tb_stat in ZQ_MOONCAKE_STAT do
				if (n_cake_stat == tb_stat[1]-1 or n_cake_stat == tb_stat[1]) then
					str = str.."   <pic=115>"
				else
					str = str.."      "
				end
				str = str.."<color=white><bclr=fire>"..tb_stat[2].."<bclr><color>     "
				if (n_cake_stat < tb_stat[1]) then
					str = str.."<color=hblue>ch璦 ti課 h祅h<color>"
				elseif (n_cake_stat == tb_stat[1]) then
					str = str.."<color=yellow>產ng ti課 h祅h<color><pic=99>"
				else
					str = str.."<color=green> ho祅 th祅h<color><pic="..tb_stat[3]..">"
				end
				str = str.."<enter>"
			end
			if (n_cake_stat == 4 or n_cake_stat == 6 or n_cake_stat == 8) then
				str = str.."<enter>   H穣 n <color=yellow>Th� b竛h<color>xem sao.<color><enter>"
			end
			NewTask_DetailTextOut(nTaskGenre, str)
		end
	end
end

--返回指定长度、带颜色的字符串
--len：	指定长度，nil为默认值
function point2str(point, len, color)
	if not color then
		color = "yellow"
	end
	local str = tostring(point)
	if (len == nil) then
		len = 4
	end
	
	while (strlen(str) < len) do
		str = " "..str
	end
	
	return "<color="..color..">"..str.."<color>"
end
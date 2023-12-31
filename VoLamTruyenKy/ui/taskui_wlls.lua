WLLS_TB	= 1715
WLLS_TASKID_WIN		= WLLS_TB+5	--个人胜利次数
WLLS_TASKID_TIE		= WLLS_TB+6	--个人平局次数
WLLS_TASKID_TOTAL	= WLLS_TB+7	--个人参赛次数
WLLS_TASKID_POINT	= 2500		--个人累计积分
WLLS_TASKID_HONOUR	= 2501		--个人荣誉点数（可消耗积分）

--WLLS_TASKID_POINT	= 2500		--个人累计积分（越南）
WLLS_TASKID_HONOUR	= 2501		--个人荣誉点数（可消耗积分）

WLLS_TASKID_LGTYPE	= WLLS_TB+11	--战队类型
WLLS_TASKID_LGPOINT	= WLLS_TB+12	--战队积分
WLLS_TASKID_LGRANK	= WLLS_TB+13	--战队排名
WLLS_TASKID_LGWIN	= WLLS_TB+14	--战队胜利次数
WLLS_TASKID_LGTIE	= WLLS_TB+15	--战队平局次数
WLLS_TASKID_LGTOTAL	= WLLS_TB+16	--战队参赛次数
WLLS_TASKID_LGTIME	= WLLS_TB+17	--战队战斗时间

--武林联赛
function showbwtaskdesc(nTaskIdx, nTaskGenre)
	--个人战绩
	NewTask_TaskTextOut(nTaskGenre, "Th祅h t輈h c� nh﹏ V� l﹎ i h閕")
	local n_total = GetTask(WLLS_TASKID_TOTAL)
	local n_win = GetTask(WLLS_TASKID_WIN)
	local n_point = GetTask(WLLS_TASKID_POINT)
	local n_honour = GetTask(WLLS_TASKID_HONOUR)
	NewTask_DetailTextOut(nTaskGenre, "   tham gia t鎛g c閚g "..n_total.."tr薾 thi u, t 頲"..n_win.." l莕 chi課 th緉g, 甶觤 t輈h l騳 t 頲 "..n_point.." . Hi謓 c� th� ti猽 hao 甶觤 vinh d� "..n_honour.." <enter>")
	--战队信息
	NewTask_TaskTextOut(nTaskGenre, "\n========== <color=red>Tin t鴆 chi課 i V� l﹎ i h閕<color> ==========")
	local n_lgtype = GetTask(WLLS_TASKID_LGTYPE)
	tb_desc = {"V� l﹎ li猲 u", "V� l﹎ li猲 u"}
	if (n_lgtype > 0) then
		NewTask_DetailTextOut(nTaskGenre, "   B筺  gia nh藀 <color=red>"..tb_desc[n_lgtype].."<color>chi課 i<enter>")
		n_win = GetTask(WLLS_TASKID_LGWIN)
		n_total = GetTask(WLLS_TASKID_LGTOTAL)
		local n_tie = GetTask(WLLS_TASKID_LGTIE)
		local n_lose = n_total - n_tie - n_win
		n_point = GetTask(WLLS_TASKID_LGPOINT)
		local n_time = ceil(GetTask(WLLS_TASKID_LGTIME)/18)
		local f_rate = 0
		if (n_total > 0) then
			f_rate = n_win/n_total*100
		end
		local n_rank = GetTask(WLLS_TASKID_LGRANK)
		local str_rank
		if (n_rank > 1000) then
			str_rank = " Th� h筺g sau <color=yellow>1000<color>"
		elseif (n_rank > 0) then
			str_rank = "  "..point2str(n_rank, 2).."  "
		else
			str_rank = " v蒼 ch璦 x誴 h筺g "
		end
		NewTask_DetailTextOut(nTaskGenre, "    tham gia u <color=yellow>"..n_total.."<color> tr薾: ")
		NewTask_DetailTextOut(nTaskGenre, "     th緉g <color=yellow>"..n_win.."<color>tr薾, h遖 <color=yellow>"..n_tie.."<color>tr薾, thua<color=yellow>"..n_lose.."<color>tr薾<enter>")
		NewTask_DetailTextOut(nTaskGenre, "     t� l� th緉g <color=yellow>"..strsub(f_rate,1,4).."<color>%<enter>")
		NewTask_DetailTextOut(nTaskGenre, "   甶觤 t輈h l騳 chi課 i: <color=yellow>"..n_point.."<color>   th阨 gian thi u t輈h l騳: <color=yellow>"..n_time.."<color>gi﹜<enter>")
		NewTask_DetailTextOut(nTaskGenre, "<color=hblue>           << "..str_rank.." >>           <color>")
	else
		NewTask_DetailTextOut(nTaskGenre, "   B筺 v蒼 ch璦 nh藀 chi課 i, n g苝 Quan vi猲 li猲 u ki謙 xu蕋 b竜 danh.<enter>")
	end
end


-- 华山 绝顶 建帮NPC
-- By：Dan_Deng(2003-09-23)
--edit by 小浪多多(2007-09-14)
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
Include("\\script\\tong\\tong_check.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
--Include("\\script\\task\\metempsychosis\\translife_6.lua")
--Include("\\script\\task\\metempsychosis\\translife_7.lua")
--Include("\\script\\task\\metempsychosis\\translife_8.lua")

function about_tong()
	Talk(6,"","Ngi h醝 l藀 bang h閕 c莕 c� nh鱪g 甶襲 ki謓 g�? в t� t� ta gi秈 th輈h cho nghe!","Ph秈 l� ngi  xu蕋 s�, kh玭g � trong b蕋 c� bang h閕 n祇. L鵦 th鑞g so竔 th蕄 nh蕋 30 甶觤!","Sau khi h閕  nh鱪g y猽 c莡 tr猲, ngi c� th� tham gia chi課 trng T鑞g Kim l蕐 頲 c﹜ V� Vng ki誱  l祄 t輓 v藅 bang ch�, sau  ti課 h祅h l藀 bang h閕","Trc ti猲 ngi ph秈 c� n╪g l鵦, trong 3 ng祔 ph秈 t譵 輙 nh蕋 16 ngi c飊g ch� hng gia nh藀, n誹 kh玭g c騨g ch糿g c� c竎h n祇. 3 ng祔  c� th� g鋓 l� 'Th阨 k� kh秓 nghi謒'.","Sau khi bang h閕 c馻 ngi 頲 輙 nh蕋 16 ngi, tr猲 giang h� s� ti課 h祅h kh秓 nghi謒. N誹 sau 3 ng祔 v蒼 ch璦  16 ngi th� giang h� v蒼 ch璦 th鮝 nh薾 bang h閕 n祔","Cu鑙 c飊g! в l藀 頲 bang ph竔 th� c莕 ph秈 c� s� v鑞 l韓. H穣 n� l鵦 t 頲 m鬰 ti猽 nh�!")
end



function main(sel)
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("Ti誴 t鬰 l藀 bang h閕 c馻 ngi, b総 u s� nghi謕 giang h� 甶!",2,"B総 u l藀 bang/Direct_CreateTong","ьi th猰 m閠 ch髏/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay","Cho h醝 ta l祄 sao c� th� gi鑞g nh� ng礽, l藀 bang ph竔 v� l祄 bang ch�?","Trc ti猲 ngi ph秈 c� n╪g l鵦, trong 3 ng祔 ph秈 t譵 輙 nh蕋 16 ngi c飊g ch� hng gia nh藀, n誹 kh玭g c騨g ch糿g c� c竎h n祇. 3 ng祔  c� th� g鋓 l� 'Th阨 k� kh秓 nghi謒'.","Sau khi bang h閕 c馻 ngi 頲 輙 nh蕋 16 ngi, tr猲 giang h� s� ti課 h祅h kh秓 nghi謒. N誹 sau 3 ng祔 v蒼 ch璦  16 ngi th� giang h� v蒼 ch璦 th鮝 nh薾 bang h閕 n祔","Sau khi ngi c�  n╪g l鵦 l穘h o v� uy t輓 giang h�, th� t譵 m閠 v藅 ph萴 c bi謙  l祄 t輓 v藅 c馻 chng m玭. V� d� nh� tham gia T鑞g Kim l蕐 頲 Nh筩 Vng ki誱","Nh筩 Vng ki誱? Ng礽 n鉯 l� c﹜ ki誱 n祔 ph秈 kh玭g?","Ho� ra ngi  c� n�! Kh玭g sai! Qu� l� tu鎖 tr� t礽 cao!")
	else				-- 此部份为缺省对话，待扩充。
		local tbOpt = {
			{"H醝 v� vi謈 th祅h l藀 bang h閕", about_tong},
			--{"Ta H醝 xem l祄 th� n祇  tr飊g sinh 6", TransLife6.ShowMainDlg, {TransLife6}},
			--{"H醝 xem l祄 th� n祇 Tr飊g sinh 7", TransLife7.ShowMainDlg, {TransLife7}},
			--{"Mu鑞 h醝 v� tr飊g sinh 8", TransLife8.ShowMainDlg, {TransLife8}},
			{"Kh玭g c� vi謈 g�", nothing},
		}
		CreateNewSayEx("<npc> Ngi c� chuy謓 g� kh玭g v藋?", tbOpt)
	end
end

function create_pay()
	Say("B﹜ gi� ch� c莕 ngi c� th猰 s� v鑞 l韓 l� 頲, c� th� l� 100 v筺 lng",2,"Kh玭g th祅h v蕁 , ta  c�  100 v筺 lng r錳./create_pay_yes","Sao nhi襲 th�? 輙 l筰 m閠 ch髏 頲 kh玭g?/create_pay_no")
end

function create_pay_yes()
	if (GetCash() >= 1000000) then
		if not %tong_check_create()then
			return
		end
		Pay(1000000)				-- 收费
		DelItem(195)			-- 删除相关道具
		SetTask(99,1)				-- 并打上标记（同时定义为帮派中的第一个人（即帮主本人））
		Direct_CreateTong()		-- 开始建帮
	else
		Talk(1,"","Dng nh� ngi kh玭g c�  ti襫, nh� th� kh玭g 鎛, i khi ngi c�  ti襫 th� n t譵 ta.")
	end
end

function create_pay_no()
	Talk(1,"","в duy tr� bang h閕 ho箃 ng b譶h thng th� m蕋 r蕋 nhi襲 ti襫, n誹 ngic遪 � y tr� gi� th� ta e bang h閕 s� kh� th祅h l� ")
end

function Direct_CreateTong()
	CreateTong(1)				-- 弹出建帮对话框，结束脚本控制
end

function wait_a_moment()
end

--得到一个玩家所在帮会占领的城市,返回索引值
function gettongownercity()
	--得到玩家帮会名称
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--分别得到七大城市的帮会名称与玩家帮会名称对比
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "" and strCityTongName == strTongName) then 
			return nCityID
		end
	end
	
	--表示玩家所在的帮会没有占领城市
	return 0
end

-- 检查领奖条件
function check_award_condition(city_index, show_talk)
	if (city_index == 0) then
		if (show_talk == 1) then
			Talk(1, "", "<#> Ch� c� bang ph竔 chi誱 頲 th祅h th� m韎 nh薾 頲 ph莕 thng, h穣 d蒼 anh em c馻 m譶h 甶 chi誱 m閠 th祅h n祇 甶!")
		end
		return 0
	end
	
	local tong_master = GetTongMaster()
	local player_name = GetName()
	if (tong_master ~= player_name) then
		if (show_talk == 1) then
			Talk(1, "", "<#> Ch� c� bang ch� m韎 m韎 l穘h 頲 ph莕 thng c馻 bang ph竔, g鋓 bang ch� c馻 c竎 ngi t韎 y")
		end
		return 0
	end
	
	local wday = tonumber(date("%w"))	-- 今天是星期几？
	local hour = tonumber(date("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#>9:00~20:00 th� hai h籲g tu莕 m韎 l� th阨 gian nh薾 thng, xin h穣 nh蒼 n筰 ch� i")
		end
		return 0
	end

	local date = tonumber(date("%Y%m%d"))
	if (date == get_citybonus_date(city_index)) then
		if (show_talk == 1) then
			Talk(1, "", "<#> Ph莕 thng tu莕 n祔  l穘h r錳, h裯 tu莕 sau h穣 t韎")
		end
		return 0
	end

	return 1
end

-- 领取城主帮会奖励
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#> Nh薾 ph莕 thng Th祅h ch� bang ph竔",
			2,
			"<#> ta mu鑞 l穘h 60 c竔/#take_tong_award(60)",
			"<#> T筸 th阨 ta kh玭g l穘h u/nothing")
	end
end

-- 领取红包
function take_tong_award(count)
	-- 一个红包占一个格子
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#> H祅h trang c馻 ngi  y, ch豱h l� l筰 xong m韎 n l穘h thng.")
		return
	end
	
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local today = tonumber(date("%Y%m%d"))
	set_citybonus_date(city_index, today)
	-- 给红包
	for i = 1, count do
		AddItem(6,1,1535,1,1,1)
	end
	local msg =	date("[%y-%m-%d %H:%M] ") .. GetAccount() .. "(".. GetName().. ") get " .. count .. " <#>Чi h錸g bao from Kim S琻 Chng M玭 Nh﹏"
	WriteLog(msg);
	Talk(1, "", "<#> Зy l� ph莕 thng c馻 c竎 ngi nh薾 l蕐 甶")
end

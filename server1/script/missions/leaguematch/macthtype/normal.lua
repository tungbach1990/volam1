--==============一般比赛相关数据===============
Include("\\script\\lib\\common.lua")
Include("\\script\\missions\\leaguematch\\head.lua")
-- 奖励规则，奖品表
function tmp_help_award(tbData, nLevel)
	local tbAward	= tbData.award_rank[nLevel]
	local str = "    1. Ph莕 thng t輈h l騳: b猲 th緉g nh薾 頲 "..(5*nLevel).."甶觤, h遖 "..(2*nLevel).." 甶觤, thua: 0 甶觤. M鏸 tr薾 u s� c� th猰 <color=red>甶觤 thng kinh nghi謒<color>. Th緉g hay thua u c� 甶觤 thng tng 鴑g\n"
		.."    2. Ph莕 thng x誴 h筺g: Sau khi giai 畂筺 u k誸 th骳, c╪ c� v祇 thn礹 t輈h chi課 i, s� x誴 h筺g <color=red> t� 1 n "..tbAward[getn(tbAward)][1]..", th祅h vi猲 c� th� nh薾 頲 ph莕 thng x誴 h筺g (甶觤 vinh d�).\n"
		.."    <t>排名奖励：\n"
		.."   th� h筺g    ph莕 thng"
	if (tbData.max_member ~= 1) then
		str	= str.."(Th祅h vi猲 chi課 i m鏸 ngi)"
	end

	local nLastRank	= 1
	for nAward = 1, getn(tbAward) do
		local nRank	= tbAward[nAward][1]
		local szRank
		if (nLastRank == nRank) then
			szRank	= nRank
		else
			szRank	= nLastRank.."-"..nRank
		end
		str = str.."\n"..strfill_left(format("    th� %s ", szRank), 16)..tbAward[nAward][2].."甶觤 vinh d�"
		nLastRank	= nRank + 1
	end

	return str
end

-- 帮助文字
-- 格式1：
--	{"项目名称", "帮助内容", 1/2(限定，可选)},
--	限定：1、只针对单人类型；2、只针对多人；nil、全部（下同）
-- 格式2：
--	{"项目名称", function(返回帮助内容的函数), 1/2(限定，可选)},
-- 格式3：
--	{
--		"项目名称",
--		{
--			"新秀赛帮助内容",
--			"高级赛帮助内容",
--		},
--		1/2(限定，可选)
--	},
tmp_help = {
	{
		"<t>Gi韎 thi謚 ",
		{
			"    Lo筰 h譶h V� l﹎ ki謙 xu蕋 li猲 u l莕 n祔 l� <color=red><s><color>, ngi tham gia ng c蕄 ph秈 t� <color=red>80-119<color>. Ngi ch琲 n g苝 <color=red>S� gi� ki謙 xu蕋<color> b竜 danh th祅h l藀 chi課 i, sau  v祇 H閕 trng li猲 u Ki謙 xu蕋 ti課 h祅h thi u",
			"    Lo筰 h譶h V� l﹎ li猲 u l莕 n祔 l� <color=red><s><color>, ngi than gia ng c蕄 ph秈 t� <color=red>120<color>. дn g苝 <color=red>S� gi� li猲 u<color>, b竜 danh th祅h l藀 chi課 i, sau  v祇 H閕 trng v� l﹎ li猲 u ti課 h祅h thi u",
		}
	},
	{"Quy tr譶h b竜 danh tham gia thi u", "    Trong giai 畂筺 thi u, ngi ch琲 c� th� b竜 danh tham gia b蕋 c� c竎 lo筰 h譶h thi u n祇, nh璶g k玥ng 頲 ph衟 th祅h l藀 chi課 i m韎", 1},
	{"Quy tr譶h b竜 danh tham gia thi u", "B竜 danh tham gia <s>, c莕 ph秈 th祅h l藀 chi課 i. Ngi ch琲 c� th� l鵤 ch鋘 chi課 i c馻 m譶h, c騨g c� th� gia nh藀 chi課 i ngi kh竎. Sau khi i trng t� i v韎 ngi kh竎, s� n鉯 chuy謓 v韎 Quan vi猲 <t>, ch鋘 <color=red>chi課 i <t> c馻 ta, chi課 i l藀 t鴆 頲 th祅h l藀. S� lng th祅h vi猲 t鑙 產 l� <color=red><d> ngi<color><e>.", 2},
	{"R阨 kh醝 i thi u", "    Trong <color=red>giai 畂筺 ngh� c竎h kho秐g<color>, ngi ch琲 c� th� t飝 � tho竧 ly chi課 i. Trong giai 畂筺 thi u, n誹 chi課 i c馻 m譶h <color=red>ch璦 n l骳 thi u<color>, ngi ch琲 c� th� t� � r阨 kh醝 chi課 i, n誹  u r錳 th� kh玭g th� r阨 i. <color=yellow>Sau khi r阨 kh醝 chi課 i s� kh玭g 頲 nh薾 ph莕 thng x誴 h筺g<color>. <color=yellow>Sau khi r阨 kh醝 chi課 i ngi ch琲 s� kh玭g th� quay tr� l筰 thi u<color>.", 1},
	{"R阨 kh醝 i thi u", "    Trong <color=red>giai 畂筺 ngh� c竎h kho秐g<color>, ngi ch琲 c� th� t飝 � tho竧 ly chi課 i. Trong giai 畂筺 thi u, n誹 chi課 i c馻 m譶h <color=red>ch璦 n l骳 thi u<color>, ngi ch琲 c� th� t� � r阨 kh醝 chi課 i, n誹  u r錳 th� kh玭g th� r阨 i. <color=yellow>Sau khi r阨 kh醝 chi課 i s� kh玭g 頲 nh薾 ph莕 thng x誴 h筺g<color>. N誹 i trng r阨 kh醝 i th� quy襫 i trng s� 頲 chuy觧 giao cho ngi kh竎. <color=yellow>n誹 chi課 i kh玭g c遪 ai th� s� t� ng b� gi秈 t竛<color>. M鏸 l莕 li猲 u k誸 th骳, chi課 i n祇 kh玭g ph� h頿 cho l莕 sau c騨g s� t� ng b� gi秈 t竛", 2},
	{"S� tr薾 thi u", "M鏸 tu莕 t� th� Hai n th� N╩, t� <color=red>18h: 00- 19h: 00<color> c� th� u <color=yellow>4 tr薾<color>. 3 ng祔 c遪 l筰 t� <color=red>18h: 00-19h: 00<color> v� <color=red>21h: 00-22h: 00<color> c� th� u <color=yellow>8 tr薾<color>. To祅 giai 畂筺 thi u <color=red>(M鏸 th竛g t� 8-28)<color> u t蕋 c� <color=yellow>108 tr薾<color>. M鏸 chi課 i tham gia t鑙 產 <color=red>48 tr薾<color> "},
	{"L璾 tr譶h thi u", "    чi vi猲 c馻 chi課 i i tho筰 v韎 <t>  v祇 h閕 trng <t>, sau  ti誴 t鬰 i tho筰 v韎 quan vi猲 trong h閕 trng  頲 a v祇 khu v鵦 chu萵 b�. дn gi� thi u, i vi猲 tham gia s� t� ng 頲 a v祇 u trng. <color=red>C� th� t� do ch鋘 binh kh� v� trang b�<color>."},
	{"Quy t綾 thi u",	-- 单人
[[    1、比赛中任意一方将对方杀死时判胜。
    2、在比赛过程中<color=red>如其中一队参赛选手同时不在比赛场内<color>，则另一队直接获胜。
    3、在比赛时间结束后，双方仍未分出胜负，则判断双方有效受伤总量。有效受伤总量少的一方判胜，另一方为负。如有效受伤总量相同，则判定平局。
    4、参加比赛，<color=red>轮空的战队<color>直接判胜。
    5、战队积分计算：胜者获取<pw>分，平者获取<pt>分，负者获取0分。
    6、比赛双方在比赛中只能使用药店出售的各种药品。
    7、每场比赛双方会在<color=red>入场10秒钟后<color>开始比赛，比赛时间为 14 分钟50秒。
    8、每场比赛的<color=red>间歇时间<color>为 10 分钟。<color=red>准备时间<color>为5分钟。
]], 1},
	{"Quy t綾 thi u",	-- 多人
[[    1、比赛中<color=red>任意一方将对方选手全部杀死<color>时判胜。
    2、在比赛过程中<color=red>如其中一队参赛选手同时不在比赛场内<color>，则另一队直接获胜。
    3、在比赛时间结束后，双方仍未分出胜负，则判定<color=red>剩余人数多的战队<color>获胜，如果<color=red>双方剩余人数相同<color>，则以双方所有队员有效受伤总量来判断胜负,有效受伤总量小的一方获胜。有效受伤总量相同，则判平。
    4、参加比赛，<color=red>轮空的战队<color>直接判胜。
    5、战队积分计算：胜者获取<pw>分，平者获取<pt>分，负者获取0分。
    6、比赛双方在比赛中只能使用药店出售的各种药品。
    7、每场比赛双方会在<color=red>入场10秒钟后<color>开始比赛，比赛时间为 14 分钟50秒。
    8、每场比赛的<color=red>准备时间<color>为5分钟。
]], 2},
	{"<<未翻译>>",
[[有效受伤总量：玩家在比赛过程中因为受到对方伤害或中对方诅咒而最终损失的血量总和(内力吸收伤害之前).

有效受伤计算规则：
    1、将玩家每次受到伤害后,计算完抗性、玄天无极等各种加成因素后,计算内力吸收伤害之前需要扣除的血量记入有效受伤总量中;
    2、玩家每次因受到诅咒负回血而损失的血量计入有效受伤总量中;
    3、玩家每次因受到反弹而损失的血量记入有效伤害总量中;
    4、玩家每次因毒发而持续损失的血量记入有效伤害总量中;
    5、玩家因使用技能而消耗的血量不记入有效伤害总量中.
]]
	},
	{"Quy t綾 b竜 danh", "    <color=red><t>觤 t輈h l騳 thi u <t><color>d飊g  l祄 c╪ c� x誴 h筺g <t>. K誸 th骳 tr薾 u, i th緉g nh薾 頲 <color=red><pw><color>甶觤, h遖 <color=red><pt><color> 甶觤; thua <color=red>0<color> 甶觤. M鏸 l莕 <t> k誸 th骳, c╪ c� v祇 <color=red>t鎛g 甶觤 c馻 chi課 i<color>  x誴 th� h筺g. N誹 甶觤 tng ng s� c╪ c� v祇 <color=yellow>t� l� th緉g<color>  x誴 h筺g. n誹 t� l� th緉g c騨g tng ng s� c╪ c� v祇 <color=green> t鎛g s� th阨 gian tham gia thi u c馻 m鏸 chi課 i<color>  x誴 h筺g. Giai 畂筺 thi u <t> sau, 甶觤 t輈h l騳 s� 頲 t譶h l筰 t� u"},
	{"Quy t綾 gi秈 thng", tmp_help_award},
}

tmp_main = {	--officer主对话
	"Giang h� phong ba lo筺 kh雐, nh璶g b� c鵦 th竔 lai. дn khi c� 1 anh h飊g ki謙 xu蕋 xu蕋 hi謓 c騨g l� l骳 1 trang s� m韎 頲 vi誸 n猲. Ai s� l� anh h飊g h祇 ki謙 th鑞g nh蕋 thi猲 h� lo筺 tranh n祔 v� m閠 m鑙?",
	"Nh籱  tr竛h anh h飊g h祇 ki謙 m閠 l莕 n鱝 ph﹏ tranh c� l頸 cho Kim binh, чc C� Minh ch�  cho t� ch鴆 nh鱪g cu閏 tranhh h飊g quy m�  t譵 ra nh﹏ t礽 ph鬰 qu鑓",
}

tmp_creat = "    sau khi l藀 chi課 i tham gia <s>, b筺 c� th� <color=red>t� m譶h l� i trng<color><enter>"
	.."    Sau khi l藀 chi課 i, b蕋 c� l骳 n祇 b筺 c騨g c� th� m阨 ngi kh竎 tham gia ho芻 tham gia v祇 t� i ngi kh竎. M鏸 chi課 i ch� 頲 t鑙 產 <d> ngi (c� i trng). <color=red>N誹 ch璦 n l骳 thi u<color> v� c騨g <color=red>ch璦 u qua tr薾 n祇<color>, ngi c� th� t飝 � ly khai chi課 i. Ngi x竎 nh l藀 chi課  c馻 m譶h ch�?"

--====Functions====
--返回当前角色可以参加的比赛类型，nil为不能参赛
function tmp_player_type()
	local nLevel = wlls_player_level()
	return iif(nLevel > 0, nLevel, nil)
end

--检查当前角色是否可以加入指定的战队
function tmp_check_addmem(n_capidx, n_lid, n_mtype)
	if (n_mtype ~= wlls_player_type()) then
	 	return "Xin l鏸! чi vi猲 trong nh鉳:"..GetName().." v� <color=red>lo筰 h譶h tham gia thi u<color> c馻 chi課 i b筺 kh玭g ph� h頿! Cho n猲 kh玭g th� v祇 chi課 i c馻 b筺!"
	end
end

function tmp_str(str, tbData)
	str	= gsub(str, "<s>", tbData.name)
	str	= gsub(str, "<d>", tbData.max_member)
	str	= gsub(str, "<e>", tbData.addmem_ex)
	return str
end

function tmp_process_data(tbData)
	-- 默认值
	if (not tbData.addmem_ex) then
		tbData.addmem_ex	= ""
	end
	if (not tbData.text_creat) then
		tbData.text_creat	= tmp_str(tmp_creat, tbData)
	end
	if (not tbData.player_type) then
		tbData.player_type	= tmp_player_type
	end
	if (not tbData.check_addmem) then
		tbData.check_addmem	= tmp_check_addmem
	end

	--建立地图索引（快速找到某一地图对应的比赛类型、场地组编号、场地类型）
	local tbMapIdx = {}
	for nMType, tbMType in tbData.match_type do
		for nGroup, tbGroup in tbMType.map do
			for i = 1, 3 do
				tbMapIdx[tbGroup[i]] = {nMType, nGroup, i}
			end
		end
	end
	tbData.map_index = tbMapIdx

	-- 处理帮助文字
	local nCount = 0
	local nMultiple = iif(tbData.max_member == 1, 1, 2)
	local tbSpecialHelp	= tbData.help_msg	-- 特定帮助信息
	if (not tbSpecialHelp) then
		tbSpecialHelp	= {}
	end
	tbData.help_msg	= {}
	for _, tbTopic in tmp_help do
		local szTitle	= tmp_str(tbTopic[1], tbData)
		local varText, nLimit
		if (tbSpecialHelp[tbTopic[1]]) then	-- 有自定义帮助信息
			varText	= tbSpecialHelp[tbTopic[1]]
			nLimit	= nil
		else
			varText	= tbTopic[2]
			nLimit	= tbTopic[3]
		end
		if (not nLimit or nLimit == nMultiple) then
			nCount	= nCount + 1
			local szType	= type(varText)
			local tbText	= {"", ""}
			if (szType == "function") then
				tbText[1]	= varText(tbData, 1)
				tbText[2]	= varText(tbData, 2)
			elseif (szType == "table") then
				tbText[1]	= varText[1]
				tbText[2]	= varText[2]
			else
				tbText[1]	= tostring(varText)
				tbText[2]	= tbText[1]
			end

			tbData.help_msg[nCount]	= {}
			for nLevel = 1, 2 do
				tbText[nLevel]	= tmp_str(tbText[nLevel], tbData)
				tbText[nLevel]	= gsub(tbText[nLevel], "<t>", WLLS_LEVEL_DESC[nLevel])
				tbText[nLevel]	= gsub(tbText[nLevel], "<pw>", 5*nLevel)
				tbText[nLevel]	= gsub(tbText[nLevel], "<pt>", 2*nLevel)
				tbData.help_msg[nCount][nLevel]	= {
					gsub(szTitle, "<t>", WLLS_LEVEL_DESC[nLevel]),
					tbText[nLevel],
				}
			end
		end
	end

	-- 处理Officer主对话文字
	tbData.text_main[1]	= tmp_main[1]..tbData.text_main[1]
	tbData.text_main[2]	= tmp_main[2]..tbData.text_main[2]
end

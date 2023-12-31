-- 定时向一组服务器的所有Gameserver发系统公告
function TaskShedule()
	TaskName("Tin t鴆 t� ng - th玭g b竜");
	
	-- 20分钟一次
	TaskInterval(20);
	
	-- 不设TaskTme, 则是Relay启动时就开始
	-- 0点00分开始
	-- TaskTime(0, 0);
	
	TaskCountLimit(0);
	
	OutputMsg("T� ng cu閚 th玭g b竜");
end

g_strTipMsg = 
	{
		--"每个门派有2-3条清晰的技能发展路线，各条路线的特点更为鲜明",
		--"在游戏世界中与各大城市的城门卫兵和新手村的门派接引弟子对话，可了解本门的技能发展路线和最适合练级的场所",
		--"在游戏世界中与各大城市的城门卫兵和新手村的门派接引弟子对话，可了解本门的技能发展路线和最适合练级的场所",
		--"在游戏世界中与各大城市的城门卫兵和新手村的门派接引弟子对话，可了解本门的技能发展路线和最适合练级的场所",
		--"在游戏世界中与各大城市的城门卫兵和新手村的门派接引弟子对话，可了解本门的技能发展路线和最适合练级的场所",
		"Trong tr� ch琲 khi i tho筰 v韎 V� binh Th祅h m玭 c馻 c竎 th祅h th� v�  t� ti誴 d蒼 c竎 m玭 ph竔 � c竎 T﹏ Th� th玭  hi觰 頲 c竎 hng ph竧 tri觧 k� n╪g c馻 t鮪g m玭 ph竔 v� khu v鵦 luy謓 c玭g th輈h h頿.",
		--"引入〖技能加成〗的概念，等级高技能点多的角色的优势将更加得到体现",
		--"〖技能加成〗低级战斗技能对高级战斗技能是指加成高级技能的伤害",
		--"全新的〖五行相克〗系统，任何门派在和被自己克的门派PK时将会拥有更加明显的优势",
		--"7月16日之后第一次登陆游戏世界，系统会根据角色的旧技能状况自动修正为新的技能，潜能点恢复到原始未分配状态",
		--"〖技能熟练度〗通过不断使用此技能攻击敌人获得提升，与敌人等级和玩家获得的练级经验无关",
		--"鼠标移到NPC身上，可显示〖五行属性图标〗",
		--"NPC只掉落相应五行属性的宝物，如想要得到冰枪，可以去打水系的NPC",
		--"NPC只掉落相应五行属性的宝物，如想要得到幸运装备，可以去打木系的NPC",
		--"NPC五行属性图标：金色-金系；蓝色-水系；绿色-木系；红色-火系；褐色-土系",
		--"〖NPC调整〗沙漠迷宫NPC不仅等级高、经验多、刷新快，而且掉宝率是普通NPC的二到三倍",
		-- "〖组队〗最后一击的玩家得到的经验将是单人经验的1.3倍",		
		--"〖组队〗队伍成员的幸运值将根据队伍中人数得到相应提升",
		--"〖组队〗队伍成员的幸运值将根据队伍中人数得到相应提升；掉落装备的属性将根据最后一击玩家角色幸运值来决定",
		--"〖组队建议〗高等级玩家带低等级玩家，等级相差70级以上时，各自的升级速度将提高20％以上",
		--"〖组队死亡惩罚〗组队人数越多，死亡后掉的经验越少；若队伍中人数达到八人，死亡后将不掉经验",
		--"〖桃花岛〗向桃花隐士购买腊八粥，籍着岛上的灵气，腊八粥的神奇功效将助你轻松修练。",
		"N誹 b筺 ph竧 hi謓 m譶h b� m蕋 nh鱪g k� n╪g  h鋍 頲, h穣 h錳 s� s� h鋍 頲 c竎 k� n╪g nh� Huy誸 Chi課 B竧 Phng, V� T﹎ Tr秏, Thi猲 Vng Chi課 � (Thi猲 Vng Bang) , c飊g v韎 T﹎ Nh穘 v� Thi猲 La мa V鈔g (Л阯g M玭) .",
		--"〖洗髓岛〗正式开放，50级或以上的非白名玩家有〖一次免费〗进入机会。进岛后可随意洗〖潜能点〗与〖技能点〗，并可在岛上或组队入洞体验加点效果",
		--"免费进入〖洗髓岛〗的机会只有一次。离开洗髓岛，你的〖潜能/技能〗分配将就此确定，离开时请三思再三思！！",	
		"M閠 b� ph薾 ngi ch琲 sau khi ho祅 th祅h [Nhi謒 v� c蕄 90] c馻 m玭 ph竔 ch璦 th� nh薾 頲 k� n╪g, sau khi [h錳 s璢 v� [Vi猲 Quan tho竔 nhi謒] L﹎ An  ch豱h s鯽 l筰 [183,182]) ",
		"M閠 b� ph薾 ngi ch琲 Л阯g M玭 sau khi h鋍 [T� ti詎 thu藅. B筼 V� L� Hoa] g苝 t譶h tr筺g kh玭g th� s� d鬾g B筼 V� L� Hoa, sau khi tr� v� [h錳 s璢 l筰 n [Vi猲 quan Tho竔 Nhi謒] L﹎ An  ch豱h s鯽 l筰 [183,182]) .",
		"M閠 b� ph薾 ngi ch琲 V� ng g苝 t譶h tr筺g b� m蕋 甶觤 k� n╪g, sau khi v� [h錳 s璢 n [Vi猲 Quan Tho竔 Nhi謒] l﹎ An  ch豱h s鯽 l筰 (L﹎ An [183,182]) ",
		--"〖声望查询〗请到各大城市的算命先生〖张铁嘴〗处，襄阳[192,193]",
		--"〖水晶风暴〗2004年7月22日早11：00以后，充值35元虚卡或者实卡都可以在新手村野叟那里随机领取一颗水晶，活动延迟到2004年8月8日结束",
		--"〖武器图谱〗用中原武林的神奇〖水晶〗，与异域神秘商人换取〖武器图谱〗。再让〖铁匠〗参照图谱，百分百地帮你把武器提升一个等级",
		--"〖武器图谱〗异域神秘商人出现在扬州[207,193]与临安[164,177]两地，要换图谱升级武器的玩家请速速行动",
		--"〖蓝名怪物〗惊现江湖(名字显示为蓝色)，携带不少金钱和装备，还可能带有〖水晶〗、〖猩红宝石〗、〖黄金装备〗、〖技能书〗",
		--"〖黄金装备〗〖定国〗〖安邦〗黄金装备套装现身江湖，打〖蓝名怪物〗即有机会获得。参加奥运竟猜活动，每天也将随机一件",
		" [T苙g qu� nh﹏ d辮 Olympic]M鏸 l莕 i Trung Qu鑓 nh薾 頲 ph莕 thng, ngi ch琲 c� th� n [L� Quan] � c竎 th祅h th�  nh薾 v藅 ph萴: Kim b礽-Kim Th秓 L�, Ng﹏ b礽-B筩h C﹗ ho祅,уng b礽-L� Hoa",
		"〖奥运奖牌送大礼〗领取礼品第一时间段：北京时间10：00~14：00领取前一天22：00~当天4：00的奖品",
		"〖奥运奖牌送大礼〗领取礼品第二时间段：19：00~20：00领取当天14：00~18：00的奖品",
		"〖奥运奖牌送大礼〗领取礼品第三时间段：23：00~次日0:00领取当天18：00~22：00的奖品",
		" [T苙g qu� nh﹏ d辮 Olympic]Vi謈 nh薾 v藅 ph萴 l� c� th阨 h筺,ngi ch琲 n猲 ch� � theo d鈏 cu閏 thi d蕌 c馻 i nh� v� n [L� Quan] nh薾 thng k辮 th阨.",
		"S� d鬾g [Kim Th秓 L閉 luy謓 c蕄 trong v遪g 1 gi� s� 頲 甶觤 kinh nghi謒 g蕄 i: S� d鬾g [B筩h C﹗ ho祅] trong v遪g 1 gi� s� 頲 [t� ng nh qu竔]. C玭g n╪g c馻 2 lo筰 dc ph萴 n祔 s� 頲 m� v祇 ng祔 ",
		" [D� 畂竛 thi u Olympic]i tho筰 v韎 [L� Quan] � c竎 th祅h th�  tham gia ho箃 ng d� 畂竛 Olympic",
		"〖奥运赛事竟猜〗竟猜中奖的玩家在获得奖金回报的同时，还有可能获得〖定国〗〖安邦〗系列黄金装备中的一件",
		"所有赛事结束后，系统将在猜中中国队获得的金、银、铜牌数量的玩家中产生一位超级幸运玩家，奖励奥运系列黄金装备套装",
		"〖奥运奖牌竟猜〗中国奖牌数目竟猜，将在2004.8.17日早上维护前截止。要参加的玩家请抓紧时间购买此类彩票",
		" [B� trang b� ho祅g kim Olympic]g錷 2 b� Athens 2004- [H錸 Olympic], B綾 Kinh 2008- [L遪g Olympic]",
		"〖奥运之魂〗、〖奥运之心〗属性均为〖所有武功等级加1〗，戴齐后自动激活全身装备的所有暗属性",
		" [H� th鑞g ph骳 duy猲] th玭g qua th阨 gian ch琲 t╪g d莕  i l蕐 甶觤 ph骳 duy猲. D飊g 甶觤 ph骳 duy猲 n [Th莕 b� thng nh﹏ Li評 蕋] Tng Dng  i l蕐 c竎 lo筰 v藅 ph萴 c th�.",
		" [H� th鑞g ph骳 duy猲] i tho筰 v韎 [V� L﹎ truy襫 nh﹏] � c竎 th祅h th�  bi誸 th玭g tin chi ti誸.",
		" [Ho箃 ng Trung Thu]  b竛h trung thu, ng緈 tr╪g s竛g, v辬h th�, gi秈 c﹗  ch�-----ho箃 ng 產ng tri觧 khai to祅 di謓, nhi襲 ph莕 thng 產ng ch� n b筺! Vui l遪g n L� Quan c竎 th祅h th�  h醝 th猰 chi ti誸.",
		" [Уo Hoa o] Olympic v筺 ngi c飊g vui,trc khi h� th鑞g d鮪g m竬 b秓 tr� t� ng祔 14/8/2004 n 30/8/2004, mi詎 ph� tu luy謓 � Уo Hoa o."
	};
	
-- 新功能预告信息
g_nFutureDate = 20040723;
STR_HEAD_FUTURE = " [Giang h� truy襫 r籲g]";
g_strFutureMsg = 
	{
		--"即将开放〖单练地图〗、〖打宝地图〗",
		--"〖洗髓岛〗洗技能点功能将在2004年7月24日开放，50级或以上的非白名玩家有一次免费进入机会",
		--"借助〖紫水晶〗或神秘〖武器图谱〗可以提升武器等级"
		--"〖蓝名怪物〗(名字显示为蓝色)蠢蠢欲动，据说将携带不少金钱和装备下山，还可能带有〖水晶〗、〖猩红宝石〗、〖黄金装备〗、〖技能书〗",
		--"〖黄金装备〗〖定国〗〖安邦〗黄金装备套装现身江湖，打〖蓝名怪物〗即有机会获得",
		--"〖双倍金钱双倍经验〗90级技能精彩唯美；剑网组队成风，打怪练级火爆。答谢新老玩家，近期将会有双倍金钱双倍经验活动",
		
	};
function TaskContent()
	str = "";
	nFutureCount = getn(g_strFutureMsg);
	nCount = getn(g_strTipMsg) + nFutureCount;
	nIndex = random(1, nCount);
	if (nIndex <= nFutureCount) then -- 1-取预告信息，2-取提示信息
		str = getFutureMsg();
		if (strlen(str) <= 0) then -- 没有预告信息，就取提示信息
			str = getTipMsg();
		end
	else
		str = getTipMsg();
	end
	
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", str));
end

-- 取提示信息
function getTipMsg()

	nCount = getn(g_strTipMsg);
	nIndex = random(1, nCount);

	return g_strTipMsg[nIndex];
end

-- 取预告信息
function getFutureMsg()
	nCurDate = tonumber(date("%Y%m%d"));
	str = "";
	if (g_nFutureDate > nCurDate) then -- 是否在指定日期之前，否则不发
		nCount = getn(g_strFutureMsg);
		nIndex = random(1, nCount);
		str = STR_HEAD_FUTURE..(g_strFutureMsg[nIndex]);
	end
	
	return str;
end

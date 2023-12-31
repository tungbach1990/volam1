-- 宋金战诏书 用来把玩家传送到宋金战报名点  需要加限制：宋金战场内（包括单条地图）不能使用
-- Liu Kuo
-- 2004.12.13
Include("\\script\\battles\\battlehead.lua");
Include("\\script\\battles\\battleinfo.lua");


function main()
	W,X,Y = GetWorldPos();

	local nSongNumber = 60; -- 宋方人数
	local nJinNumber = 70;  -- 金方人数
	local nMapId = W;
	tbFORBIDDEN_MAP = { 197, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 334, 335, 356, 337, 338,339,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,825,826};	-- 禁用特殊地图
	tbCD_MAP = {516, 517, 580, 581}	--烽火连城守城地图
	for j = 1, getn(tbFORBIDDEN_MAP) do
		if ( nMapId == tbFORBIDDEN_MAP[j] ) then
			Msg2Player("L骳 n祔 b筺 kh玭g th� s� d鬾g v藅 ph萴 n祔");
			return 1;
		end
	end		
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("L骳 n祔 b筺 kh玭g th� s� d鬾g v藅 ph萴 n祔");
			return 1;
		end
	end
	if (nMapId >= 464 and nMapId <= 511) then
		Msg2Player("L骳 n祔 b筺 kh玭g th� s� d鬾g v藅 ph萴 n祔");
		return 1
	end
	--[DinhHQ]
	--20110407: kh玭g cho s� d鬾g t鑞g kim chi猽 th� khi 產ng vt 秈 30
	if (nMapId == 957) then
		Msg2Player("L骳 n祔 b筺 kh玭g th� s� d鬾g v藅 ph萴 n祔");
		return 1
	end
	if ( nMapId >= 235 and nMapId <= 318 ) then
		Msg2Player("L骳 n祔 b筺 kh玭g th� s� d鬾g v藅 ph萴 n祔");
		return 1;
	end
	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("L骳 n祔 b筺 kh玭g th� s� d鬾g v藅 ph萴 n祔");
			return 1;
		end
	end	
	if ( nMapId >= 540 and nMapId <= 583 ) then
		Msg2Player("L骳 n祔 b筺 kh玭g th� s� d鬾g v藅 ph萴 n祔");
		return 1;
	end
	if (nMapId >= 605 and nMapId <= 613) then	--武林第一帮地图
		Msg2Player("L骳 n祔 b筺 kh玭g th� s� d鬾g v藅 ph萴 n祔");
		return 1;
	end
	
	if (nMapId == 162) then	--武林第一帮地图
		Say("Hi謓 t筰 c竎 h� 產ng � th祅h Чi L�, c� th� n c竎 a 甶觤 sau  b竜 danh:\nPhe V祅g (T): t鋋  <color=red>201/203<color>\nPhe T輒 (K): t鋋  <color=red>195/204<color>", 1, "сng/onCancel")
		return 1;
	end
	
	Say ( "<#> <color=red>Chi猽 th�<color><enter><enter><color><enter><enter>   s� ngi chi誱 th� m筺h tuy tr猲 chi課 trng c� 1 v礽 璾 th� nh璶g 甶觤 t輈h l騳 nh薾 頲<enter> c� th� tng i 輙, b筺 mu鑞 n 甶觤 b竜 danh c馻 phe n祇?", 
			4, "\tV祇 甶觤 b竜 danh phe V祅g (T) /ToSong", 
			"\tV祇 甶觤 b竜 danh phe T輒 (K) /ToJin", 
			" Ta l� o binh.../Cancel" );
	-- 空格不要改了，为了居中显示
	return 1;

end

function ToSong()	-- 进入宋方报名点	
	if ( GetLevel() < 120 ) then
		Talk( 1, "", "Phong V﹏ Lu薾 Ki誱 gian kh� kh鑓 li謙, ngi ch璦 t n c蕄 120 h穣 v� luy謓 th猰 r錳 h穣 t輓h." );
		return
	end
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "Chi課 trng T鑞g Kim gian kh� kh鑓 li謙, ngi ch璦 t n c蕄 40 h穣 v� luy謓 th猰 r錳 h穣 t輓h." );
	elseif ( GetLevel() >= 40 and GetLevel() < 80 ) then
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 323, 1541, 3178);
			DisabledUseTownP(0); -- 不限制其使用回城符
			Msg2Player( "дn n琲 b竜 danh Chi課 Trng T鑞g Kim S� C蕄" );
		end
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 324, 1541, 3178);
			DisabledUseTownP(0); -- 不限制其使用回城符
			Msg2Player( "дn n琲 b竜 danh Chi課 Trng T鑞g Kim Trung C蕄" );
		end
	else
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 162,1608,3254);
			DisabledUseTownP(0); -- 不限制其使用回城符
			Msg2Player( "Х n th祅h Чi L�" );
		end
	end
end

function ToJin()	-- 进入金方报名点
	if ( GetLevel() < 120 ) then
		Talk( 1, "", "Phong V﹏ Lu薾 Ki誱 gian kh� kh鑓 li謙, ngi ch璦 t n c蕄 120 h穣 v� luy謓 th猰 r錳 h穣 t輓h." );
		return
	end
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "Chi課 trng T鑞g Kim gian kh� kh鑓 li謙, ngi ch璦 t n c蕄 40 h穣 v� luy謓 th猰 r錳 h穣 t輓h." );
	elseif ( GetLevel() >= 40 and GetLevel() < 80 ) then
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 323, 1570, 3085);
			DisabledUseTownP(0); -- 不限制其使用回城符
			Msg2Player( "дn n琲 b竜 danh Chi課 Trng T鑞g Kim S� C蕄" );
		end
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 324, 1570, 3085);
			DisabledUseTownP(0); -- 不限制其使用回城符
			Msg2Player( "дn n琲 b竜 danh Chi課 Trng T鑞g Kim Trung C蕄" );
		end
	else
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 162,1566,3277);
			DisabledUseTownP(0); -- 不限制其使用回城符
			Msg2Player( "Х n th祅h Чi L�" );
		end
	end
end


function Cancel()
end
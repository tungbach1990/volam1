-------------------------------------------------------------------------
-- FileName		:	messenger_flyrukou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-31 22:21:14
-- Desc			:   风之骑入口
-------------------------------------------------------------------------
Include("\\script\\task\\tollgate\\killbosshead.lua") --包含了图象调用
Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\tollgate\\messenger\\posthouse.lua"); 	--包含玩家任务数据表格的赖
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");	-- 越南资料片生日活动
Include("\\script\\event\\birthday_jieri\\200905\\message\\message.lua");
Include("\\script\\lib\\common.lua");

function main()
	local tbDialog =
	{
		"B総 u nhi謒 v�/fly_starttask", 
		"R阨 甶 khu v鵦/fly_movecity", 
		"Sau n祔 tr� l筰/no",
	}
	if (tbBirthday0905:IsActDate() == 1) then
--		tinsert(tbDialog, 3, "Map Phong K� tr猲 b秐  ch nhi謒 v�/birthday0905_fly");
	end
	 Describe(DescLink_YiGuan..": Х m� m韎 t輓h to竛 x玭g quan th阨 gian, c� g緉g l猲 nha ! B﹜ gi� ngi ngh� l祄 c竔 g� ?",getn(tbDialog), unpack(tbDialog))
end

function fly_starttask()
	if ( nt_getTask(1201) == 10 ) then
		nt_setTask(1211,GetGameTime())              --:设置任务开始时间
		nt_setTask(1201,20)
		DisabledUseTownP(1)			--禁用回城符				--1：禁用	--0：启用
		SetFightState(1);			--打开战斗状态				--1：打开	--0：关闭
		SetLogoutRV(1);				--断线和死亡不为一个重生点		--1：断线和死亡为一个重生点	--0：断线和死亡不为一个重生点
		SetPunish(0);				--关闭死亡惩罚					--1：有死亡惩罚		--0：没有死亡惩罚
		SetCreateTeam(1);			--允许组队					--1：允许组队		--0：不允许组队
		ForbidChangePK(1);   		--不能更改pk状态		--1：不能更改pk状态		--0:可以更改pk状态
		SetPKFlag(0);               --设置为练功模式            
		SetDeathScript("\\script\\task\\tollgate\\messenger\\playerdead_tollgate.lua");
		SetPos(1559,3113);
		Msg2Player("Х m� m韎 t輓h to竛 th阨 gian l祄 nhi謒 v�")
	elseif ( nt_getTask(1201) == 20 ) then
		Describe(DescLink_YiGuan.."Ngi  ho祅 th祅h nhi謒 v�, kh玭g c莕 ti誴 t鬰 nh薾 !",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		Describe(DescLink_YiGuan..": Ngi  ho祅 th祅h nhi謒 v�, c遪 mu鑞 ti誴 t鬰 l祄 nhi謒 v� sao? H穣 nhanh ch﹏ r阨 kh醝 n琲 n祔 甶!",1,"K誸 th骳 i tho筰/no")
	elseif ( nt_getTask(1201) == 0 ) then
		Describe(DescLink_YiGuan..": Ngi  ho祅 th祅h nhi謒 v� t輓 s�, xin nhanh l猲 m閠 ch髏 r阨 甶 甶!",1,"K誸 th骳 i tho筰/no")
	end
end

function fly_movecity()
	local name = GetName()
	if ( nt_getTask(1201) == 25 or nt_getTask(1201) == 30 ) then
		for i=1,getn(citygo) do
			if ( nt_getTask(1204) == citygo[i][2] ) then
				SetLogoutRV(0);
				NewWorld(citygo[i][7], citygo[i][8], citygo[i][9])
				Msg2Player("Phong k� d辌h tr筸 cung ti詎 "..name.." i nh﹏ n "..citygo[i][4].." d辌h tr筸 !")
			end
		end	
	elseif ( nt_getTask(1201) == 10 ) or ( nt_getTask(1201) == 0 ) then
		SetLogoutRV(0);
		NewWorld(37,1601,3001)
	end
end

function birthday0905_fly()
	tbBirthday0905.tbTask:reset_task();
	Say("D辌h quan : t� 19/06/2009 n 19/07/2009 24 l骳 , n誹 nh� i hi謕 c� th� xuy猲 qua ph輆 di m閠 c竔 trong  khi猽 chi課 , i hi謕 甧m t 頲 4 c� b秓 v藅 trung ch m閠 , l� b� vng s髇g . i hi謕 mu鑞 tham gia khi猽 chi課 sao ?", 8, 
         "Nh薾 ti猽 di謙 500 kim qu鑓 gi竛 甶謕 nhi謒 v� /#birthday0905_settask_message(1)", 
         "Nh薾 ti猽 di謙 6 c� h� b竜 k� nhi謒 v� /#birthday0905_settask_message(2)", 
         "Ti誴 nh薾 ti誴 x骳 100 c� t鋋  nhi謒 v�./#birthday0905_settask_message(3)", 
         "Ta  ho祅 th祅h ti猽 di謙 500 kim qu鑓 gi竛 甶謕 nhi謒 v�/#birthday0905_gettask_message(1)", 
         "Ta  ho祅 th祅h ti猽 di謙 6 c� h� b竜 k� nhi謒 v�/#birthday0905_gettask_message(2)", 
         "Ta  ho祅 th祅h ti誴 x骳 100 c� t鋋  nhi謒 v�./#birthday0905_gettask_message(3)", 
         "Ta mu鑞 bu玭g tha cho trc m総 nhi謒 v�/birthday0905_cancel_message", 
         "Ta c� vi謈 g蕄 , ch� m閠 ch髏 tr� l筰./no");
end

function no()
	
end

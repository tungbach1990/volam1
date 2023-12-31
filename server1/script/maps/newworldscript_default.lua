-------------------------------------------------------------------------
-- FileName		:	NewWorldScript_H.lua
-- Author		:	LuoBaohang
-- CreateTime	:	2005-09-02
-- Desc			:  	地图切换触发脚本
-------------------------------------------------------------------------
Include("\\script\\lib\\string.lua")
Include("\\script\\maps\\newworldscript_h.lua")
Include("\\script\\maps\\maplimit.lua")
Include("\\script\\item\\tianziyuxi.lua");	-- 天子玉玺

Include("\\script\\misc\\eventsys\\type\\map.lua")
aryChangeWorldExec = {}
W,X,Y =0

function PraseParam(szParam)
	if (szParam == nil) then
		return nil
	end
	if (aryChangeWorldExec[SubWorld] == nil) then	--还没有函数链，分析参数
		aryChangeWorldExec[SubWorld] = {}
		local aryFuns = split(szParam, '|')
		local j=1;
		for i = 1,getn(aryFuns) do
			local ExecFun = aryFuncStore[aryFuns[i]]
			if (ExecFun == nil)then
				print("Error: (Ne v筺 v筺orld:%d) Ch璦 nh ngh� h祄 s�%s", SubWorld, aryFuns[i])
			else
				aryChangeWorldExec[SubWorld][j] =  ExecFun;
				j = j+1;
			end	
		end
	end
	return 1;
end

function OnNewWorldDefault(szParam)
	-- nW,nX,nY = GetWorldPos()

	-- if CheckMapEnter() < 1 then
	-- 	print("Map enter Vuot cap !!!!!")
	-- 	if (W == nil or X == nil or Y ==nil )then
	-- 		print("Map enter is Nil Value")
	-- 		--NewWorld(53, 1626, 3179)--ph� ba l╪g huy謓
	-- 	elseif (nW == W) then
	-- 		print("Gia tri map bang nhau")
	-- 		--NewWorld(53, 1626, 3179)--ph� ba l╪g huy謓
	-- 	else
	-- 		print("Ok,Phu ve noi truoc do")
	-- 		print(W)
	-- 		print(X)
	-- 		print(Y)
	-- 		--NewWorld(W, X, Y)--ph� v� n琲 trc 
	-- 	end
	-- 	Talk(1,"","N琲 i hi謕 v鮝 bc ch﹏ t韎 c鵦 k� nguy hi觤. Ta  may m緉 a 頲 i hi謕 v� y !")
	-- 	Msg2Player("N琲 i hi謕 v鮝 bc ch﹏ t韎 c鵦 k� nguy hi觤. Ta  may m緉 a 頲 i hi謕 v� y !")
	-- end


	-- if CheckMapEnter() < 1 then
	-- 	NewWorld(53, 1626, 3179)--ph� ba l╪g huy謓
	-- 	Talk(1,"","N琲 i hi謕 v鮝 bc ch﹏ t韎 c鵦 k� nguy hi觤. Ta  may m緉 a 頲 i hi謕 v� y !")
	--     Msg2Player("N琲 i hi謕 v鮝 bc ch﹏ t韎 c鵦 k� nguy hi觤. Ta  may m緉 a 頲 i hi謕 v� y !")
	-- end

	--print("OnNewWorldDefault invoked!!!")
	if (PraseParam(szParam) == 1) then
		for i = 1,getn(aryChangeWorldExec[SubWorld]) do	--执行函数链
			aryChangeWorldExec[SubWorld][i](1)
		end
	end
	
	YuXiChangeMapMsg();
	EventSys:GetType("EnterMap"):OnPlayerEvent(SubWorldIdx2ID(SubWorld), PlayerIndex)
	EventSys:GetType("EnterMap"):OnPlayerEvent("ALL", PlayerIndex)
end

function OnLeaveWorldDefault(szParam)
	 W,X,Y = GetWorldPos(); --l璾 l筰 v� tr� trc khi tr阨 map

	print("OnLeaveWorldDefault invoked!!!")
	if (PraseParam(szParam) == 1) then
		for i = 1,getn(aryChangeWorldExec[SubWorld]) do	--执行函数链
			aryChangeWorldExec[SubWorld][i](0)
		end
	end
	EventSys:GetType("LeaveMap"):OnPlayerEvent(SubWorldIdx2ID(SubWorld), PlayerIndex)
	EventSys:GetType("LeaveMap"):OnPlayerEvent("ALL", PlayerIndex)
end
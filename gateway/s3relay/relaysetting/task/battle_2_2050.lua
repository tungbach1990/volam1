-- 战役系统
-- Dongzhi

function TaskShedule()
	TaskName( "Chi課 d辌h qu鑓 chi課 T鑞g Kim 20:50" );
	TaskInterval( 1440 );
	TaskTime( 20, 50 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "BATTLE[GuoZhan] 20:50 startup..." );

end

function TaskContent()
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
		
		if CW_GetOccupant(4) == CW_GetOccupant(7) then
			local szMsg  = format("Chi猽 c竜 thi猲 h�:\"%s\" ng th阨 chi誱 l躰h c� L﹎ An l蒼 Bi謓 Kinh, bang ch� c� th� tr鵦 ti誴 ng c� th祅h thi猲 t�!", CW_GetOccupant(4));
			local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
			GlobalExecute(szNews);
			
			for i = 0,10 do
				NW_SetTask(i, 0);
			end
			NW_Abdicate();			-- 原来天子退位
			NW_SetTask(0, 1);		-- 宋赢
			return
		end
		
		local szMsg  = format("Ti襫 tuy課 m藅 b竜! T鑞g qu鑓 \"%s\" v� Kim Qu鑓 \"%s\" tranh 畂箃 ng玦 v� Thi猲 T�  b総 u, xin m阨 c竎 tng s� h穣 n ch� b竜 danh T鑞g Kim ph輆 m譶h  tham chi課!", CW_GetOccupant(7), CW_GetOccupant(4));
		local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
		GlobalExecute(szNews);
		Battle_StartNewRound( 2, 3 );	-- GM指令，启动国战宋金
	end
	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end

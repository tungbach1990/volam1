--帮会维护脚本
--by luobaohang 06/03/10
IncludeLib("TONG")
-- 帮会维护定时器
INTERVAL_TIME = 999999
function TaskShedule()
	TaskName("Bang h閕 c� 產ng kh雐 ng");
	-- 设置触发时间(即时执行)
	-- 执行1次
	TaskCountLimit(1);
end

function TaskContent()
	local nTongID = TONG_GetFirstTong()
	OutputMsg("Bang h閕 c� 產ng kh雐 ng.......................")
	while (nTongID ~= 0)do
		if (TONG_GetDay(nTongID) <= 0)then
			OutputMsg("ng v薾 h祅h bang h閕 c�: "..TONG_GetName(nTongID))
			TONG_ApplyInit(nTongID)
		end	
		nTongID = TONG_GetNextTong(nTongID)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end

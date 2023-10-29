Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\vng_script\\features\\nhiemvu_rua_pk\\main.lua")
Include("\\vng_script\\features\\quest_daily\\mainfuc.lua")
Include("\\vng_script\\features\\thammayman\\head.lua")
Include("\\vng_script\\features\\ruong_tinhnang\\exp_award.lua")
Include("\\vng_script\\features\\trongkhaihoan\\head.lua")

if not tbCheckTaskDaily2ReSet then
	tbCheckTaskDaily2ReSet = {}
end
tbCheckTaskDaily2ReSet.TASKID = 2778

function tbCheckTaskDaily2ReSet:OnLogin(bExchangeIn)
	if bExchangeIn == 1 then
		return
	end	
	
	local nTaskValue =  GetTask(self.TASKID)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
		
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		SetTask(self.TASKID, nTaskValue)		
		
		--khi nao can reset thi dua thong tin vao day
		--reset s� l�n nv rua pk 20lan/ngay
		tbVNG_BitTask_Lib:setBitTask(tbVngRuaPK.BITTASK_NUM_QUEST, 0)
		--reset nhi�m v� h�ng ng�y
		tbQuestDaily:ResetDailyTaskQuest()	
		--reset exp th�m may m�n
		tbVngThamMayMan:ResetExpDaily()
		--reset daily t�t c� bit c�a c�c lo�i r��ng t�nh n�ng
		tbVNG_GiveExpAward_Box:ResetExpDailyBoxFeature()
		--reset daily exp tr�ng kh�i ho�n
		tbVNGTriumphDrum:ResetExpDrumpDaily()
		return
	end			
end

EventSys:GetType("OnLogin"):Reg(0, tbCheckTaskDaily2ReSet.OnLogin, tbCheckTaskDaily2ReSet)
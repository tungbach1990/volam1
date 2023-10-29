--Item Th�m may m�n -by thanhld 20160120
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\vng_script\\features\\thammayman\\head.lua")
Include("\\vng_script\\vng_lib\\reset_daily_task.lua")

function main(nItemIdx)	
	if tbVngThamMayMan:IsOpen() ~= 1 then
		Talk(1,"","��t Th�m may m�n n�y �� k�t th�c, h�y ch� ��t t�i nh�!")
		return 1
	end
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	if tbVNG_BitTask_Lib:getBitTask(tbVngThamMayMan.BITTASK_WIN) ~= 0 then
		Talk(1,"","H�y nh�n gi�i th��ng m�i c� th� s� d�ng ti�p Th�m May M�n!")
		return 1
	end
	--kiem tra o trong hanh trang
	if PlayerFunLib:CheckFreeBagCell(5,"Ph�i c� �t nh�t 5 � tr�ng m�i c� th� nh�n th��ng.")~= 1 then
		return 1
	end
	--kiem tra reset daily
	tbCheckTaskDaily2ReSet:OnLogin()
	
	local nNumBer = tbVngThamMayMan:RandomNumber()	
	if not nNumBer then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE,"LoiSudungTMM_NotNumber")
		return 1
	end
	Msg2Player(format("D�ng Th�m May M�n nh�n ���c s�: <color=yellow>%d<color>",nNumBer))
	local nCheck = tbVngThamMayMan:CheckSpecNum(nNumBer)
	if nCheck == 0 then	
		local nExp = tbVngThamMayMan:RandomExp()
		local tbBitTask = tbVngThamMayMan.BITTASK_LIMIT_EXP_DAILY
		local nCurExp = tbVNG_BitTask_Lib:getBitTask(tbBitTask) 
		if  (nCurExp + nExp ) > MAX_EXP then
			nExp = MAX_EXP - nCurExp
		end
		tbVNG_BitTask_Lib:addTask(tbBitTask, nExp)
		PlayerFunLib:AddExp(nExp*FACTOR,0,tbVngThamMayMan.EVENT_LOG_TITLE,"SuDungTMMNhanExp")
	else
		tbLog:PlayerActionLog(tbVngThamMayMan.EVENT_LOG_TITLE.." - SoTrungGiai123: "..nNumBer)
		Talk(1,"",format("Ch�c m�ng c�c h� s� d�ng Th�m May M�n nh�n ���c s�: %d <color=yellow>tr�ng gi�i: %d<color>, h�y l�i Th�n T�i �� l�nh th��ng.",nNumBer,nCheck))
		AddGlobalNews(format("Ch�c m�ng ��i hi�p <color=pink>%s<color> s� d�ng Th�m may m�n nh�n ���c ph�n th��ng gi�i: <color=pink>%d<color>", GetName(), nCheck))
		tbVNG_BitTask_Lib:setBitTask(tbVngThamMayMan.BITTASK_WIN, nCheck)
	end	
	--Cong so lan su dung TMM
	tbVNG_BitTask_Lib:addTask(tbVngThamMayMan.BITTASK_USE_TMN_1000, 1)
	--print("====Su dung TMM so: "..tbVNG_BitTask_Lib:getBitTask(tbVngThamMayMan.BITTASK_USE_TMN_1000))
	--Kiem tra dat su dung 1000 cai thi trao thuong truc tiep vao hanh trang
	if tbVNG_BitTask_Lib:getBitTask(tbVngThamMayMan.BITTASK_USE_TMN_1000) == MOC_1000 then
		tbAwardTemplet:Give(tbVngThamMayMan.Award_1000_TMM,1,{tbVngThamMayMan.EVENT_LOG_TITLE,"NhanThuongSuDung1000TMM "})	
		Msg2Player(format("Ch�c m�ng c�c h� nh�n ���c ph�n th��ng s� d�ng ��t <color=yellow>1000 Th�m may m�n!<color>"))
		tbVNG_BitTask_Lib:setBitTask(tbVngThamMayMan.BITTASK_USE_TMN_1000, 0)
		--��t 1000 c�i th� add th�m 1  �� nh�n m�c 
		tbVNG_BitTask_Lib:addTask(tbVngThamMayMan.BITTASK_USE_TOTAL, 1)
	end	
	
	return
end

function tbVngThamMayMan:CheckSpecNum(nNumBer)	
	local nCheck = 0	
	for k,v in self.tbSpecialNum do
		for i=1, getn(v) do
			if nNumBer == v[i] then
				nCheck = k
				--print("===tbVngThamMayMan:CheckSpecNum: "..nNumBer)
			end
		end
	end
	return nCheck
end

function tbVngThamMayMan:RandomExp()	
 	local nRanVar =random(100*100)
	local num = 0	
	for k,v in self.AwardExp do
		num = num + v.nRate*100
		if nRanVar <= num then
			return k
		end
	end
 end
 
--Random Number
function tbVngThamMayMan:RandomNumber()	
 	local nRanVar =random(100*1000) 	
	local num = 0
	local nResult = nil
	if not self.tbNumberTMM then
		self.LoadFile()
	end
	for k,v in self.tbNumberTMM do
		num = num + v[1].nRate*1000		
		if nRanVar <= num then
			nResult = k
			break
		end
	end
	return nResult
 end
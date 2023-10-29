Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("SETTINGS")
PhongVanLenhBai2011 = {}
--PhongVanLenhBai2011.TASK_DAILY_AWARD_TIMES1 = 3090
--PhongVanLenhBai2011.TASK_DAILY_AWARD_TIMES2 = 3091
--PhongVanLenhBai2011.TASK_DAILY_WEEKEND_AWARD = 3092
--PhongVanLenhBai2011.TASK_COUNT_DAILY_AWARD_TIMES1 = 3093
--PhongVanLenhBai2011.TASK_COUNT_DAILY_AWARD_TIMES2 = 3094
--PhongVanLenhBai2011.TASK_COUNT_WEEKEND_AWARD = 3095
PhongVanLenhBai2011.TASK_DAILY_RESET = 3090
PhongVanLenhBai2011.tbBitTsk_Daily_Award_Time1 = {nTaskID = 3091,nStartBit = 1,nBitCount = 1,nMaxValue = 1}	
PhongVanLenhBai2011.tbBitTsk_Daily_Award_Time2 = {nTaskID = 3091,nStartBit = 2,nBitCount = 1,nMaxValue = 1}
PhongVanLenhBai2011.tbBitTsk_Weekend_Award = 	{nTaskID = 3091,nStartBit = 3,nBitCount = 1,nMaxValue = 1}

PhongVanLenhBai2011.tbAwardDaily1 = 
{
	-- [1]  =
	-- {
	-- 	{szName = "S�t th� gi�n (c�p 90)", tbProp = {6, 1, 400, 90,0,0}, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "Anh H�ng Thi�p", tbProp = {6, 1, 1604,1,0,0}, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName="Phong V�n Chi�u Binh L�nh",tbProp={6,1,30083,1,0,0},nCount=1,nExpiredTime=20160, nBindState = -2},
	-- 	{szName = "Qu� Huy Ho�ng (cao) ", tbProp = {6, 1, 906,1,0,0}, nCount = 3, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "T�ng Kim Phi T�c ho�n", tbProp = {6, 1, 190,1,0,0}, nCount = 20, nExpiredTime = 43200, nBindState = -2},
	-- 	{szName = "L�nh b�i ", tbProp = {6, 1, 157,1,0,0}, nCount = 20, nExpiredTime = 43200, nBindState = -2},
	-- },
	-- [2] = {
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=10,nRate=40, nBindState = -2},
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=20,nRate=35, nBindState = -2},
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=30,nRate=25, nBindState = -2},
	-- },
	-- [3] =
	-- {
	-- 	{szName = "Ti�n Th�o L� ", tbProp = {6,1,71,1,0,0}, nCount = 5, nRate = 50, nBindState = -2, nExpiredTime = 43200},
	-- 	{szName = "Ti�n Th�o L� ��c bi�t", tbProp = {6,1,1181,1,0,0}, nCount = 5, nRate = 50, nBindState = -2, nExpiredTime = 43200},
	-- },
	-- [4] =
	-- {
	-- 	{szName = "B�ch Ni�n Tr�n L�", tbProp = {6,1,2266,1,0,0}, nCount = 1, nRate =34, nExpiredTime = 43200, nBindState = -2},
	-- 	{szName = "Thi�n Ni�n Tr�n L�", tbProp = {6,1,2267,1,0,0}, nCount = 1, nRate =33, nExpiredTime = 43200, nBindState = -2},
	-- 	{szName = "V�n Ni�n Tr�n L�", tbProp = {6,1,2268,1,0,0}, nCount = 1, nRate =33, nExpiredTime = 43200, nBindState = -2},
	-- },
	-- [5] =
	-- {
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=5,nRate=40,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=10,nRate=35,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=15,nRate=25,nExpiredTime=20160, nBindState = -2},
	-- },	
}

PhongVanLenhBai2011.tbAwardDaily2 =
{
	-- [1] =
	-- {
	-- 	{szName = "Ph� Qu� C�m H�p", tbProp = {6, 1, 2402,1,0,0}, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "Ng�c Qu�n", tbProp = {6, 1, 2311,1,0,0}, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "L�nh b�i ", tbProp = {6, 2, 1020,1,0,0}, nCount = 40, nExpiredTime = 20160, nBindState = -2, CallBack = function (nItemIndex) SetItemMagicLevel(nItemIndex, 1, random(211,216)) end},
	-- 	{szName = "M�c nh�n", tbProp = {6, 1, 2969,1,0,0}, nCount = 40, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName="Phong V�n Chi�u Binh L�nh",tbProp={6,1,30083,1,0,0},nCount=1,nExpiredTime=20160, nBindState = -2},
	-- },	
	-- [2] = {
	-- 	{szName = "Long Huy�t Ho�n", tbProp = {6,1,2117,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "H�i Long Ch�u", tbProp = {6,1,2115,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "L�nh B�i Th�y T�c", tbProp = {6,1,2745,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName="Thi�n Tr� M�t L�nh",tbProp={6,1,30194,1,0,0},nCount=1,nRate=20,nExpiredTime=20160, nBindState = -2},
	-- 	{szName = "Vi�m �� L�nh", tbProp = {6,1,1617,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 20160, nBindState = -2},
	-- },
	-- [3] =
	-- {
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=10,nRate=40, nBindState = -2},
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=20,nRate=35, nBindState = -2},
	-- 	{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=30,nRate=25, nBindState = -2},
	-- },
	-- [4] =
	-- {
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=5,nRate=40,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=10,nRate=35,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=15,nRate=25,nExpiredTime=20160, nBindState = -2},
	-- },	
}

PhongVanLenhBai2011.tbWeekendAward = 
{
	-- [1] =
	-- {		
	-- 	{szName = "Ho�ng Kim �n C�p 5 (C��ng h�a)", tbProp = {0,3209}, nRate = 25, nQuality = 1, nExpiredTime = 10080, nBindState = -2},		
	-- 	{szName = "Ho�ng Kim �n C�p 5 (Nh��c h�a)", tbProp = {0,3219}, nRate = 25, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
	-- 	{szName = "Ho�ng Kim �n C�p 6 (C��ng h�a)", tbProp = {0,3210}, nRate = 25, nQuality = 1, nExpiredTime = 10080, nBindState = -2},		
	-- 	{szName = "Ho�ng Kim �n C�p 6 (Nh��c h�a)", tbProp = {0,3220}, nRate = 25, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
	-- },
	-- [2] =
	-- {
	-- 	{szName = "Qu� Ho�ng Kim", tbProp = {6, 1,907,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
	-- 	{szName = "H�n Nguy�n Linh L�", tbProp = {6, 1,2312,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},		
	-- 	{szName = "M�t n� Nguy�n so�i", tbProp = {0, 11,447,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
	-- 	{szName="T�c Hi�u B�ch C�u Ho�n c�p 150",tbProp={6,1,2975,1,0,0},nCount=1,nExpiredTime=10080, nBindState = -2},
	-- },
	-- [3] =
	-- {
	-- 	{szName = "B�ch C�u ho�n", tbProp = {6, 1, 74, 1, 0, 0}, nCount = 1, nExpiredTime = 20160, nRate = 34, nBindState = -2},
	-- 	{szName = "��i B�ch C�u ho�n", tbProp = {6, 1, 130, 1, 0, 0}, nCount = 1, nExpiredTime = 20160, nRate = 33, nBindState = -2},
	-- 	{szName = "B�ch C�u Ho�n ��c bi�t", tbProp = {6, 1, 1157, 1, 0, 0}, nCount = 1, nExpiredTime = 20160, nRate = 33, nBindState = -2},
	-- },
	-- [4] =
	-- {
	-- 	{szName = "B�ch C�u Ho�n k� n�ng", tbProp = {6, 1, 1372,1,0,0}, nRate = 34, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "��i B�ch C�u ho�n (K� n�ng) ", tbProp = {6, 1, 977,1,0,0}, nRate = 33, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "B�ch C�u Ho�n k� n�ng ��c bi�t", tbProp = {6, 1, 1182,1,0,0}, nRate = 33, nCount = 1, nExpiredTime = 20160, nBindState = -2},
	-- },
	-- [5] =
	-- {
	-- 	{szName = "T� H�i Ti�u Di�u ��n L� H�p", tbProp = {6, 1, 2398,1,0,0}, nCount = 1, nRate = 34, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "C�u Thi�n V�n Du ��n L� H�p", tbProp = {6, 1, 2400,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 20160, nBindState = -2},
	-- 	{szName = "Ng� Ch�u L�ng Kh�ng ��n L� H�p", tbProp = {6, 1, 2399,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 20160, nBindState = -2},
	-- },
	-- [6] =
	-- {
	-- 	{szName = "B�ch Ni�n Huy Ho�ng qu�", tbProp = {6, 1, 2269,1,0,0}, nCount = 1, nRate = 34, nExpiredTime = 10080, nBindState = -2},
	-- 	{szName = "Thi�n Ni�n Huy Ho�ng qu�", tbProp = {6, 1, 2270,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},
	-- 	{szName = "V�n Ni�n Huy Ho�ng qu�", tbProp = {6, 1, 2271,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},

	-- },
	-- [7] =
	-- 	{
	-- 		{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=20,nRate=40, nBindState = -2},
	-- 		{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=30,nRate=35, nBindState = -2},
	-- 		{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=40,nRate=25, nBindState = -2},
	-- 	},
	-- [8] =
	-- {
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=10,nRate=40,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=20,nRate=35,nExpiredTime=20160, nBindState = -2},
	-- 	{szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=30,nRate=25,nExpiredTime=20160, nBindState = -2},
	-- },
	-- [9] = {
	-- 	{szName="V� �� H�",tbProp={0,3880},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="Thanh B�nh L�c",tbProp={0,3881},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="H�i Xu�n",tbProp={0,3882},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="Kh� M�c",tbProp={0,3883},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="L�u V�n ",tbProp={0,3884},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="N� Tr�ch",tbProp={0,3885},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="L�i H�a Ki�p",tbProp={0,3886},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="M� T�y Thi�n H��ng",tbProp={0,3887},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="�i�p V� Hoa Phi",tbProp={0,3888},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- 	{szName="Long ��m",tbProp={0,3499},nCount=1,nRate=10,nQuality = 1,nExpiredTime=10080, nBindState = -2},
	-- },
} 

function PhongVanLenhBai2011:ShowDialogDaily()
	--Ki�m tra nh�p m� code Phong Van Lenh Bai
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		Talk(1, "", "C�c h� kh�ng �� �i�u ki�n tham gia ch��ng tr�nh.")
		return
	end
	local nTransCount = ST_GetTransLifeCount()
	if nTransCount < 3 or (nTransCount >= 4 and GetLevel() >= 190) then
		Talk(1, "", "Ph�i l� nh�n v�t chuy�n sinh l�n 3 tr� l�n v� chuy�n sinh l�n 4 c�p d��i 190 m�i nh�n ���c ph�n th��ng n�y")
		return
	end	
	self:ResetTask()
	local nDay = tonumber(date("%w"))
	local nTime =tonumber(GetLocalDate("%H%M"))
	local szTitle = "Ph�n th��ng h�ng ng�y"
	local tbOpt = {}
	
	if (nTime >= 0 and nTime <= 1400) then
		tinsert(tbOpt,  "Nh�n ph�n th��ng h�ng ng�y/#PhongVanLenhBai2011:GetDailyAwardTimes1()")
	else
		tinsert(tbOpt,  "Nh�n ph�n th��ng h�ng ng�y/#PhongVanLenhBai2011:GetDailyAwardTimes2()")
	end
	
	if ( nDay == 6 or nDay == 0) then
		tinsert(tbOpt,  "Nh�n ph�n th��ng cu�i tu�n/#PhongVanLenhBai2011:GetWeekendAward()")
	end
	tinsert(tbOpt,  "Kh�ng c�n g�/Cancel")
	
	Say(szTitle, getn(tbOpt), tbOpt)
end

function PhongVanLenhBai2011:GetDailyAwardTimes1()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end	
	
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTsk_Daily_Award_Time1) == 1 then
		Talk(1, "", "H�m nay ��i hi�p �� nh�n ph�n th��ng n�y r�i!")
		return
	end
	
	if CalcFreeItemCellCount() < 58 then
		Talk(1, "", "H�nh trang ��i hi�p kh�ng �� 58 � tr�ng!")
		return
	end
		
	if CalcItemCount(3, 6, 1, 30280, -1) <= 0 or ConsumeItem(3, 1, 6, 1, 30280, -1) ~= 1 then
		Talk(1, "", "C�n ph�i c� 1 v�t ph�m Nh�t Th�ng L�nh �� nh�n th��ng.")
		return					
	end	
	
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTsk_Daily_Award_Time1, 1)
	local tbAward = self.tbAwardDaily1
	tbAwardTemplet:Give(tbAward, 1, {"BatNienHoiNgoLenhBai", "NhanThuongHangNgayLan1"})	
end

function PhongVanLenhBai2011:GetDailyAwardTimes2()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end	
	
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTsk_Daily_Award_Time2) == 1 then
		Talk(1, "", "H�m nay ��i hi�p �� nh�n ph�n th��ng n�y r�i!")
		return
	end	 
	
	if CalcFreeItemCellCount() < 58 then
		Talk(1, "", "H�nh trang ��i hi�p kh�ng �� 58 � tr�ng!")
		return
	end
	
	if CalcItemCount(3, 6, 1, 30280, -1) <= 0 or ConsumeItem(3, 1, 6, 1, 30280, -1) ~= 1 then
		Talk(1, "", "C�n ph�i c� 1 v�t ph�m Nh�t Th�ng L�nh �� nh�n th��ng.")
		return					
	end
	
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTsk_Daily_Award_Time2, 1)
	
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(2000)
		Msg2Player("B�n nh�n ���c 2000 �i�m c�ng hi�n bang h�i")
		tbLog:PlayerActionLog("BatNienHoiNgoLenhBai", "NhanThuongHangNgayLan2", "2000 �i�m c�ng hi�n bang h�i")
	end
	local tbAward = self.tbAwardDaily2
	tbAwardTemplet:Give(tbAward, 1, {"BatNienHoiNgoLenhBai", "NhanThuongHangNgayLan2"})	
end

function PhongVanLenhBai2011:GetWeekendAward()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end	
	
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTsk_Weekend_Award) == 1 then
		Talk(1, "", "H�m nay ��i hi�p �� nh�n ph�n th��ng n�y r�i!")
		return
	end	 
	
	if CalcFreeItemCellCount() < 57 then
		Talk(1, "", "H�nh trang ��i hi�p kh�ng �� 57 � tr�ng!")
		return
	end
	
	if CalcItemCount(3, 6, 1, 30280, -1) < 2 or ConsumeItem(3, 2, 6, 1, 30280, -1) ~= 1 then
		Talk(1, "", "C�n ph�i c� 2 v�t ph�m Nh�t Th�ng L�nh �� nh�n th��ng.")
		return
	else
		
	end
		
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTsk_Weekend_Award, 1)
	tbAwardTemplet:Give(self.tbWeekendAward, 1, {"BatNienHoiNgoLenhBai", "NhanThuongCuoiTuan"})	
end

function PhongVanLenhBai2011:ResetTask()
	if PlayerFunLib:GetTaskDailyCount(self.TASK_DAILY_RESET) == 0 then
		PlayerFunLib:AddTaskDaily(self.TASK_DAILY_RESET, 1)
	 	for i = 1, 3 do
	 		tbVNG_BitTask_Lib:setBitTask({nTaskID = 3091,nStartBit = i,nBitCount = 1,nMaxValue = 1}, 0)
	 	end	 	
	 end 
end
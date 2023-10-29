Include("\\script\\trip\\define.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING")

local tbXunJinYuPai = {szName = "Huy�n Kim Ng�c B�i", tbProp = {6, 1, 3035, 1, 0, 0},}
local POINT2EXP_RATE = 6000


local TSK_TRIP_BATTLE_POINT_USED = 2906
local TSK_UESED_WEEK = 2907
--add exp limit for translife 6 - modified by DinhHQ - 20130531
local MAX_COUNT_PER_WEEK = 
{
	[0] = 600000,
	[1] = 600000,
	[2] = 700000,
	[3] = 800000,
	[4] = 1000000,
	[5] = 1000000,
	[6] = 1000000,
}
-- Task doi Chan Nguyen Don, edit by ThanhLd 20130515
tbVngtbXunJinYuPai = {};
tbVngtbXunJinYuPai.TSK_DAILY_LIMIT = 3063;

tbTripBattlePoint2Exp = {}

function tbTripBattlePoint2Exp:GetUsed()
	local nYW = tonumber(GetLocalDate("%Y%W"))
	if GetTask(%TSK_UESED_WEEK) ~= nYW then
		return 0
	else
		return GetTask(%TSK_TRIP_BATTLE_POINT_USED)
	end
end

function tbTripBattlePoint2Exp:GetUsedLimit(nValue)
	local nCount = self:GetUsed()
	local nTransLifeCount = ST_GetTransLifeCount()
	local nMax = %MAX_COUNT_PER_WEEK[nTransLifeCount]
	if not nMax then
		return 
	end
	if nCount + nValue > nMax then
		Msg2Player(format("M�i tu�n ng��i ch� ���c ph�p ��i %d �i�m, ng��i �� ��i %d �i�m r�i.", nMax, nMax))
		return nMax - nCount
	else
		Msg2Player(format("M�i tu�n ng��i ch� ���c ph�p ��i %d �i�m, ng��i �� ��i %d �i�m r�i.", nMax, nCount + nValue))
		return nValue
	end
end

function tbTripBattlePoint2Exp:AddUsed(nValue)
	local nYW = tonumber(GetLocalDate("%Y%W"))
	if GetTask(%TSK_UESED_WEEK) ~= nYW then
		SetTask(%TSK_UESED_WEEK, nYW)
		SetTask(%TSK_TRIP_BATTLE_POINT_USED, nValue)
	else
		local nAdd =GetTask(%TSK_TRIP_BATTLE_POINT_USED) + nValue
		SetTask(%TSK_TRIP_BATTLE_POINT_USED, nAdd)
	end
end

function tbTripBattlePoint2Exp:DialogMain()
	local szTitle = format("T� l� quy ��i �i�m c�ng hi�n li�n server v� kinh nghi�m l� 1:%d", %POINT2EXP_RATE)
	local tbOpt =
	{
		{"Ki�m tra �i�m c�ng hi�n li�n server", self.QueryPoint,{self}},
		{"��i kinh nghi�m", self.ToExp,{self}},
		{"��i Ch�n Nguy�n ��n", self.ToItem,{self}},
		{"K�t th�c ��i tho�i"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function tbTripBattlePoint2Exp:QueryPoint()
	local nTaskValue = GetTask(%TSK_TRIP_BATTLE_POINT)
	local szName = GetName()
	local szTitle = format("<npc><color=yellow>%s<color>�i�m c�ng hi�n li�n server c�a ng��i l� <color=yellow>%d<color>", szName, nTaskValue)
	local tbOpt =
	{
		{"Tr� v�", self.DialogMain, {self}},
		{"Ta bi�t r�i!"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbTripBattlePoint2Exp:ToExp()
	
	local nMaxValue = GetTask(%TSK_TRIP_BATTLE_POINT)
	if nMaxValue <= 0 then
		return Talk(1, "", "Xin l��ng th� �i�m c�ng hi�n li�n server c�a ng��i �� ���c ��i h�t r�i")
	end
	
	g_AskClientNumberEx(0, nMaxValue, format("C�n d� l�i %d c� th� ��i", nMaxValue), {self.GetExp, {self}})
end

function tbTripBattlePoint2Exp:GetExp(nValue)
	local nCurValue = GetTask(%TSK_TRIP_BATTLE_POINT)
	if nCurValue < nValue then
		nValue = nCurValue
	end
	if nValue <= 0 then
		return
	end
	local nAddValue = self:GetUsedLimit(nValue)
	if nAddValue <= 0 then
		return
	end
	SetTask(%TSK_TRIP_BATTLE_POINT, nCurValue - nAddValue)
	self:AddUsed(nAddValue)
	
	tbAwardTemplet:Give( {nExp_tl = nAddValue * %POINT2EXP_RATE}, 1, {"TRIP", "EXCHANGE EXP"})
end

--Th�m d�ng ��i Ch�n Nguy�n ��n- edit by ThanhLD 20130514

function tbTripBattlePoint2Exp:ToItem()
	local nStartDate = 20130530
	local nEndate = 20130623
	local nCurDate =  tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate < nStartDate or nCurDate > nEndate) then
		return Talk(1, "", "Kh�ng c�n  trong th�i gian ho�t ��ng ��i Ch�n Nguy�n ��n.")
	end
	local nCurPoint = GetTask(%TSK_TRIP_BATTLE_POINT)	
	if nCurPoint <= 0 then
		return Talk(1, "", "Xin l��ng th� �i�m c�ng hi�n li�n server c�a ng��i �� ���c ��i h�t r�i")
	end
	if CalcFreeItemCellCount() < 4 then
		return Talk(1, "", "B�ng h�u h�y ch�a 4 �  tr�ng trong h�nh trang" )		
	end
	if PlayerFunLib:CheckTaskDaily(tbVngtbXunJinYuPai.TSK_DAILY_LIMIT, 150, nil, "<") ~= 1 then
		return Talk(1, "", "M�i ng�y ch� ��i ���c t�i �a 150 Ch�n Nguy�n ��n, ng�y mai b�ng h�u h�y quay l�i ��i ti�p." )	
	end
	local nMaxValue = floor(nCurPoint/300)
	g_AskClientNumberEx(0, nMaxValue, format("C� th� ��i: %d", nMaxValue), {self.GetItem, {self}})	
	
end

function tbTripBattlePoint2Exp:GetItem(nValue)	
	
	local nMaxValue = PlayerFunLib:GetTaskDaily(tbVngtbXunJinYuPai.TSK_DAILY_LIMIT)
	if (nValue > 150 or (nMaxValue + nValue) > 150) then
		return Talk(1, "", "M�i ng�y ch� ��i ���c t�i �a 150 Ch�n Nguy�n ��n" )
	end
	
	local nCurPoint = GetTask(%TSK_TRIP_BATTLE_POINT)
	local nPointRequired = nValue * 300
	if nCurPoint < nPointRequired  then
		return Say(format("�i�m c�ng hi�n li�n server c�a ng��i kh�ng ��  �� ��i <color=yellow>%d  Ch�n Nguy�n ��n<color>",nValue ),0)		
	end	
		
	PlayerFunLib:AddTaskDaily(tbVngtbXunJinYuPai.TSK_DAILY_LIMIT, nValue)
	SetTask(%TSK_TRIP_BATTLE_POINT, nCurPoint - nPointRequired)
	local tbAward = {szName = "Ch�n Nguy�n ��n", tbProp = {6,1,30228,0,0,0}, nCount = nValue,nBindState=-2}	
	tbAwardTemplet:Give(tbAward, 1, {"TongKimLienServer", "DoiChanNguyenDonTrung"})		
end


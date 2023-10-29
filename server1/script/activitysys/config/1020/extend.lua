Include("\\script\\activitysys\\config\\1020\\head.lua")
Include("\\script\\activitysys\\config\\1020\\variables.lua")
Include("\\script\\activitysys\\config\\1020\\awardlist.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
pActivity.nPak = curpack()

function pActivity:UseFruitCake()
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_USE_FRUIT,%tbBITTSK_LIMIT_USE_FRUIT.nMaxValue,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<") then
		return
	end
	--ngau nhi�n exp
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = %tbAward_FruitCake_Exp
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_FRUIT)
	local nNextExp = nRandResult
	-- Lan su dung cuoi cung vuot qua gioi han
	if floor(nNextExp/1e6) + nCurTskVal > %tbBITTSK_LIMIT_USE_FRUIT.nMaxValue then
		nNextExp = (%tbBITTSK_LIMIT_USE_FRUIT.nMaxValue - nCurTskVal)*1e6
	end
	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_FRUIT, floor(nNextExp/1e6))
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_USE_FRUIT_COUNT, 1)
	tbAwardTemplet:Give({szName = "�i�m kinh nghi�m", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, "SuDungBanhTraiCayNhanExp"})
	tbAwardTemplet:Give(%tbAward_FruitCake_Item, 1, {%EVENT_LOG_TITLE, "SuDungBanhTraiCayNhanItem"})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_USE_FRUIT)
	Msg2Player(format("B�n �� nh�n ���c <color=yellow>%s<color> exp t� v�t ph�m %s, b�n c�n c� th� nh�n ���c th�m <color=yellow>%s<color> exp t� v�t ph�m n�y.", nCurTskVal*1e6, "B�nh kem Tr�i C�y", (%tbBITTSK_LIMIT_USE_FRUIT.nMaxValue - nCurTskVal)*1e6))	
end

function pActivity:CheckAwardExp(strFailMessage)
		local tb = {[1] = 201306110000, [2] = 201306112400}
		local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
		if nDate >= tb[1] and nDate <= tb[2] then
			return 1
		end 
		Talk(1, "", strFailMessage)
		return nil
end
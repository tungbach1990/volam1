
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("SETTING");

if (not tbTrainSkill150) then
	tbTrainSkill150 = {};
end

tbTrainSkill150.tbBIT_MIJI19 = {nTaskID = 3081,nStartBit = 1, nBitCount = 2, nMaxValue = 2};    --Task d�nh cho m�t t�ch skill 150 v�i c�p 19
tbTrainSkill150.tbBIT_MIJI20 = {nTaskID = 3081,nStartBit = 3, nBitCount = 2, nMaxValue = 2};    --Task d�nh cho m�t t�ch skill 150 v�i c�p 20

tbTrainSkill150.tbBIT_TCVA = {nTaskID = 3082,nStartBit = 1, nBitCount = 2, nMaxValue = 2};    --Task l�u s� l�n n�p tu ch�u v��t �i
tbTrainSkill150.tbBIT_TCVD = {nTaskID = 3082,nStartBit = 3, nBitCount = 2, nMaxValue = 2};    --Task l�u s� l�n n�p tu ch�u v��t �i vi�m �� 
tbTrainSkill150.tbBIT_TCTTMC = {nTaskID = 3082,nStartBit = 5, nBitCount = 2, nMaxValue = 2};	    --Task l�u s� l�n n�p tu ch�u v��t �i thi�n tr� m�t c�nh
tbTrainSkill150.tbBIT_BCH_USE = {nTaskID = 3082,nStartBit = 7, nBitCount = 6, nMaxValue = 50};			-- Task l�u s� l�n d�ng Item B�ch c�u ho�n k� n�ng
tbTrainSkill150.tbBIT_Free_Use = {nTaskID = 2902,nStartBit = 1, nBitCount = 6, nMaxValue = 60};			-- Task l�u s� l�n d�ng Free trong ng�y
tbTrainSkill150.tbBIT_Fee_Use = {nTaskID = 2902,nStartBit = 7, nBitCount = 6, nMaxValue = 60};			-- Task l�u s� l�n d�ng Fee trong ng�y
--tbTrainSkill150.TSK_CHANGE_DAY = 3083;     --Task l�u l�i ng�y �� ki�m tra reset
tbTrainSkill150.TSK_DAILY_CHANGE = 3082;  --Task reset theo ng�y
tbTrainSkill150.TSK_DAILY_USE = 2902		--Task reset theo ng�y
tbTrainSkill150.TSK_CHANGE_DAY = 2903;     --Task l�u l�i ng�y �� ki�m tra reset

tbTrainSkill150.tbFactionList_150 = {
	[0] = {1055, 1056, 1057},
	[1] = {1058, 1059, 1060},
	[2] = {1069, 1070, 1071, 1110},
	[3] = {1066, 1067},
	[4] = {1061, 1062, 1114},
	[5] = {1063, 1065},
	[6] = {1073, 1074},
	[7] = {1075, 1076},
	[8] = {1078, 1079},
	[9] = {1080, 1081},
}

function tbTrainSkill150:ResetDailyTask()
	local nDay = GetTask(self.TSK_CHANGE_DAY)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if nDay ~= nCurDate then
		SetTask(self.TSK_CHANGE_DAY, nCurDate)
		SetTask(self.TSK_DAILY_CHANGE, 0)
		SetTask(self.TSK_DAILY_USE, 0)
	end
end

--Ki�m tra level skill > 17 hay kh�ng
function tbTrainSkill150:checkLevelSkill(nSkillId)
	if (GetCurrentMagicLevel(nSkillId, 0) > 17) then
		return 1
	end
	return 0
end

function tbTrainSkill150:GetMaxTask(nSkillId)
	local nNextTskVal = tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCVA) + tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCVD) + tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCTTMC)
	if self:checkLevelSkill(nSkillId) == 1 then  --Levelskill  > 17	
			return tbVNG_BitTask_Lib:getBitTask(self.tbBIT_BCH_USE), 1
	end -- N�u Levelskill < 18	
	return nNextTskVal* 10 + tbVNG_BitTask_Lib:getBitTask(self.tbBIT_BCH_USE), 0
end
--DC nh�n ���c 10 l�n / 1 l�n ��i Tu Ch�n Y�u Quy�t, by ThanhLD 20130611
function tbTrainSkill150:GetValueMaxTask(nSkillId)
	local nNextTskVal = tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCVA) + tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCVD) + tbVNG_BitTask_Lib:getBitTask(self.tbBIT_TCTTMC)
	return nNextTskVal* 10
end

--Thi�t l�p cho task vng
function tbTrainSkill150:addDailyTask_Fee(nValue)
	self:ResetDailyTask()
	tbVNG_BitTask_Lib:addTask(self.tbBIT_Fee_Use, nValue)
end

function tbTrainSkill150:CheckValueTask()
	if (tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCVA) ~= 1 or tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCVD) ~= 1 or tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCTTMC) ~= 1) then
			return 0;
	end
	return 1;
end

function tbTrainSkill150:GetValueTask(nNumber)
	if(nNumber == 30162 and tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCVA) ~= 1) then
			return self.tbBIT_TCVA
	end
	if(nNumber == 30163 and tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCVD) ~= 1) then
			return self.tbBIT_TCVD
	end
	if(nNumber == 30164 and tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbBIT_TCTTMC) ~= 1) then
			return self.tbBIT_TCTTMC
	end
	return 0
end

--Kiem tra trung sinh cua nguoi choi
function tbTrainSkill150:CheckTS()
	local nTransLife = ST_GetTransLifeCount()	
	if (nTransLife == 3) then
		return 19
	end
	if (nTransLife == 2) then
		return 18
	end
	return 0
end

--H�m ki�m tra Player c� s� d�ng item
function tbTrainSkill150:Check_UseItem(nSkillId)
	local nTransLife = ST_GetTransLifeCount()	
	if (nTransLife == 2) and (GetCurrentMagicLevel(nSkillId, 0) == 18) then
		if tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_MIJI19) == 1 then
			return 1
		end
	end

	if (nTransLife <= 3) and (GetCurrentMagicLevel(nSkillId, 0) == 19) then
		if tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_MIJI20) == 1 then
			return 1
		end
	end
	
	return 0
end


function tbTrainSkill150:LoadItem()
	GiveItemUI("N�p v�t ph�m Tu ch�n y�u quy�t","Y�u c�u: M�i l�n ch� n�p 1 trong 3 lo�i v�t ph�m\nTu ch�n y�u quy�t(v��t �i)\nTu ch�n y�u quy�t(vi�m ��)\nTu ch�n y�u quy�t(thi�n tr� m�t c�nh)" , "confirm_LoadItem", "onCancel", 1)
end

function confirm_LoadItem(nCount)
	if nCount > 1 or nCount <= 0 then
		Talk(1, "", "V�t ph�m b� v�o kh�ng ��ng, xin h�y ki�m tra l�i")
		Msg2Player("V�t ph�m b� v�o kh�ng ��ng, xin h�y ki�m tra l�i")
		return
	end
	
	if tbTrainSkill150:CheckValueTask() == 1 then
			Talk(1, "", "S� l�n h�m nay c�a ng��i �� h�t, ng�y mai h�y l�i ��y nh�")
			Msg2Player("S� l�n h�m nay c�a ng��i �� h�t, ng�y mai h�y l�i ��y nh�")
			return
	end
	
	local nIdx=GetGiveItemUnit(1)
	local nG,nD,nP,_,_=GetItemProp(nIdx)

	if nG ~= 6 or nD ~= 1 or (nP ~= 30162 and nP ~= 30163 and nP ~= 30164) then
			Talk(1, "", "V�t ph�m b� v�o kh�ng ��ng, xin h�y ki�m tra l�i")
			Msg2Player("V�t ph�m b� v�o kh�ng ��ng, xin h�y ki�m tra l�i")
			return
	end
	
	local nRet = tbTrainSkill150:GetValueTask(nP);
	if  nRet == 0 then
		Talk(1, "", "S� l�n h�m nay c�a ng��i �� h�t, ng�y mai h�y l�i ��y nh�")
		Msg2Player("S� l�n h�m nay c�a ng��i �� h�t, ng�y mai h�y l�i ��y nh�")
		return
	end
	if IsMyItem(nIdx) ~= 1 or RemoveItemByIndex(nIdx) ~= 1 then
		return
	end
	tbVNG_BitTask_Lib:addTask(nRet, 1)
	Msg2Player("Ch�c m�ng b�n �� n�p th�nh c�ng v� nh�n ���c 10 l�n ��i �i�m tu luy�n ��i v�i Skill 150 c� c�p d��i 18")
end
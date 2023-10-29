IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\vngtranslog.lua")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
tbPVLB_Award = {}
tbPVLB_Award.Award = {
	--Ch�a tr�ng sinh
	[0] = {		
		[1] = { --lv 1-189
			nLevel = 190,
			tbItem = {
				{szName = "<B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>", tbProp={6,1,1390,1,0,0}, nCount = 1, nBindState = -2,nExpiredTime=20160},
				{szName="Ng�n l��ng",nJxb=20000,nCount=1},
				{szName="Th�n H�nh Ph�",tbProp={6,1,1266,1,0,0},nCount=1,nExpiredTime=43200, nBindState = -2},
			},
			tbBitTask = tbBITTASK_AWARD_0_1,
			strLog = "PhanThuongTS0_LVL1_189",
		},			
	},
	--ts 1
	[1] = {
		[1] = {
			nLevel = 190,
			tbItem = {
				{szName = "<B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>", tbProp={6,1,1390,1,0,0}, nCount = 1, nBindState = -2,nExpiredTime=4320},				
			},
			tbBitTask = tbBITTASK_AWARD_1_1,
			strLog = "PhanThuongTS1_LVL10_189",
		},			
	},
	--ts 2
	[2] = {
		[1] = {
			nLevel = 190,
			tbItem = {
				{szName = "<B�c ��u Tr��ng Sinh Thu�t - C� S� Thi�n>", tbProp={6,1,1390,1,0,0}, nCount = 1, nBindState = -2,nExpiredTime=4320},				
			},
			tbBitTask = tbBITTASK_AWARD_2_1,
			strLog = "PhanThuongTS2_LVL10_189",
		},		
	},
	--ts 3
	[3] = nil,
	[4] = {
		[1] = {
			nLevel = 120,
			tbItem = {
				{szName = "C�u ni�n tr�ng ph�ng l�nh b�i - B�ch H� B�o R��ng", tbProp={6,1,30282,1,0,0}, nCount = 1, tbParam = {0,7,0,0,0,0}, nExpiredTime=10080, nBindState = -2},
			},
			tbBitTask = tbBITTASK_AWARD_4_1,
			strLog = "PhanThuongTS4_LVL10_119",
		},
		[2] = {			
			tbItem = {
				{szName = "C�u ni�n tr�ng ph�ng l�nh b�i - X�ch L�n B�o R��ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080, nJustNewRole = 1},
			},
			tbBitTask = tbBITTASK_AWARD_4_2,
			strLog = "PhanThuongTS4_LVL190",
		},		
	},
}
tbPVLB_Award.tbTransLog = {strFolder = "201109_EventPhongVanLenhBai/", nPromID = 11, nResult = 1}

function tbPVLB_Award:GetAwardIDx()
	local nTransLife = ST_GetTransLifeCount()
	--local nAwardIdx = 0
	if nTransLife < 0 or nTransLife >= 5 then
		return nil, nil
	end
	local nLevel = GetLevel()
	if nTransLife == 0 then
		if nLevel >= 1 and nLevel <= 189 then
			return nTransLife, 1;
		end		
	elseif nTransLife == 1 then
		if nLevel >= 10 and nLevel <= 189 then
			return nTransLife, 1;
		end		
	elseif nTransLife == 2 then
		if nLevel >= 10 and nLevel <= 189 then
			return nTransLife, 1;
		end		
	elseif nTransLife == 3 then
		return nil, nil;
	elseif nTransLife == 4 then
		if nLevel >= 10 and nLevel <= 119 then
			return nTransLife, 1;
		end		
		if nLevel == 190 and tbPVLB_Check:IsNewRole() == 1 then
			return nTransLife, 2;
		end
	end
	return nil, nil;
end

function tbPVLB_Award:MainDialog()
	local strTittle = "Ph�n th��ng hi�n t�i nh� sau:\n\n"
	local tbOpt = {}
	local n1, n2 = self:GetAwardIDx()
--	print(n1.." "..n2)
	if not n1 or not n2 then
		strTittle = strTittle.."\t\t\t\t<color=red>Kh�ng c� ph�n th��ng n�o<color>\n"
		tinsert(tbOpt, {"��ng"})
		CreateNewSayEx(strTittle, tbOpt)
		return
	end
	local tbTempAward = self.Award[n1][n2]
	if not tbTempAward then
		strTittle = strTittle.."\t\t\t\t<color=red>Kh�ng c� ph�n th��ng n�o<color>\n"
		tinsert(tbOpt, {"��ng"})
		CreateNewSayEx(strTittle, tbOpt)
		return
	end
	if tbTempAward.nLevel then
		strTittle = strTittle.."\t\t\t\t<color=yellow>Th�ng ��ng c�p "..tbTempAward.nLevel.."<color>\n"
	end
	if tbTempAward.tbItem then
		local tb = tbTempAward.tbItem
		for i = 1, getn(tb) do
			if tb[i].szName == "Ng�n l��ng" then
				strTittle = strTittle.."\t\t\t\t<color=yellow>"..tb[i].nJxb.." "..tb[i].szName.."<color>\n"
			elseif tb[i].szName == "�i�m Kinh Nghi�m" then
				strTittle = strTittle.."\t\t\t\t<color=yellow>"..tb[i].nExp.." "..tb[i].szName.."<color>\n"
			else
				if tb[i].nJustNewRole == 1 then
					if  tbPVLB_Check:IsNewRole() == 1 then
						strTittle = strTittle.."\t\t\t\t<color=yellow>"..tb[i].nCount.." "..tb[i].szName.."<color>\n"
					else
						strTittle = strTittle.."\t\t\t\t<color=yellow>kh�ng ph�i l� role t�o m�i n�n kh�ng nh�n ���c ph�n th��ng "..tb[i].szName.."<color>\n"
					end
				else
					strTittle = strTittle.."\t\t\t\t<color=yellow>"..tb[i].nCount.." "..tb[i].szName.."<color>\n"
				end
			end
		end
	end
	if tbVNG_BitTask_Lib:getBitTask(tbTempAward.tbBitTask) == 0 then
		tinsert(tbOpt, {"Nh�n ngay", tbPVLB_Award.GetAward, {tbPVLB_Award, tbTempAward}})
	else
		strTittle = strTittle.."\n<color=red>�� nh�n th��ng<color>"
	end
	tinsert(tbOpt, {"��ng"})
	CreateNewSayEx(strTittle, tbOpt)
end

function tbPVLB_Award:GetAward(tbAward)
	if PlayerFunLib:VnCheckInCity () ~= 1 then		
		return
	end
	if tbAward.tbItem and CalcFreeItemCellCount() < 59 then
		Talk(1, "", "Xin h�y d�n tr�ng h�nh trang r�i h�y nh�n th��ng.")
		return
	end		
	tbVNG_BitTask_Lib:setBitTask(tbAward.tbBitTask, 1)
	if tbAward.nLevel and tbAward.nLevel > GetLevel() then
		ST_LevelUp(tbAward.nLevel - GetLevel())
		tbLog:PlayerActionLog(strLOG_HEAD, tbAward.strLog, "ThangDangCap: "..GetLevel())
	end	
	if tbAward.tbItem then
		local nIsNewRole = tbPVLB_Check:IsNewRole()				
		for i = 1, getn(tbAward.tbItem) do
			if tbAward.tbItem[i].nJustNewRole == 1 then
				if nIsNewRole == 1 then
					tbAwardTemplet:Give(tbAward.tbItem[i], 1, {strLOG_HEAD, strLog})
				else
					Msg2Player("Kh�ng ph�i l� nh�n v�t m�i t�o n�n kh�ng nh�n ���c ph�n th��ng "..tbAward.tbItem[i].szName)
				end
			else
				tbAwardTemplet:Give(tbAward.tbItem[i], 1, {strLOG_HEAD, strLog})
			end
		end		
	end	
end

function tbPVLB_Award:CheckDidGetAward()
	local n1, n2 = self:GetAwardIDx()
	if not n1 or not n2 then
		return 1
	end
	local tbTempAward = self.Award[n1][n2]
	if tbTempAward then
		if tbVNG_BitTask_Lib:getBitTask(tbTempAward.tbBitTask) == 1 then
			return 1
		end	
	end
	return 0
end
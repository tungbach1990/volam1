Include("\\script\\activitysys\\config\\1004\\data.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
tbMainQuest = {
	tbMaterial = {
		{strName = "T�y T�y ��n", nG = 6, nD = 1, nP = 30133},
		{strName = "T�i Linh ��n", nG = 6, nD = 1, nP = 30134},
		{strName = "��ng Tr�ng Th�o", nG = 6, nD = 1, nP = 30135},
	}
}
function tbMainQuest:SelectTypePoint(nStage)
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	
	local nLevel,_ = zhuansheng_get_gre(nStage)
	local strTittle = "<color=orange>B�c ��u L�o Nh�n: <color>"
	local tbOpt = {}
	local nTransCount = ST_GetTransLifeCount()
	if nTransCount < nStage then
		strTittle = strTittle.."Hi�n t�i c�c h� m�i ch� tr�ng sinh "..nTransCount..", kh�ng c�n ph�i l�m nhi�m v� giai �o�n n�y."
	else
		if nLevel == 200 then
			strTittle = strTittle..format("C�c h� tr�ng sinh l�n <color=yellow>%d<color> � ��ng c�p <color=yellow>200<color>, kh�ng c�n ph�i l�m nhi�m v� n�y.", nStage)
		else
			strTittle = strTittle..format("C�c h� tr�ng sinh l�n <color=yellow>%d<color> � c�p <color=yellow>%d<color>, ho�n th�nh <color=yellow>1<color> l�n nhi�m v� ��ng Tr�ng H� Th�o <color=yellow>giai �o�n %d<color> s� gi�p c�c h� b� sung m�t trong c�c lo�i �i�m sau:\n\n", nStage, nLevel, nStage)
			local tbStage = %tbDTT_Data.tbStages[nStage]
			strTittle = strTittle..format("%-4s%-20s%-14s%s\n", "", "�i�m", "S� l��ng", "Ti�n ��")
			for nType = 1, getn(tbStage) do
				if tbStage[nType][nLevel] then
					local tbBTask = tbStage[nType].tbBitTask
					if not tbBTask then
						return
					end
					local strProccess = ""
					if tbVNG_BitTask_Lib:getBitTask(tbBTask[1]) == 0 then
						strProccess = "<color=red>Ch�a nh�n"
					else
						if tbVNG_BitTask_Lib:getBitTask(tbBTask[2]) == 0 then
							strProccess = "<color=red>Ch�a ho�n th�nh"
						else
							strProccess = "<color=green>�� ho�n th�nh"
						end
					end
					if tbStage[nType].strType == "Kh�ng t�nh" then					
						local n_translevel, n_transresist = zhuansheng_get_gre(nStage);
						if not TB_BASE_RESIST[n_transresist] then
							return
						end
						strTittle = strTittle..format("<color=yellow>%-4s%-20s%-14s%s<color>\n", "", TB_BASE_RESIST[n_transresist], tbStage[nType][nLevel][1], strProccess)	
						tbDailog:AddOptEntry(TB_BASE_RESIST[n_transresist], self.SelectTypeDialog, {self, nStage, nType, nLevel})
					else
						strTittle = strTittle..format("<color=yellow>%-4s%-20s%-14s%s<color>\n", "", tbStage[nType].strType, tbStage[nType][nLevel][1], strProccess)	
						tbDailog:AddOptEntry(tbStage[nType].strType, self.SelectTypeDialog, {self, nStage, nType, nLevel})
					end
				end				
			end
		end
	end		
	tbDailog.szTitleMsg = strTittle
	tbDailog:Show();
end

function tbMainQuest:SelectTypeDialog(nStage, nType, nLevel)
	local tbStage = %tbDTT_Data.tbStages[nStage]
	local strTypePoint = tbStage[nType].strType
	local tbTemp = tbStage[nType][nLevel]
	if not tbTemp then
		return
	end
	local tbMaterialCount = {tbTemp[2], tbTemp[3],tbTemp[4]}	
	local nCount1, nCount2, nCount3 = self:CalcItems()
	local strTittle = format("<color=orange>B�c ��u L�o Nh�n<color>: Nhi�m v� <color=yellow>%s<color> giai �o�n <color=yellow>%d<color> y�u c�u:\n\n", strTypePoint, nStage)
	strTittle = strTittle..format("%-4s%-24s%s\n", "", "Nguy�n li�u", "S� l��ng")
	if nCount1 < tbMaterialCount[1] then
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=red>%d/%d<color>\n", "", self.tbMaterial[1].strName, nCount1, tbMaterialCount[1])
	else
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=green>%d/%d<color>\n", "", self.tbMaterial[1].strName, nCount1, tbMaterialCount[1])
	end
	if nCount2 < tbMaterialCount[2] then
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=red>%d/%d<color>\n", "", self.tbMaterial[2].strName, nCount2, tbMaterialCount[2])
	else
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=green>%d/%d<color>\n", "", self.tbMaterial[2].strName, nCount2, tbMaterialCount[2])
	end
	if nCount3 < tbMaterialCount[3] then
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=red>%d/%d<color>\n", "", self.tbMaterial[3].strName, nCount3, tbMaterialCount[3])
	else
		strTittle = strTittle..format("<color=yellow>%-4s%-24s<color=green>%d/%d<color>\n", "", self.tbMaterial[3].strName, nCount3, tbMaterialCount[3])
	end	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = strTittle
	tbDailog:AddOptEntry("Nh�n nhi�m v�", self.AcceptQuest, {self, nStage, nType, nLevel})
	tbDailog:AddOptEntry("Ho�n th�nh nhi�m v�", self.CompleteQuest, {self, nStage, nType, nLevel})
	tbDailog:AddOptEntry("H�y nhi�m v�", self.CancelQuest, {self, nStage, nType, nLevel})
	tbDailog:Show();
end

function tbMainQuest:CalcItems()
	local n1, n2, n3
	n1 = CalcItemCount(3, self.tbMaterial[1].nG, self.tbMaterial[1].nD, self.tbMaterial[1].nP, -1)
	n2 = CalcItemCount(3, self.tbMaterial[2].nG, self.tbMaterial[2].nD, self.tbMaterial[2].nP, -1)
	n3 = CalcItemCount(3, self.tbMaterial[3].nG, self.tbMaterial[3].nD, self.tbMaterial[3].nP, -1)
	return n1, n2, n3
end

function tbMainQuest:ConsumeItems(tbMateRequire, strLog)
	for i = 1, getn(self.tbMaterial) do	
		if ConsumeItem(3, tbMateRequire[i], self.tbMaterial[i].nG, self.tbMaterial[i].nD, self.tbMaterial[i].nP, -1) ~= 1 then
			Talk(1, "", format("Giao n�p %s th�t b�i, ti�u hao m�t s� nguy�n li�u.", self.tbMaterial[i].strName))
			tbLog:PlayerActionLog("DongTrungHaThao", "GiaoNopThatBai", tbMateRequire[i].." "..self.tbMaterial[i].strName, strLog)
			return 0
		else
			tbLog:PlayerActionLog("DongTrungHaThao", "GiaoNopThanhCong", tbMateRequire[i].." "..self.tbMaterial[i].strName, strLog)
		end
	end
	return 1
end

function tbMainQuest:AcceptQuest(nStage, nType, nLevel)
	local tbBTask = %tbDTT_Data.tbStages[nStage][nType].tbBitTask
	if not tbBTask then
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[1]) ~= 0 then
		Talk(1, "", "C�c h� �� nh�n nhi�m v� n�y r�i, ��u c�n nh�n l�i.")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[2]) ~= 0 then
		Talk(1, "", "C�c h� �� ho�n th�nh nhi�m v� n�y r�i, h�y l�m nhi�m v� kh�c �i.")
		return
	end
	if nStage == 1 then
		if GetLevel() <150 and ST_GetTransLifeCount() <= 1 then
			Talk(1, "", "Y�u c�u ��ng c�p tr�n 150 v� �� tr�ng sinh 1 l�n m�i ���c ph�p nh�n nhi�m v� n�y!")
			return nil
		end
		local nLvlST1,_ = zhuansheng_get_gre(1)
		if nLvlST1 == 200 then
			Talk(1, "", "C�c h� �� tr�ng sinh l�n 1 � ��ng c�p 200 kh�ng c�n ph�i l�m nhi�m v� n�y.")
			return nil
		end
	elseif nStage == 2 then
		local nLvlST1,_ = zhuansheng_get_gre(1)
		if nLvlST1 ~= 200 then
			--ph�i ho�n th�nh nhi�m v� k� n�ng v� ti�m n�ng gd 1 m�i dc nh�n nhi�m v� gd2
			local tbPreBTask1 = %tbDTT_Data.tbStages[1][1].tbBitTask
			local tbPreBTask2 = %tbDTT_Data.tbStages[1][2].tbBitTask
			if tbVNG_BitTask_Lib:getBitTask(tbPreBTask1[2]) ~= 1 or tbVNG_BitTask_Lib:getBitTask(tbPreBTask2[2]) ~= 1 then
				Talk(1, "", "Y�u c�u ph�i ho�n th�nh <color=red>nhi�m v� k� n�ng v� ti�m n�ng giai �o�n 1<color> m�i ���c ph�p nh�n ti�p nhi�m v� giai �o�n 2. Khi n�o ho�n th�nh h�y quay l�i t�m ta.")
				return
			end
		end
	elseif nStage == 3 then
		local nLevel1,_ = zhuansheng_get_gre(1)
		if nLevel1 ~= 200 then
			--ph�i ho�n th�nh nhi�m v� k� n�ng v� ti�m n�ng gd 1 m�i dc nh�n nhi�m v� gd3
			local tbPreBTask1 = %tbDTT_Data.tbStages[1][1].tbBitTask
			local tbPreBTask2 = %tbDTT_Data.tbStages[1][2].tbBitTask
			if tbVNG_BitTask_Lib:getBitTask(tbPreBTask1[2]) ~= 1 or tbVNG_BitTask_Lib:getBitTask(tbPreBTask2[2]) ~= 1 then
				Talk(1, "", "Y�u c�u ph�i ho�n th�nh <color=red>nhi�m v� k� n�ng v� ti�m n�ng giai �o�n 1<color> m�i ���c ph�p nh�n ti�p nhi�m v� giai �o�n 2. Khi n�o ho�n th�nh h�y quay l�i t�m ta.")
				return
			end
		end
		local nLevel2,_ = zhuansheng_get_gre(2)
		if nLevel2 ~= 200 then
			--ph�i ho�n th�nh nhi�m v� k� n�ng v� ti�m n�ng gd 2 m�i dc nh�n nhi�m v� gd3
			local tbPreBTask1 = %tbDTT_Data.tbStages[2][1].tbBitTask
			local tbPreBTask2 = %tbDTT_Data.tbStages[2][2].tbBitTask
			if tbVNG_BitTask_Lib:getBitTask(tbPreBTask1[2]) ~= 1 or tbVNG_BitTask_Lib:getBitTask(tbPreBTask2[2]) ~= 1 then
				Talk(1, "", "Y�u c�u ph�i ho�n th�nh <color=red>nhi�m v� k� n�ng v� ti�m n�ng giai �o�n 2<color> m�i ���c ph�p nh�n ti�p nhi�m v� giai �o�n 3. Khi n�o ho�n th�nh h�y quay l�i t�m ta.")
				return
			end
		end
	end
	if tbVNG_BitTask_Lib:setBitTask(tbBTask[1], 1) ~= 1 then
		Talk(1, "", "<color=red>Nh�n nhi�m v� kh�ng th�nh c�ng, xin h�y th� l�i!<color>")
		return
	end
	local strTypePoint = %tbDTT_Data.tbStages[nStage][nType].strType 
	local strLogTittle = %tbDTT_Data.tbStages[nStage][nType].strLog
	tbLog:PlayerActionLog("DongTrungHaThao", "Nhan"..strLogTittle)
	Msg2Player(format("<color=green>C�c h� �� ti�p nh�n nhi�m v� ��ng Tr�ng H� Th�o (%s) giai �o�n <color=yellow>%d<color=green>, h�y mau �i thu th�p nguy�n li�u mang v� ��y.<color>", strTypePoint, nStage))
end

function tbMainQuest:CompleteQuest(nStage, nType, nLevel)
	local tbStage = %tbDTT_Data.tbStages[nStage]
	if not tbStage or not tbStage[nType] or not tbStage[nType][nLevel] then		
		return
	end
	local strTypePoint = tbStage[nType].strType
	local tbTemp = tbStage[nType][nLevel]	
	--Ki�m tra �� nh�n nv ch�a
	local tbBTask = tbStage[nType].tbBitTask
	if not tbBTask then	
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[1]) ~= 1 then
		Talk(1, "", "<color=red>Nhi�m v� ch�a nh�n kh�ng th� ho�n th�nh.<color>")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[2]) ~= 0 then
		Talk(1, "", "<color=red>C�c h� �� ho�n th�nh nhi�m v� n�y r�i, h�y l�m nhi�m v� kh�c �i.<color>")
		return
	end
	--Ki�m tra nguy�n li�u
	local tbMaterialCount = {tbTemp[2], tbTemp[3],tbTemp[4]}
	local nCount1, nCount2, nCount3 = self:CalcItems()
	if nCount1 < tbMaterialCount[1] or nCount2 < tbMaterialCount[2] or nCount3 < tbMaterialCount[3] then
		Talk(1, "", "<color=red>C�c h� �em nguy�n li�u kh�ng �� r�i, c� g�ng thu th�p th�m r�i quay l�i t�m ta.<color>")
		return
	end
	local strLogTittle = tbStage[nType].strLog
	if self:ConsumeItems(tbMaterialCount, strLogTittle) ~= 1 then
		return
	end
	--Add task
	if tbVNG_BitTask_Lib:setBitTask(tbBTask[2], 1) ~= 1 then
		Talk(1, "", "<color=red>Nhi�m v� ch�a ho�n th�nh, xin h�y li�n l�c ban �i�u h�nh �� ���c gi�i quy�t!<color>")
		return
	end
	--Add ph�n th��ng
	local nPointCount = tbTemp[1]
	if strTypePoint == "�i�m k� n�ng" then
		AddMagicPoint(nPointCount)
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Ch�c m�ng b�n �� ho�n th�nh nhi�m v� ��ng Tr�ng H� Th�o (%s) giai �o�n <color=yellow>%d<color=green>, nh�n ���c <color=yellow>%s.<color>", strTypePoint, nStage, str))
		tbLog:PlayerActionLog("DongTrungHaThao", "HoanThanh"..strLogTittle, "TS"..nStage.."Level"..nLevel, str)
	elseif strTypePoint == "�i�m ti�m n�ng" then
		AddProp(nPointCount)
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Ch�c m�ng b�n �� ho�n th�nh nhi�m v� ��ng Tr�ng H� Th�o (%s) giai �o�n <color=yellow>%d<color=green>, nh�n ���c <color=yellow>%s.<color>", strTypePoint, nStage, str))
		tbLog:PlayerActionLog("DongTrungHaThao", "HoanThanh"..strLogTittle, "TS"..nStage.."Level"..nLevel, str)
	elseif strTypePoint == "Kh�ng t�t c�" then
		for i = 0, 4 do
			AddMaxResist(i, nPointCount);
		end
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Ch�c m�ng b�n �� ho�n th�nh nhi�m v� ��ng Tr�ng H� Th�o (%s) giai �o�n <color=yellow>%d<color=green>, nh�n ���c <color=yellow>%s.<color>", strTypePoint, nStage, str))
		tbLog:PlayerActionLog("DongTrungHaThao", "HoanThanh"..strLogTittle, "TS"..nStage.."Level"..nLevel, str)
	elseif strTypePoint == "K� n�ng t�i �a" then
		SetSkillMaxLevelAddons(GetSkillMaxLevelAddons() + nPointCount)
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Ch�c m�ng b�n �� ho�n th�nh nhi�m v� ��ng Tr�ng H� Th�o (%s) giai �o�n <color=yellow>%d<color=green>, nh�n ���c <color=yellow>%s.<color>", strTypePoint, nStage, str))
		tbLog:PlayerActionLog("DongTrungHaThao", "HoanThanh"..strLogTittle, "TS"..nStage.."Level"..nLevel, str)
	elseif strTypePoint == "Kh�ng t�nh" then
		local n_translevel, n_transresist = zhuansheng_get_gre(nStage);
		if n_transresist >= 0 and n_transresist <= 4 then
			AddMaxResist(n_transresist, nPointCount);
			local str = nPointCount.." "..TB_BASE_RESIST[n_transresist]
			Msg2Player(format("<color=green>Ch�c m�ng b�n �� ho�n th�nh nhi�m v� ��ng Tr�ng H� Th�o (%s) giai �o�n <color=yellow>%d<color=green>, nh�n ���c <color=yellow>%s.<color>", strTypePoint, nStage, str))
			tbLog:PlayerActionLog("DongTrungHaThao", "HoanThanh"..strLogTittle, "TS"..nStage.."Level"..nLevel, str)
		end
	end
	KickOutSelf()
end

function tbMainQuest:CancelQuest(nStage, nType, nLevel)
	local tbBTask = %tbDTT_Data.tbStages[nStage][nType].tbBitTask
	if not tbBTask then
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[1]) ~= 1 then
		Talk(1, "", "Kh�ng th� hu� nhi�m v� ch�a nh�n.")
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[2]) ~= 0 then
		Talk(1, "", "C�c h� �� ho�n th�nh nhi�m v� n�y r�i.")
		return
	end
	tbVNG_BitTask_Lib:setBitTask(tbBTask[1], 0) 
	Msg2Player("Hu� b� nhi�m v� ��ng Tr�ng H� Th�o th�nh c�ng.")
end
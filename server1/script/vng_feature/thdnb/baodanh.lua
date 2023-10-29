Include("\\script\\vng_feature\\thdnb\\head.lua")

function tbTHDNBReg:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbTHDNBReg:AddDialog()
	if not self:IsActive() then
		return
	end
	if GetWorldPos() ~= self.nMapID then
		return
	end	
	CreateTaskSay({"<dec><npc>Ho�t ��ng ��ng k� chi�n ��i Thi�n H� �� Nh�t Bang �ang ti�n h�nh, ng��i t�m ta c� vi�c g�: ",
					"Xem danh s�ch th�nh vi�n/#tbTHDNBReg:ShowMemList(0)",
					"B�o danh tham gia Thi�n H� �� Nh�t Bang/#tbTHDNBReg:SignUpMem()",					
					"K�t th�c ��i tho�i/OnCancel"});
end

function tbTHDNBReg:ShowMemList(nPage)
	local strMasterAccount = GetAccount()
	if not self.tbTongMaster[strMasterAccount] or self.tbTongMaster[strMasterAccount] ~= 1 then
		CreateTaskSay({"<dec><npc>T�i kho�n kh�ng h�p l�.", "K�t th�c ��i tho�i/OnCancel"});
		return
	end
	local tbOpt = {}
	local nMinOpt = nPage*10 + 1
	local nMaxOpt = nMinOpt + 9	
	local nCurMemCount = self:GetCurMemCount(strMasterAccount) 
	if nCurMemCount < nMinOpt  then
		return
	end
	if nCurMemCount < nMaxOpt then
		nMaxOpt = nCurMemCount
	end
	for i = nMinOpt, nMaxOpt do
		tinsert(tbOpt, format("%s/#tbTHDNBReg:SelectMember(%d)", self.tbMemList[strMasterAccount][i][2], i))
	end
	if nPage > 0 then
		tinsert(tbOpt, format("Trang tr��c/#tbTHDNBReg:ShowMemList(%d)", nPage - 1))
	end
	if nCurMemCount >= ((nPage + 1)*10 + 1) then
		tinsert(tbOpt, format("Trang sau/#tbTHDNBReg:ShowMemList(%d)", nPage + 1))
	end
	tinsert(tbOpt, "K�t th�c ��i tho�i/OnCancel")
	tinsert(tbOpt, 1, "<dec><npc>Danh s�ch th�nh vi�n: ");
	CreateTaskSay(tbOpt)
end

function tbTHDNBReg:SelectMember(nIdx)
	local strMemName = self.tbMemList[GetAccount()][nIdx][2]
	CreateTaskSay({format("<dec><npc> Th�nh vi�n %s", strMemName), format("Lo�i b� th�nh vi�n/#tbTHDNBReg:DelMember(%d)", nIdx), "K�t th�c ��i tho�i/OnCancel"})
end

function tbTHDNBReg:DelMember(nIdx)
	local strMaster = GetAccount()
	local strMemAcc = self.tbMemList[strMaster][nIdx][1]
	local strMemName = self.tbMemList[strMaster][nIdx][2]
	tremove(self.tbMemList[strMaster], nIdx)
	Msg2Player(format("�� lo�i b� ng��i ch�i <color=yellow>%s<color> ra kh�i danh s�ch thi ��u.", strMemName))
	tbLog:PlayerActionLog("DangKyTHDNB", "LoaiBoThanhVien", strMemAcc, strMemName)
	self:WriteMemList(strMaster)	
end

function tbTHDNBReg:SignUpMem()
	local strMasterAccount = GetAccount()
	if not self.tbTongMaster[strMasterAccount] or self.tbTongMaster[strMasterAccount] ~= 1 then
		CreateTaskSay({"<dec><npc>T�i kho�n kh�ng h�p l�.", "K�t th�c ��i tho�i/OnCancel"});
		return
	end	
	local nTeamSize = GetTeamSize();	
	if (nTeamSize < 2) then
		CreateTaskSay({"<dec><npc>H�y t� ��i v�i th�nh vi�n tr��c r�i m�i b�o danh tham gia.", "K�t th�c ��i tho�i/OnCancel"});
		return
	elseif (nTeamSize > 2) then
		CreateTaskSay({"<dec><npc>M�i l�n b�o danh c�n t� ��i v�i 1 th�nh vi�n.", "K�t th�c ��i tho�i/OnCancel"});
		return
	end;
	if (IsCaptain() == 0) then
		CreateTaskSay({"<dec><npc>Ch� c� ��i tr��ng m�i c� th� ti�n h�nh b�o danh.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end;
	if self:GetCurMemCount(strMasterAccount) >= self.nMaxMemCount then
		CreateTaskSay({"<dec><npc>Danh s�ch th�nh vi�n Thi�n H� �� Nh�t Bang �� �� s�, kh�ng th� ti�p t�c b�o danh.", "K�t th�c ��i tho�i/OnCancel"});
		return
	end
	
	local strMemName = "";
	local strMemAcc = ""
	local nIsExist = 0;
	local nfact = -1;
	local oldPlayer = PlayerIndex;
	for i = 1, 2 do
		local nplayer = GetTeamMember(i);
		PlayerIndex = nplayer;
		
		if (GetAccount() ~= strMasterAccount) then
			strMemName = GetName();
			strMemAcc = GetAccount()
			nfact = GetLastFactionNumber();
			local nMemIdx = self:GetMemIndex(strMasterAccount, strMemAcc, strMemName)
			if nMemIdx >= 1 and nMemIdx <= 74 then
				nIsExist = 1;				
			end;
			break
		end;
	end;
	PlayerIndex = oldPlayer;
	if (nIsExist == 1) then		
		CreateTaskSay({format("<dec><npc>Ng��i ch�i <color=yellow>%s<color> hi�n �� c� t�n trong danh s�ch!",strMemName), "K�t th�c ��i tho�i/OnCancel"});
	else
		if (nfact ~= -1) then
			CreateTaskSay({format("<dec><npc>Ng��i x�c nh�n mu�n b�o danh cho <color=yellow>%s<color> kh�ng?",strMemName), format("Ta ��ng �/#tbTHDNBReg:SureReg('%s', '%s', '%s')", strMasterAccount, strMemAcc, strMemName),"K�t th�c ��i tho�i/OnCancel"});
		else
			CreateTaskSay({"<dec><npc>Th�nh vi�n ch� tr�ng kh�ng th� b�o danh tham gia!", "K�t th�c ��i tho�i/OnCancel"});
		end;	
	end;
end

function tbTHDNBReg:SureReg(strMaster, strMemAcc, strMemName)
	local tbCurMemList = self.tbMemList[strMaster]
	tinsert(tbCurMemList, {strMemAcc, strMemName})
	tbLog:PlayerActionLog("DangKyTHDNB", "DangKyThanhVien", strMemAcc, strMemName)
	CreateTaskSay({"<dec><npc>��ng k� th�nh c�ng.", "K�t th�c ��i tho�i/OnCancel"});
	self:WriteMemList(strMaster)
end

function tbTHDNBReg:WriteMemList(strMaster)
	local tbTemp = {}	
	tinsert(tbTemp, {"Account", "Role Name"})
	tinsert(tbTemp, {strMaster, self.tbMasterName[strMaster]})
	local nCurMemCount = self:GetCurMemCount(strMaster)
	local tbCurMemList = self.tbMemList[strMaster]
	for i = 1, nCurMemCount do
		tinsert(tbTemp, {tbCurMemList[i][1], tbCurMemList[i][2]})
	end
	tbVngLib_File:Table2File(self.strFilePath, format(self.strFileName, strMaster), "w", tbTemp)	
end

function tbTHDNBReg:GetMemIndex(strMaster, strMemAcc, strMemName)	
	local nCurMemCount = self:GetCurMemCount(strMaster)
	local tbCurMemList = self.tbMemList[strMaster]
	for i = 1, nCurMemCount do
		if tbCurMemList[i][1] == strMemAcc and tbCurMemList[i][2] == strMemName then
			return i
		end
	end
	return -1	
end

function tbTHDNBReg:GetCurMemCount(strMaster)
	return getn(self.tbMemList[strMaster])
end

function LoadMemberList()
	for key, val in tbTHDNBReg.tbTongMaster do
		local tb = tbVngLib_File:TableFromFile2("\\vng_data\\130416_baodanh_thdnb13\\memlist_"..key..".txt", {"*w", "*w"})
		if not tb then
			tbTHDNBReg.tbMemList[key] = {}
		else
			for i = 2, getn(tb) do		
				if tb[i][1] and tb[i][2] and tb[i][1] ~= "" and tb[i][2] ~= "" then					
					tinsert(tbTHDNBReg.tbMemList[key], {tb[i][1], tb[i][2]})
				end
			end
		end
	end
end

if tbTHDNBReg:IsActive() == 1 then
	local a = AutoFunctions:Add(LoadMemberList)
end
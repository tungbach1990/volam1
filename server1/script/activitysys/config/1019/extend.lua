Include("\\script\\activitysys\\config\\1019\\head.lua")
Include("\\script\\activitysys\\config\\1019\\variables.lua")
Include("\\script\\activitysys\\config\\1019\\awardlist.lua");
Include("\\script\\activitysys\\config\\1019\\writefile.lua")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("TITLE")

pActivity.nPak = curpack()
pActivity.tbGlobalNumber = {
	["NopVoLam"] = 0,
	["NopTruyenKy"] = 0,
	["NopVoLamTruyenKy"] = 0,	
	["NopLuuDanh"] = 0,
	["NopHungBinh"] = 0,
	["NopHungBinhLuuDanh"] = 0,
}

--Ghi file t�ch l�y b�o r��ng
function pActivity:Write_File(tbSubcribers)
	local tbTemp = {}
	local szNameFile = format("tichluy%s.txt",GetLocalDate("%Y%W"));
	tinsert(tbTemp, {"Name", "Account","Count"})
	for key, val in tbSubcribers do
		tinsert(tbTemp, {key, val[1], val[2]})
	end
	tbVngLib_File:Table2File("vng_data/truytimbaovat/",szNameFile, "w", tbTemp)	
	return 1
end

function pActivity:Tichluy(TASK_BAORUONG, nCount)
	if nCount < 1 then	return  end
	local szName = GetName()
	local szAccount = GetAccount()
	local nNumber = 0
	self.tbAccumulate = self.tbAccumulate or {}
	if self.tbAccumulate and self.tbAccumulate[szName] then
		nNumber = tonumber(self.tbAccumulate[szName][2]) or 0
	end	
	self:SetWeeklyCount(TASK_BAORUONG,nCount)
	self.tbAccumulate[szName] = {szAccount,nNumber + nCount}
	self:Write_File(self.tbAccumulate)
	Msg2Player("Ch�c m�ng ��i hi�p t�ch l�y th�nh c�ng <color=green>" ..nCount.." <color>b�o r��ng")
	%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "BaoRuong","TS"..ST_GetTransLifeCount(),format("SoluongBaoRuong:%d",nCount))
end


function pActivity:NopBoChu(szNameBo,szGlobalName, nCount)
	if nCount < 1 then	return  end
	for i=1, nCount do
		self.tbGlobalNumber[szGlobalName] = self.tbGlobalNumber[szGlobalName]  + 1
		if szGlobalName ~= "NopHungBinhLuuDanh" and self.tbGlobalNumber[szGlobalName] < %tbGlobalName_A[szGlobalName]["LIMIT"] then
			tbAwardTemplet:Give(%tbGlobalName_A[szGlobalName]["AWARD"], 1, {%EVENT_LOG_TITLE, szGlobalName.."HoanThanh"})
		end
	
		if szGlobalName == "NopHungBinhLuuDanh" and self.tbGlobalNumber[szGlobalName] < %tbGlobalName_A[szGlobalName]["LIMIT"] then
			tbVNG_BitTask_Lib:addTask(%TASK_DH_HBLD, 1)
			DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\1019\\addtitle.lua",  "tbTittle_Hungbinh_Luudanh:Add_Tittle")
			%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "NhanDanhHieu","TS"..ST_GetTransLifeCount(),"NhanDanhHieu")
		end
		
		if szGlobalName == "NopHungBinhLuuDanh" or szGlobalName == "NopVoLamTruyenKy" then
				local TaskId = %tbGlobalName_A[szGlobalName]["TASKID"]
				if TaskId and tbVNG_BitTask_Lib:getBitTask(TaskId) ~= 1 then
					self:RegisterAward(TaskId)
				end
				self:RegisterTop(szGlobalName,i)
		end
	end
	Msg2Player("Ch�c m�ng ��i hi�p n�p th�nh c�ng b� 2 ch� <color=yellow>"..szNameBo.."<color>")
	--Msg2Player("Ch�c m�ng ��i hi�p n�p th�nh c�ng b� 2 ch� <color=yellow>"..szNameBo.."<color>, hi�n t�i tr�n server �� n�p <color=yellow>"..self.tbGlobalNumber[szGlobalName].."<color>")
	%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, szGlobalName,"TS"..ST_GetTransLifeCount(),format("Soluong%s:%d",szGlobalName,nCount))
end
--Ki�m tra gi�i h�n nh�n ph�n th��ng c�a b� ch� V� L�m Truy�n K� - H�ng Binh L�u Danh
function pActivity:CheckAwardLimit()
	if tbVNG_BitTask_Lib:getBitTask(%TASK_VLTK_HBLD) == 1 then
		Talk(1, "", "Trong su�t th�i gian di�n ra s� ki�n, ch� �u�c nh�n 1 l�n duy nh�t n�u n�p �� 2 b� ch�.")
		return nil
	end
	if tbVNG_BitTask_Lib:getBitTask(%TASK_HBLD) == 1 and tbVNG_BitTask_Lib:getBitTask(%TASK_VLTK) == 1 then
		return 1
	end
	Talk(1, "", "��i hi�p ch�a n�p �� hai b� ch� V� l�m truy�n k� v� H�ng Binh L�u Danh.")
	return nil
end

--Ghi l�i th�i gian n�p 1 trong 2 b� ch� V� L�m Truy�n K� - H�ng Binh L�u Danh
function pActivity:RegisterAward(nTask)
	local szName = GetName()
	local szAccount = GetAccount()
	local stDate = GetLocalDate("%Y-%m-%d")
	local	strTime = GetLocalDate("%H:%M:%S")
	if tbVNG_BitTask_Lib:getBitTask(nTask) ~= 1 then
		tbVNG_BitTask_Lib:setBitTask(nTask, 1)
	end
	if tbVNG_BitTask_Lib:getBitTask(%TASK_HBLD) == 1 and tbVNG_BitTask_Lib:getBitTask(%TASK_VLTK) == 1 then
		if not %tbWriteFile.tbSubcribers then
			 %tbWriteFile:Init()
		end
		%tbWriteFile.tbSubcribers[szName] = {szAccount, stDate,strTime}	
		if %tbWriteFile:Subcribers2File() == 1 then
			print("ghi file thanh cong")
		end
	end
end

--Ghi l�i s� l��ng n�p ch� c�i c�a to�n server
function pActivity:Global2File()
	local tbTemp = {}
	tinsert(tbTemp, %tbWriteFile.tbGlobalHeader)
	tinsert(tbTemp, {"GhepChu",self.tbGlobalNumber["NopVoLam"],self.tbGlobalNumber["NopTruyenKy"],self.tbGlobalNumber["NopVoLamTruyenKy"],self.tbGlobalNumber["NopHungBinh"],self.tbGlobalNumber["NopLuuDanh"],self.tbGlobalNumber["NopHungBinhLuuDanh"]})
	tbVngLib_File:Table2File(%tbWriteFile.strFilePath, %tbWriteFile.strGlobalFileName, "w", tbTemp)	
	return 1
end

function pActivity:Load_Server()
	local szPosPath = "\\vng_data\\truytimbaovat\\globals.txt"
	self.tbGlobalNumber = self.tbGlobalNumber or {}
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		return
	end
	self.tbGlobalNumber["NopVoLam"] = tonumber(TabFile_GetCell(szPosPath, 2, 2)) or 0
	self.tbGlobalNumber["NopTruyenKy"] = tonumber(TabFile_GetCell(szPosPath, 2, 3)) or 0
	self.tbGlobalNumber["NopVoLamTruyenKy"] = tonumber(TabFile_GetCell(szPosPath, 2,4)) or 0
	self.tbGlobalNumber["NopHungBinh"] = tonumber(TabFile_GetCell(szPosPath, 2, 5)) or 0
	self.tbGlobalNumber["NopLuuDanh"] = tonumber(TabFile_GetCell(szPosPath, 2, 6)) or 0
	self.tbGlobalNumber["NopHungBinhLuuDanh"] = tonumber(TabFile_GetCell(szPosPath, 2,7)) or 0
end

--S3 s� g�i v� load file t�ch l�y tu�n tr��c
function pActivity:LoadAccumulatepr()
	self.tbAccumulate = {}
	self.tbAccumulatepr  = self:Table_Sort(%tbWriteFile:Load_Xephang(1) or {})
end

--Load c�c d� li�u c�a c�c ch� c�i
function pActivity:StartServer()
		%tbWriteFile:LoadFile()
		--Load x�p h�ng r��ng c�a tu�n tr��c
		--self.tbAccumulatepr = %tbWriteFile:Load_Xephang(1) or {}
		self.tbAccumulatepr  = self:Table_Sort(%tbWriteFile:Load_Xephang(1) or {})
		--Load x�p h�ng r��ng c�a tu�n hi�n t�i
		self.tbAccumulate = %tbWriteFile:Load_Xephang(0) or {}
		--Load so l��ng n�p ch� c�i
		self:Load_Server()
end

--��ng k� top 10 nh�n v�t n�p �� b� 4 b� ch� ��u ti�n
function pActivity:RegisterTop(szNameCharacter,nCount)
	local szName = GetName()
	local szAccount = GetAccount()
	local stDate = GetLocalDate("%Y-%m-%d")
	local	strTime = GetLocalDate("%H:%M:%S")
	local nNumber = 0
	local tbTop10 = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\files_lib.lua",  "tbVngLib_File:TableFromFile", %tbWriteFile.strFilePath, "nametop.txt", {"*w", "*w", "*w","*w","*w","*n"})
	tbTop10 = tbTop10 or {}
	for i = 1, getn(tbTop10) do
		if tbTop10[i][5]	== szNameCharacter then
			nNumber = nNumber + 1
		end
	end
 	if nNumber > 10 then
 		return
 	end
	local tbSubcriber = {}
	tinsert(tbSubcriber,szName)
	tinsert(tbSubcriber,szAccount)
	tinsert(tbSubcriber,stDate)
	tinsert(tbSubcriber,strTime)
	tinsert(tbSubcriber,szNameCharacter)
	tinsert(tbSubcriber,nCount)
	tinsert(tbTop10,tbSubcriber)
	if (self:Subcribers2File(tbTop10,szNameCharacter) ~= 1) then 
		return
	end
end

function pActivity:Subcribers2File(tbSubcriber,szNameCharacter)
	local tbTemp = {}
	local nCount = 0
	local nNumber = 0
	for i = 1, getn(tbSubcriber) do
		if tbSubcriber[i][5]	== szNameCharacter then
			nNumber = nNumber + 1
		end
	end
 	if nNumber > 10 then
 		return
 	end
 	nCount = getn(tbSubcriber)
 	tinsert(tbTemp, {"Name", "Account","Date","Time","TheWorld", "Count"})
	for i =1 , nCount do
		tinsert(tbTemp, tbSubcriber[i])
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\files_lib.lua",  "tbVngLib_File:Table2File", %tbWriteFile.strFilePath,"nametop.txt","w", tbTemp)
	return 1
end

function pActivity:ShowTop(szNameBoChu,szNameChu)
	local szfile = "\\vng_data\\truytimbaovat\\nametop.txt";
	local nLineCount = 0
	TabFile_UnLoad(szfile)
	if (TabFile_Load(szfile, szfile) == 0) then
		CreateNewSayEx("Hi�n t�i ch�a c� ��i hi�p n�o n�p �� b� ch�",{{"��ng",OnCancel}})
		return
	end
	nLineCount = TabFile_GetRowCount(szfile)
	if not nLineCount or nLineCount < 2 then
		CreateNewSayEx("Hi�n t�i ch�a c� ��i hi�p n�o n�p �� b� ch�",{{"��ng",OnCancel}})
		return
	end
	local strTittle = format("10 Cao th� �� n�p �� B� 4 ch� <color=red>%s<color>\n%-16s%-12s%-12s\n",szNameBoChu," Nh�n V�t","Ng�y","Th�i gian")
	for i = 2, nLineCount do
		local TopName = TabFile_GetCell(szfile, i, "TheWorld") or ""
		if szNameChu == TopName then
			strTittle = strTittle..format("<color=yellow>%-16s%-12s%-12s\n<color>",TabFile_GetCell(szfile, i,"Name"), TabFile_GetCell(szfile, i,"Date"),TabFile_GetCell(szfile, i, "Time"))
		end	
	end
	CreateNewSayEx(strTittle,{{"��ng",OnCancel}})
end

function pActivity:Show_VLTK_HBLD()
	local szfile = "\\vng_data\\truytimbaovat\\subcribers.txt";
	local nLineCount = 0
	TabFile_UnLoad(szfile)
	if (TabFile_Load(szfile, szfile) == 0) then
		CreateNewSayEx("Hi�n t�i ch�a c� ��i hi�p n�o n�p �� b� ch�",{{"��ng",OnCancel}})
		return
	end
	nLineCount = TabFile_GetRowCount(szfile)
	if not nLineCount or nLineCount < 2 then
		CreateNewSayEx("Hi�n t�i ch�a c� ��i hi�p n�o n�p �� b� ch�",{{"��ng",OnCancel}})
		return
	end
	local strTittle = format("10 Cao th� �� n�p �� 2 B� ch� <color=red>%s<color>\n%-16s%-12s%-12s\n","V� L�m Truy�n K� - H�ng Binh L�u Danh"," Nh�n V�t","Ng�y","Th�i gian")
	if nLineCount > 10 then
		nLineCount = 10
	end
	for i = 2, nLineCount do
		strTittle = strTittle..format("<color=yellow>%-16s%-12s%-12s\n<color>",TabFile_GetCell(szfile, i,"Name"), TabFile_GetCell(szfile, i,"Date"),TabFile_GetCell(szfile, i,"Hour"))
	end
	CreateNewSayEx(strTittle,{{"��ng",OnCancel}})
end

function pActivity:ReadFile_BaoRuong(szPath, szNameFile, tbSettingControl, nCount)
	local szName = GetName()
	local szAccount = GetAccount()
	local tb = DynamicExecuteByPlayer(PlayerIndex,"\\script\\vng_lib\\files_lib.lua","tbVngLib_File:TableFromFile",szPath,szNameFile, tbSettingControl)
	tb = tb or {}
	local tbSubcriber = {}
	tinsert(tbSubcriber,szName)
	tinsert(tbSubcriber,szAccount)
	tinsert(tbSubcriber,nCount)
	tinsert(tb,tbSubcriber)
	return tb
end

function pActivity:SetWeeklyCount(TASK_BAORUONG, nValue)
	local nCount = self:GetWeeklyCount(TASK_BAORUONG)
	SetTask(TASK_BAORUONG, nCount + nValue)
end

function pActivity:GetWeeklyCount(TASK_DATA_BAORUONG)
	local nDate = GetTask(%TASK_RESET_BAORUONG)
	local nCurDate = tonumber(GetLocalDate("%Y%W"))
	if nDate ~= nCurDate then
		SetTask(%TASK_RESET_BAORUONG, nCurDate)
		SetTask(TASK_DATA_BAORUONG, 0)
	end
	return GetTask(TASK_DATA_BAORUONG)
end

function pActivity:Show_BaoRuong(TASK_BAORUONG)
	CreateNewSayEx(format("Hi�n t�i ��i hi�p �� t�ch l�y <color=yellow>%d<color> B�o R��ng",self:GetWeeklyCount(TASK_BAORUONG)),{{"��ng",OnCancel}})
end

function pActivity:Table_Sort(tbAccumulate)
	local tbTemp = {}
	if tbAccumulate == {} then
		return {}
	end
	for key, val in tbAccumulate do
		tinsert(tbTemp,{key,val[1],val[2]})
	end
	sort(tbTemp, function (a, b) return(a[3] > b[3]) end)
	return tbTemp
end

function pActivity:Show_XepHang()
	local strTittle = "Danh s�ch 10 ng��i c� s� l��ng n�p nhi�u nh�t\n"
	strTittle = strTittle..format("%-5s%-17s%-12s\n", "H�ng", "T�n Role", "S� l��ng n�p")	
	local i = 0
	local tbTemp = self:Table_Sort(self.tbAccumulate)
	if not self.tbAccumulate or getn(tbTemp) < 1 then
		CreateNewSayEx("Hi�n t�i ch�a c� b�ng x�p h�ng",{{"��ng",OnCancel}})
		return
	end
	for i=1,getn(tbTemp) do
		if i <= 10 then 
			strTittle = strTittle..format("<color=yellow>%-5s%-17s%-12s<color>\n", i, tbTemp[i][1], tbTemp[i][3])		
		end
	end
	CreateNewSayEx(strTittle,{{"��ng",OnCancel}})
end

function pActivity:Show_XepHangPr()
	local strTittle = "Danh s�ch 10 ng��i c� s� l��ng n�p nhi�u nh�t\n"
	strTittle = strTittle..format("%-5s%-17s%-12s\n", "H�ng", "T�n Role", "S� l��ng n�p")	
	local i = 0
	--local tbTemp = self:Table_Sort(self.tbAccumulatepr)
	local tbTemp = self.tbAccumulatepr
	if not self.tbAccumulatepr or getn(tbTemp) < 1 then
		CreateNewSayEx("Hi�n t�i ch�a c� b�ng x�p h�ng",{{"��ng",OnCancel}})
		return
	end	
	for i=1,getn(tbTemp) do
		if i <= 10 then 
			strTittle = strTittle..format("<color=yellow>%-5s%-17s%-12s<color>\n", i, tbTemp[i][1], tbTemp[i][3])		
		end
	end
	CreateNewSayEx(strTittle,{{"��ng",OnCancel}})
end

--Tr� v� x�p h�ng theo tu�n
function pActivity:GetAwardXephang(szName,tbTemp)
	local tb = {}
	for i=1,getn(tbTemp) do
		if i == 1 then
			tb[tbTemp[i][1]]  = i
		end
		if i >= 2  and i <= 3 then
			tb[tbTemp[i][1]]  = 2
		end
		if i >= 4 and i <= 10 then
			tb[tbTemp[i][1]]  = 3
		end
	end
	if not tb[szName] then
		return 0
	end
	return tb[szName]
end

function pActivity:GetLimitRank(nRank)
	if nRank == 1 then 
		return 2
	end
	if nRank == 2 then 
		return 1
	end
	if nRank == 3 then 
		return 1
	end
	return 0
end

function pActivity:CheckXephang()
	local szName = GetName()
	local szDate = tonumber(GetLocalDate("%w%H%M"))  ----WW--HH--MM
	if szDate < 10005 or  szDate > 12300 then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng. Th�i gian nh�n th��ng t� 00:05 -> 23:00 ng�y th� 2 h�ng tu�n")
		return nil 
	end
	if self:GetAwardXephang(szName,self.tbAccumulatepr) == 0 then
		Talk(1, "", "��i hi�p kh�ng n�m trong danh s�ch h�ng tu�n tr��c")
		return nil
	end
	local nTaskValue = self:GetLimitRank(self:GetAwardXephang(szName,self.tbAccumulatepr))
	if VngTaskWeekly:CheckTaskWeekly(%TASK_AWARD_TUAN,nTaskValue,"",">=") then
		Talk(1, "", "��i hi�p �� nh�n th��ng kh�ng th� nh�n th�m")
		return nil
	end
	return 1
end

function pActivity:VnGiveAwardChu(nRank, nId, nLog,Task_Award)
	local tb = {
			[1] = {szName = "�i�m Kinh Nghi�m", nExp=75e5},
			[2] = {szName = "�i�m Kinh Nghi�m", nExp=7e6},
			[3] = {szName = "�i�m Kinh Nghi�m", nExp=7e6},
	}
	if nRank > 0 and nRank <= 2 then
		tbAwardTemplet:Give(TB_A[nId],1, {%EVENT_LOG_TITLE, nLog})
	end
	tbAwardTemplet:Give(tb[nRank], 1, {%EVENT_LOG_TITLE, nLog.."vaNhanExp"})
	VngTaskWeekly:AddWeeklyCount(Task_Award, 1)
end

--Nh�n th��ng x�p h�ng theo tu�n
function pActivity:NhanThuongXephang()
	local szDate = tonumber(GetLocalDate("%w%H%M"))
	if szDate < %DateStart and  szDate > %DateEnd then
		return
	end
	local szName = GetName()
	local nRank = self:GetAwardXephang(szName,self.tbAccumulatepr)
	if nRank == 3 then
		self:VnGiveAwardChu(nRank,0,"NhanHang4_10",%TASK_AWARD_TUAN)
		return
	end
	local szTitle = "Xin h�y l�a ch�n lo�i ph�n th��ng !"
	local tbOpt = {}
	tinsert(tbOpt,{"Ph�n th��ng ch� V�",self.VnGiveAwardChu,{self,nRank,1,"NhanChuVo",%TASK_AWARD_TUAN}})
	tinsert(tbOpt,{"Ph�n th��ng ch� L�m",self.VnGiveAwardChu,{self,nRank,2,"NhanChuLam",%TASK_AWARD_TUAN}})
	tinsert(tbOpt,{"Ph�n th��ng ch� Truy�n",self.VnGiveAwardChu,{self,nRank,3,"NhanChuTruyen",%TASK_AWARD_TUAN}})
	tinsert(tbOpt,{"Ph�n th��ng ch� Binh",self.VnGiveAwardChu,{self,nRank,4,"NhanChuBinh",%TASK_AWARD_TUAN}})
	tinsert(tbOpt,{"Ph�n th��ng ch� L�u",self.VnGiveAwardChu,{self,nRank,5,"NhanChuL�u",%TASK_AWARD_TUAN}})
	tinsert(tbOpt,{"Ph�n th��ng ch� Danh",self.VnGiveAwardChu,{self,nRank,6,"NhanChuDanh",%TASK_AWARD_TUAN}})
	tinsert(tbOpt, {"R�i kh�i",no})
	CreateNewSayEx(szTitle, tbOpt)
end

--Trong cay thien loc
function pActivity:GetAwardEvent()
	tbAwardTemplet:Give(%ITEM_RUONG_BAOVAT, 1, {%EVENT_LOG_TITLE, "NhanThuongTrongCay"})	
end

--------------------------------Nh�n th��ng �ua top c�a tu�n tr��c---------------------------------------------------
function pActivity:CheckXephangPr()
	local szName = GetName()
	if self:GetAwardXephang(szName,self.tbAccumulatepr) == 0 then
		Talk(1, "", "��i hi�p kh�ng n�m trong danh s�ch h�ng tu�n tr��c")
		return nil
	end
	
	local tbSavepr  = self:Table_Sort(%tbWriteFile:Load_Xephang(1) or {})
	local nTaskValue = self:GetLimitRank(self:GetAwardXephang(szName,tbSavepr))
	if VngTaskWeekly:CheckTaskWeekly(%TASK_AWARD_PREV,nTaskValue,"",">=") then
		Talk(1, "", "��i hi�p �� nh�n th��ng kh�ng th� nh�n th�m")
		return nil
	end
	return 1
end

function pActivity:NhanThuongXephangpr()
	local szName = GetName()
	local tbSavepr  = self:Table_Sort(%tbWriteFile:Load_Xephang(1) or {})
	local nRank = self:GetAwardXephang(szName,tbSavepr)
	if nRank == 3 then
		self:VnGiveAwardChu(nRank,0,"NhanHang4_10",%TASK_AWARD_PREV)
		return
	end
	local szTitle = "Xin h�y l�a ch�n lo�i ph�n th��ng !"
	local tbOpt = {}
	tinsert(tbOpt,{"Ph�n th��ng ch� V�",self.VnGiveAwardChu,{self,nRank,1,"NhanChuVo",%TASK_AWARD_PREV}})
	tinsert(tbOpt,{"Ph�n th��ng ch� L�m",self.VnGiveAwardChu,{self,nRank,2,"NhanChuLam",%TASK_AWARD_PREV}})
	tinsert(tbOpt,{"Ph�n th��ng ch� Truy�n",self.VnGiveAwardChu,{self,nRank,3,"NhanChuTruyen",%TASK_AWARD_PREV}})
	tinsert(tbOpt,{"Ph�n th��ng ch� Binh",self.VnGiveAwardChu,{self,nRank,4,"NhanChuBinh",%TASK_AWARD_PREV}})
	tinsert(tbOpt,{"Ph�n th��ng ch� L�u",self.VnGiveAwardChu,{self,nRank,5,"NhanChuL�u",%TASK_AWARD_PREV}})
	tinsert(tbOpt,{"Ph�n th��ng ch� Danh",self.VnGiveAwardChu,{self,nRank,6,"NhanChuDanh",%TASK_AWARD_PREV}})
	tinsert(tbOpt, {"R�i kh�i",no})
	CreateNewSayEx(szTitle, tbOpt)
end

----------------------------------------------Nh�n th��ng Danh Hi�u H�ng Binh L�u Danh v�i 5 ng��i ��u ti�n-------------------------------------------------
function pActivity:LoadHungBinhLuuDanh()
	local szfile = "\\vng_data\\truytimbaovat\\nametop.txt"
	local nNumber = 1
	local tb = {}
	if (TabFile_Load(szfile, szfile) == 0) then
		CreateNewSayEx("Hi�n t�i ��i hi�p ch�a c� n�p �� b� ch�",{{"��ng",OnCancel}})
		return tb
	end
	local nLineCount = TabFile_GetRowCount(szfile)
	if not nLineCount or nLineCount < 2 then
		CreateNewSayEx("Hi�n t�i ��i hi�p ch�a c� n�p �� b� ch�",{{"��ng",OnCancel}})
		return tb
	end
	for i = 2, nLineCount do
		local TopName = TabFile_GetCell(szfile, i, "TheWorld") or ""
		if "NopHungBinhLuuDanh" == TopName and not tb[TabFile_GetCell(szfile, i,"Name")]  then
			tb[TabFile_GetCell(szfile, i,"Name")] = nNumber
			nNumber = nNumber + 1
		end	
	end
	TabFile_UnLoad(szfile)
	return tb
end

function pActivity:TitleAwardEx()
	local tb = self.LoadHungBinhLuuDanh() or {}
	if tb == {} then
		CreateNewSayEx("Hi�n t�i ��i hi�p ch�a c� n�p �� b� ch�",{{"��ng",OnCancel}})
		return
	end
	if tb[GetName()] and tb[GetName()] <= 5 then
		tbVNG_BitTask_Lib:addTask(%TASK_DH_HBLD, 1)
		DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\1019\\addtitle.lua",  "tbTittle_Hungbinh_Luudanh:Add_Tittle")
		%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "NhanDanhHieu","TS"..ST_GetTransLifeCount(),format("NhanLaiDanhHieuThanhCongDatHang_%d_TrenServer",tb[GetName()]))	
	else
		%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "NhanDanhHieu","TS"..ST_GetTransLifeCount(),"NhanDanhHieuKhongThanhCong")	
	end
end

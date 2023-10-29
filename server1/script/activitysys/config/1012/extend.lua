Include("\\script\\activitysys\\config\\1012\\head.lua");
Include("\\script\\activitysys\\config\\1012\\variables.lua");
Include("\\script\\activitysys\\config\\1012\\awardlist.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\flipcard\\flipcard_gs.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING");
pActivity.nPak = curpack()
pActivity.tbNpc = {}

function pActivity:FlipCardCallBack(nIndex)
	if PlayerFunLib:CheckTaskDaily(%TSKI_BOX_OPEN_NUM,%MAX_USE_LIMIT_BOX,"H�m nay ��i hi�p �� m� 200 � r�i, ng�y mai l�i ti�p t�c nh�.","<") and
	PlayerFunLib:CheckCash(%nConsumeMoney,"Ti�n ��i hi�p mang theo kh�ng �� r�i, mang ti�n ��y �� r�i h�ng ��n.") and
	PlayerFunLib:CheckFreeBagCell(%nBagCell,"H�nh trang c�a c�c h� kh�ng �� � tr�ng, h�y s�p x�p l�i r�i h�y ��n.") then
		local funCallBack = function(nItemIndex)
			local nCount = GetItemStackCount(nItemIndex)
			local nG, nD, nP = GetItemProp(nItemIndex)
			%tbFlipCard:SetItem(%nIndex, {nCount, nG, nD, nP})
		end
		local tbAward = {
			[1]={szName=%BANH_HATSEN.szName, tbProp=%BANH_HATSEN.tbProp, nExpiredTime=%BANH_HATSEN.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[2]={szName=%BANH_HATSEN.szName, tbProp=%BANH_HATSEN.tbProp, nExpiredTime=%BANH_HATSEN.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[3]={szName=%BANH_HATSEN.szName, tbProp=%BANH_HATSEN.tbProp, nExpiredTime=%BANH_HATSEN.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[4]={szName=%BANH_HATSEN.szName, tbProp=%BANH_HATSEN.tbProp, nExpiredTime=%BANH_HATSEN.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[5]={szName=%BANH_HATSEN.szName, tbProp=%BANH_HATSEN.tbProp, nExpiredTime=%BANH_HATSEN.nExpiredTime, nRate = 5, nCount = 10,CallBack=funCallBack},
			[6]={szName=%BANH_DAUXANH.szName, tbProp=%BANH_DAUXANH.tbProp, nExpiredTime=%BANH_DAUXANH.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[7]={szName=%BANH_DAUXANH.szName, tbProp=%BANH_DAUXANH.tbProp, nExpiredTime=%BANH_DAUXANH.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[8]={szName=%BANH_DAUXANH.szName, tbProp=%BANH_DAUXANH.tbProp, nExpiredTime=%BANH_DAUXANH.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[9]={szName=%BANH_DAUXANH.szName, tbProp=%BANH_DAUXANH.tbProp, nExpiredTime=%BANH_DAUXANH.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[10]={szName=%BANH_DAUXANH.szName, tbProp=%BANH_DAUXANH.tbProp, nExpiredTime=%BANH_DAUXANH.nExpiredTime, nRate = 5, nCount = 10,CallBack=funCallBack},
			[11]={szName=%BANH_KHOAIMON.szName, tbProp=%BANH_KHOAIMON.tbProp, nExpiredTime=%BANH_KHOAIMON.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[12]={szName=%BANH_KHOAIMON.szName, tbProp=%BANH_KHOAIMON.tbProp, nExpiredTime=%BANH_KHOAIMON.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[13]={szName=%BANH_KHOAIMON.szName, tbProp=%BANH_KHOAIMON.tbProp, nExpiredTime=%BANH_KHOAIMON.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[14]={szName=%BANH_KHOAIMON.szName, tbProp=%BANH_KHOAIMON.tbProp, nExpiredTime=%BANH_KHOAIMON.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[15]={szName=%BANH_KHOAIMON.szName, tbProp=%BANH_KHOAIMON.tbProp, nExpiredTime=%BANH_KHOAIMON.nExpiredTime, nRate = 6, nCount = 10,CallBack=funCallBack},			
		} 	
		self:OpenBox(tbAward)
	end
end

--N�u quay vao � kh�ng tr�ng th� sao(c� m�t ti�n, c� tinh 1 l�n quay kh�ng)
function pActivity:OpenBox(tbAward)
	PlayerFunLib:AddTaskDaily(%TSKI_BOX_OPEN_NUM,1) -- T�ng th�m 1 l�n m� �
	Pay(%nConsumeMoney)  -- Tr� ti�n khi m� �
	PlayerFunLib:AddExp(%EXP_OPEN_BOX, 1)
	tbAwardTemplet:Give(tbAward, 1, {"TRUNGTHU_2012", "MoOnhanphanthuong"})
	if PlayerFunLib:GetTaskDailyCount(%TSKI_BOX_OPEN_NUM) == %MAX_USE_LIMIT_BOX then 
		Msg2Player(format("H�m nay ��i hi�p �� m� %d �, ng�y mai l�i ��n nh�", %MAX_USE_LIMIT_BOX))
	end
end

function pActivity:OpenUI()
	%tbFlipCard:OpenUI(self.FlipCardCallBack, {self})
end

function pActivity:GetRabbit()
	local szLuaFile = "\\script\\activitysys\\config\\1012\\whiterabbit.lua"
	local x ,y, worldindex = GetPos()
	local nW, nX, nY =GetWorldPos()
	local nNpcIndex = AddNpc(1799, 1, worldindex, x + 5, y + 5, "Th� Tr�ng")
	SetNpcScript(nNpcIndex, szLuaFile)	
	SetNpcTimer(nNpcIndex, 60*18)
	self.tbNpc[nNpcIndex] = GetName()
	%tbLog:PlayerActionLog("TRUNGTHU_2012","ThoTrangXuatHien",  nW, nX, nY)
end

function pActivity:ComposeLimit(nCount)
	local nTaskVal = GetTask(%nTask_ItemScript_KQ)
	if not nTaskVal then
		return nil
	end
	if (nTaskVal + nCount) > %nLimit_LongDen_KQ then
		Msg2Player(format("S� l��ng v��t qu� gi�i h�n, ng��i ch� c� th� t�ng <color=yellow>%d <color>L�ng ��n K�o Qu�n n�a.", %nLimit_LongDen_KQ - nTaskVal))
		return nil
	end
	return 1
end

function pActivity:GiveCompose(nCount)		
	local tbAward = {szName = "�i�m kinh nghi�m", nExp=4e5}
--	local nTaskVal = GetTask(%nTask_ItemScript_KQ)
	--SetTask(%nTask_ItemScript_KQ,nTaskVal + nCount)
	PlayerFunLib:AddTask(%nTask_ItemScript_KQ,nCount)
	for i = 1, nCount do		
		tbzhongqiu:GiveItem2HengE()
		tbAwardTemplet:Give(tbAward, 1, {"TRUNGTHU_2012", "TangLongDenKeoQuan"})
	end
	return 1
end
function pActivity:Use_LongDenRong()
	local nCount = GetTask(%nTask_ItemScript_R)
	local tbAwardDB = %tbTable_B
	if %tbLogTable[nCount] and tbAwardDB then
		tbAwardTemplet:Give(tbAwardDB, 1, {"TRUNGTHU_2012", %tbLogTable[nCount]})
		if %tbTable_A[nCount] then
			tbAwardTemplet:Give(%tbTable_A[nCount], 1, {"TRUNGTHU_2012", format("SuDung%dLanLongDenRong",nCount)})
		end
	elseif mod(nCount,30) == 0 then
		tbAwardTemplet:Give(%tbTable_C, 1, {"TRUNGTHU_2012", "PhanThuongDatMoc30_60_90"})
	else
		tbAwardTemplet:Give(%tbTable_D, 1, {"TRUNGTHU_2012","SuDungLongDenRong"})
	end
end
function pActivity:Log_LongDenBB(nTaskID)
	PlayerFunLib:AddExp(5e5,0,%EVENT_LOG_TITLE,format("SuDung%dLanLongDenBuomBuom",GetTask(nTaskID)))
end
function pActivity:Log_LongDenCT(nTaskID)
	PlayerFunLib:AddExp(1e6,0,%EVENT_LOG_TITLE,format("SuDung%dLanLongDenConTho",GetTask(nTaskID)))
end
function pActivity:Log_LongDenP(nTaskID)
	PlayerFunLib:AddExp(5e6,0,%EVENT_LOG_TITLE,format("SuDung%dLanLongDenPhuong",GetTask(nTaskID)))
end
function pActivity:Log_LongDenR(nTaskID)
	PlayerFunLib:AddExp(6e6,0,%EVENT_LOG_TITLE,format("SuDung%dLanLongDenRong",GetTask(nTaskID)))
end
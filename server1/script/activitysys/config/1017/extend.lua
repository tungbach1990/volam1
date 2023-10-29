Include("\\script\\activitysys\\config\\1017\\head.lua");
Include("\\script\\activitysys\\config\\1017\\variables.lua");
Include("\\script\\activitysys\\config\\1017\\awardlist.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\flipcard\\flipcard_gs.lua")
IncludeLib("SETTING")
pActivity.nPak = curpack()
tbKeyOpenChest = {
		["chiakhoadong"] = {6, 1, 30389,"Ch�a kh�a ��ng"},
		["chiakhoabac"] = {6, 1, 30390,"Ch�a kh�a b�c"},
		["chiakhoangusac"] = {6, 1, 30391,"Ch�a kh�a ng� s�c"},
	}
	
function pActivity:PlayerOnLogin()
	if tbVNG_BitTask_Lib:getBitTask(%TSK_RESET_OLD_TASK) == 0 then
		tbVNG_BitTask_Lib:setBitTask(%TSK_RESET_OLD_TASK, 1)
		tbVNG_BitTask_Lib:setBitTask(%TSK_USE_AWARD1, 0)
		tbVNG_BitTask_Lib:setBitTask(%TSK_USE_AWARD2, 0)
		tbVNG_BitTask_Lib:setBitTask(%TSK_USE_AWARD3, 0)
		SetTask(2981, 0)
	end	
end

function pActivity:FlipCardCallBack(nIndex)
	if PlayerFunLib:CheckTaskDaily(%TSK_FLIPCARD_DAILY_LIMIT,%FLIPCARD_MAX_DAILY,"H�m nay ��i hi�p �� m� 200 � r�i, ng�y mai l�i ti�p t�c nh�.","<") and
	PlayerFunLib:CheckCash(%FLIPCARD_CASH_REQUIRE,"Ti�n ��i hi�p mang theo kh�ng �� r�i, mang ti�n ��y �� r�i h�ng ��n.") and
	PlayerFunLib:CheckFreeBagCell(%FLIPCARD_FREE_BAG_REQUIRE,"H�nh trang c�a c�c h� kh�ng �� � tr�ng, h�y s�p x�p l�i r�i h�y ��n.") then
		local funCallBack = function(nItemIndex)
			local nCount = GetItemStackCount(nItemIndex)
			local nG, nD, nP = GetItemProp(nItemIndex)
			%tbFlipCard:SetItem(%nIndex, {nCount, nG, nD, nP})
		end
		local tbAward = {
			[1]={szName=%ITEM_MATERIAL_3.szName, tbProp=%ITEM_MATERIAL_3.tbProp, nExpiredTime=%ITEM_MATERIAL_3.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[2]={szName=%ITEM_MATERIAL_3.szName, tbProp=%ITEM_MATERIAL_3.tbProp, nExpiredTime=%ITEM_MATERIAL_3.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[3]={szName=%ITEM_MATERIAL_3.szName, tbProp=%ITEM_MATERIAL_3.tbProp, nExpiredTime=%ITEM_MATERIAL_3.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[4]={szName=%ITEM_MATERIAL_3.szName, tbProp=%ITEM_MATERIAL_3.tbProp, nExpiredTime=%ITEM_MATERIAL_3.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},			
			[5]={szName=%ITEM_MATERIAL_3.szName, tbProp=%ITEM_MATERIAL_3.tbProp, nExpiredTime=%ITEM_MATERIAL_3.nExpiredTime, nRate = 5, nCount = 10,CallBack=funCallBack},			
			[6]={szName=%ITEM_MATERIAL_2.szName, tbProp=%ITEM_MATERIAL_2.tbProp, nExpiredTime=%ITEM_MATERIAL_2.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[7]={szName=%ITEM_MATERIAL_2.szName, tbProp=%ITEM_MATERIAL_2.tbProp, nExpiredTime=%ITEM_MATERIAL_2.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[8]={szName=%ITEM_MATERIAL_2.szName, tbProp=%ITEM_MATERIAL_2.tbProp, nExpiredTime=%ITEM_MATERIAL_2.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[9]={szName=%ITEM_MATERIAL_2.szName, tbProp=%ITEM_MATERIAL_2.tbProp, nExpiredTime=%ITEM_MATERIAL_2.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[10]={szName=%ITEM_MATERIAL_2.szName, tbProp=%ITEM_MATERIAL_2.tbProp, nExpiredTime=%ITEM_MATERIAL_2.nExpiredTime, nRate = 5, nCount = 10,CallBack=funCallBack},			
			[11]={szName=%ITEM_AWARD_2.szName, tbProp=%ITEM_AWARD_2.tbProp, nExpiredTime=%ITEM_AWARD_2.nExpiredTime, nRate = 10, nCount = 2,CallBack=funCallBack},
			[12]={szName=%ITEM_AWARD_2.szName, tbProp=%ITEM_AWARD_2.tbProp, nExpiredTime=%ITEM_AWARD_2.nExpiredTime, nRate = 7, nCount = 4,CallBack=funCallBack},
			[13]={szName=%ITEM_AWARD_2.szName, tbProp=%ITEM_AWARD_2.tbProp, nExpiredTime=%ITEM_AWARD_2.nExpiredTime, nRate = 6, nCount = 6,CallBack=funCallBack},
			[14]={szName=%ITEM_AWARD_2.szName, tbProp=%ITEM_AWARD_2.tbProp, nExpiredTime=%ITEM_AWARD_2.nExpiredTime, nRate = 5, nCount = 8,CallBack=funCallBack},
			[15]={szName=%ITEM_AWARD_2.szName, tbProp=%ITEM_AWARD_2.tbProp, nExpiredTime=%ITEM_AWARD_2.nExpiredTime, nRate = 6, nCount = 10,CallBack=funCallBack},			
		} 	
		self:OpenBox(tbAward)
	end
end

--N�u quay vao � kh�ng tr�ng th� sao(c� m�t ti�n, c� tinh 1 l�n quay kh�ng)
function pActivity:OpenBox(tbAward)
	PlayerFunLib:AddTaskDaily(%TSK_FLIPCARD_DAILY_LIMIT,1) -- T�ng th�m 1 l�n m� �
	Pay(%FLIPCARD_CASH_REQUIRE)  -- Tr� ti�n khi m� �
	PlayerFunLib:AddExp(%FLIPCARD_EXP_AWARD, 1)
	tbAwardTemplet:Give(tbAward, 1, {%EVENT_LOG_TITLE, "MoOnhanphanthuong"})
	if PlayerFunLib:GetTaskDailyCount(%TSK_FLIPCARD_DAILY_LIMIT) == %FLIPCARD_MAX_DAILY then 
		Msg2Player(format("H�m nay ��i hi�p �� m� %d �, ng�y mai l�i ��n nh�", %FLIPCARD_MAX_DAILY))
	end
end

function pActivity:OpenUI()
	%tbFlipCard:OpenUI(self.FlipCardCallBack, {self})
end



function pActivity:CheckUseItem(szIndex)
	if not tbKeyOpenChest[szIndex] then return end
	local tbKey = tbKeyOpenChest[szIndex]
	local nCount = CalcItemCount(3, tbKey[1], tbKey[2], tbKey[3], -1) 
	if nCount <= 0 then
		lib:ShowMessage(format("C�n ph�i c� <color=yellow>1 %s<color>", tbKey[4]))
		return nil
	end
	return 1
end

function pActivity:UseItem(szIndex,Task_ID,Exp_Award)
	local tbKey = tbKeyOpenChest[szIndex]
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Msg2Player(format("C�n ph�i c� %s m�i c� th� m� ���c B�o R��ng",tbKey[4]))
		return
	end
	local nCnt_Award3 = tbVNG_BitTask_Lib:getBitTask(Task_ID)
	if (nCnt_Award3 < 0) then return 	end
	%tbVNG_BitTask_Lib:addTask(Task_ID, 1)	
	nCnt_Award3 = nCnt_Award3 + 1;
	tbAwardTemplet:Give(Exp_Award, 1, {%EVENT_LOG_TITLE, format("SuDungLanThu%sNhanExpkhidung_%s",nCnt_Award3,szIndex)});
	if %tbAward_A and %tbAward_A[szIndex] then
		local tbMoc = %tbAward_A["datmocevent"]
		if (mod(nCnt_Award3, 30) == 0) then
				--Nh�n ph�n th��ng ��t m�c 30,60,90
			tbAwardTemplet:Give(%tbAward_A[szIndex][2], 1, {%EVENT_LOG_TITLE, format("SuDung%sChiaKhoaNguSacNhanPhanThuong", nCnt_Award3)})	
		else
			--Nh�n ph�n th��ng bt v�i r��ng ng� s�c
			tbAwardTemplet:Give(%tbAward_A[szIndex][1], 1, {%EVENT_LOG_TITLE, format("SuDung%sChiaKhoaNguSacNhanPhanThuong", nCnt_Award3)})	
		end	
		if tbMoc and tbMoc[nCnt_Award3] then
			tbAwardTemplet:Give(tbMoc[nCnt_Award3], 1, {%EVENT_LOG_TITLE, format("SuDung%sChiaKhoaNguSacNhanPhanThuongDatMoc", nCnt_Award3)})	
		end
	end
end
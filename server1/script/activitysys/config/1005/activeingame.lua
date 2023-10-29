Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\config\\1005\\tongsupport.lua")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")
--Include("\\script\\vng_event\\tanthu\\giveskill60.lua")

tbPVLBActive = {}

function tbPVLBActive:AddDialog(tbDailog)	
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))	
	if nCurDate >= %nSTART_DATE_GET_ITEM and nCurDate < %nEND_DATE_GET_ITEM then		
		--tbDailog:AddOptEntry("Nh�n C�u Ni�n Tr�ng Ph�ng L�nh B�i", tbPVLBActive.main, {tbPVLBActive})
		--tbDailog:AddOptEntry("��i B�t Ni�n L�nh B�i l�y C�u Ni�n Tr�ng Ph�ng L�nh B�i", tbPVLBActive.ExchangeNewCard, {tbPVLBActive})
		--tbDailog:AddOptEntry("Nh�n th��ng C�u Ni�n L�nh B�i d�nh cho nh�n v�t c�", tbPVLBActive.GetExtItem_Dlg, {tbPVLBActive})	
		--tbDailog:AddOptEntry("Nh�n K� N�ng sau Khi Gia Nh�p M�n Ph�i", tbGiveSkill60.main, {tbGiveSkill60})	
			
	end
--	if nCurDate >= %nSTART_DATE and nCurDate < %nEND_DATE then		
--		tbDailog:AddOptEntry("Ph�n th��ng bang h�i ti�p nh�n t�n th�", tbTongSupport.main, {tbTongSupport})
--	end	
end

function tbPVLBActive:main()
	if CalcFreeItemCellCount() < 10 then
		Talk(1, "", "Y�u c�u ph�i c� �t nh�t 10 � tr�ng trong h�nh trang r�i m�i nh�n v�t ph�m.")
		return
	end
	if self:ActiveCondition() ~= 1 then
		return
	end
	if tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME, 1) ~= 1 then
		Talk(1, "", "D� li�u kh�ng c�p nh�t, xin vui l�ng li�n h� ban qu�n tr� �� ���c gi�i quy�t.")
		return
	end
	if tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME) ~= 1 then
		Talk(1, "", "D� li�u kh�ng c�p nh�t, xin vui l�ng li�n h� ban qu�n tr� �� ���c gi�i quy�t.")
		return
	end	
	local tbItem = {szName="C�u Ni�n Tr�ng Ph�ng L�nh B�i",tbProp={6,1,30439,1,0,0},nCount=1,nExpiredTime=129600,nBindState=-2};
	local strActionLog = ""
	if tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_NEW_ACCOUNT) == 1 then
		strActionLog = "NewUserActive"
	elseif tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_OLD_ACCOUNT) == 1 then
		strActionLog = "OldUserActive"
	end	
	tbAwardTemplet:Give(tbItem, 1, {"CuuNienHoiNgoLenhBai", strActionLog})
end
--�i�u ch�nh �i�u ki�n nh�n PVLB tr�n server m�i - Modified By DinhHQ - 20111117
function tbPVLBActive:ActiveCondition()
	local nBitVal1 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_NEW_ACCOUNT) --n�p code t�i kho�n m�i
	local nBitVal2 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_OLD_ACCOUNT)--n�p code t�i kho�n c�
	if nBitVal1 == 0 and nBitVal2 == 0 then
		Talk(1, "", "C�c h� ch�a n�p code kh�ng th� nh�n th��ng, xin h�y ki�m tra l�i!")
		return nil
	end
	local nBitVal3 = tbExtPointLib:GetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME)--�� nh�n th��ng
	if nBitVal3 ~= 0 then
		Talk(1, "", "Xin th� l�i, c�c h� �� nh�n ph�n th��ng n�y r�i.")
		return nil
	end
	
	if GetRoleCreateDate() >= 20130611 then		
		return 1
	end
	local nTranLife = ST_GetTransLifeCount()	
	if nTranLife == 0 or nTranLife == 1 or nTranLife == 2 or nTranLife == 3 then
		return 1
	end
	if nTranLife == 4 and GetLevel() < 190 then
		return 1
	end
	Talk(1, "", "Xin th� l�i, c�c h� kh�ng �� �i�u ki�n tham gia ch��ng tr�nh, h�y gh� th�m trang ch� c�a tr� ch�i �� bi�t th�m th�ng tin.")
end

function tbPVLBActive:ExchangeNewCard()
	if CalcFreeItemCellCount() < 10 then
		Talk(1, "", "Y�u c�u ph�i c� �t nh�t 10 � tr�ng trong h�nh trang r�i m�i nh�n v�t ph�m.")
		return
	end
	if CalcItemCount(3, 6, 1, 30141, -1)  == 0 or ConsumeItem(3, 1, 6, 1, 30141, -1) ~= 1 then
		Talk(1, "", "N�u kh�ng c� B�t Ni�n H�i Ng� L�nh B�i th� ��ng l�m phi�n ta")
		return
	end
	tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_USER_ACTIVE_IN_GAME, 1)
	tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_NEW_ACCOUNT, 0)
	tbExtPointLib:SetBitValue(nEXT_POINT_ID, nEXT_POINT_BIT_OLD_ACCOUNT, 1)
	local tbItem = {szName="C�u Ni�n Tr�ng Ph�ng L�nh B�i",tbProp={6,1,30439,1,0,0},nCount=1,nExpiredTime=129600,nBindState=-2};
	local strActionLog = "OldItem2New"	
	tbAwardTemplet:Give(tbItem, 1, {"CuuNienHoiNgoLenhBai", strActionLog})
end

---Nh�n ch�n phong thu� t�c nghi�p v� Ch�n gi�c kinh v� t�c cho account c�
tbExtendAward = {
	[1] = {
		strTittle = "Ch�n Phong Th�y T�c Nghi�p d�nh cho nh�n v�t t�o tr��c ng�y 9 th�ng 6", 
		tbTSK_Condition = {nTaskID = 3087,nStartBit = 26,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_1_LIMIT, 
		tbAward = {szName="Ch�n Phong Th�y T�c Nghi�p",tbProp={6,1,30440,1,0,0},nCount=1,nExpiredTime=86400},
		strActionLog = "NhanThuongChanPhongThuyTacNghiep",
	},
	[2] = {
		strTittle = "Ch�n Gi�c Kinh T�c V� d�nh cho nh�n v�t t�o tr��c ng�y 9 th�ng 6", 
		tbTSK_Condition = {nTaskID = 3083,nStartBit = 10,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_2_LIMIT, 
		tbAward = {szName="Ch�n Gi�c Kinh T�c V�",tbProp={6,1,30441,1,0,0},nCount=1,nExpiredTime=86400},
		strActionLog = "NhanThuongChanGiacKinhVuTac",
	},
	[3] = {
		strTittle = "Trang b� X�ch L�n cho nh�n v�t c� h�an th�nh nhi�m v� TS 4 c�p 170", 
		tbTSK_Condition = {nTaskID = 3098,nStartBit = 30,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_3_LIMIT, 
		tbAward = {szName = "C�u ni�n tr�ng ph�ng l�nh b�i - X�ch L�n B�o R��ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		strActionLog = "ThuongBoSungRoleCuTS4170",
	},
	[4] = {
		strTittle = "Trang b� X�ch L�n cho nh�n v�t c� h�an th�nh nhi�m v� TS 4 c�p 175", 
		tbTSK_Condition = {nTaskID = 3083,nStartBit = 5,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_4_LIMIT, 
		tbAward = {szName = "C�u ni�n tr�ng ph�ng l�nh b�i - X�ch L�n B�o R��ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		strActionLog = "ThuongBoSungRoleCuTS4175",
	},
	[5] = {
		strTittle = "Trang b� X�ch L�n cho nh�n v�t c� h�an th�nh nhi�m v� TS 4 c�p 180", 
		tbTSK_Condition = {nTaskID = 3083,nStartBit = 10,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_5_LIMIT, 
		tbAward = {szName = "C�u ni�n tr�ng ph�ng l�nh b�i - X�ch L�n B�o R��ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		strActionLog = "ThuongBoSungRoleCuTS4180",
	},
	[6] = {
		strTittle = "Trang b� X�ch L�n cho nh�n v�t c� h�an th�nh nhi�m v� TS 4 c�p 185", 
		tbTSK_Condition = {nTaskID = 3083,nStartBit = 15,nBitCount = 1,nMaxValue = 1}, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_6_LIMIT, 
		tbAward = {szName = "C�u ni�n tr�ng ph�ng l�nh b�i - X�ch L�n B�o R��ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		strActionLog = "ThuongBoSungRoleCuTS4185",
	},
	[7] = {
		strTittle = "Trang b� X�ch L�n cho nh�n v�t c� ��t c�p TS 4 c�p 190", 
		tbTSK_Condition = nil, 
		tbTSK_Limit = tbBITTASK_GET_EXT_ITEM_7_LIMIT, 
		tbAward = {szName = "C�u ni�n tr�ng ph�ng l�nh b�i - X�ch L�n B�o R��ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		strActionLog = "ThuongBoSungRoleCuTS4190",
	},
}

function tbPVLBActive:GetExtItem_Dlg()
	if CalcItemCount(-1, 6, 1, 30439, -1) < 1 then
		Say("C�c h� kh�ng tham gia ch��ng tr�nh C�u Ni�n H�i Ng� L�nh B�i n�n kh�ng th� nh�n th��ng.", 1, "��ng/OnCancel")
		return
	end	
	local tbDlg = {}
	for i = 1, getn(tbExtendAward) do
		tinsert(tbDlg, tbExtendAward[i].strTittle..format("/#tbPVLBActive:GetExtItem(%d)", i))
	end
	tinsert(tbDlg, "��ng/OnCancel")
	Describe("C�c ph�n th��ng n�y ch� d�nh cho nh�n v�t t�o tr��c ng�y 9 th�ng 6 n�m 2013 v� h�an th�nh nhi�m v� � m�c t��ng �ng", getn(tbDlg), tbDlg)
	
end

function tbPVLBActive:GetExtItem(nIndex)
	if CalcItemCount(-1, 6, 1, 30439, -1) < 1 then
		Say("C�c h� kh�ng tham gia ch��ng tr�nh C�u Ni�n H�i Ng� L�nh B�i n�n kh�ng th� nh�n th��ng.", 1, "��ng/OnCancel")
		return
	end
	if CalcFreeItemCellCount() < 2 then
		Say("C�n ch�a 2 � tr�ng trong h�nh trang r�i m�i nh�n th��ng", 1, "��ng/OnCancel")
		return
	end
	local tbTmpDesc = tbExtendAward[nIndex]
	if tbVNG_BitTask_Lib:getBitTask(tbTmpDesc.tbTSK_Limit) == 1 then
		Say("C�c h� �� nh�n ph�n th��ng n�y r�i.", 1, "��ng/OnCancel")
		return
	end
	if nIndex == 7 then
		if ST_GetTransLifeCount() < 4 or (ST_GetTransLifeCount() == 4 and GetLevel() < 190) then
			Say("C�c h� kh�ng �� �i�u ki�n nh�n th��ng", 1, "��ng/OnCancel")
			return
		end
	else
		local tbTSK_Quest = tbTmpDesc.tbTSK_Condition
		if tbVNG_BitTask_Lib:getBitTask(tbTSK_Quest) ~= 1 then
			Say("C�c h� ch�a h�an th�nh nhi�m v� � m�c t��ng �ng.", 1, "��ng/OnCancel")
			return
		end
	end
	if GetRoleCreateDate() > 20130609 then		
		Say("Ch� c� nh�n v�t t�o tr��c ng�y 9 th�ng 6 n�m 2013 m�i ���c ph�p nh�n th��ng.", 1, "��ng/OnCancel")
		return
	end
	if nIndex == 1 or nIndex == 2 then
		nLastTranslifeTime = tonumber(FormatTime2String("%Y%m%d", GetTask(2580)))
		if ST_GetTransLifeCount() < 4 or nLastTranslifeTime < 20130610 then
			Say("Ch� c� nh�n v�t tr�ng sinh 4 sau ng�y10 th�ng 6 n�m 2013 m�i ���c ph�p nh�n th��ng.", 1, "��ng/OnCancel")
			return
		end
	end
	tbVNG_BitTask_Lib:setBitTask(tbTmpDesc.tbTSK_Limit, 1)
	local tbItem = tbTmpDesc.tbAward
	local strActionLog = tbTmpDesc.strActionLog
	tbAwardTemplet:Give(tbItem, 1, {"CuuNienHoiNgoLenhBai", strActionLog})
end

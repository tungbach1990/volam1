-- ============================================

--��n b� gamer Chinh ��
--Created by DinhHQ - 20130107

-- ======================================================
Include("\\script\\vng_event\\20130107_den_bu_chinh_do\\translife_func.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\vng_event\\20130107_den_bu_chinh_do\\items_skills_award.lua")
function tbZhengtuCompensate:AddDialog()
	if not self:IsActive() then
		return
	end
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("Chi�n T�m T�n Gi�", "Nh�n ��n b� Chinh ��", tbZhengtuCompensate.main,{tbZhengtuCompensate})
end

function tbZhengtuCompensate:main()
	if not self:IsActive() then
		Talk(1, "", "Hi�n t�i �� qu� th�i gian nh�n th��ng, xin ��i hi�p th�ng c�m.")
		return
	end	
	local tbTemp = self.tbExtpointList
	if not self:Get_TL_AccType_By_BitTSK() and not tbZhengtuCompensate:Get_ItemSkill_AccType() and tbExtPointLib:GetBitValue(tbTemp[1].nExtPoint, tbTemp[1].nBit) == 0 and tbExtPointLib:GetBitValue(tbTemp[2].nExtPoint, tbTemp[2].nBit) == 0 then
		Talk(1, "", "Xin l�i, c�c h� kh�ng �� �i�u ki�n nh�n th��ng.")
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)	
	tbMainDialog:AddOptEntry("Nh�n ph�n th��ng tr�ng sinh", ZhTCompensate_Translife_Begin, {nil})
	tbMainDialog:AddOptEntry("Nh�n ��ng c�p tr�ng sinh 4", ZhTCompensate_Translife4_GetLevel, {nil})
	tbMainDialog:AddOptEntry("Ki�m tra s� l�n tr�ng sinh", ZhTCompensate_Translife_Check, {nil})
	tbMainDialog:AddOptEntry("Nh�n v�t ph�m v� k� n�ng", tbItemSkillAward.Skill90_SelectSkillMax, {tbItemSkillAward})
	tbMainDialog:AddOptEntry("K�ch ho�t nh�n l�i ph�n th��ng ��n b� trang b�", tbZhengtuCompensate.ReUpdateBitTSKValue, {tbZhengtuCompensate})
	tbMainDialog.szTitleMsg = "Ta ph� tr�ch trao ph�n th��ng ��n b� cho c�c nh�n s� Chinh ��, n�u ng��i th�a �i�u ki�n h�y mau mau nh�n th��ng"
	tbMainDialog:Show()
end

function tbZhengtuCompensate:ReUpdateBitTSKValue()
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTSKGetItem) == 1 then
		Talk(1, "", "Nh�n v�t �� nh�n th��ng r�i.")
		return
	end
	if tbExtPointLib:GetBitValue(self.tbExtpointList[2].nExtPoint, self.tbExtpointList[2].nBit) == 1 then
		self:UpdateBitTSKValue()
		tbLog:PlayerActionLog("DenBuChinhDo", "KichHoatLaiPhanThuongDenBuTrangBi")	
	end
end

if tbZhengtuCompensate:IsActive() then
	tbZhengtuCompensate:AddDialog()
end
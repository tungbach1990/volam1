Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
tbVng_Exchange_HHL = {}
--tbVng_Exchange_HHL.nStartDate = 201109220000
--tbVng_Exchange_HHL.nEndDate = 201110222400

function tbVng_Exchange_HHL:IsActive()
--	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
--	if self.nStartDate and self.nStartDate ~= 0 and self.nStartDate > nCurDate then
--		return nil
--	end
--	if self.nEndDate and self.nEndDate ~= 0 and self.nEndDate <= nCurDate then
--		return nil
--	end
	return 1
end

function tbVng_Exchange_HHL:AddDialog(tbDialog)
	if self:IsActive() ~= 1 then
		return
	end
	tbDialog:AddOptEntry("Ph�c h�i H�nh Hi�p L�nh", tbVng_Exchange_HHL.Recover_Item_UI, {tbVng_Exchange_HHL})
end

function OnCancel() end

function Do_Recover(nCount)
	if GetFightState() ~= 0 then
		return
	end
	local nItemCount = 0	
	for i = 1, nCount do
		local nIdx = GetGiveItemUnit(i)
		local nG, nD, nP = GetItemProp(nIdx)
		if nG ~= 6 or nD ~= 1 or nP ~= 2566 then
			Talk(1, "", "Ta ch� ph�c h�i cho ng��i <color=red>H�nh Hi�p L�nh<color>. V�t ph�m ng��i b� v�o kh�ng ��ng r�i")
			return
		else
			nItemCount = nItemCount + GetItemStackCount(nIdx)			
		end
	end
	if nItemCount <= 0 then
		return
	end
	
	for i = 1, nCount do
		local nIdx = GetGiveItemUnit(i)
		local nRemovedCount = GetItemStackCount(nIdx)
		if IsMyItem(nIdx) ~= 1 or RemoveItemByIndex(nIdx) ~= 1 then
			Talk(1, "", "Thao t�c th�t b�i, m�t m�t s� nguy�n li�u.")
			return
		else
			tbLog:PlayerActionLog("PhucHoiHanhHiepLenh", "XoaHanhHiepLenhCu", "SoLuong: "..nRemovedCount)
		end		
	end
	local tbAward = {szName = "H�nh Hi�p L�nh", tbProp = {6,1,2566,1,0,0}, nCount = nItemCount}
	tbAwardTemplet:Give(tbAward, 1, {"PhucHoiHanhHiepLenh", "NhanHanhHiepLenhMoi"})
end

function tbVng_Exchange_HHL:Recover_Item_UI()
	GiveItemUI("Ph�c h�i H�nh Hi�p L�nh", "Xin b� v�o H�nh Hi�p L�nh", "Do_Recover", "OnCancel")
end

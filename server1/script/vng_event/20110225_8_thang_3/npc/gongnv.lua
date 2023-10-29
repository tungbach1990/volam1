--Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\head.lua")

tbVNGWD2011_GongNV = {}

function tbVNGWD2011_GongNV:addDialog(tbDialog)	
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= 20110321 or now < 20110307) then
		return
	end	
	tbDialog:AddOptEntry("Ho�t ��ng m�ng ng�y Qu�c T� Ph� N�",tbVNGWD2011_GongNV.main,{tbVNGWD2011_GongNV})				
end

function tbVNGWD2011_GongNV:main()	
	local tbMainDialog = tbVNGWD2011_NpcHead:CreateDialog()
	if tbVNG_WomenDay2011:IsActive() == 1 then
		tbMainDialog:AddOptEntry("Gi�i thi�u ho�t ��ng", tbVNGWD2011_GongNV.description, {tbVNGWD2011_GongNV})
		tbMainDialog:AddOptEntry("T�ng B� Hoa H�ng", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "T�ng B� Hoa H�ng"})
		tbMainDialog:AddOptEntry("��i h�t m�u s�c", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "H�p th�nh H�t M�u S�c"})
	end
	tbMainDialog:AddOptEntry("Nh�n ph�n th��ng b� sung", tbVNGWD2011_GongNV.GetExtraAward, {tbVNGWD2011_GongNV})
	tbMainDialog:Show()			
end

function tbVNGWD2011_GongNV:description()	
	local tbDescDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbDescDialog.szTitleMsg = "Th�i gian n�y �ang di�n ra ho�t ��ng m�ng ng�y Qu�c T� Ph� N�. H�y gh� th�m trang ch� c�a tr� ch�i �� bi�t th�m chi ti�t."
	tbDescDialog:AddOptEntry("Tr� l�i", tbVNGWD2011_GongNV.main, {tbVNGWD2011_GongNV})
	tbDescDialog:Show()
end

function tbVNGWD2011_GongNV:GetExtraAward()
	local tbDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbDialog.szTitleMsg = "Xin ch�n ph�n th��ng"
	
	local tbTSK, tbTSK_FLAG = {}
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("Ph�n th��ng trao t�ng 100 B� Hoa H�ng", tbVNGWD2011_GongNV.ExtraRoseAward, {tbVNGWD2011_GongNV, 100})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("Ph�n th��ng trao t�ng 200 B� Hoa H�ng", tbVNGWD2011_GongNV.ExtraRoseAward, {tbVNGWD2011_GongNV, 200})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("Ph�n th��ng s� d�ng 100 H�p qu�", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 100})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("Ph�n th��ng s� d�ng 200 H�p qu�", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 200})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("Ph�n th��ng s� d�ng 300 H�p qu�", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 300})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("Ph�n th��ng s� d�ng 400 H�p qu�", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 400})
	end
	
	tbDialog:AddOptEntry("Tr� l�i", tbVNGWD2011_GongNV.main, {tbVNGWD2011_GongNV})
	tbDialog:Show()
end

function tbVNGWD2011_GongNV:ExtraRoseAward(nRank)
	local tbAward = {}
	local tbTaskInfo = {}
	if nRank == 100 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE_FLAG
		tbAward = {szName = "�i�m Kinh Nghi�m", nExp=20000000}
	elseif nRank == 200 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE_FLAG
		tbAward = {szName = "�i�m Kinh Nghi�m", nExp=40000000}
	end
	tbVNG_BitTask_Lib:setBitTask(tbTaskInfo, 1)
	tbAwardTemplet:GiveAwardByList(tbAward, format("[VNG][8thang3][Ph�n th��ng t�ng %d B� Hoa H�ng]", nRank))
end

function tbVNGWD2011_GongNV:ExtraGiftAward(nRank)
	local tbAward = {}
	local tbTaskInfo = {}
	if nRank == 100 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
		tbAward = {szName = "�i�m Kinh Nghi�m", nExp=25000000}
	elseif nRank == 200 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
		tbAward = {szName = "�i�m Kinh Nghi�m", nExp=50000000}
	elseif nRank == 300 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
		tbAward = {szName = "�i�m Kinh Nghi�m", nExp=75000000}
	elseif nRank == 400 then
		if (CalcFreeItemCellCount() < 2) then
			Talk(1, "", format("�� b�o v� t�i s�n, xin vui l�ng ch�a <color=red>%d<color> � tr�ng trong h�nh trang r�i m�i nh�n th��ng!", 2))
			return
		end
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
		tbAward = 
			{
				{szName="Ng� H�nh �n (C��ng h�a)",tbProp={0,3209},nCount=1,nQuality = 1,nExpiredTime = 43200},
				{szName="Ng� H�nh �n (Nh��c h�a)",tbProp={0,3219},nCount=1,nQuality = 1,nExpiredTime = 43200},
			}
	end
	tbVNG_BitTask_Lib:setBitTask(tbTaskInfo, 1)
	tbAwardTemplet:GiveAwardByList(tbAward, format("[VNG][8thang3][Ph�n th��ng s� d�ng %d H�p Qu�]", nRank))
end

function tbVNGWD2011_GongNV:onCancel()
end
Include("\\vng_script\\activitysys\\config\\1024\\head.lua")
Include("\\vng_script\\activitysys\\config\\1024\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1024\\awardlist.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

function pActivity:HDTP_BK_90_Dialog(nItemIndex)
	local nFaction = self:HDTP_Check_Facion() + 1
	if not nFaction then
		return 
	end
	local szTitle = format("<color=yellow>- M�n ph�i n�o th� s� ���c ch�n b� k�p c�a m�n ph�i ��. H�y ch�n cho ��ng lo�i b� k�p m�nh c�n.\n")
	local tbBranchFac = %tbAward_BiKip_90_HDLB[nFaction]
	local tbOpt = {}	
	for i=1, getn(tbBranchFac) do		
		tinsert(tbOpt,  format("%s/#pActivity:HDTP_Nhan_BK_90(%d,%d,%d)",tbBranchFac[i].szName,nItemIndex, nFaction, i)	)		
	end	
	if getn(tbOpt) > 0 then
		tinsert(tbOpt,  "�� ta suy t�nh.../Cancel")	
		Say(szTitle, getn(tbOpt), tbOpt)		
	end
	return 
end
function pActivity:HDTP_Nhan_BK_90(nItemIndex, nBranch, nID)
	if IsMyItem(nItemIndex) ~=1 then
		return
	end
	tbAwardTemplet:Give(%tbAward_BiKip_90_HDLB[nBranch][nID], 1, {EVENT_LOG_TITLE,"NhanBK90Thanhcong"})
	RemoveItemByIndex(nItemIndex)
end

function pActivity:HDTP_Check_Facion()
	local nFaction = GetLastFactionNumber()	
	if nFaction < 0 then
		Talk(1,"","H�y gia nh�p m�n ph�i tr��c.")
		return 
	end
	return nFaction
end


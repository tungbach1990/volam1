Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\vng_script\\features\\doi_diem_vinhdu\\head.lua")


function tbVngDoiDiemVD:main()
	local nPointWlls = GetTask(%TASK_WLLS_TASKID_HONOUR)		
	local szMsg = format("<npc>Ch� cao th� <color=yellow>V� L�m Li�u ��u<color> m�i c� th� s� h�u ���c nh�ng trang b� c�c hi�m c� m�t kh�ng hai.\nNg��i hi�n t�i �ang c� <color=yellow>%d �i�m vinh d�<color> c� mu�n ��i th��ng kh�ng?\n\n",nPointWlls)
	
	local tbOpt = {}		
	tinsert(tbOpt, {format("��i ph�n th��ng li�n ��u"), self.Open_Sell_Wlls, {self}})	
	tinsert(tbOpt, {format("��i V� Danh Ch� Ho�n"), self.Give_UI, {self,141}})
	tinsert(tbOpt, {format("��i V� Danh Gi�i Ch�"), self.Give_UI, {self,142}})
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end

function tbVngDoiDiemVD:Open_Sell_Wlls()
	if (GetBoxLockState() == 0) then
		Sale(146,11) -- Shop id 11 ban bang diem tinh luc
	else
		Talk(1,"","H�y m� kh�a r��ng tr��c ��.")
		return
	end
end

function tbVngDoiDiemVD:Give_UI(nIDRing)
	local strDesc = "Vui l�ng b� 4 vi�n V� Danh H�n Th�ch v�o."	
	if nIDRing == 141 then		
		g_GiveItemUI("��i V� Danh Ch� Ho�n", strDesc, {self.DoiVoDanh, {self,nIDRing}}, nil, 1)
	else
		g_GiveItemUI("��i V� Danh Gi�i Ch�", strDesc, {self.DoiVoDanh, {self,nIDRing}}, nil, 1)
	end
end

function tbVngDoiDiemVD:DoiVoDanh(nIDRing,nCount)
	if (nCount ~= 4) then 
		Talk(1, "", "M�i l�n ch� ���c b� <color=yellow>4 vi�n V� Danh H�n Th�ch<color>.")
		return
	end
	local nNumStone = self:CheckMaterial_Stone(nCount)
	if nNumStone < 4 then
		return Talk(1,"",format("��i V� Danh Ch� Ho�n c�n <color=yellow>4 vi�n V� Danh H�n Th�ch<color>, h�y ki�m cho ��."))
	end
	--kiem tra diem lien dau
	local nCurPoint = GetTask(%TASK_WLLS_TASKID_HONOUR)
	if nCurPoint < %NEED_POINT_WLLS then
		return Talk(1,"",format("��i V� Danh Ch� Ho�n c�n <color=yellow>%d �i�m vinh d�<color>.",%NEED_POINT_WLLS))
	end
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		if IsMyItem(nItemIndex) ~= 1 then
			return
		end
		local szGDP = format("%d,%d,%d", GetItemProp(nItemIndex))
		local nQuality = GetItemQuality(nItemIndex)
		if nQuality == 0 and %szGDP_ITEM_VODANH_STONE == szGDP then
			RemoveItemByIndex(nItemIndex)
			tbLog:PlayerActionLog(KEY_LOG, "[TruNguyenLieu]_"..GetItemName(nItemIndex))
		end
	end
	local nLastPoint = nCurPoint - %NEED_POINT_WLLS 
	SetTask(%TASK_WLLS_TASKID_HONOUR,nLastPoint)
	tbLog:PlayerActionLog(KEY_LOG, format("[TruDiemLienDau]_DiemHienTai: %d _ DiemConLai: %d ",nCurPoint,nLastPoint))
	tbAwardTemplet:Give(self.tbItemVoDanhRing[nIDRing],1,{KEY_LOG,"DoiVoDanhID_"..nIDRing})	
	local szEquipName = self.tbItemVoDanhRing[nIDRing].szName	
	local szNew = format("Ch�c m�ng ��i hi�p <color=yellow>%s<color> �� ��i ���c <color=yellow>%s<color>. T� n�y nh� h� m�c th�m c�nh, tung ho�nh gian h�",GetName(),szEquipName)
	Talk(1,"",szNew)
	AddGlobalNews(szNew)
	AddGlobalNews(szNew)
end

function tbVngDoiDiemVD:CheckMaterial_Stone(nCount)
	local nNumStone = 0
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		if IsMyItem(nItemIndex) ~= 1 then
			return 0
		end
		if IsItemStackable(nItemIndex) == 1 then			
			return 0
		end
		local szGDP = format("%d,%d,%d", GetItemProp(nItemIndex))		
		local nQuality = GetItemQuality(nItemIndex)	
		if nQuality == 0 and %szGDP_ITEM_VODANH_STONE == szGDP then
			nNumStone = nNumStone + 1			
		end
	end
	return nNumStone 
end

EventSys:GetType("AddNpcOption"):Reg("S� gi� trao th��ng li�n ��u","Ta mu�n l�nh th��ng �i�m li�n ��u", tbVngDoiDiemVD.main,{tbVngDoiDiemVD})



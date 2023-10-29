Include("\\vng_script\\activitysys\\config\\1021\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1021\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1021\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

pActivity.nPak = curpack()

local _GetHorse = function(nID)
	if not nID then
		return
	end	
	if (GetCash() < MONEY_PHIVAN) then 
		Talk(1, "", "H�nh nh� ng��i kh�ng mang �� 2000 v�n l��ng!")
		return 
	end	
	
	--ty le thanh cong khi thuan hoa ngua 25%
	local nRand = random(1,100)
	if nRand <= 75 then
		if Pay(MONEY_PHIVAN) ~= 1 then
			tbLog:PlayerActionLog(EVENT_LOG_TITLE,"ThuanHoaPhiVan_TruTien_ThatBai1")
			return Talk(1,"","Thu�n h�a ng�a th�t b�i, kh�ng th� tr� ph� thu�n h�a ng�a.")
		end
		tbLog:PlayerActionLog(EVENT_LOG_TITLE,"ThuanHoaPhiVanThatBai")
		return Talk(1,"","Thu�n h�a ng�a th�t b�i, ta tr� l�i v�t d�ng ch� l�y ti�n ph� l�n n�y.")		 	
	end
	
	if (pActivity:CheckItemListInBag(tbITEM_PHIVAN, "Kh�ng �� nguy�n li�u thu�n h�a Phi V�n.") ~= 1) then 		
		return 
	end
	
	if (pActivity:ConsumeEquiproomItemList(tbITEM_PHIVAN)	) ~= 1 then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE,"ThuanHoaPhiVan_NguyenLieu_ThatBai")
		return Talk(1,"","Thu�n h�a ng�a th�t b�i, kh�ng th� tr� nguy�n li�u.")
	end
	
	if Pay(MONEY_PHIVAN) ~= 1 then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE,"ThuanHoaPhiVan_TruTien_ThatBai2")
		return Talk(1,"","Thu�n h�a ng�a th�t b�i, kh�ng th� tr� ph� thu�n h�a ng�a.")
	end	
	tbAwardTemplet:Give(%tbHorseAward[nID], 1, {EVENT_LOG_TITLE,"ThuanHoaPhiVanThanhCong"})
	AddGlobalNews(format("��i hi�p <color=yellow>%s<color> �� thu�n h�a ���c Phi V�n th�n m�. T� nay s� nh� h� m�c th�m c�nh, tung ho�nh giang h�.",GetName()))
end

local _OnBreak = function()
	Msg2Player("Thu�n h�a ng�a th�t b�i, h�y c� g�ng th� l�i l�n n�a.")
end

function pActivity:ComposeHorse(nID)
	local szTitle = format("<color=yellow>\n\n- Thu�n h�a ng�a kh�ng ph�i mu�n l� ���c, c�n ph�i ki�n nh�n. Ng��i l�m ���c kh�ng?")
	if nID == 1 then
		szTitle = szTitle.." \nThu�n h�a Phi V�n th�n m� h�y t�m ���c c�c v�t d�ng sau: <color>\n	- 2 C� T��i. 2 B�y Ng�a. 2 D�y Th�ng. 2 Y�n C��ng. 2 Roi Ng�a.\n	- 2000 v�n l��ng b�c\n\n\n"
	end		
	local tbOpt = {}	
	tinsert(tbOpt,  format("B�t ��u thu�n h�a Phi v�n/#pActivity:ProgressHorse(%d)",nID)	)		
	tinsert(tbOpt,  "Ta s� th� sau.../Cancel")
	Say(szTitle, getn(tbOpt), tbOpt)	
	--CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:ProgressHorse(nID)
	if (pActivity:CheckItemListInBag(tbITEM_PHIVAN, "Kh�ng �� nguy�n li�u thu�n h�a Phi V�n.") ~= 1) then 		
		return
	end
	if (GetCash() < MONEY_PHIVAN) then 
		Talk(1, "", "H�nh nh� ng��i kh�ng mang �� 2000 v�n l��ng!")
		return 
	end	
	tbProgressBar:OpenByConfig(17, %_GetHorse, {nID}, %_OnBreak)
end

function pActivity:ConsumeEquiproomItemList(tbItemList)
	if not tbItemList then
		return
	end
	for i=1, getn(tbItemList) do
		local tbItem = tbItemList[i]
		local tbProp = tbItem.tbProp
	
		tbItem.nCount = tbItem.nCount or 1
		
		ConsumeEquiproomItem(tbItem.nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	end
	return 1
end

function pActivity:CheckItemListInBag(tbItemList, szFailMsg)	
	if not tbItemList then
		return
	end
	for i=1, getn(tbItemList) do
		local tbItem = tbItemList[i]
		local tbProp = tbItem.tbProp
	
		tbItem.nCount = tbItem.nCount or 1
		if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < tbItem.nCount then
			lib:ShowMessage(szFailMsg)
			return nil
		end
	end
	return 1
end


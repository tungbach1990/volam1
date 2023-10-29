Include("\\vng_script\\activitysys\\config\\1026\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1026\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1026\\awardlist.lua")
Include("\\vng_script\\activitysys\\config\\1026\\sale_item_event.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
Include("\\vng_script\\activitysys\\config\\1026\\write_award_daily.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\log.lua")

pActivity.nPak = curpack()

function pActivity:CheckSaleDate()
	--da mo ban vinh vien
	return 1
end

function pActivity:SaleDialog()
	--tam thoi chua ban trang bi quy hiem, khi nao ban thi mo lai
	do 
		return Talk(1,"","Ta �ang truy t�m m�t s� trang b� ho�ng kim, nh�ng ch� ���c m�t �t th�ng tin v� ch�ng...")
	end
	
	local szTitle = format("<color=green>\n\n- Ta m�i s�u t�m ���c m�t s� trang b� hi�m, ng��i c� mu�n s� h�u kh�ng?<color>")
	local nNowDate = tonumber(GetLocalDate("%d"))

	local szEquipName = ""
	local nNeedMaterial = 0
	local nIDSale = 0
	for i=1, getn(TB_SALE_EQUIP_DATE) do
		for k,v in TB_SALE_EQUIP_DATE[i] do				
			if 	k == nNowDate then
				szEquipName = v.szName
				nNeedMaterial = v.nNeedMaterial
				nIDSale = i				
				break
			end
			print("SaleDialog i: "..i)
		end
	end
	if nNeedMaterial == 0 or  nIDSale == 0 then
		print("-----------SaleDialog Loi khong thay lich ban hang") 
		return
	end
	local szState = format("<color=cyan>(c�n h�ng)<color>")
	if tbListSaleDaily:CheckCanSaleOutItem(nIDSale,nNowDate) == 0 then
		szState =format("<color=red>(h�t h�ng)<color>")
	end
	szTitle = szTitle..format(" \nNg�y h�m nay ch� ta ch� c�: <color=yellow>\n	- %s %s <color> .\n\n- Mu�n s� h�u trang b� n�y, ng��i c�n ��a cho ta  <color=yellow>%d<color> Ng�c L�c B�o.",szEquipName,szState,nNeedMaterial)
	local szNote = "\n<color=yellow>L�u �<color>: <color=red>Ai ��ng � trao ��i v�i ta tr��c th� ng��i �� s� h�u tr��c<color>.\n\n\n"
	szTitle = szTitle..szNote 
	--12h den 12h30 moi xuat hien dong cho doi
	local nNowHour = tonumber(GetLocalDate("%H%M"))
	if nNowHour >= 1200 and nNowHour <= 1230 then
		CreateTaskSay({"<dec><npc>"..szTitle,format("Ta mu�n s� h�u trang b� n�y/#pActivity:AcceptTradeEquip(%d,%d)",nIDSale,nNowDate),"�� ta suy ngh�../Cancel"})
	else
		CreateTaskSay({"<dec><npc>"..szTitle, "��n gi� ta s� quay l�i./Cancel"})
	end
end

function pActivity:AcceptTradeEquip(nIDSale,nDate)
	local nNowDate = tonumber(GetLocalDate("%d"))
	if nDate ~= nNowDate then
		return Talk(1,"","�� qua ng�y b�n trang b� ng��i xem, h�m nay �� b�n trang b� kh�c r�i, ng��i vui l�ng xem l�i.")
	end
	if tbListSaleDaily:CheckCanSaleOutItem(nIDSale,nNowDate) ~= 1 then
		return Talk(1,"","H�m nay th�t l� ��t h�ng! ta kh�ng c�n g� �� trao ��i, ng�y mai h�y quay l�i nh�.")
	end
	if self:CheckSaleDate() ~= 1 then
		return
	end	
	if not TB_SALE_EQUIP_DATE[nIDSale][nNowDate] then
		print("-----------AcceptTradeEquip Loi khong thay lich ban hang")
		return
	end	
	
	local szEquipName = TB_SALE_EQUIP_DATE[nIDSale][nNowDate].szName
	local nNeedMaterial = TB_SALE_EQUIP_DATE[nIDSale][nNowDate].nNeedMaterial	
	local nTotalQuantity = TB_SALE_EQUIP_DATE[nIDSale][nNowDate].nQuantity	
	local nCurMaterial = GetTask(%TASK_SAVE_SL_NGOCLUCBAO)
	
	local nLastNum = tbListSaleDaily.tbAwardCheck[nIDSale]
	if nLastNum < 0 or nLastNum > nTotalQuantity then
		--print("AcceptTradeEquip nLastNum"..nLastNum)
		--print("AcceptTradeEquip nTotalQuantity"..nTotalQuantity)
		tbLog:PlayerActionLog("AcceptTradeEquip - Loi tong so luong ban ra vuot qua qui dinh: "..nLastNum)
		return Talk(1,"","C� l�i x�y ra, xin vui l�ng li�n h� v�i Ban �i�u h�nh.")
	end
	if nCurMaterial < nNeedMaterial then 
		return Talk(1,"","Hi�n t�i ta ch�a nh�n �� s� Ng�c L�c B�o c�n �� ��i trang b� n�y, h�y n�p �� cho ta tr��c.")
	end
		
	if PlayerFunLib:CheckFreeBagCellWH(2,3,1,"default") ~= 1 then
		return
	end
	--tr� s� l��ng Ng�c l�c b�o trong kh�
	SetTask(%TASK_SAVE_SL_NGOCLUCBAO,nCurMaterial - nNeedMaterial)
	-- ghi s� l��ng �� b�n v�o file
	tbListSaleDaily:SaleOutItem(nIDSale,nDate,1)
	
	tbAwardTemplet:Give(TB_SALE_EQUIP_DATE[nIDSale][nNowDate], 1, {EVENT_LOG_TITLE,"DoiThanhCong"})
	local szNew = format("��i hi�p <color=yellow>%s<color> �� s� h�u ���c <color=yellow>%s<color>. Th�t ��ng ng��ng m�, c�c anh h�ng thi�n h� c�ng th�m ph�n k�nh ph�c...",GetName(),szEquipName)
	AddGlobalNews(szNew)
	AddGlobalNews(szNew)
	Talk(1,"",format(" Ch�c m�ng ��i hi�p ��i th�nh c�ng <color=yellow>%s<color>.\n Hi�n t�i c�n %d Ng�c l�c b�o g�i � Th�m V�n Tam",szEquipName,nCurMaterial - nNeedMaterial))
	return 1
end

--Ky gui NLB tai NPC
function pActivity:CheckSaving_Item()
	local tbProp = %ITEM_NGOCLUCBAO.tbProp
	local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	if nCurCount <= 0  then		
		 return 0
	end
	return nCurCount
end
function pActivity:Add_Num_Saving_Item()
	local nMaxCount  = self:CheckSaving_Item()
	if nMaxCount <= 0 then
		Talk(1,"","Trong ng��i ng��i l�m g� c� Ng�c L�c B�o m� ��i k� g�i � ta.")
		return
	end
	if not nMaxCount or nMaxCount > 500 then
		nMaxCount = 500
	end
	g_AskClientNumberEx(1, nMaxCount, "Nh�p s� l��ng g�i", {self.Saving_Item_NgocLucBao, {self,nCount}} )
end
function pActivity:Saving_Item_NgocLucBao(nCount)		
	if (nCount == 0 or nCount == nil ) then
		nCount = 1
	end
	if nCount > 500   then
		return Talk(1,"","G�i t�i �a 500 c�i 1 l�n th�i.")
	end
	local nCountInBag  = self:CheckSaving_Item()
	if nCount > nCountInBag then
		return Talk(1,"","C�ng c� th� g�i ta l� th��ng bu�n, nh�ng ta kh�ng bao gi� l� gian th��ng. Ng��i kh�ng qua m�t ta ���c ��u ...")
	end
	local nCurPoint = GetTask(%TASK_SAVE_SL_NGOCLUCBAO)
	local nTotal = nCurPoint + nCount
	if nCurPoint < 0 or nTotal > 2*1000*1e6 then
		 return Talk(1,"","Kho c�a ta ch� ch�a c� gi�i h�n, c�c h� th�ng c�m.")
	end
	
	local tbProp = %ITEM_NGOCLUCBAO.tbProp
	if ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
			tbLog:PlayerActionLog("Error Gui NLB - Loi tru khong duoc item sl: "..nCount)
			return
	end
	Talk(1,"",format("C�c h� �� g�i th�nh c�ng <color=yellow>%d<color> Ng�c L�c B�o",nCount))
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"[Gui: ]".."so luong NLB hien tai: "..nCurPoint.."- So luong nop vao: "..nCount)
	SetTask(%TASK_SAVE_SL_NGOCLUCBAO,nTotal)	
	return 1
end

--Rut Ngoc Luc Bao
function pActivity:CheckWithdraw_Item()
	if PlayerFunLib:CheckFreeBagCell(5,"C�n Ph�i c� 5 � tr�ng h�nh trang") ~= 1 then
		return
	end
	local nValue = ONE_WITHDRAW 
	local nCurPoint = GetTask(%TASK_SAVE_SL_NGOCLUCBAO)
	if  nCurPoint <= TAX then
		 return Talk(1,"","C�c h� g�i kh�ng �� s� l��ng �� r�t. T�i thi�u 1 l�n r�t trong kho ph�i c� 6 c�i Ng�c L�c B�o.")
	elseif nCurPoint < ONE_WITHDRAW + TAX then 
		nValue =  nCurPoint -TAX
	end
		
	SetTask(%TASK_SAVE_SL_NGOCLUCBAO,nCurPoint - (nValue + TAX) )
	tbAwardTemplet:Give(ITEM_NGOCLUCBAO, nValue, {EVENT_LOG_TITLE,format("RutThanhCong %d NLB",nValue)})
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"[Rut: ]".."So NLB hien tai:"..nCurPoint.."- So luong NLB bi tru + thue: ".. (nValue + TAX))
	Talk(1,"",format("C�c h� �� r�t th�nh c�ng <color=yellow>%d<color> Ng�c L�c B�o",nValue)	)
end

--Xem lich danh sach ban hang
function pActivity:ShowPlanSale()
	local szTitle = format("<color=green>\n\n- Ta m�i s�u t�m ���c m�t s� trang b� hi�m, nh�ng m�t s� th� ta ch�a c�m trong tay, d� ki�n s� c�:<color>\n")	
	if not TB_SALE_EQUIP_DATE_DIALOG then
		print("-----------ShowPlanSale Loi khong thay lich ban hang")
		return
	end	
	for i=1,getn(TB_SALE_EQUIP_DATE_DIALOG) do
		local tbInfo = TB_SALE_EQUIP_DATE_DIALOG[i]
		local szDate = tbInfo.nDateSale
		local szEquipName = tbInfo.szName
		local nNeedMaterial = tbInfo.nNeedMaterial	
		szTitle = szTitle..format(" \nNg�y: %s: <color=yellow>%s<color>\n\t\t\t\t\t\t\t\t\t\t\t\t\tC�n: <color=yellow>%d<color> Ng�c L�c B�o.",szDate,szEquipName,nNeedMaterial)
	end	
	CreateTaskSay({"<dec><npc>"..szTitle,"Ta bi�t r�i/Cancel"})
end

---------
function pActivity:SaleItemDailyDialog(nStartIndex)

	local nSize = 5
	local tb1 = TB_SALE_EQUIP_DAILY
	if nStartIndex < 1 or nStartIndex > getn(tb1) then
		return
	end
	local tb2
	local nEndIndex
	local tbOpt = {}
	if nStartIndex +nSize > getn(tb1) then
		nEndIndex = getn(tb1)
	else
		nEndIndex = nStartIndex + nSize
	end
	for i = nStartIndex, nEndIndex do
		tb2 = tb1[i]
		local szEquipName =tb2.szName 
		tinsert(tbOpt , format("%s/#pActivity:AcceptTradeItem(%d)",szEquipName, i))
	end
	if nEndIndex < getn(tb1) then	
		tinsert(tbOpt, format("Trang k�/#pActivity:SaleItemDailyDialog(%d)", nEndIndex + 1))
	end
	if nStartIndex > 1 then
		tinsert(tbOpt, format("Tr� l�i/#pActivity:SaleItemDailyDialog(%d)",  nStartIndex - nSize))
	end
	
	tinsert(tbOpt, {"K�t th�c ��i tho�i"})
	Describe("Ng��i mu�n s� h�u m�n n�o?", getn(tbOpt), tbOpt)
end

function pActivity:AcceptTradeItem(nIDSale)
	
	if tbListSaleDaily:CheckCanSaleOutItem_Daily(nIDSale) == 0 then
		return Talk(1,"","��t n�y th�t l� ��t h�ng! ta kh�ng c�n g� �� trao ��i n�a, h�n g�p l�i c�c h� l�n sau.")
	end
	if self:CheckSaleDate() ~= 1 then
		return
	end
	if not TB_SALE_EQUIP_DAILY[nIDSale] then
		print("-----------Loi khong thay lich ban hang")
		return
	end	
		
	local szItemName = TB_SALE_EQUIP_DAILY[nIDSale].szName
	local nNeedMaterial = TB_SALE_EQUIP_DAILY[nIDSale].nNeedMaterial	
	local nTotalQuantity =TB_SALE_EQUIP_DAILY[nIDSale].nQuantity	
	local nCurMaterial = GetTask(%TASK_SAVE_SL_NGOCLUCBAO)
	local nLastNum = tbListSaleDaily.tbAwardCheck_SaleDaily[nIDSale]
	if nLastNum < 0 or nLastNum > nTotalQuantity then
		tbLog:PlayerActionLog("AcceptTradeItem - Loi tong so luong ban ra vuot qua qui dinh: "..nLastNum)
		return Talk(1,"","C� l�i x�y ra, xin vui l�ng li�n h� v�i Ban �i�u h�nh.")
	end
	if nCurMaterial < nNeedMaterial then 
		return Talk(1,"","Hi�n t�i ta ch�a nh�n �� s� Ng�c L�c B�o c�n �� ��i v�t ph�m n�y, h�y n�p �� cho ta tr��c.")
	end
		
	if PlayerFunLib:CheckFreeBagCellWH(2,3,1,"default") ~= 1 then
		return
	end
	if nIDSale == TRADE_EXP_ID then 
		self:CheckResetMonthlyExp() 
	end
	--kiem tra gioi han doi 500 lan exp	
	if (nIDSale == TRADE_EXP_ID) and  (tbVNG_BitTask_Lib:getBitTask(BITTASK_MAX_CHANGE_EXP) >= MAX_CHANGE_EXP) then
		Talk(1,"",format("M�t th�ng ��i �i�m kinh nghi�m t�i �a <color=yellow>%d<color> l�n.",MAX_CHANGE_EXP))
		return
	end	
	-- ghi s� l��ng �� b�n v�o file
	if not tbListSaleDaily:SaleOutItem_Daily(nIDSale,1) then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE,"[Mua: ]".."Item ID: "..nIDSale.." GhiFileThatBai ")	
		return
	end
	--tr� s� l��ng Ng�c l�c b�o trong kh�
	SetTask(%TASK_SAVE_SL_NGOCLUCBAO,nCurMaterial - nNeedMaterial)
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"[Mua: ]".."So NLB hien tai:"..nCurMaterial.."- So luong NLB bi tru: "..nNeedMaterial)
	--Luu so lan doi exp
	if nIDSale == TRADE_EXP_ID then 
		tbVNG_BitTask_Lib:addTask(BITTASK_MAX_CHANGE_EXP, 1)
	end
	
	tbAwardTemplet:Give(TB_SALE_EQUIP_DAILY[nIDSale], 1, {EVENT_LOG_TITLE,"DoiThanhCong"})	
	Talk(1,"",format(" Ch�c m�ng ��i hi�p ��i th�nh c�ng <color=yellow>%s<color>.\n Hi�n t�i c�n %d Ng�c l�c b�o g�i � Th�m V�n Tam",szItemName,nCurMaterial - nNeedMaterial))
	Msg2Player(format(" Ch�c m�ng ��i hi�p ��i th�nh c�ng <color=yellow>%s<color>",szItemName))
	return 1
end
--Check dk reset theo thang solan mua exp
function pActivity:CheckResetMonthlyExp() 
	local nCur_Month = tonumber(GetLocalDate("%m"))
	local nLastMonth = tbVNG_BitTask_Lib:getBitTask(BITTASK_SAVE_CUR_MONTH)
	if nCur_Month ~= nLastMonth then
		tbVNG_BitTask_Lib:setBitTask(BITTASK_SAVE_CUR_MONTH, nCur_Month)	
		--reset s� l�n ��i exp h�ng th�ng
		tbVNG_BitTask_Lib:setBitTask(BITTASK_MAX_CHANGE_EXP, 0)	
	end
end
--Ban Item even trong shop
function pActivity:CheckEventSaleDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if (nCurDate >= %tbSaleEventItem.StartSaleEventDate and nCurDate < %tbSaleEventItem.EndSaleEventDate) then		
		return 1
	else
		Talk(1,"","Th�i gian s� ki�n �� h�t, ta s� c� g�ng c�p nh�p trong c�c s� ki�n sau.")
		return
	end
end
function pActivity:OpenSaleItemEvent()
	%tbSaleEventItem:SaleItemEventUI()
end
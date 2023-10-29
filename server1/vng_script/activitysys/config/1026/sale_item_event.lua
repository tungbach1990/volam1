Include("\\vng_script\\activitysys\\config\\1026\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

if not tbSaleEventItem  then
	tbSaleEventItem = {}
end
tbSaleEventItem.StartSaleEventDate = 201508200000
tbSaleEventItem.EndSaleEventDate = 201509092400
tbSaleEventItem.TASK_LIMIT_TRADE = 2707
tbSaleEventItem.MaxTrade = 100
tbSaleEventItem.tbItem =  {szName="B�ng h�ng c�i �o", tbProp={6,1,30301,1,0,0},nExpiredTime=20150910}


function tbSaleEventItem:SaleItemEventUI()
	local nMaxCount = 100
	g_AskClientNumberEx(1, nMaxCount, "Nh�p s� v�t ph�m mu�n mua", {self.AcceptTradeEventItem, {self,nCount}} )
end

function tbSaleEventItem:AcceptTradeEventItem(nCount)		
	--kiem tra goi han mua
	local nValue = GetTask(self.TASK_LIMIT_TRADE)
	
	if (nValue  >= self.MaxTrade)  then
		return Talk(1,"",format("��t n�y m�i nh�n v�t ch� mua ���c 100 c�i th�i."))
	end
	
	if ((nValue + nCount)  > self.MaxTrade) then
		return Talk(1,"",format("L�n n�y ch� c�n mua ���c %d <color=yellow>%s<color>",(self.MaxTrade-nValue),self.tbItem.szName))
	end
	
	local nCurMaterial = GetTask(%TASK_SAVE_SL_NGOCLUCBAO)	
	local nNeedMaterial = 4*nCount --gia doi 4 NLB lay 1 item event
	if nCurMaterial < nNeedMaterial then 
		return Talk(1,"","Hi�n t�i ta ch�a nh�n �� s� Ng�c L�c B�o c�n �� ��i v�t ph�m n�y, h�y n�p �� cho ta tr��c.")
	end	
	--tr� s� l��ng Ng�c l�c b�o trong kh�
	SetTask(%TASK_SAVE_SL_NGOCLUCBAO,nCurMaterial - nNeedMaterial)
	--ghi so luong mua
	SetTask(self.TASK_LIMIT_TRADE, nValue+nCount)
	tbAwardTemplet:Give(self.tbItem, nCount, {EVENT_LOG_TITLE,"DoiThanhCong_HoaHongCaiAo"})
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"[Mua: ]".."So NLB hien tai:"..nCurMaterial.."- So luong NLB bi tru: "..nNeedMaterial)		
end
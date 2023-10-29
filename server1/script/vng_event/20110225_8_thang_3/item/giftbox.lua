Include("\\script\\vng_event\\20110225_8_thang_3\\item\\item_head.lua")
tbVNGWD2011_GiftBox = {}
tbVNGWD2011_GiftBox.nTaskLimitUse = 2748
tbVNGWD2011_GiftBox.nMaxExp = 4e9	
function main(itemidx)
	if (tbVNGWD2011_ItemHead:isExpired(itemidx) == 1) then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0; -- delete item
	end
	local nResult, szErrorMessage = tbVNGWD2011_GiftBox:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end		
end

function tbVNGWD2011_GiftBox:UseItem()
	if tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 0, "B�n kh�ng �� �i�u ki�n s� d�ng v�t ph�m! Y�u c�u c�p �� tr�n 150 v� ��  n�p th�."
	end
	
	if tbVNGWD2011_ItemHead:checkBag(10) ~= 1 then
		return 0, "�� b�o v� t�i s�n, xin vui l�ng ch�a 10 � tr�ng trong h�nh trang r�i m�i s� d�ng v�t ph�m n�y!"
	end		
	local nTaskVal = GetTask(self.nTaskLimitUse)
	if nTaskVal >= (self.nMaxExp/1e6) then
		return 0, "��i hi�p �� s� d�ng t�i �a v�t ph�m n�y, kh�ng th� s� d�ng th�m"
	end
	SetTask(self.nTaskLimitUse, nTaskVal + 10)	
	self:AddExtraAwardDialog()
	local tbExpAward =  {szName = "�i�m Kinh Nghi�m", nExp=10000000}
	local tbItemAward = 
		{
			{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.08,nExpiredTime=43200},
			{szName="Huy�n Vi�n L�nh",tbProp={6,1,2351,1,0,0},nCount=1,nRate=0.6},
			{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
			{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=5},
			{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=5},
			{szName="H�i th�nh ph� (l�n)",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.5},
			{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=4},
			{szName="T�ng Kim Chi�u Binh L� Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},
			{szName="M�c B�c Truy�n T�ng L�nh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=4},
			{szName="H�i long ch�u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2},
			{szName="Huy�n Thi�n C�m Nang",tbProp={6,1,2355,1,0,0},nCount=1,nRate=5},
			{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=1,nRate=5},
			{szName="Thi�n Ni�n Tr�n L�",tbProp={6,1,2267,1,0,0},nCount=1,nRate=4},
			{szName="V�n Ni�n Tr�n L�",tbProp={6,1,2268,1,0,0},nCount=1,nRate=6.32},
			{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
			{szName="B�c ��u truy�n c�ng thu�t",tbProp={6,1,1672,1,0,0},nCount=1,nRate=1},
			{szName="Long Huy�t Ho�n",tbProp={6,1,2117,1,0,0},nCount=1,nRate=2},
			{szName="Thi�n tinh b�ch c�u ho�n",tbProp={6,1,2183,1,0,0},nCount=1,nRate=3},
			{szName="B�ch C�u Ho�n ��c bi�t",tbProp={6,1,1157,1,0,0},nCount=1,nRate=5},
			{szName="C�m nang thay ��i tr�i ��t",tbProp={6,1,1781,1,0,0},nCount=1,nRate=5,tbParam={60}},
			{szName="Nh�t K� C�n Kh�n Ph�",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
			{szName="Ng�c Qu�n",tbProp={6,1,2311,1,0,0},nCount=1,nRate=10},
		}
	if tbExpAward and tbItemAward then
		tbAwardTemplet:GiveAwardByList(tbExpAward, "[VNG][8thang3][Ph�n th��ng Exp s� d�ng H�p Qu� 8 th�ng 3]")
		tbAwardTemplet:GiveAwardByList(tbItemAward, "[VNG][8thang3][Ph�n th��ng Item S� d�ng H�p Qu� 8 th�ng 3]")
	end
	return 1
end

function tbVNGWD2011_GiftBox:AddExtraAwardDialog()
	local nItemUsed = GetTask(self.nTaskLimitUse) / 10
	local tbTSK, tbTSK_FLAG = {}
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
	if (nItemUsed >= 100 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
	if (nItemUsed >= 200 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
	if (nItemUsed >= 300 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
	if (nItemUsed >= 400 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
end
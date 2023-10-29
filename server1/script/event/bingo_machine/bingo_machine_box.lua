Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\metempsychosis\\task_head.lua")
local  _Message =  function (nItemIndex, strBoxName)
	local handle = OB_Create()
	local msg = format("<color=green>Ch�c m�ng cao th� <color=yellow>%s<color=green> �� nh�n ���c <color=yellow><%s><color=green> t� <color=yellow><%s><color>" ,GetName(),GetItemName(nItemIndex), strBoxName)
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
local  BingoBoxAddExp =  function (nAmount, strBoxName)
	AddOwnExp(nAmount)
	Msg2Player("��t ���c kinh nghi�m kh�ng th� c�ng d�n "..nAmount)
	tbLog:PlayerAwardLog("BachBaoRuong", "SuDungTinhMyBaoRuong", "�i�m Kinh Nghi�m", "", nAmount)
	local handle = OB_Create()
	local msg = format("<color=green>Ch�c m�ng cao th� <color=yellow>%s<color=green> �� nh�n ���c <color=yellow><%s><color=green> t� <color=yellow><%s><color>" ,GetName(),nAmount.." �i�m kinh nghi�m", strBoxName)
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end
tbBingoBoxAward = {
	[3053] = {		--Qu� tr�ng b�o r��ng	
		{szName = "Kim � Ph�t Qu�n (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={13,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � Kim Kh�i (Max Option - T� ch�n h� ph�i)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={17,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � H�i (Max Option) - T� ch�n h� ph�i)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={19,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � Y�u ��i (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={16,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � H� Uy�n (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={15,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � H�ng Li�n (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={12,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � Ng�c B�i (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={20,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � Th��ng Gi�i Ch� (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={14,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � H� Gi�i Ch� (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={21,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � Kh� Gi�i (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={18,0,0,0,0,0}, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},	
		{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1, nRate = 12, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� Kh�i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� H�i",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� Y�u ��i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� H� Uy�n",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� H�ng Li�n",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� B�i",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� Th��ng Gi�i",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="B�ch H� �� Ph� H� Gi�i",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "�i�m Kinh Nghi�m", nRate=10, pFun = function() %BingoBoxAddExp(200e6, "Qu� Tr�ng B�o R��ng") end},
		{szName = "�i�m Kinh Nghi�m", nRate=6, pFun = function() %BingoBoxAddExp(500e6, "Qu� Tr�ng B�o R��ng") end},
		{szName="Long ��m",tbProp={0,3499},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="L�u Hu�nh",tbProp={0,3500},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Cu�ng Lan",tbProp={0,3501},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Th�y Ng�c B�ng Huy�n",tbProp={0,3502},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Ng�ng Tuy�t H�n S��ng",tbProp={0,3504},nCount=1,nRate=3,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Gia H�n Ph�",tbProp={6,1,30225,1,0,0},nCount=1,nRate=1,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Phong V�n Th�ch",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Ho�ng Kim �n (C��ng h�a)",tbProp={0,3211},nCount=1,nRate=7,nQuality = 1,nExpiredTime=129600, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Ho�ng Kim �n (Nh��c h�a)",tbProp={0,3221},nCount=1,nRate=7,nQuality = 1,nExpiredTime=129600, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
	},
	[3054] = {--Tinh M� B�o R��ng
		{szName="B�o R��ng Kim � Kh�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � Y",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � H�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � Y�u ��i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � H� Uy�n",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � H�ng Li�n",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � B�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � Th��ng Gi�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � H� Gi�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � V� Kh�",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},	
		{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1, nRate = 15, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� Kh�i",tbProp={6,1,3173,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� Y",tbProp={6,1,3174,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� H�i",tbProp={6,1,3175,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� Y�u ��i",tbProp={6,1,3176,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� H� Uy�n",tbProp={6,1,3177,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� H�ng Li�n",tbProp={6,1,3178,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� B�i",tbProp={6,1,3179,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� Th��ng Gi�i",tbProp={6,1,3180,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�ch H� �� Ph� H� Gi�i",tbProp={6,1,3181,1,0,0},nCount=1, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1, nRate = 0.5, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.5, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Long ��m",tbProp={0,3499},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="L�u Hu�nh",tbProp={0,3500},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Cu�ng Lan",tbProp={0,3501},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Th�y Ng�c B�ng Huy�n",tbProp={0,3502},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Ng�ng Tuy�t H�n S��ng",tbProp={0,3504},nCount=1,nRate=2,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Gia H�n Ph�",tbProp={6,1,30225,1,0,0},nCount=1,nRate=1,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Phong V�n Th�ch",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Phi�n V� ",tbProp={0,10,7,1,0,0},nCount=1,nRate=4,nExpiredTime=259200, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName = "�i�m Kinh Nghi�m", nRate=15, pFun = function() %BingoBoxAddExp(100e6, "Tinh M� B�o R��ng") end},
		{szName = "�i�m Kinh Nghi�m", nRate=9, pFun = function() %BingoBoxAddExp(200e6, "Tinh M� B�o R��ng") end},
		{szName = "�i�m Kinh Nghi�m", nRate=2, pFun = function() %BingoBoxAddExp(500e6, "Tinh M� B�o R��ng") end},		
	},
}
tbBingoBoxAward_2 = {
	[3053] = {		--Qu� tr�ng b�o r��ng	
		{szName = "Kim � Ph�t Qu�n (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={13,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � Kim Kh�i (Max Option - T� ch�n h� ph�i)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={17,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � H�i (Max Option) - T� ch�n h� ph�i)", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={19,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � Y�u ��i (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={16,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � H� Uy�n (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={15,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � H�ng Li�n (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={12,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � Ng�c B�i (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={20,0,0,0,0,0}, nRate = 3, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � Th��ng Gi�i Ch� (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={14,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � H� Gi�i Ch� (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={21,0,0,0,0,0}, nRate = 2, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "Kim � Kh� Gi�i (Max Option) - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={18,0,0,0,0,0}, nRate = 1, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},	
		{szName="�� Ph� B�ch H� Kh�i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� H�i",tbProp={6,1,3175,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� Y�u ��i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� H� Uy�n",tbProp={6,1,3177,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� H�ng Li�n",tbProp={6,1,3178,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� B�i",tbProp={6,1,3179,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� Th��ng Gi�i",tbProp={6,1,3180,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="B�ch H� �� Ph� H� Gi�i",tbProp={6,1,3181,1,0,0},nCount=1,nRate=1.8, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="�� Ph� B�ch H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1,nRate=1.2, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=1.2, CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName = "�i�m Kinh Nghi�m", nRate=16, pFun = function() %BingoBoxAddExp(200e6, "Qu� Tr�ng B�o R��ng") end},
		{szName = "�i�m Kinh Nghi�m", nRate=8, pFun = function() %BingoBoxAddExp(500e6, "Qu� Tr�ng B�o R��ng") end},
		{szName="Long ��m",tbProp={0,3499},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},		
		{szName="Cu�ng Lan",tbProp={0,3501},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Th�y Ng�c B�ng Huy�n",tbProp={0,3502},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Ng�ng Tuy�t H�n S��ng",tbProp={0,3504},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Gia H�n Ph�",tbProp={6,1,30225,1,0,0},nCount=1,nRate=3,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
		{szName="Phong V�n Th�ch",tbProp={6,1,30224,1,0,0},nCount=1,nRate=8.4,CallBack = function(nParam) %_Message(nParam, "Qu� Tr�ng B�o R��ng") end},
	},
	[3054] = {--Tinh M� B�o R��ng
		{szName="B�o R��ng Kim � Kh�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � Y",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � H�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � Y�u ��i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � H� Uy�n",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � H�ng Li�n",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � B�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=3, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � Th��ng Gi�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � H� Gi�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�o R��ng Kim � V� Kh�",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=1, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},			
		{szName="�� Ph� B�ch H� Kh�i",tbProp={6,1,3173,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� Y",tbProp={6,1,3174,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� H�i",tbProp={6,1,3175,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� Y�u ��i",tbProp={6,1,3176,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� H� Uy�n",tbProp={6,1,3177,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� H�ng Li�n",tbProp={6,1,3178,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� B�i",tbProp={6,1,3179,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� Th��ng Gi�i",tbProp={6,1,3180,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�ch H� �� Ph� H� Gi�i",tbProp={6,1,3181,1,0,0},nCount=1, nRate = 1.2, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="�� Ph� B�ch H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1, nRate = 0.8, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.8, CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Long ��m",tbProp={0,3499},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},		
		{szName="Cu�ng Lan",tbProp={0,3501},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Th�y Ng�c B�ng Huy�n",tbProp={0,3502},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Ng�ng Tuy�t H�n S��ng",tbProp={0,3504},nCount=1,nRate=4,nQuality = 1,nExpiredTime=10080,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Gia H�n Ph�",tbProp={6,1,30225,1,0,0},nCount=1,nRate=3,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},
		{szName="Phong V�n Th�ch",tbProp={6,1,30224,1,0,0},nCount=1,nRate=9,CallBack = function(nParam) %_Message(nParam, "Tinh M� B�o R��ng") end},		
		{szName = "�i�m Kinh Nghi�m", nRate=16.6, pFun = function() %BingoBoxAddExp(100e6, "Tinh M� B�o R��ng") end},
		{szName = "�i�m Kinh Nghi�m", nRate=12, pFun = function() %BingoBoxAddExp(200e6, "Tinh M� B�o R��ng") end},
		{szName = "�i�m Kinh Nghi�m", nRate=5, pFun = function() %BingoBoxAddExp(500e6, "Tinh M� B�o R��ng") end},		
	},
}
local tbBingoBoxLog = {
	[3053] = "SuDungQuyTrongBaoRuong",
	[3054] = "SuDungTinhMyBaoRuong",--Tinh M� B�o R��ng
}
local tbBingoBoxTSKDailyLimit = {
	[3053] = 3078,
	[3054] = 3077,--Tinh M� B�o R��ng
}
local tbBingoBoxFreeBag = {
	[3053] = {nW = 2, nH = 1},
	[3054] = {nW = 3, nH = 3},--Tinh M� B�o R��ng
}
local tbHeiLongXianDan = {tbProp={6,1,3278,1,0,0},}
function main(nItemIndex)
	local _, _, nP = GetItemProp(nItemIndex)
	if nP ~= 3053 and nP ~= 3054 then
		return 1
	end
		
	local nTSKID = %tbBingoBoxTSKDailyLimit[nP]
	if PlayerFunLib:CheckTaskDaily(nTSKID, 10, format("S� d�ng v�t ph�m %s ��t gi�i h�n ng�y, kh�ng th� s� d�ng th�m.", GetItemName(nItemIndex)), "<") ~= 1 then
		return 1
	end
	local tbFreeBag = %tbBingoBoxFreeBag[nP]
	if PlayerFunLib:CheckFreeBagCellWH(tbFreeBag.nW, tbFreeBag.nH, 1, "default") ~= 1  then
		return 1
	end
	
	if GetTask(TSK_TRANSLIFE_5)>0 then
		if PlayerFunLib:CheckFreeBagCell(tbFreeBag.nW*tbFreeBag.nH+1,"default") ~= 1 then
			return 1
		end
		tbAwardTemplet:Give(%tbHeiLongXianDan, 1, {"heilongxiandan"})
	end
	
	PlayerFunLib:AddTaskDaily(nTSKID, 1)	
	if mod(PlayerFunLib:GetTaskDailyCount(nTSKID), 4) == 0 then	
		tbAwardTemplet:Give(tbBingoBoxAward_2[nP], 1, {"BachBaoRuong", %tbBingoBoxLog[nP].."2"})
	else
		tbAwardTemplet:Give(tbBingoBoxAward[nP], 1, {"BachBaoRuong", %tbBingoBoxLog[nP]})
	end
	--Meridan material - Modified by DinhHQ - 20120711
	local tbMeridanAward = {szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=2,nBindState=-2}
	tbAwardTemplet:Give(tbMeridanAward, 1, {"KinhMach", %tbBingoBoxLog[nP]})
	return 0
end
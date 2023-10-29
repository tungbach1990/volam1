Include("\\script\\lib\\log.lua")
_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>Ch�c m�ng <color=yellow>%s<color=green> �� nh�n ���c v�t ph�m <color=yellow>%s<color=green>", GetName(), strItemName)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function pContributionAward(nCount)
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(nCount)
		Msg2Player("B�n nh�n ���c "..nCount.." �i�m c�ng hi�n bang h�i")
		%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "SuDungVatPham", nCount.." �i�m c�ng hi�n bang h�i")
	end
end

tbAward_Ext = {
	["award2000"] = {
		--{szName="B�o R��ng Kim � V� Kh�",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, CallBack = _Message}
		  {szName = "Kim � Kh� Gi�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, CallBack = _Message},
	},
	["awardspecial"] = { 
			{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200, CallBack = _Message},
			{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=1, CallBack = _Message},
			{szName="T� M�ng Chi B�o (N�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={1,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (�ai L�ng)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={4,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (Bao Tay)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={3,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (Ng�c B�i)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={8,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (�o)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={5,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (Gi�y)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={7,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (H�ng Li�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={0,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (Nh�n Tr�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={2,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (Nh�n D��i)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={9,0,0,0,0,0}},
			{szName="T� M�ng Chi B�o (V� Kh�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={6,0,0,0,0,0}},
			{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=2},
			{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=2},
			{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=2},
			{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=2},
			{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=2},
			{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=2},
			{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=2},
			{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=1},
			{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=1},
			{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=1},
			{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=40.5},
			{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=10},
			{szName = "�i�m Kinh Nghi�m", nExp=100000000,nRate=5},
			{szName="B�o R��ng Kim � Kh�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.2, CallBack = _Message},
			{szName="B�o R��ng Kim � Y",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="B�o R��ng Kim � H�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="B�o R��ng Kim � Y�u ��i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="B�o R��ng Kim � H� Uy�n",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="B�o R��ng Kim � H�ng Li�n",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.2, CallBack = _Message},
			{szName="B�o R��ng Kim � B�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.2, CallBack = _Message},
			{szName="B�o R��ng Kim � Th��ng Gi�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="B�o R��ng Kim � H� Gi�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="B�o R��ng Kim � V� Kh�",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.1, CallBack = _Message},
			{szName="Kim Hoa Chi B�o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=3.3},
			{szName="Ph� Th�y Chi B�o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=2, CallBack = _Message},
			{szName="Phong V�n Chi B�o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=1, CallBack = _Message},
			{szName="M�t n� V��ng Gi�",tbProp={0,11,561,1,0,0},nCount=1,nRate=1,nExpiredTime=43200, CallBack = _Message},	
		},
	["awardnomal"] ={ --Server c� v� si�u quang
		{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.1, CallBack = _Message},
		{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.3},
		{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.3},
		{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.3},
		{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.3},
		{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.3},
		{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.3},
		{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.2},
		{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.2},
		{szName="Kim Hoa Chi B�o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.5},
		{szName="Ph� Th�y Chi B�o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2,CallBack = _Message},
		{szName="Phong V�n Chi B�o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1,CallBack = _Message},
		{szName="B�o R��ng Kim � Kh�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.004, CallBack = _Message},
		{szName="B�o R��ng Kim � Y",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="B�o R��ng Kim � H�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="B�o R��ng Kim � Y�u ��i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="B�o R��ng Kim � H� Uy�n",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="B�o R��ng Kim � H�ng Li�n",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.004, CallBack = _Message},
		{szName="B�o R��ng Kim � B�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.004, CallBack = _Message},
		{szName="B�o R��ng Kim � Th��ng Gi�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.002, CallBack = _Message},
		{szName="B�o R��ng Kim � H� Gi�i",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.002, CallBack = _Message},
		{szName="B�o R��ng Kim � V� Kh�",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.001, CallBack = _Message},
		{szName="20000 �i�m C�ng Hi�n Bang H�i",nCount=1,nRate=4.5, pFun = function() %pContributionAward(20000) end},
		{szName="50000 �i�m C�ng Hi�n Bang H�i",nCount=1,nRate=2.5, pFun = function() %pContributionAward(50000) end},
		{szName="100000 �i�m C�ng Hi�n Bang H�i",nCount=1,nRate=1, pFun = function() %pContributionAward(100000) end},
		{szName="M�t t�ch k� n�ng 150 (C�p 19)",tbProp={6,1,30170,1,0,0},nCount=1,nRate=0.02, CallBack = _Message},
		{szName="M�t t�ch k� n�ng 150 (C�p 20)",tbProp={6,1,30171,1,0,0},nCount=1,nRate=0.02, CallBack = _Message},
		{szName="M�t n� V��ng Gi�",tbProp={0,11,561,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200, CallBack = _Message},
		{szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="H�i thi�n t�i t�o l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1},
		{szName="Vi�m �� L�nh",tbProp={6,1,1617,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
		{szName="Ch�a kh�a v�ng",tbProp={6,1,30191,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="Ch�a Kh�a Nh� �",tbProp={6,1,2744,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
		{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200, CallBack = _Message},
		{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
		{szName="K�ch C�ng Tr� L�c Ho�n",tbProp={6,1,2952,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="�m D��ng Ho�t Huy�t ��n",tbProp={6,1,2953,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
		{szName="B�ch Ni�n Tr�n L�",tbProp={6,1,2266,1,0,0},nCount=1,nRate=0.1},
		{szName="Thi�n Ni�n Tr�n L�",tbProp={6,1,2267,1,0,0},nCount=1,nRate=0.1},
		{szName="V�n Ni�n Tr�n L�",tbProp={6,1,2268,1,0,0},nCount=1,nRate=0.1},
		{szName="H�i th�nh ph� (nh�) ",tbProp={6,1,1082,1,0,0},nCount=1,nRate=0.1,nExpiredTime=20160},
		{szName="H�i th�nh ph� (l�n) ",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.1,nExpiredTime=20160},
		{szName="Long Huy�t Ho�n",tbProp={6,1,2117,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName="T�ng Kim Chi�u Binh L� Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
		{szName = "�i�m Kinh Nghi�m", nExp=5000000,nRate=49.527},
		{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=6},
		{szName = "�i�m Kinh Nghi�m", nExp=15000000,nRate=2.5},
		{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=0.5},
		{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=0.05},
	},
}	
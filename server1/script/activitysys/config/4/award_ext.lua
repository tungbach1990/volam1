_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>Ch�c m�ng <color=yellow>%s<color=green> �� nh�n ���c v�t ph�m <color=yellow>%s<color=green>", GetName(), strItemName)
	AddGlobalNews(strMessage)
	--local handle = OB_Create();
	--ObjBuffer:PushObject(handle, strMessage)
	--RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	--OB_Release(handle)
end	
Award_A = 
{
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
	{szName="Kim Hoa Chi B�o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.4},
	{szName="Ph� Th�y Chi B�o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.2},
	{szName="Phong V�n Chi B�o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=0.1, CallBack = _Message},
	{szName = "Kim � Ph�t Qu�n - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim � Kim Kh�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim � H�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim � Y�u ��i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0}, nRate =0.004, CallBack = _Message},
	{szName = "Kim � H� Uy�n - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim � H�ng Li�n - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim � Ng�c B�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate = 0.004, CallBack = _Message},
	{szName = "Kim � Th��ng Gi�i Ch� - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0}, nRate = 0.002, CallBack = _Message},
	{szName = "Kim � H� Gi�i Ch� - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0}, nRate = 0.002, CallBack = _Message},
	{szName = "Kim � Kh� Gi�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, nRate = 0.001, CallBack = _Message},
	{szName="Ho�ng Kim �n (C��ng h�a)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=43200,},
	{szName="Ho�ng Kim �n (Nh��c h�a)",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=43200,},
	{szName="Ho�ng Kim �n (C��ng h�a)",tbProp={0,3210},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=43200,},
	{szName="Ho�ng Kim �n (Nh��c h�a)",tbProp={0,3220},nCount=1,nRate=0.2,nQuality = 1,nExpiredTime=43200,},
	{szName="Ch�a Kh�a Nh� �",tbProp={6,1,2744,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
	{szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1},
	{szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nRate=0.2,nExpiredTime=10080,nUsageTime=60},
	{szName="H�i thi�n t�i t�o l� bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="M�t n� Nguy�n so�i",tbProp={0,11,447,1,0,0},nCount=1,nRate=1,nExpiredTime=10080,nUsageTime=60},
	{szName="M�t n� Qu� �nh",tbProp={0,11,455,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Ch�a kh�a v�ng",tbProp={6,1,30191,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Thi�n Linh ��n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200, CallBack = _Message},
	{szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
	{szName="K�ch C�ng Tr� L�c Ho�n",tbProp={6,1,2952,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="�m D��ng Ho�t Huy�t ��n",tbProp={6,1,2953,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Ph� Qu� C�m H�p",tbProp={6,1,2402,1,0,0},nCount=1,nRate=4,nExpiredTime=10080},
	{szName="L�nh B�i Th�y T�c",tbProp={6,1,2745,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Thi�n B�o Kh� L�nh",tbProp={6,1,2813,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Kim � Tr�ng Luy�n Ng�c",tbProp={6,1,3005,1,0,0},nCount=1,nRate=0.2},
	{szName="T�ng Kim Chi�u Binh L� Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName = "�i�m Kinh Nghi�m", nExp=5000000,nRate=46.417},
	{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=6},
	{szName = "�i�m Kinh Nghi�m", nExp=15000000,nRate=2.5},
	{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=0.5},
	{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=0.05},
}


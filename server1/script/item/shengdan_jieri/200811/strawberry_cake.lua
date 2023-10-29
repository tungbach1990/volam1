Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

tb_strawberry_award	=
{
	{szName="Huy�n tinh kho�ng th�ch c�p 3", 		tbProp={6, 1, 147, 3, 0, 0}, 	nRate = 3},
	{szName="Huy�n Tinh Kho�ng Th�ch c�p 4", 		tbProp={6, 1, 147, 4, 0, 0},	nRate = 2},
	{szName="Huy�n Tinh Kho�ng Th�ch c�p 5", 		tbProp={6, 1, 147, 5, 0, 0},	nRate = 0.8},
	{szName="L�nh b�i vinh d� H�n thi�t", 	tbProp={6, 1, 1257, 1, 0, 0},	nRate = 5},
	{szName="L�nh b�i vinh d� Thanh ��ng",	tbProp={6, 1, 1256, 1, 0, 0}, 	nRate = 2},
	{szName="L�nh b�i vinh d� B�ch Ng�n",	tbProp={6, 1, 1255, 1, 0, 0}, 	nRate = 0.8},
	{szName="L�nh b�i vinh d� Ho�ng Kim", 	tbProp={6, 1, 1254, 1, 0, 0}, 	nRate = 0.05},
	{szName="V� L�m M�t T�ch", 		tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.05},
	{szName="T�y T�y Kinh", 			tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.05},
	{szName="B�n Nh��c T�m Kinh", 		tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 1},
	{szName="Thi�t La H�n", 			tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 2},
	{szName="Th�n b� ��i H�ng Bao", 		tbProp={6, 1, 402,1, 0, 0}, 	nRate = 6},
	{szName="��nh Qu�c � Sa Ph�t Qu�n", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.006},
	{szName="��nh Qu�c Thanh Sa Tr��ng Sam", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.01},
	{szName="��nh Qu�c Ng�n T�m Y�u ��i", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.04},
	{szName="��nh Qu�c T� ��ng H� uy�n", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.1},
	{szName="1 danh v�ng", 			nRepute = 1, 		nRate = 30},
	{szName="2 danh v�ng", 			nRepute = 2, 		nRate = 25},
	{szName="3 danh v�ng", 			nRepute = 3, 		nRate = 19},
	{szName="10 danh v�ng",			nRepute = 10, 		nRate = 2.494},
	{szName="50 danh v�ng",		 	nRepute = 50, 		nRate = 0.5},
};

function main(nItemIndex)
	christmas_resettask();
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "V�t ph�m n�y �� h�t h�n")
		return 0
	end
	if (CalcFreeItemCellCount() < 20) then
		Say("H�nh trang c�a ��i hi�p �� ��y!", 0);
		return 1;
	end
	
	if (50 + GetTask(christmas_getexp_taskid) <= GetTask(christmas_bingjing_taskid))	then
		SetTask(christmas_getexp_taskid, 50 + GetTask(christmas_getexp_taskid));
		AddOwnExp(500000);
		tbAwardTemplet:GiveAwardByList(tb_strawberry_award, "Ho�t ��ng gi�ng sinh 2008_B�nh Kem D�u");	
	else
		Say("��i hi�p �� thu ���c kinh nghi�m cao nh�t v� v�y kh�ng th� s� d�ng th�m kem d�u n�a.", 0);
		return 1;
	end
end
--�Ҵ��ؼ�
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\lib.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\taskctrl.lua")
Include("\\script\\lib\\pay.lua")
local tbAwardList = 
{
	[1] = {nExp = 1000000},
	[2] =
	{
		{szName="An Bang B�ng Tinh Th�ch H�ng Li�n", nQuality=1, nRate=0.002, tbProp={0, 164}},
		{szName="An Bang K� Huy�t Th�ch Gi�i Ch� ", nQuality=1, nRate=0.005, tbProp={0, 167}},
		{szName="An Bang C�c Hoa Th�ch Ch� ho�n", nQuality=1, nRate=0.005, tbProp={0, 165}},
		{szName="An Bang �i�n Ho�ng Th�ch Ng�c B�i", nQuality=1, nRate=0.01, tbProp={0, 166}},
		{szName="��nh Qu�c � Sa Ph�t Qu�n", nQuality=1, nRate=0.005, tbProp={0, 160}},
		{szName="��nh Qu�c Thanh Sa Tr��ng Sam", nQuality=1, nRate=0.008, tbProp={0, 159}},
		{szName="��nh Qu�c Ng�n T�m Y�u ��i", nQuality=1, nRate=0.2, tbProp={0, 163}},
		{szName="��nh Qu�c X�ch Quy�n Nhuy�n Ngoa", nQuality=1, nRate=0.05, tbProp={0, 161}},
		{szName="��nh Qu�c T� ��ng H� uy�n", nQuality=1, nRate=0.2, tbProp={0, 162}},
		{szName="Nhu T�nh C�n Qu�c Ngh� Th��ng", nQuality=1, nRate=0.002, tbProp={0, 190}},
		{szName="Nhu T�nh  Tu� T�m Ng�c B�i", nQuality=1, nRate=0.01, tbProp={0, 193}},
		{szName="Nhu T�nh  Ph�ng Nghi Gi�i Ch� ", nQuality=1, nRate=0.2, tbProp={0, 192}},
		{szName="Nhu T�nh Th�c N� H�ng Li�n", nQuality=1, nRate=0.15, tbProp={0, 191}},
		{szName="Hi�p C�t T�nh � K�t", nQuality=1, nRate=0.01, tbProp={0, 189}},
		{szName="Hi�p C�t Thi�t Huy�t Sam", nQuality=1, nRate=0.1, tbProp={0, 186}},
		{szName="Hi�p C�t �an T�m Gi�i", nQuality=1, nRate=0.1, tbProp={0, 188}},
		{szName="Hi�p C�t �a T�nh Ho�n", nQuality=1, nRate=0.5, tbProp={0, 187}},
		{szName="Huy�n tinh kho�ng th�ch c�p 3", nRate=5, tbProp={6, 1, 147, 3, 0, 0}},
		{szName="Huy�n tinh kho�ng th�ch c�p 4", nRate=3, tbProp={6, 1, 147, 4, 0, 0}},
		{szName="Huy�n tinh kho�ng th�ch c�p 5", nRate=2, tbProp={6, 1, 147, 5, 0, 0}},
		{szName="V� L�m M�t T�ch", nRate=0.1, tbProp={6, 1, 26, 1, 0, 0}},
		{szName="T�y T�y Kinh", nRate=0.1, tbProp={6, 1, 22, 1, 0, 0}},
	}
}

function main(nItemIndex)
	jiaoshi0810_ResetTask()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate >= GetItemParam(nItemIndex, 1) then
		Talk(1,"","V�t ph�m n�y �� h�t h�n");
		return 0
	end
	if GetLevel() < 50 or IsCharged() == 0 then
		Talk(1, "", "Ch� c� ng��i ch�i c�p 50 tr� l�n v� �� qua n�p th� m�i c� th� s� d�ng c�ng c� n�y.")
		return 1
	end
	local nCurExp = GetTask(jiaoshi0810_TSK_ExpLimit)
	if nCurExp >= jiaoshi0810_MaxExpLimit then
		Talk(1, "", format("M�i nh�n v�t s� d�ng v�t ph�m n�y nhi�u nh�t ch� thu ���c %s kinh nghi�m.", jiaoshi0810_TransferDigit2CnNum(jiaoshi0810_MaxExpLimit)))
		return 1;
	end
	tbAwardTemplet:GiveAwardByList(%tbAwardList, "use "..GetItemName(nItemIndex))
	SetTask(jiaoshi0810_TSK_ExpLimit, nCurExp + %tbAwardList[1].nExp)
end
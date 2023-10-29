Include("\\script\\lib\\awardtemplet.lua")

tbItemAward = {
	{szName = "T� M�ng L�nh", tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},	
	{szName = "Huy�n Vi�n L�nh", tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 0.05},	
	{szName = "Th��ng Lang L�nh", tbProp = {6, 1, 2352, 1, 0, 0}, nRate = 1},	
	{szName = "V�n L�c L�nh", tbProp = {6, 1, 2353, 1, 0, 0}, nRate = 3},	
	{szName = "H�n Nguy�n Linh L�", tbProp = {6, 1, 2312, 1, 0, 0}, nRate = 10},	
	{szName = "��i L�c ho�n", tbProp = {6, 0, 3, 1, 0, 0}, nRate = 5},	
	{szName = "Phi T�c ho�n", tbProp = {6, 0, 6, 1, 0, 0}, nRate = 5},	
	{szName = "Qu� Ho�ng Kim", tbProp = {6, 1, 907, 1, 0, 0}, nRate = 10, nExpiredTime = 10080},	
	{szName = "Thi�n Ni�n Huy Ho�ng qu�", tbProp = {6, 1, 2270, 1, 0, 0}, nRate = 20},	
	{szName = "V�n Ni�n Huy Ho�ng qu�", tbProp = {6, 1, 2271, 1, 0, 0}, nRate = 7.94},	
	{szName = "B�ch Ni�n Huy Ho�ng qu�", tbProp = {6, 1, 2269, 1, 0, 0}, nRate = 30},	
	{szName = "Th�n b� kho�ng th�ch", tbProp = {6, 1, 398, 1, 0, 0}, nRate = 1},	
	{szName = "Huy�n Ch�n ��n", tbProp = {6, 1, 1678, 1, 0, 0}, nRate = 5, tbParam={15e8}},	
	{szName = "T� Kim Ch�n ��n", tbProp = {6, 1, 2263, 1, 0, 0}, nRate = 2, tbParam={20e8}},	
}

tbExpAward = {szName = "�i�m kinh nghi�m", nExp_tl = 50000000}

TASK_USECOUNT = 2789
TASK_MONTH = 2790


function main(nItemIndex)
	local nMonth =tonumber(GetLocalDate("%m"))

	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "H�nh trang ��i hi�p kh�ng �� 1 � tr�ng!.");
		return 1
	end
	
	if (GetTask(TASK_MONTH) ~= nMonth) then
		SetTask(TASK_MONTH, nMonth)
		SetTask(TASK_USECOUNT, 0)
	end
	
	if (GetTask(TASK_USECOUNT) < 9) then
		SetTask(TASK_USECOUNT, GetTask(TASK_USECOUNT)+1)
		tbAwardTemplet:GiveAwardByList(tbExpAward , "Nh�n th��ng H�ng Bao C�u L�c B�");
		tbAwardTemplet:GiveAwardByList(tbItemAward , "Nh�n th��ng H�ng Bao C�u L�c B�");
		return 0
	else
		Msg2Player("V�t ph�m ch� c� th� s� d�ng t�i �a 9 l�n trong m�t th�ng!")
		return 1
	end
	
end
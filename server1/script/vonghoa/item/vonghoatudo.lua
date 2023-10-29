Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vonghoa\\item\\head.lua")
--Include("\\script\\vonghoa\\item\\yanhua.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")

 tbAwardEXPTuDo=
 {
 	{nExp_tl=5000000, nRate = 80},
 	{nExp_tl=5500000, nRate = 15},
 	{nExp_tl=6000000, nRate = 5},
 };
  tbAwardItemTuDo=
  {
  	{szName = "Huy�n Vi�n L�nh", tbProp = {6, 1, 2351, 1, 0, 0}, nCount = 1, nRate = 0.2},	
  	{szName = "Th��ng Lang L�nh", tbProp = {6, 1, 2352, 1, 0, 0}, nCount = 1, nRate = 0.5},	
  	{szName = "V�n L�c L�nh", tbProp = {6, 1, 2353, 1, 0, 0}, nCount = 1, nRate = 1},	
  	{szName = "Thanh C�u L�nh", tbProp = {6, 1, 2369, 1, 0, 0}, nCount = 1, nRate = 1},	
  	{szName = "H�n Nguy�n Linh L�", tbProp = {6, 1, 2312, 1, 0, 0}, nCount = 1, nRate = 15},	
  	{szName = "Huy�n Thi�n C�m Nang", tbProp = {6, 1, 2355, 1, 0, 0}, nCount = 1, nRate = 10},	
  	{szName = "Th�n N�ng Ch�n ��n", tbProp = {6, 1, 2113, 1, 0, 0}, nCount = 1, nRate = 3},	
  	{szName = "N�n B�t Tr�n Ph�c Nguy�t", tbProp = {6, 1, 1817, 1, 0, 0}, nCount = 1, nRate = 10},	
  	{szName = "Khi�u Chi�n L� Bao", tbProp = {6, 1, 2006, 1, 0, 0}, nCount = 1, nRate = 7},	
  	{szName = "B�ch Ni�n Tr�n L�", tbProp = {6, 1, 2266, 1, 0, 0}, nCount = 1, nRate = 12},	
  	{szName = "Long Huy�t Ho�n", tbProp = {6, 1, 2117, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "Thi�n Long L�nh", tbProp = {6, 1, 2256, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "B�ch C�t L�nh", tbProp = {6, 1, 2255, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "H�i Long Ch�u", tbProp = {6, 1, 2115, 1, 0, 0}, nCount = 1, nRate = 3.3},	
  	{szName = "Ti�n Th�o L� (��c bi�t)", tbProp = {6, 1, 1181, 1, 0, 0}, nCount = 1, nRate =5 },	
  	{szName = "Th� Luy�n Thi�p", tbProp = {6, 1, 2317, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "Qu� Huy Ho�ng (cao c�p)", tbProp = {6, 1, 906, 1, 0, 0}, nCount = 1, nRate = 10,nExpiredTime = 10080},	
  	{szName = "B�ch Ni�n Huy Ho�ng qu�", tbProp = {6, 1, 2269, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "Thi�n Ni�n Huy Ho�ng qu�", tbProp = {6, 1, 2270, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "V�n Ni�n Huy Ho�ng qu�", tbProp = {6, 1, 2271, 1, 0, 0}, nCount = 1, nRate = 1},	
  };
   function tbRandom(tbAward)
 	local nRanVar =random(1,100);
	local num = 0; row = 0
	for row=1,getn(tbAward) do
		num = num + tbAward[row].nRate;
		if nRanVar <= num then
			return row
		end
	end
 end
 
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	if (GetTask(Task_IsCurUse_VongHoa) ~= 0) then
		Talk(1,"","B�n �ang s� d�ng v�t ph�m !")
		return 1
	end
	if (GetTask(Task_BeUse_VongHoa) >= nMaxEXP) then
		Talk(1,"","S� d�ng v�ng hoa ��t t�i �a �i�m kinh nghi�m !")
		return 1
	end
	if (GetLevel() < 50) then
		Talk(1,"","��ng c�p nh� h�n 50 kh�ng th� s� d�ng !")
		return 1
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "H�nh trang kh�ng �� 5 � tr�ng.");
			return 1
	end
	
	local nPlayerIndex = SearchPlayer(GetName())
	if(nPlayerIndex > 0)then
		local nValue = tbRandom(tbAwardEXPTuDo)
		if (nValue==nil) then
					nValue = 1
		end
		SetTask(Task_BeUse_VongHoa, GetTask(Task_BeUse_VongHoa) + tbAwardEXPTuDo[nValue].nExp_tl/10000)
		lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardEXPTuDo[nValue] , "Nh�n EXP s� d�ng v�ng hoa t� do")
		lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardItemTuDo , "nh�n th��ng Item s� d�ng v�ng hoa t� do")
	end
end
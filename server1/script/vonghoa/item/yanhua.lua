Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

 tbData = {}
  tbAwardEXPQuocKhanh=
 {
 	{nExp_tl=250000, nRate = 29},
 	{nExp_tl=300000, nRate = 31},
 	{nExp_tl=350000, nRate = 40},
 };
  tbAwardEXPDocLap=
 {
 	{nExp_tl=500000, nRate = 29},
 	{nExp_tl=550000, nRate = 31},
 	{nExp_tl=600000, nRate = 40},
 };

  tbAwardItemDocLap=
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
 
function Create_main(nItemIndex)
	SetTask(Task_IsCurUse_VongHoa,1)
	local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
	local nPosX, nPosY, nMapIndex = GetPos()
	local nNpcIndex = AddNpcEx(1575, 1, 5, nMapIndex, nPosX, nPosY, 1, " ", 0)
	SetTask(Task_NPC_InDex,nNpcIndex)
	tbData[nNpcIndex] = {szPlayerName = GetName(), nCount = 0, nP = parttype};
	local nTimerId = AddTimer(18*10, "OnTime", nNpcIndex)
	SetTask(Task_TimerId, nTimerId)
end

function CalcDistance(nx1, ny1, nx2, ny2)
	return ( (nx1-nx2)^2 + (ny1-ny2)^2 )
end;

function OnTime(nNpcIndex, nTimerId)

	local tbData = tbData[nNpcIndex]

	if not tbData then
		if nNpcIndex > 0 then
			DelNpc(nNpcIndex)
		end
		return 0,0
	end
	
	
	
	tbData.nCount = tbData.nCount + 1
	--Msg2Player("B�n nh�n ���c kinh nghi�m l�n th� "..tbData.nCount)
	
	local nPlayerIndex = SearchPlayer(tbData.szPlayerName)
	
	if nPlayerIndex > 0 then
		
		local nNpcX, nNpcY, nNpcMapIndex = GetNpcPos(nNpcIndex)
		local nX, nY, nMapIndex = lib:DoFunByPlayer(nPlayerIndex, GetPos)
		
		if CalcDistance(nX/32, nY/32, nNpcX/32, nNpcY/32) <= 144 then
			if (tbData.nP == 30033) then
				local nValue = tbRandom(tbAwardEXPQuocKhanh)
				if (nValue==nil) then
					nValue = 1
				end
				local nTaskBeUse = lib:DoFunByPlayer(nPlayerIndex, GetTask,Task_BeUse_VongHoa)
				local nTotalEXP = nTaskBeUse + tbAwardEXPQuocKhanh[nValue].nExp_tl/10000
				lib:DoFunByPlayer(nPlayerIndex, SetTask,Task_BeUse_VongHoa , nTotalEXP)
				--SetTask(Task_BeUse_VongHoa, GetTask(Task_BeUse_VongHoa) + tbAwardEXPQuocKhanh[nValue].nExp_tl/10000)
				lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardEXPQuocKhanh[nValue] , "Nh�n EXP s� d�ng v�ng hoa qu�c kh�nh")
			end
			if (tbData.nP == 30034) then
				local nValue = tbRandom(tbAwardEXPDocLap)
				if (nValue==nil) then
					nValue = 1
				end
				local nTaskBeUse = lib:DoFunByPlayer(nPlayerIndex, GetTask,Task_BeUse_VongHoa)
				local nTotalEXP = nTaskBeUse + tbAwardEXPDocLap[nValue].nExp_tl/10000
				lib:DoFunByPlayer(nPlayerIndex, SetTask,Task_BeUse_VongHoa , nTotalEXP)
				--SetTask(Task_BeUse_VongHoa, GetTask(Task_BeUse_VongHoa) +  tbAwardEXPDocLap[nValue].nExp_tl/10000)
				lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardEXPDocLap[nValue] , "Nh�n EXP s� d�ng v�ng hoa ��c l�p")
			end
		end
	end
	
	if tbData.nCount >= 12 then
		lib:DoFunByPlayer(nPlayerIndex, SetTask,Task_IsCurUse_VongHoa , 0)
		if nNpcIndex > 0 then
			SetTask(Task_NPC_InDex,0)
			DelNpc(nNpcIndex)
			
			if (tbData.nP == 30034) then
				lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardItemDocLap , "nh�n th��ng Item s� d�ng v�ng hoa ��c l�p")
			end
			lib:DoFunByPlayer(nPlayerIndex, Msg2Player,"Th�i gian s� d�ng v�ng hoa k�t th�c !")
		end
		return 0,0
	else
		return 18*10, nNpcIndex
	end
	
end
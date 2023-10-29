Include("\\script\\activitysys\\config\\22\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

--�ſ��ƶһ�����
function pActivity:AddDukangjiuAward(TSK_EXP_A,TSK_DATE_A,nCount)
	--��鱳���Ƿ�������һ��1*1�Ŀ�λ
	if(CalcFreeItemCellCount() < 1) then
		Say("H�nh trang kh�ng �� ch�, c�n �t nh�t kh�ng gian 1*1", 0);
		return
	end
	--�ȴӱ����п۳��ſ���
	if (ConsumeItem(3, nCount, 6,1,2572,-1) ~= 1) then
		return
	end
	
	--����Ӧ�üӵľ���
	local nBigRateExp = 500000
	local nSmallRateExp = 1000000
	local nDailyUpExp = 20000000 
	local nTaskDailyCount = self:GetTaskA(TSK_EXP_A,TSK_DATE_A)
	local nTemp = nDailyUpExp - nTaskDailyCount
	if (nTemp < nBigRateExp) then
		nBigRateExp = nTemp
	end
	if (nTemp < nSmallRateExp) then
		nSmallRateExp = nTemp
	end
	--������
	local tbAward = 
	{
		{
			[1] = {nExp = nBigRateExp},
			[2] = {szName="T�y H� Long T�nh Tr�", tbProp={6,1,2573,1,0,0},nCount = 3,nExpiredTime=20101213},
			[3] = 
			{
				pFun = function (tbItem, nItemCount, szLogTitle)
					%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, %nBigRateExp * nItemCount)
				end
			},
			nRate = 80,
		},
		{
			[1] = {nExp = nSmallRateExp},
			[2] = {szName="T�y H� Long T�nh Tr�", tbProp={6,1,2573,1,0,0},nCount = 6,nExpiredTime=20101213},
			
			[3] = 
			{
				pFun = function (tbItem, nItemCount, szLogTitle)
					%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, %nSmallRateExp * nItemCount)
				end
			},
			nRate = 20,
		}
	}
	tbAwardTemplet:GiveAwardByRate(tbAward, "Ph�n th��ng ��i �� Khang T�u")
	Say("R��u ngon! R��u ngon, kh�ng ph�i d� d�ng c� ng��i �� t� hi�u th�o nh� v�y. �� �� �, ta c� m�t �t T�y H� Long T�nh Tr� t�ng ng��i n�!")
end

--��˿������õ�����
function pActivity:AddSichouxiangbaoAward(TSK_EXP_A)
	local nUpExp = 1e6
	local nRateExp1 = 2000000
	local nRateExp2 = 2500000
	local nRateExp3 = 3000000
	local nTaskValue = self:GetTask(TSK_EXP_A)
	local nTemp = (nUpExp - nTaskValue) * 10000
	if (nTemp < nRateExp1) then
		nRateExp1 = nTemp
	end
	if(nTemp < nRateExp2) then
		nRateExp2 = nTemp
	end
	if(nTemp < nRateExp3) then
		nRateExp3 = nTemp
	end
	local tbAward = 
	{
		{
			[1] = {nExp = nRateExp1},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp1 / 10000)
				end
			},
			nRate = 70,
		},
		{
			[1] = {nExp = nRateExp2},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp2 / 10000)
				end
			},
			nRate = 20,
		},
		{
			[1] = {nExp = nRateExp3},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp3 / 10000)
				end
			},
			nRate = 10,
		},
	}
	tbAwardTemplet:GiveAwardByRate(tbAward, "Ph�n th��ng t� t�m h��ng bao")
end

function pActivity:CheckFreeRoom(nWidth, nHeight, nCount, szMsg)
	if(CountFreeRoomByWH(nWidth,nHeight,1) >= nCount) then	
		return 1
	else
		szMsg = format("H�nh trang kh�ng ��, c�n �t nh�t h�nh trang c�n th�a %d %d*%d � tr�ng", nCount, nWidth, nHeight)
		Say(szMsg, 0)
	end	
end

--���������õ�����
function pActivity:AddWucaixiangbaoAward(TSK_EXP_A)
	local nUpExp = 1e6
	local nRateExp1 = 5000000
	local nRateExp2 = 6000000
	local nRateExp3 = 8000000
	local nRateExp4 = 10000000
	local nRateExp5 = 20000000
	local nTaskValue = self:GetTask(TSK_EXP_A)
	local nTemp = (nUpExp - nTaskValue) * 10000
	if (nTemp < nRateExp1) then
		nRateExp1 = nTemp
	end
	if (nTemp < nRateExp2) then
		nRateExp2 = nTemp
	end
	if (nTemp < nRateExp3) then
		nRateExp3 = nTemp
	end
	if (nTemp < nRateExp4) then
		nRateExp4 = nTemp
	end
	if (nTemp < nRateExp5) then
		nRateExp5 = nTemp
	end
	local tbAwardEXP = 
	{
		{
			[1] = {nExp = nRateExp1},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp1 / 10000)
				end
			},
			nRate = 67,
		},
		{
			[1] = {nExp = nRateExp2},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp2 / 10000)
				end
			},
			nRate = 20,
		},
		{
			[1] = {nExp = nRateExp3},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp3 / 10000)
				end
			},
			nRate = 10,
		},
		{
			[1] = {nExp = nRateExp4},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp4 / 10000)
				end
			},
			nRate = 2,
		},
		{
			[1] = {nExp = nRateExp5},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp5 / 10000)
				end
			},
			nRate = 1,
		},
	}
	local tbAward = 
	{
		{szName="Huy�n Vi�n Tr� Tu� Ch�u Li�m", tbProp={0,1595}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Tr� Tu� T�ng M�o", tbProp={0,1596}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Tr� Tu� Th��ng Gi�i", tbProp={0,1597}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Tr� Tu� H� Uy�n", tbProp={0,1598}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Tr� Tu� Y�u ��i", tbProp={0,1599}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Tr� Tu� C� Sa", tbProp={0,1600}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Tr� Tu� Tri�n Th�", tbProp={0,1601}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Tr� Tu� T�ng H�i", tbProp={0,1602}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Tr� Tu� Y�u Tr�y", tbProp={0,1603}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Tr� Tu� H� Gi�i", tbProp={0,1604}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Vi�n M�n Ph�t Ch�u", tbProp={0,1605}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Vi�n M�n T�ng M�o", tbProp={0,1606}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Vi�n M�n Th��ng Gi�i", tbProp={0,1607}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Vi�n M�n H� Uy�n", tbProp={0,1608}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Vi�n M�n Y�u ��i", tbProp={0,1609}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Vi�n M�n C� Sa", tbProp={0,1610}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Vi�n M�n T�ng C�n", tbProp={0,1611}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Vi�n M�n T�ng H�i", tbProp={0,1612}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Vi�n M�n Y�u Tr�y", tbProp={0,1613}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Vi�n M�n H� Gi�i", tbProp={0,1614}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�t T�m H�ng Li�m", tbProp={0,1615}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�t T�m T�ng M�o", tbProp={0,1616}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�t T�m Th��ng Gi�i", tbProp={0,1617}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�t T�m H� Uy�n", tbProp={0,1618}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�t T�m Y�u ��i", tbProp={0,1619}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�t T�m C� Sa", tbProp={0,1620}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�t T�m Gi�i �ao", tbProp={0,1621}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�t T�m T�ng H�i", tbProp={0,1622}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�t T�m Y�u Tr�y", tbProp={0,1623}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�t T�m H� Gi�i", tbProp={0,1624}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Xung Thi�n H�ng Li�m", tbProp={0,1625}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Xung Thi�n Kh�i", tbProp={0,1626}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Xung Thi�n Th��ng Gi�i", tbProp={0,1627}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Xung Thi�n Th�c Uy�n", tbProp={0,1628}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Xung Thi�n Y�u ��i", tbProp={0,1629}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Xung Thi�n Kh�i", tbProp={0,1630}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Xung Thi�n Ch�y", tbProp={0,1631}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Xung Thi�n Ngoa", tbProp={0,1632}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Xung Thi�n B�i", tbProp={0,1633}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Xung Thi�n H� Gi�i", tbProp={0,1634}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Phi V�n H�ng Li�m", tbProp={0,1635}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Phi V�n Kh�i", tbProp={0,1636}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Phi V�n Th��ng Gi�i", tbProp={0,1637}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Phi V�n Th�c Uy�n", tbProp={0,1638}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Phi V�n Y�u ��i", tbProp={0,1639}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Phi V�n Kh�i", tbProp={0,1640}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Phi V�n Th��ng", tbProp={0,1641}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Phi V�n Ngoa", tbProp={0,1642}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Phi V�n Y�u Tr�y", tbProp={0,1643}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng H� Gi�i", tbProp={0,1644}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng H�ng Li�m", tbProp={0,1645}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng Kh�i", tbProp={0,1646}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng Th��ng Gi�i", tbProp={0,1647}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng Th�c Uy�n", tbProp={0,1648}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng Y�u ��i", tbProp={0,1649}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng Kh�i", tbProp={0,1650}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng B�o �ao", tbProp={0,1651}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng Ngoa", tbProp={0,1652}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng Y�u Tr�y", tbProp={0,1653}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Anh D�ng H� Gi�i", tbProp={0,1654}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n T�nh �m Ch�u Li�m", tbProp={0,1655}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n T�nh �m Ph�t ��i", tbProp={0,1656}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n T�nh �m Th��ng Gi�i", tbProp={0,1657}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n T�nh �m H� Uy�n", tbProp={0,1658}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n T�nh �m Th�c Y�u", tbProp={0,1659}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n T�nh �m Sa Y", tbProp={0,1660}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n T�nh �m Ki�m", tbProp={0,1661}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n T�nh �m H�i", tbProp={0,1662}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n T�nh �m H��ng Nang", tbProp={0,1663}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n T�nh �m H� Gi�i", tbProp={0,1664}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n B�ng Ch�u Li�m", tbProp={0,1665}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n B�ng Ph�t ��i", tbProp={0,1666}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n B�ng Th��ng Gi�i", tbProp={0,1667}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n B�ng H� Uy�n", tbProp={0,1668}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n B�ng Th�c Y�u", tbProp={0,1669}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n B�ng Sam", tbProp={0,1670}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n B�ng Tri�n Th�", tbProp={0,1671}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n B�ng H�i", tbProp={0,1672}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n B�ng H��ng Nang", tbProp={0,1673}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n B�ng H� Gi�i", tbProp={0,1674}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Nguy�t Hoa Ch�u Li�m", tbProp={0,1675}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Nguy�t Hoa Tr�m", tbProp={0,1676}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Nguy�t Hoa Th��ng Gi�i", tbProp={0,1677}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Nguy�t Hoa T�", tbProp={0,1678}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Nguy�t Hoa Th�c Y�u", tbProp={0,1679}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Nguy�t Hoa Sam", tbProp={0,1680}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Nguy�t Hoa �ao", tbProp={0,1681}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Nguy�t Hoa Ngoa", tbProp={0,1682}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Nguy�t Hoa H��ng Nang", tbProp={0,1683}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Nguy�t Hoa H� Gi�i", tbProp={0,1684}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�n Hoa Ch�u Li�m", tbProp={0,1685}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�n Hoa Tr�m", tbProp={0,1686}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�n Hoa Th��ng Gi�i", tbProp={0,1687}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�n Hoa T�", tbProp={0,1688}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�n Hoa Y�u ��i", tbProp={0,1689}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�n Hoa Sam", tbProp={0,1690}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�n Hoa Uy�n ��ng �ao", tbProp={0,1691}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�n Hoa Ngoa", tbProp={0,1692}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�n Hoa H��ng Nang", tbProp={0,1693}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Ph�n Hoa H� Gi�i", tbProp={0,1694}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n �o�n Tr��ng H�ng Li�m", tbProp={0,1695}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n �o�n Tr��ng Ph�t ��i", tbProp={0,1696}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n �o�n Tr��ng Th��ng Gi�i", tbProp={0,1697}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n �o�n Tr��ng H� Uy�n", tbProp={0,1698}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n �o�n Tr��ng Y�u ��i", tbProp={0,1699}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n �o�n Tr��ng B� Trang", tbProp={0,1700}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n �o�n Tr��ng Tri�n Th�", tbProp={0,1701}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n �o�n Tr��ng Ngoa", tbProp={0,1702}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n �o�n Tr��ng Y�u Tr�y", tbProp={0,1703}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n �o�n Tr��ng H� Gi�i", tbProp={0,1704}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Huy�t S�t H�ng Li�m", tbProp={0,1705}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Huy�t S�t Ph�t ��i", tbProp={0,1706}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Huy�t S�t Th��ng Gi�i", tbProp={0,1707}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Huy�t S�t H� Uy�n", tbProp={0,1708}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Huy�t S�t Y�u ��i", tbProp={0,1709}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Huy�t S�t B� Trang", tbProp={0,1710}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Huy�t S�t �ao", tbProp={0,1711}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Huy�t S�t Ngoa", tbProp={0,1712}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Huy�t S�t Y�u Tr�y", tbProp={0,1713}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n Huy�t S�t H� Gi�i", tbProp={0,1714}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n L�nh T�m H�ng Li�m", tbProp={0,1715}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n L�nh T�m Qu�n", tbProp={0,1716}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n L�nh T�m Th��ng Gi�i", tbProp={0,1717}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n L�nh T�m H� Uy�n", tbProp={0,1718}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n L�nh T�m Tri�n Y�u", tbProp={0,1719}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n L�nh T�m Gi�p Y", tbProp={0,1720}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n L�nh T�m Phi �ao", tbProp={0,1721}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n L�nh T�m L�", tbProp={0,1722}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n L�nh T�m Tr�y", tbProp={0,1723}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n L�nh T�m H� Gi�i", tbProp={0,1724}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n V� T�nh H�ng Li�m", tbProp={0,1725}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n V� T�nh Qu�n", tbProp={0,1726}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n V� T�nh Th��ng Gi�i", tbProp={0,1727}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n V� T�nh H� Uy�n", tbProp={0,1728}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n V� T�nh Th�c Y�u", tbProp={0,1729}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n V� T�nh Gi�p", tbProp={0,1730}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n V� T�nh T�Ti�n", tbProp={0,1731}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n V� T�nh L�", tbProp={0,1732}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n V� T�nh Y�u Tr�y", tbProp={0,1733}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n V� T�nh H� Gi�i", tbProp={0,1734}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n Quang Li�m", tbProp={0,1735}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n Quang Ph�t Qu�n", tbProp={0,1736}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n Quang Th��ng Gi�i", tbProp={0,1737}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n Quang H� Uy�n", tbProp={0,1738}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n Quang Th�c Y�u", tbProp={0,1739}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n Quang Gi�p Y", tbProp={0,1740}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n Quang Ti�u", tbProp={0,1741}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n Quang L�", tbProp={0,1742}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n Quang Tr�y", tbProp={0,1743}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n H�n Quang H� Gi�i", tbProp={0,1744}, nQuality=1, nRate=0.002},	
		{szName="Huy�n Vi�n D��ng C��ng H�ng Li�m", tbProp={0,1745}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n D��ng C��ng ��u Ho�n", tbProp={0,1746}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n D��ng C��ng Th��ng Gi�i", tbProp={0,1747}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n D��ng C��ng H� Uy�n", tbProp={0,1748}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n D��ng C��ng Th�c Y�u", tbProp={0,1749}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n D��ng C��ng C�i Y", tbProp={0,1750}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n D��ng C��ng Tri�n Th�", tbProp={0,1751}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n D��ng C��ng Ngoa", tbProp={0,1752}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n D��ng C��ng Y�u Tr�y", tbProp={0,1753}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n D��ng C��ng H� Gi�i", tbProp={0,1754}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Chi�n Long H�ng Li�m", tbProp={0,1755}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Chi�n Long ��u Ho�n", tbProp={0,1756}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Chi�n Long Th��ng Gi�i", tbProp={0,1757}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Chi�n Long H� Uy�n", tbProp={0,1758}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Chi�n Long Th�c Y�u", tbProp={0,1759}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Chi�n Long C�i Y", tbProp={0,1760}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Chi�n Long Tr��ng", tbProp={0,1761}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Chi�n Long Ngoa", tbProp={0,1762}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Chi�n Long Y�u Tr�y", tbProp={0,1763}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Chi�n Long H� Gi�i", tbProp={0,1764}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n L�c H�n H�ng Khuy�n", tbProp={0,1765}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n L�c H�n Kh�i", tbProp={0,1766}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n L�c H�n Th��ng Gi�i", tbProp={0,1767}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n L�c H�n H� Uy�n", tbProp={0,1768}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n L�c H�n Y�u ��i", tbProp={0,1769}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n L�c H�n Gi�p Y", tbProp={0,1770}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n L�c H�n Th��ng", tbProp={0,1771}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n L�c H�n Ngoa", tbProp={0,1772}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n L�c H�n B�i", tbProp={0,1773}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n L�c H�n H� Gi�i", tbProp={0,1774}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ch��c T�nh H�ng Li�m", tbProp={0,1775}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ch��c T�nh Qu�n Mi�n", tbProp={0,1776}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ch��c T�nh Th��ng Gi�i", tbProp={0,1777}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ch��c T�nh H� Uy�n", tbProp={0,1778}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ch��c T�nh Y�u ��i", tbProp={0,1779}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ch��c T�nh Gi�p Y", tbProp={0,1780}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ch��c T�nh �ao", tbProp={0,1781}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ch��c T�nh Ngoa", tbProp={0,1782}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ch��c T�nh B�i", tbProp={0,1783}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ch��c T�nh H� Gi�i", tbProp={0,1784}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tam Phong Ph�", tbProp={0,1785}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tam Phong Qu�n", tbProp={0,1786}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tam Phong Th��ng Gi�i", tbProp={0,1787}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tam Phong T�", tbProp={0,1788}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tam Phong Ph�p ��i", tbProp={0,1789}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tam Phong ��o B�o", tbProp={0,1790}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tam Phong Ki�m", tbProp={0,1791}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tam Phong L�", tbProp={0,1792}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tam Phong Ng�c B�i", tbProp={0,1793}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tam Phong H� Gi�i", tbProp={0,1794}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tu T�m Ph�", tbProp={0,1795}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tu T�m Qu�n", tbProp={0,1796}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tu T�m Th��ng Gi�i", tbProp={0,1797}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tu T�m T�", tbProp={0,1798}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tu T�m Ph�p ��i", tbProp={0,1799}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tu T�m ��o B�o", tbProp={0,1800}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tu T�m Ki�m", tbProp={0,1801}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tu T�m L�", tbProp={0,1802}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tu T�m Ng�c B�i", tbProp={0,1803}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Tu T�m H� Gi�i", tbProp={0,1804}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Xuy�n V�n H�ng Li�m", tbProp={0,1805}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Xuy�n V�n ��o Qu�n", tbProp={0,1806}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Xuy�n V�n Th��ng Gi�i", tbProp={0,1807}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Xuy�n V�n H� Uy�n", tbProp={0,1808}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Xuy�n V�n Y�u ��i", tbProp={0,1809}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Xuy�n V�n ��o B�o", tbProp={0,1810}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Xuy�n V�n Nh�n", tbProp={0,1811}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Xuy�n V�n Ngoa", tbProp={0,1812}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Xuy�n V�n B�i", tbProp={0,1813}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Xuy�n V�n H� Gi�i", tbProp={0,1814}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ph� B�ng Ph�", tbProp={0,1815}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ph� B�ng ��o Qu�n", tbProp={0,1816}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ph� B�ng Th��ng Gi�i", tbProp={0,1817}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ph� B�ng Th�", tbProp={0,1818}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ph� B�ng Y�u ��i", tbProp={0,1819}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ph� B�ng ��o B�o", tbProp={0,1820}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ph� B�ng Tr��ng Ki�m", tbProp={0,1821}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ph� B�ng Ngoa", tbProp={0,1822}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ph� B�ng B�i", tbProp={0,1823}, nQuality=1, nRate=0.0025},	
		{szName="Huy�n Vi�n Ph� B�ng H� Gi�i", tbProp={0,1824}, nQuality=1, nRate=0.0025},	
		{szName="H�n Nguy�n Linh L�", tbProp={6,1,2312,1,0,0}, nCount=1, nRate=4},	
		{szName="Huy�n Thi�n C�m Nang", tbProp={6,1,2355,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="Long Huy�t Ho�n", tbProp={6,1,2117,1,0,0}, nCount=1, nRate=3, nExpiredTime=20101220},	
		{szName="H�i Long Ch�u", tbProp={6,1,2115,1,0,0}, nCount=1, nRate=3, nExpiredTime=20101220},	
		{szName="S�t Th� Gi�n l� h�p", tbProp={6,1,2339,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="M�nh b�n �� s�n h� x� t�c (1000 m�nh)", tbProp={6,1,2514,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="M�c B�c Truy�n T�ng L�nh", tbProp={6,1,1448,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="Ng�c Qu�n", tbProp={6,1,2311,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="B�ch Ni�n Tr�n L�", tbProp={6,1,2266,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="B�ch C�u Ho�n ��c Bi�t", tbProp={6,1,1157,1,0,0}, nCount=1, nRate=4},	
		{szName="Thi�n Tinh b�ch C�u Ho�n", tbProp={6,1,2183,1,0,0}, nCount=1, nRate=2},	
		{szName="Thi�n Ni�n Tr�n L�", tbProp={6,1,2267,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="V�n Ni�n Tr�n L�", tbProp={6,1,2268,1,0,0}, nCount=1, nRate=2, nExpiredTime=20101220},	
		{szName="��i L�c ho�n L� bao", tbProp={6,1,2517,1,0,0}, nCount=1, nRate=5},	
		{szName="Phi t�c ho�n L� bao", tbProp={6,1,2520,1,0,0}, nCount=1, nRate=5},	
		{szName="B�ch C�t L�nh", tbProp={6,1,2255,1,0,0}, nCount=1, nRate=5, nExpiredTime=20101220},	
		{szName="Ti�n Th�o L� ��c bi�t", tbProp={6,1,1181,1,0,0}, nCount=1, nRate=5},	
		{szName="Ph� Qu� C�m H�p", tbProp={6,1,2402,1,0,0}, nCount=1, nRate=14.6, nExpiredTime=20101220},	
		{szName="N�n B�t Tr�n Ph�c Nguy�t", tbProp={6,1,1817,1,0,0}, nCount=1, nRate=10},	
		{szName="Ng�n l��ng", nJxb =1000000, nRate=10},	
		{szName="Ng�n l��ng", nJxb =2000000, nRate=2},	
		{szName="Ng�n l��ng", nJxb =5000000, nRate=1},	
		{szName="Ng�n l��ng", nJxb =10000000, nRate=0.5},	
		{szName="Nh�t K� C�n Kh�n Ph�", tbProp={6,1,2126,1,0,0}, nCount=1, nRate=0.2, nExpiredTime=43200},	
		{szName="H�ng Bao Sum V�y", tbProp={6,1,2104,1,0,0}, nCount=1, nRate=0.2},	
		{szName="C�m nang thay ��i tr�i ��t", tbProp={6,1,1781,1,0,0}, nCount=1, nRate=3, tbParam={60}},	

	}
	tbAwardTemplet:GiveAwardByList(tbAward, "Ph�n th��ng ng� s�c h��ng bao")
	tbAwardTemplet:GiveAwardByList(tbAwardEXP, "Ph�n th��ng EXP ng� s�c h��ng bao")
end

--����ҩ����õ�����
function pActivity:AddZhongyaoxiangbaoAward(TSK_EXP_A)
	local nUpExp = 1e6
	local nRateExp1 = 25000000
	local nRateExp2 = 30000000
	local nRateExp3 = 40000000
	local nRateExp4 = 50000000
	local nRateExp5 = 100000000
	local nTaskValue = self:GetTask(TSK_EXP_A)
	local nTemp = (nUpExp - nTaskValue) * 10000
	if (nTemp < nRateExp1) then
		nRateExp1 = nTemp
	end
	if (nTemp < nRateExp2) then
		nRateExp2 = nTemp
	end
	if (nTemp < nRateExp3) then
		nRateExp3 = nTemp
	end
	if (nTemp < nRateExp4) then
		nRateExp4 = nTemp
	end
	if (nTemp < nRateExp5) then
		nRateExp5 = nTemp
	end
	local tbAwardEXP = 
	{
		{
			[1] = {nExp = nRateExp1},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp1 / 10000)
				end
			},
			nRate = 60,
		},
		{
			[1] = {nExp = nRateExp2},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp2 / 10000)
				end
			},
			nRate = 27,
		},
		{
			[1] = {nExp = nRateExp3},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp3 / 10000)
				end
			},
			nRate = 10,
		},
		{
			[1] = {nExp = nRateExp4},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp4 / 10000)
				end
			},
			nRate = 2,
		},
		{
			[1] = {nExp = nRateExp5},
			[2] = 
			{
				pFun = function(tbItem, nItemCount, szLogTitle)
					%self:AddTask(%TSK_EXP_A, %nRateExp5 / 10000)
				end
			},
			nRate = 1,
		},
	}
	local tbAward = 
	{
		{szName="Huy�n Vi�n L�nh", tbProp={6,1,2351,1,0,0}, nRate=1, nCount=1},	
		{szName="H�n Nguy�n Linh L�", tbProp={6,1,2312,1,0,0}, nRate=4, nCount=5},	
		{szName="Thi�n Long L�nh", tbProp={6,1,2256,1,0,0}, nRate=5, nCount=5, nExpiredTime=20101220},	
		{szName="Ti�n Th�o L� ��c bi�t", tbProp={6,1,1181,1,0,0}, nRate=10, nCount=2, nExpiredTime=20101220},	
		{szName="Ph� Qu� C�m H�p", tbProp={6,1,2402,1,0,0}, nRate=17.7, nCount=5, nExpiredTime=20101220},	
		{szName="V�n Ni�n Tr�n L�", tbProp={6,1,2268,1,0,0}, nRate=10, nCount=2, nExpiredTime=20101220},	
		{szName="V�n Ni�n Ng� Th�i Hoa", tbProp={6,1,2265,1,0,0}, nRate=1, nCount=1},	
		{szName="Thi�n Ni�n Th�t Tinh Th�o", tbProp={6,1,1675,1,0,0}, nRate=1, nCount=1},	
		{szName="B�ch C�u Ho�n ��c Bi�t", tbProp={6,1,1157,1,0,0}, nRate=14, nCount=1},	
		{szName="Thi�n Tinh b�ch C�u Ho�n", tbProp={6,1,2183,1,0,0}, nRate=6, nCount=1},	
		{szName="Ng�n l��ng", nJxb =10000000, nRate=5},	
		{szName="Ng�n l��ng", nJxb =20000000, nRate=2},	
		{szName="Ng�n l��ng", nJxb =50000000, nRate=1},	
		{szName="Ng�n l��ng", nJxb =100000000, nRate=0.2},	
		{szName="Nh�t K� C�n Kh�n Ph�", tbProp={6,1,2126,1,0,0}, nRate=2, nCount=1, nExpiredTime=43200},	
		{szName="C�n Kh�n Song Tuy�t B�i", tbProp={6,1,2219,1,0,0}, nRate=0.1, nCount=1, nExpiredTime=86400},	
		{szName="��i L�c ho�n L� bao", tbProp={6,1,2517,1,0,0}, nRate=5, nCount=5},	
		{szName="Phi t�c ho�n L� bao", tbProp={6,1,2520,1,0,0}, nRate=5, nCount=5},	
		{szName="H�ng Bao Sum V�y", tbProp={6,1,2104,1,0,0}, nRate=3, nCount=1},	
		{szName="H�ng Bao An Khang", tbProp={6,1,2105,1,0,0}, nRate=1, nCount=1},	
		{szName="C�m nang thay ��i tr�i ��t", tbProp={6,1,1781,1,0,0}, nRate=6, nCount=5, tbParam={60}},	
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "Ph�n th��ng trung d��c h��ng bao")
	tbAwardTemplet:GiveAwardByList(tbAwardEXP, "Ph�n th��ng EXP trung d��c h��ng bao")
end

function pActivity:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nRecordDate = self:GetTask(TSK_DATE_A)
	
	if nCurDate ~= nRecordDate then
		self:SetTask(TSK_DATE_A, nCurDate)
		self:SetTask(TSK_EXP_A, 0)
	end
end

function pActivity:CheckTaskA(TSK_EXP_A, TSK_DATE_A, nTargetValue, szFailMsg, szOption)

	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:CheckTask(TSK_EXP_A, nTargetValue, szFailMsg, szOption)
end

function pActivity:AddTaskA(TSK_EXP_A, TSK_DATE_A, nAddValue)
	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:AddTask(TSK_EXP_A, nAddValue)
end

function pActivity:GetTaskA(TSK_EXP_A, TSK_DATE_A)
	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:GetTask(TSK_EXP_A)
end

function pActivity:AddExpB(TSK_EXP_B,nTskBExpLimit,nAddExp,nbStack,szLogTitle, szFailMsg)
	
	if self:GetTask(TSK_EXP_B) >= nTskBExpLimit then
		return Msg2Player(szFailMsg)
	end
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\playerfunlib.lua", "PlayerFunLib:AddExp", nAddExp, nbStack, szLogTitle)
	self:AddTask(TSK_EXP_B, nAddExp)
end

function pActivity:AddDialogNpc(szNpcName, nNpcId, tbNpcPos)
	for i=1, getn(tbNpcPos) do
		local pPos = tbNpcPos[i]
		
		local nMapIndex = SubWorldID2Idx(pPos[1])
		if nMapIndex > 0 then
			local nNpcIndex = AddNpc(nNpcId, 1, nMapIndex, pPos[2] * 32, pPos[3] * 32, 0, szNpcName);
			SetNpcScript(nNpcIndex, "\\script\\activitysys\\npcdailog.lua");	
		end		
	end
end

function pActivity:Give5SHB(nEXP_Give_NSHB, TSK_Date_Give_NSHB)
	
	if (PlayerFunLib:CheckTaskDaily(TSK_Date_Give_NSHB,8,"M�i ng�y ch� c� th� t�ng 8 Ng� S�c H��ng Bao !","<") ~= 1) then
			return
	end
	if (ConsumeEquiproomItem(1, 6,1,2578,-1) ~= 1) then
		return
	end
	PlayerFunLib:AddTaskDaily(TSK_Date_Give_NSHB,1)
	AddOwnExp(nEXP_Give_NSHB)
	Msg2Player("Ban nh�n ���c 8000000 �i�m kinh nghi�m")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 20112010"..GetAccount().."\t"..GetName().."\t".."T�ng Ng� S�c H��ng Bao ")
end
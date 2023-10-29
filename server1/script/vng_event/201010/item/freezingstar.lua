Include("\\script\\lib\\awardtemplet.lua")

tbAwardLamBangTinh 		=  {szName = "�i�m kinh nghi�m", nExp = 3e6}

tbAwardHoangBangTinh 	= {szName = "�i�m kinh nghi�m", nExp = 2e6}

tbAwardTuBangTinh 	=
{
	[1] = 
	{
		{szName="�i�m kinh nghi�m", nExp=5000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=67},	
		{szName="�i�m kinh nghi�m", nExp=6000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=20},	
		{szName="�i�m kinh nghi�m", nExp=8000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=10},	
		{szName="�i�m kinh nghi�m", nExp=10000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=2},	
		{szName="�i�m kinh nghi�m", nExp=20000000, pFun = function(self, nItemCount, szLogTitle) SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) + self.nExp/1e6) end, nRate=1},	
	},
	[2] =
	{
		{szName="Huy�n Vi�n Tr� Tu� Ch�u Li�m", tbProp={0,1595}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Tr� Tu� T�ng M�o", tbProp={0,1596}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Tr� Tu� Th��ng Gi�i", tbProp={0,1597}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Tr� Tu� H� Uy�n", tbProp={0,1598}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Tr� Tu� Y�u ��i", tbProp={0,1599}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Tr� Tu� C� Sa", tbProp={0,1600}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Tr� Tu� Tri�n Th�", tbProp={0,1601}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Tr� Tu� T�ng H�i", tbProp={0,1602}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Tr� Tu� Y�u Tr�y", tbProp={0,1603}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Tr� Tu� H� Gi�i", tbProp={0,1604}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Vi�n M�n Ph�t Ch�u", tbProp={0,1605}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Vi�n M�n T�ng M�o", tbProp={0,1606}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Vi�n M�n Th��ng Gi�i", tbProp={0,1607}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Vi�n M�n H� Uy�n", tbProp={0,1608}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Vi�n M�n Y�u ��i", tbProp={0,1609}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Vi�n M�n C� Sa", tbProp={0,1610}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Vi�n M�n T�ng C�n", tbProp={0,1611}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Vi�n M�n T�ng H�i", tbProp={0,1612}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Vi�n M�n Y�u Tr�y", tbProp={0,1613}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Vi�n M�n H� Gi�i", tbProp={0,1614}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�t T�m H�ng Li�m", tbProp={0,1615}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�t T�m T�ng M�o", tbProp={0,1616}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�t T�m Th��ng Gi�i", tbProp={0,1617}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�t T�m H� Uy�n", tbProp={0,1618}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�t T�m Y�u ��i", tbProp={0,1619}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�t T�m C� Sa", tbProp={0,1620}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�t T�m Gi�i �ao", tbProp={0,1621}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�t T�m T�ng H�i", tbProp={0,1622}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�t T�m Y�u Tr�y", tbProp={0,1623}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�t T�m H� Gi�i", tbProp={0,1624}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Xung Thi�n H�ng Li�m", tbProp={0,1625}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Xung Thi�n Kh�i", tbProp={0,1626}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Xung Thi�n Th��ng Gi�i", tbProp={0,1627}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Xung Thi�n Th�c Uy�n", tbProp={0,1628}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Xung Thi�n Y�u ��i", tbProp={0,1629}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Xung Thi�n Kh�i", tbProp={0,1630}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Xung Thi�n Ch�y", tbProp={0,1631}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Xung Thi�n Ngoa", tbProp={0,1632}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Xung Thi�n B�i", tbProp={0,1633}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Xung Thi�n H� Gi�i", tbProp={0,1634}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Phi V�n H�ng Li�m", tbProp={0,1635}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Phi V�n Kh�i", tbProp={0,1636}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Phi V�n Th��ng Gi�i", tbProp={0,1637}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Phi V�n Th�c Uy�n", tbProp={0,1638}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Phi V�n Y�u ��i", tbProp={0,1639}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Phi V�n Kh�i", tbProp={0,1640}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Phi V�n Th��ng", tbProp={0,1641}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Phi V�n Ngoa", tbProp={0,1642}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Phi V�n Y�u Tr�y", tbProp={0,1643}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng H� Gi�i", tbProp={0,1644}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng H�ng Li�m", tbProp={0,1645}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng Kh�i", tbProp={0,1646}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng Th��ng Gi�i", tbProp={0,1647}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng Th�c Uy�n", tbProp={0,1648}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng Y�u ��i", tbProp={0,1649}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng Kh�i", tbProp={0,1650}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng B�o �ao", tbProp={0,1651}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng Ngoa", tbProp={0,1652}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng Y�u Tr�y", tbProp={0,1653}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Anh D�ng H� Gi�i", tbProp={0,1654}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n T�nh �m Ch�u Li�m", tbProp={0,1655}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n T�nh �m Ph�t ��i", tbProp={0,1656}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n T�nh �m Th��ng Gi�i", tbProp={0,1657}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n T�nh �m H� Uy�n", tbProp={0,1658}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n T�nh �m Th�c Y�u", tbProp={0,1659}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n T�nh �m Sa Y", tbProp={0,1660}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n T�nh �m Ki�m", tbProp={0,1661}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n T�nh �m H�i", tbProp={0,1662}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n T�nh �m H��ng Nang", tbProp={0,1663}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n T�nh �m H� Gi�i", tbProp={0,1664}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n B�ng Ch�u Li�m", tbProp={0,1665}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n B�ng Ph�t ��i", tbProp={0,1666}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n B�ng Th��ng Gi�i", tbProp={0,1667}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n B�ng H� Uy�n", tbProp={0,1668}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n B�ng Th�c Y�u", tbProp={0,1669}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n B�ng Sam", tbProp={0,1670}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n B�ng Tri�n Th�", tbProp={0,1671}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n B�ng H�i", tbProp={0,1672}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n B�ng H��ng Nang", tbProp={0,1673}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n B�ng H� Gi�i", tbProp={0,1674}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Nguy�t Hoa Ch�u Li�m", tbProp={0,1675}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Nguy�t Hoa Tr�m", tbProp={0,1676}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Nguy�t Hoa Th��ng Gi�i", tbProp={0,1677}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Nguy�t Hoa T�", tbProp={0,1678}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Nguy�t Hoa Th�c Y�u", tbProp={0,1679}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Nguy�t Hoa Sam", tbProp={0,1680}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Nguy�t Hoa �ao", tbProp={0,1681}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Nguy�t Hoa Ngoa", tbProp={0,1682}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Nguy�t Hoa H��ng Nang", tbProp={0,1683}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Nguy�t Hoa H� Gi�i", tbProp={0,1684}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�n Hoa Ch�u Li�m", tbProp={0,1685}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�n Hoa Tr�m", tbProp={0,1686}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�n Hoa Th��ng Gi�i", tbProp={0,1687}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�n Hoa T�", tbProp={0,1688}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�n Hoa Y�u ��i", tbProp={0,1689}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�n Hoa Sam", tbProp={0,1690}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�n Hoa Uy�n ��ng �ao", tbProp={0,1691}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�n Hoa Ngoa", tbProp={0,1692}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�n Hoa H��ng Nang", tbProp={0,1693}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Ph�n Hoa H� Gi�i", tbProp={0,1694}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n �o�n Tr��ng H�ng Li�m", tbProp={0,1695}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n �o�n Tr��ng Ph�t ��i", tbProp={0,1696}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n �o�n Tr��ng Th��ng Gi�i", tbProp={0,1697}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n �o�n Tr��ng H� Uy�n", tbProp={0,1698}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n �o�n Tr��ng Y�u ��i", tbProp={0,1699}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n �o�n Tr��ng B� Trang", tbProp={0,1700}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n �o�n Tr��ng Tri�n Th�", tbProp={0,1701}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n �o�n Tr��ng Ngoa", tbProp={0,1702}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n �o�n Tr��ng Y�u Tr�y", tbProp={0,1703}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n �o�n Tr��ng H� Gi�i", tbProp={0,1704}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Huy�t S�t H�ng Li�m", tbProp={0,1705}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Huy�t S�t Ph�t ��i", tbProp={0,1706}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Huy�t S�t Th��ng Gi�i", tbProp={0,1707}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Huy�t S�t H� Uy�n", tbProp={0,1708}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Huy�t S�t Y�u ��i", tbProp={0,1709}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Huy�t S�t B� Trang", tbProp={0,1710}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Huy�t S�t �ao", tbProp={0,1711}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Huy�t S�t Ngoa", tbProp={0,1712}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Huy�t S�t Y�u Tr�y", tbProp={0,1713}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n Huy�t S�t H� Gi�i", tbProp={0,1714}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n L�nh T�m H�ng Li�m", tbProp={0,1715}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n L�nh T�m Qu�n", tbProp={0,1716}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n L�nh T�m Th��ng Gi�i", tbProp={0,1717}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n L�nh T�m H� Uy�n", tbProp={0,1718}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n L�nh T�m Tri�n Y�u", tbProp={0,1719}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n L�nh T�m Gi�p Y", tbProp={0,1720}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n L�nh T�m Phi �ao", tbProp={0,1721}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n L�nh T�m L�", tbProp={0,1722}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n L�nh T�m Tr�y", tbProp={0,1723}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n L�nh T�m H� Gi�i", tbProp={0,1724}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n V� T�nh H�ng Li�m", tbProp={0,1725}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n V� T�nh Qu�n", tbProp={0,1726}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n V� T�nh Th��ng Gi�i", tbProp={0,1727}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n V� T�nh H� Uy�n", tbProp={0,1728}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n V� T�nh Th�c Y�u", tbProp={0,1729}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n V� T�nh Gi�p", tbProp={0,1730}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n V� T�nh T�Ti�n", tbProp={0,1731}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n V� T�nh L�", tbProp={0,1732}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n V� T�nh Y�u Tr�y", tbProp={0,1733}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n V� T�nh H� Gi�i", tbProp={0,1734}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n Quang Li�m", tbProp={0,1735}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n Quang Ph�t Qu�n", tbProp={0,1736}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n Quang Th��ng Gi�i", tbProp={0,1737}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n Quang H� Uy�n", tbProp={0,1738}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n Quang Th�c Y�u", tbProp={0,1739}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n Quang Gi�p Y", tbProp={0,1740}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n Quang Ti�u", tbProp={0,1741}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n Quang L�", tbProp={0,1742}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n Quang Tr�y", tbProp={0,1743}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n H�n Quang H� Gi�i", tbProp={0,1744}, nRate=0.004, nQuality=1},	
		{szName="Huy�n Vi�n D��ng C��ng H�ng Li�m", tbProp={0,1745}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n D��ng C��ng ��u Ho�n", tbProp={0,1746}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n D��ng C��ng Th��ng Gi�i", tbProp={0,1747}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n D��ng C��ng H� Uy�n", tbProp={0,1748}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n D��ng C��ng Th�c Y�u", tbProp={0,1749}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n D��ng C��ng C�i Y", tbProp={0,1750}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n D��ng C��ng Tri�n Th�", tbProp={0,1751}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n D��ng C��ng Ngoa", tbProp={0,1752}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n D��ng C��ng Y�u Tr�y", tbProp={0,1753}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n D��ng C��ng H� Gi�i", tbProp={0,1754}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Chi�n Long H�ng Li�m", tbProp={0,1755}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Chi�n Long ��u Ho�n", tbProp={0,1756}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Chi�n Long Th��ng Gi�i", tbProp={0,1757}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Chi�n Long H� Uy�n", tbProp={0,1758}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Chi�n Long Th�c Y�u", tbProp={0,1759}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Chi�n Long C�i Y", tbProp={0,1760}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Chi�n Long Tr��ng", tbProp={0,1761}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Chi�n Long Ngoa", tbProp={0,1762}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Chi�n Long Y�u Tr�y", tbProp={0,1763}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Chi�n Long H� Gi�i", tbProp={0,1764}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n L�c H�n H�ng Khuy�n", tbProp={0,1765}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n L�c H�n Kh�i", tbProp={0,1766}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n L�c H�n Th��ng Gi�i", tbProp={0,1767}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n L�c H�n H� Uy�n", tbProp={0,1768}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n L�c H�n Y�u ��i", tbProp={0,1769}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n L�c H�n Gi�p Y", tbProp={0,1770}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n L�c H�n Th��ng", tbProp={0,1771}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n L�c H�n Ngoa", tbProp={0,1772}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n L�c H�n B�i", tbProp={0,1773}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n L�c H�n H� Gi�i", tbProp={0,1774}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ch��c T�nh H�ng Li�m", tbProp={0,1775}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ch��c T�nh Qu�n Mi�n", tbProp={0,1776}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ch��c T�nh Th��ng Gi�i", tbProp={0,1777}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ch��c T�nh H� Uy�n", tbProp={0,1778}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ch��c T�nh Y�u ��i", tbProp={0,1779}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ch��c T�nh Gi�p Y", tbProp={0,1780}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ch��c T�nh �ao", tbProp={0,1781}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ch��c T�nh Ngoa", tbProp={0,1782}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ch��c T�nh B�i", tbProp={0,1783}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ch��c T�nh H� Gi�i", tbProp={0,1784}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tam Phong Ph�", tbProp={0,1785}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tam Phong Qu�n", tbProp={0,1786}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tam Phong Th��ng Gi�i", tbProp={0,1787}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tam Phong T�", tbProp={0,1788}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tam Phong Ph�p ��i", tbProp={0,1789}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tam Phong ��o B�o", tbProp={0,1790}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tam Phong Ki�m", tbProp={0,1791}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tam Phong L�", tbProp={0,1792}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tam Phong Ng�c B�i", tbProp={0,1793}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tam Phong H� Gi�i", tbProp={0,1794}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tu T�m Ph�", tbProp={0,1795}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tu T�m Qu�n", tbProp={0,1796}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tu T�m Th��ng Gi�i", tbProp={0,1797}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tu T�m T�", tbProp={0,1798}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tu T�m Ph�p ��i", tbProp={0,1799}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tu T�m ��o B�o", tbProp={0,1800}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tu T�m Ki�m", tbProp={0,1801}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tu T�m L�", tbProp={0,1802}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tu T�m Ng�c B�i", tbProp={0,1803}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Tu T�m H� Gi�i", tbProp={0,1804}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Xuy�n V�n H�ng Li�m", tbProp={0,1805}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Xuy�n V�n ��o Qu�n", tbProp={0,1806}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Xuy�n V�n Th��ng Gi�i", tbProp={0,1807}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Xuy�n V�n H� Uy�n", tbProp={0,1808}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Xuy�n V�n Y�u ��i", tbProp={0,1809}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Xuy�n V�n ��o B�o", tbProp={0,1810}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Xuy�n V�n Nh�n", tbProp={0,1811}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Xuy�n V�n Ngoa", tbProp={0,1812}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Xuy�n V�n B�i", tbProp={0,1813}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Xuy�n V�n H� Gi�i", tbProp={0,1814}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ph� B�ng Ph�", tbProp={0,1815}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ph� B�ng ��o Qu�n", tbProp={0,1816}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ph� B�ng Th��ng Gi�i", tbProp={0,1817}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ph� B�ng Th�", tbProp={0,1818}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ph� B�ng Y�u ��i", tbProp={0,1819}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ph� B�ng ��o B�o", tbProp={0,1820}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ph� B�ng Tr��ng Ki�m", tbProp={0,1821}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ph� B�ng Ngoa", tbProp={0,1822}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ph� B�ng B�i", tbProp={0,1823}, nRate=0.005, nQuality=1},	
		{szName="Huy�n Vi�n Ph� B�ng H� Gi�i", tbProp={0,1824}, nRate=0.005, nQuality=1},	
		{szName="Th��ng Lang L�nh", tbProp={6,1,2352,1,0,0}, nRate=1},	
		{szName="V�n L�c L�nh", tbProp={6,1,2353,1,0,0}, nRate=1},	
		{szName="Ng�c Qu�n", tbProp={6,1,2311,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="Huy�n Thi�n C�m Nang", tbProp={6,1,2355,1,0,0}, nRate=2},	
		{szName="Long Huy�t Ho�n", tbProp={6,1,2117,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="H�i Long Ch�u", tbProp={6,1,2115,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="��i L�c ho�n L� bao", tbProp={6,1,2517,1,0,0}, nRate=3},	
		{szName="Phi t�c ho�n L� bao", tbProp={6,1,2520,1,0,0}, nRate=3},	
		{szName="B�ch Ni�n Tr�n L�", tbProp={6,1,2266,1,0,0}, nRate=5},	
		{szName="Thi�n Ni�n Tr�n L�", tbProp={6,1,2267,1,0,0}, nRate=2},	
		{szName="V�n Ni�n Tr�n L�", tbProp={6,1,2268,1,0,0}, nRate=1},	
		{szName="B�o T�c ho�n", tbProp={6,1,219,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="Ph� C�ng ho�n", tbProp={6,1,229,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="��c C�ng ho�n", tbProp={6,1,230,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="B�ng C�ng ho�n", tbProp={6,1,231,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="H�a C�ng ho�n", tbProp={6,1,232,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="L�i C�ng ho�n", tbProp={6,1,233,1,0,0}, nRate=3, nExpiredTime=10080},	
		{szName="Ti�n Th�o L� (��c Bi�t)", tbProp={6,1,1765,1,0,0}, nRate=4},	
		{szName="H�ng Bao An Khang", tbProp={6,1,2105,1,0,0}, nRate=0.2},	
		{szName="Ph� Qu� C�m H�p", tbProp={6,1,2402,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="B�ch C�t L�nh", tbProp={6,1,2255,1,0,0}, nRate=5, nExpiredTime=20101118},	
		{szName="M�nh b�n �� S�n H� X� T�c (1000 m�nh)", tbProp={6,1,2514,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="M�c B�c Truy�n T�ng L�nh", tbProp={6,1,1448,1,0,0}, nRate=2, nExpiredTime=20101118},	
		{szName="Ng� H�nh K� Th�ch", tbProp={6,1,2125,1,0,0}, nRate=7.1},	
		{szName="Linh D��c Th�nh ��", tbProp={6,1,30062,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D��c ��i L�", tbProp={6,1,30063,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D��c Ph��ng T��ng", tbProp={6,1,30064,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D��c T��ng D��ng", tbProp={6,1,30065,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D��c Bi�n Kinh", tbProp={6,1,30066,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D��c L�m An", tbProp={6,1,30067,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Linh D��c D��ng Ch�u", tbProp={6,1,30068,1,0,0}, nRate=3, nExpiredTime=20101118},	
		{szName="Ng�n l��ng", nRate =5, nJxb=1000000},	
		{szName="Ng�n l��ng", nRate =2, nJxb=2000000},	
		{szName="Ng�n l��ng", nRate =0.5, nJxb=5000000},	
		{szName="Ng�n l��ng", nRate =0.2, nJxb=10000000},	
	},
}

TASK_LIMIT_USE_LAMBANGTINH 					= 2772
TASK_LIMIT_USE_HOANG_TU_BANGTINH		= 2773

function main(nItemIndex)

	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.")
		return 0;
	end
	
	if (GetLevel() < 50) then
		Say("C�p 50 tr� l�n m�i c� th� s� d�ng v�t ph�m n�y!",0)
		return 1
	end

	if CountFreeRoomByWH(2,3,1) < 1 then
		Talk(1, "", "H�nh trang ��i hi�p kh�ng �� 2x3 � tr�ng!.");
		return 1
	end
	
	local G,D,P,nLevel = GetItemProp(nItemIndex);
	
	if (P == 30059) then -- lam bang tinh
		if (GetTask(TASK_LIMIT_USE_LAMBANGTINH) >= 1000) then
			Say("��i hi�p �� ��t t�i �a s� l�n s� d�ng Lam B�ng Tinh!",0)
			return 1
		end
		SetTask(TASK_LIMIT_USE_LAMBANGTINH, GetTask(TASK_LIMIT_USE_LAMBANGTINH)+1)
		tbAwardTemplet:GiveAwardByList(tbAwardLamBangTinh, "S� d�ng Lam B�ng Tinh");
		return 0
	end
	
	if (P == 30060) then -- hoang bang tinh
		if (GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) >= 6000) then
			Say("��i hi�p �� ��t t�i �a s� l�n s� d�ng v�t ph�m n�y!",0)
			return 1
		end
		SetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH, GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH)+2)
		tbAwardTemplet:GiveAwardByList(tbAwardHoangBangTinh, "S� d�ng Ho�ng B�ng Tinh");
		return 0
	end
	
	if (P == 30061) then -- tu bang tinh
		if (GetTask(TASK_LIMIT_USE_HOANG_TU_BANGTINH) >= 6000) then
			Say("��i hi�p �� ��t t�i �a s� l�n s� d�ng v�t ph�m n�y!",0)
			return 1
		end
		tbAwardTemplet:GiveAwardByList(tbAwardTuBangTinh, "S� d�ng T� B�ng Tinh ");
		return 0
	end
	
	Say("V�t ph�m kh�ng th� x�c ��nh!",0)
	return 1
end
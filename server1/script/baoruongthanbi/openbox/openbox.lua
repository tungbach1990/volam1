Include("\\script\\baoruongthanbi\\head.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
tbAWard=
{
	[1]=
	{
		{szName = "�i�m kinh nghi�m", nExp_tl=1000000000},
	},
	[2]=
	{
		{szName = "�i�m kinh nghi�m", nExp_tl=100000000},
	},
	[3]=
	{
		{szName = "�i�m kinh nghi�m", nExp_tl=20000000},
	},
	[4]=
	{
		{szName = "�i�m kinh nghi�m", nExp_tl=6000000},
	},
	
}
tbAwardItem = 
{
	{szName = "Huy�n Vi�n Tr� Tu� Ch�u Li�m", tbProp = {0, 1595}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tr� Tu� T�ng M�o", tbProp = {0, 1596}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Tr� Tu� Th��ng Gi�i", tbProp = {0, 1597}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tr� Tu� H� Uy�n", tbProp = {0, 1598}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tr� Tu� Y�u ��i", tbProp = {0, 1599}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Tr� Tu� C� Sa", tbProp = {0, 1600}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tr� Tu� Tri�n Th�", tbProp = {0, 1601}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tr� Tu� T�ng H�i", tbProp = {0, 1602}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tr� Tu� Y�u Tr�y", tbProp = {0, 1603}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tr� Tu� H� Gi�i", tbProp = {0, 1604}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Vi�n M�n Ph�t Ch�u", tbProp = {0, 1605}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Vi�n M�n T�ng M�o", tbProp = {0, 1606}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Vi�n M�n Th��ng Gi�i", tbProp = {0, 1607}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Vi�n M�n H� Uy�n", tbProp = {0, 1608}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Vi�n M�n Y�u ��i", tbProp = {0, 1609}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Vi�n M�n C� Sa", tbProp = {0, 1610}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Vi�n M�n T�ng C�n", tbProp = {0, 1611}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Vi�n M�n T�ng H�i", tbProp = {0, 1612}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Vi�n M�n Y�u Tr�y", tbProp = {0, 1613}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Vi�n M�n H� Gi�i", tbProp = {0, 1614}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�t T�m H�ng Li�m", tbProp = {0, 1615}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�t T�m T�ng M�o", tbProp = {0, 1616}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�t T�m Th��ng Gi�i", tbProp = {0, 1617}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�t T�m H� Uy�n", tbProp = {0, 1618}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Ph�t T�m Y�u ��i", tbProp = {0, 1619}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�t T�m C� Sa", tbProp = {0, 1620}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�t T�m Gi�i �ao", tbProp = {0, 1621}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Ph�t T�m T�ng H�i", tbProp = {0, 1622}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�t T�m Y�u Tr�y", tbProp = {0, 1623}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�t T�m H� Gi�i", tbProp = {0, 1624}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xung Thi�n H�ng Li�m", tbProp = {0, 1625}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xung Thi�n Kh�i", tbProp = {0, 1626}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xung Thi�n Th��ng Gi�i", tbProp = {0, 1627}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xung Thi�n Th�c Uy�n", tbProp = {0, 1628}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Xung Thi�n Y�u ��i", tbProp = {0, 1629}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xung Thi�n Kh�i", tbProp = {0, 1630}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Xung Thi�n Ch�y", tbProp = {0, 1631}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xung Thi�n Ngoa", tbProp = {0, 1632}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xung Thi�n B�i", tbProp = {0, 1633}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xung Thi�n H� Gi�i", tbProp = {0, 1634}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Phi V�n H�ng Li�m", tbProp = {0, 1635}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Phi V�n Kh�i", tbProp = {0, 1636}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Phi V�n Th��ng Gi�i", tbProp = {0, 1637}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Phi V�n Th�c Uy�n", tbProp = {0, 1638}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Phi V�n Y�u ��i", tbProp = {0, 1639}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Phi V�n Kh�i", tbProp = {0, 1640}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Phi V�n Th��ng", tbProp = {0, 1641}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Phi V�n Ngoa", tbProp = {0, 1642}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Phi V�n Y�u Tr�y", tbProp = {0, 1643}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Anh D�ng H� Gi�i", tbProp = {0, 1644}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Anh D�ng H�ng Li�m", tbProp = {0, 1645}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Anh D�ng Kh�i", tbProp = {0, 1646}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Anh D�ng Th��ng Gi�i", tbProp = {0, 1647}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Anh D�ng Th�c Uy�n", tbProp = {0, 1648}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Anh D�ng Y�u ��i", tbProp = {0, 1649}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Anh D�ng Kh�i", tbProp = {0, 1650}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Anh D�ng B�o �ao", tbProp = {0, 1651}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Anh D�ng Ngoa", tbProp = {0, 1652}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Anh D�ng Y�u Tr�y", tbProp = {0, 1653}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Anh D�ng H� Gi�i", tbProp = {0, 1654}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n T�nh �m Ch�u Li�m", tbProp = {0, 1655}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n T�nh �m Ph�t ��i", tbProp = {0, 1656}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n T�nh �m Th��ng Gi�i", tbProp = {0, 1657}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n T�nh �m H� Uy�n", tbProp = {0, 1658}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n T�nh �m Th�c Y�u", tbProp = {0, 1659}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n T�nh �m Sa Y", tbProp = {0, 1660}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n T�nh �m Ki�m", tbProp = {0, 1661}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n T�nh �m H�i", tbProp = {0, 1662}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n T�nh �m H��ng Nang", tbProp = {0, 1663}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n T�nh �m H� Gi�i", tbProp = {0, 1664}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n H�n B�ng Ch�u Li�m", tbProp = {0, 1665}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n B�ng Ph�t ��i", tbProp = {0, 1666}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n H�n B�ng Th��ng Gi�i", tbProp = {0, 1667}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n B�ng H� Uy�n", tbProp = {0, 1668}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n B�ng Th�c Y�u", tbProp = {0, 1669}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n B�ng Sam", tbProp = {0, 1670}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n B�ng Tri�n Th�", tbProp = {0, 1671}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n B�ng H�i", tbProp = {0, 1672}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n H�n B�ng H��ng Nang", tbProp = {0, 1673}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n B�ng H� Gi�i", tbProp = {0, 1674}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Nguy�t Hoa Ch�u Li�m", tbProp = {0, 1675}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Nguy�t Hoa Tr�m", tbProp = {0, 1676}, nQuality = 1, nRate = 1.8},
{szName = "Huy�n Vi�n Nguy�t Hoa Th��ng Gi�i", tbProp = {0, 1677}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Nguy�t Hoa T�", tbProp = {0, 1678}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Nguy�t Hoa Th�c Y�u", tbProp = {0, 1679}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Nguy�t Hoa Sam", tbProp = {0, 1680}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Nguy�t Hoa �ao", tbProp = {0, 1681}, nQuality = 1, nRate = 1.9},
{szName = "Huy�n Vi�n Nguy�t Hoa Ngoa", tbProp = {0, 1682}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Nguy�t Hoa H��ng Nang", tbProp = {0, 1683}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Nguy�t Hoa H� Gi�i", tbProp = {0, 1684}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�n Hoa Ch�u Li�m", tbProp = {0, 1685}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�n Hoa Tr�m", tbProp = {0, 1686}, nQuality = 1, nRate = 1.8},
{szName = "Huy�n Vi�n Ph�n Hoa Th��ng Gi�i", tbProp = {0, 1687}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�n Hoa T�", tbProp = {0, 1688}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�n Hoa Y�u ��i", tbProp = {0, 1689}, nQuality = 1, nRate = 1.8},
{szName = "Huy�n Vi�n Ph�n Hoa Sam", tbProp = {0, 1690}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�n Hoa Uy�n ��ng �ao", tbProp = {0, 1691}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�n Hoa Ngoa", tbProp = {0, 1692}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�n Hoa H��ng Nang", tbProp = {0, 1693}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph�n Hoa H� Gi�i", tbProp = {0, 1694}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n �o�n Tr��ng H�ng Li�m", tbProp = {0, 1695}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n �o�n Tr��ng Ph�t ��i", tbProp = {0, 1696}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n �o�n Tr��ng Th��ng Gi�i", tbProp = {0, 1697}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n �o�n Tr��ng H� Uy�n", tbProp = {0, 1698}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n �o�n Tr��ng Y�u ��i", tbProp = {0, 1699}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n �o�n Tr��ng B� Trang", tbProp = {0, 1700}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n �o�n Tr��ng Tri�n Th�", tbProp = {0, 1701}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n �o�n Tr��ng Ngoa", tbProp = {0, 1702}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n �o�n Tr��ng Y�u Tr�y", tbProp = {0, 1703}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n �o�n Tr��ng H� Gi�i", tbProp = {0, 1704}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Huy�t S�t H�ng Li�m", tbProp = {0, 1705}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Huy�t S�t Ph�t ��i", tbProp = {0, 1706}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Huy�t S�t Th��ng Gi�i", tbProp = {0, 1707}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Huy�t S�t H� Uy�n", tbProp = {0, 1708}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Huy�t S�t Y�u ��i", tbProp = {0, 1709}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Huy�t S�t B� Trang", tbProp = {0, 1710}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Huy�t S�t �ao", tbProp = {0, 1711}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Huy�t S�t Ngoa", tbProp = {0, 1712}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Huy�t S�t Y�u Tr�y", tbProp = {0, 1713}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Huy�t S�t H� Gi�i", tbProp = {0, 1714}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�nh T�m H�ng Li�m", tbProp = {0, 1715}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n L�nh T�m Qu�n", tbProp = {0, 1716}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�nh T�m Th��ng Gi�i", tbProp = {0, 1717}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�nh T�m H� Uy�n", tbProp = {0, 1718}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�nh T�m Tri�n Y�u", tbProp = {0, 1719}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�nh T�m Gi�p Y", tbProp = {0, 1720}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n L�nh T�m Phi �ao", tbProp = {0, 1721}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�nh T�m L�", tbProp = {0, 1722}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�nh T�m Tr�y", tbProp = {0, 1723}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�nh T�m H� Gi�i", tbProp = {0, 1724}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n V� T�nh H�ng Li�m", tbProp = {0, 1725}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n V� T�nh Qu�n", tbProp = {0, 1726}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n V� T�nh Th��ng Gi�i", tbProp = {0, 1727}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n V� T�nh H� Uy�n", tbProp = {0, 1728}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n V� T�nh Th�c Y�u", tbProp = {0, 1729}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n V� T�nh Gi�p", tbProp = {0, 1730}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n V� T�nh T�Ti�n", tbProp = {0, 1731}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n V� T�nh L�", tbProp = {0, 1732}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n V� T�nh Y�u Tr�y", tbProp = {0, 1733}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n V� T�nh H� Gi�i", tbProp = {0, 1734}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n Quang Li�m", tbProp = {0, 1735}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n Quang Ph�t Qu�n", tbProp = {0, 1736}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n Quang Th��ng Gi�i", tbProp = {0, 1737}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n H�n Quang H� Uy�n", tbProp = {0, 1738}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n Quang Th�c Y�u", tbProp = {0, 1739}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n Quang Gi�p Y", tbProp = {0, 1740}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n H�n Quang Ti�u", tbProp = {0, 1741}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n Quang L�", tbProp = {0, 1742}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n Quang Tr�y", tbProp = {0, 1743}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n H�n Quang H� Gi�i", tbProp = {0, 1744}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n D��ng C��ng H�ng Li�m", tbProp = {0, 1745}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n D��ng C��ng ��u Ho�n", tbProp = {0, 1746}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n D��ng C��ng Th��ng Gi�i", tbProp = {0, 1747}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n D��ng C��ng H� Uy�n", tbProp = {0, 1748}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n D��ng C��ng Th�c Y�u", tbProp = {0, 1749}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n D��ng C��ng C�i Y", tbProp = {0, 1750}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n D��ng C��ng Tri�n Th�", tbProp = {0, 1751}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n D��ng C��ng Ngoa", tbProp = {0, 1752}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n D��ng C��ng Y�u Tr�y", tbProp = {0, 1753}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n D��ng C��ng H� Gi�i", tbProp = {0, 1754}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Chi�n Long H�ng Li�m", tbProp = {0, 1755}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Chi�n Long ��u Ho�n", tbProp = {0, 1756}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Chi�n Long Th��ng Gi�i", tbProp = {0, 1757}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Chi�n Long H� Uy�n", tbProp = {0, 1758}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Chi�n Long Th�c Y�u", tbProp = {0, 1759}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Chi�n Long C�i Y", tbProp = {0, 1760}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Chi�n Long Tr��ng", tbProp = {0, 1761}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Chi�n Long Ngoa", tbProp = {0, 1762}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Chi�n Long Y�u Tr�y", tbProp = {0, 1763}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Chi�n Long H� Gi�i", tbProp = {0, 1764}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n L�c H�n H�ng Khuy�n", tbProp = {0, 1765}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�c H�n Kh�i", tbProp = {0, 1766}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�c H�n Th��ng Gi�i", tbProp = {0, 1767}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�c H�n H� Uy�n", tbProp = {0, 1768}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�c H�n Y�u ��i", tbProp = {0, 1769}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n L�c H�n Gi�p Y", tbProp = {0, 1770}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�c H�n Th��ng", tbProp = {0, 1771}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�c H�n Ngoa", tbProp = {0, 1772}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n L�c H�n B�i", tbProp = {0, 1773}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n L�c H�n H� Gi�i", tbProp = {0, 1774}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ch��c T�nh H�ng Li�m", tbProp = {0, 1775}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ch��c T�nh Qu�n Mi�n", tbProp = {0, 1776}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ch��c T�nh Th��ng Gi�i", tbProp = {0, 1777}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ch��c T�nh H� Uy�n", tbProp = {0, 1778}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Ch��c T�nh Y�u ��i", tbProp = {0, 1779}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ch��c T�nh Gi�p Y", tbProp = {0, 1780}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ch��c T�nh �ao", tbProp = {0, 1781}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Ch��c T�nh Ngoa", tbProp = {0, 1782}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ch��c T�nh B�i", tbProp = {0, 1783}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ch��c T�nh H� Gi�i", tbProp = {0, 1784}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tam Phong Ph�", tbProp = {0, 1785}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Tam Phong Qu�n", tbProp = {0, 1786}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tam Phong Th��ng Gi�i", tbProp = {0, 1787}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tam Phong T�", tbProp = {0, 1788}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tam Phong Ph�p ��i", tbProp = {0, 1789}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tam Phong ��o B�o", tbProp = {0, 1790}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Tam Phong Ki�m", tbProp = {0, 1791}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tam Phong L�", tbProp = {0, 1792}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tam Phong Ng�c B�i", tbProp = {0, 1793}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tam Phong H� Gi�i", tbProp = {0, 1794}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tu T�m Ph�", tbProp = {0, 1795}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tu T�m Qu�n", tbProp = {0, 1796}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tu T�m Th��ng Gi�i", tbProp = {0, 1797}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Tu T�m T�", tbProp = {0, 1798}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tu T�m Ph�p ��i", tbProp = {0, 1799}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tu T�m ��o B�o", tbProp = {0, 1800}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tu T�m Ki�m", tbProp = {0, 1801}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Tu T�m L�", tbProp = {0, 1802}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tu T�m Ng�c B�i", tbProp = {0, 1803}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Tu T�m H� Gi�i", tbProp = {0, 1804}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xuy�n V�n H�ng Li�m", tbProp = {0, 1805}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xuy�n V�n ��o Qu�n", tbProp = {0, 1806}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xuy�n V�n Th��ng Gi�i", tbProp = {0, 1807}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xuy�n V�n H� Uy�n", tbProp = {0, 1808}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xuy�n V�n Y�u ��i", tbProp = {0, 1809}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Xuy�n V�n ��o B�o", tbProp = {0, 1810}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xuy�n V�n Nh�n", tbProp = {0, 1811}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xuy�n V�n Ngoa", tbProp = {0, 1812}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Xuy�n V�n B�i", tbProp = {0, 1813}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Xuy�n V�n H� Gi�i", tbProp = {0, 1814}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph� B�ng Ph�", tbProp = {0, 1815}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph� B�ng ��o Qu�n", tbProp = {0, 1816}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph� B�ng Th��ng Gi�i", tbProp = {0, 1817}, nQuality = 1, nRate = 1.5},
{szName = "Huy�n Vi�n Ph� B�ng Th�", tbProp = {0, 1818}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph� B�ng Y�u ��i", tbProp = {0, 1819}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph� B�ng ��o B�o", tbProp = {0, 1820}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph� B�ng Tr��ng Ki�m", tbProp = {0, 1821}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph� B�ng Ngoa", tbProp = {0, 1822}, nQuality = 1, nRate = 1.6},
{szName = "Huy�n Vi�n Ph� B�ng B�i", tbProp = {0, 1823}, nQuality = 1, nRate = 0.15},
{szName = "Huy�n Vi�n Ph� B�ng H� Gi�i", tbProp = {0, 1824}, nQuality = 1, nRate = 0.15},

}
function OpenBox_main()
	GiveItemUI("M� B�o R��ng", "M� b�o r��ng c�n 1 b�o r��ng v� 1 ch�a kh�a v�n n�ng", "ConfirmOpenBox", "OnCancel");
end

function ConfirmOpenBox(nCount)
	local nBoxValue, nKeyValue = 0
	if (nCount ~= 2) then 
		Talk(1, "", "M� b�o r��ng ch� c�n 1 B�o r��ng th�n b� v� 1 Ch�a kh�a v�n n�ng c� c�ng m� s� !");
		return
	end
	local lag1, lag2, nBoxIndex,nKeyIndex = 0
	
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)	
		local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
		if (parttype == 30036) then--box
			lag1 = 1
			nBoxIndex = nItemIndex
		end
		if (parttype == 30037) then--key
			lag2 = 1
			nKeyIndex = nItemIndex
		end
	end--for
	if (lag1 == 1 and lag2 ==1) then
		nBoxValue = GetBoxValue(nBoxIndex)
		nKeyValue = GetKeyValue(nKeyIndex)
		if (nKeyValue >= 10000) then--if user in put key 5 so thi bat buoc phai trung giai nhat
			if ( ConpareValue(nBoxValue, nKeyValue, nKeyIndex) ~= 1) then
				Talk(1, "", "��i hi�p xin h�y ki�m tra l�i m� s� tr�n R��ng v� Ch�a Kh�a !");
				return
			end
		end
	else
		Talk(1, "", "��i hi�p xin h�y b� v�o ��ng v�t ph�m !");
		return
	end
	local result = ConpareValue(nBoxValue, nKeyValue, nKeyIndex)
	if (result==0) then
		Talk(1, "", "B�o r��ng th�n b� n�y mu�n m� ra ph�i t�m 1 Ch�a kh�a v�n n�ng �t nh�t c� 2 m� s� ��u tr�ng nhau !");
		return 0
	end
	 if (result == 1) then
	--giai nhat
		--Say("<#> ��i hi�p �� t�m ra m� s� m� t�t c� c�c ng�n trong B�o r��ng, ��i hi�p mu�n nh�n v�t ph�m trong r��ng ch� ?", 2,
				--"Ta mu�n nh�n/# GetBonusOpenBox(1,"..nBoxIndex..", "..nKeyIndex..")",
				--"H�y b� /OnCancel")
				GetBonusOpenBox(1,nBoxIndex, nKeyIndex)
	end
	if (result == 2) then
	--giai nhi
--		Say("<#> ��i hi�p �� t�m ra m� s� m� ng�n th� ba trong B�o r��ng, ��i hi�p mu�n nh�n v�t ph�m trong r��ng ch� ?", 2,
--				"Ta mu�n nh�n/# GetBonusOpenBox(2,"..nBoxIndex..", "..nKeyIndex..")",
--				"H�y b� /OnCancel")
				GetBonusOpenBox(2,nBoxIndex, nKeyIndex)
	end
	if (result == 3) then
	--giai 3
--		Say("<#> ��i hi�p �� t�m ra m� s� m� ng�n th� nh� trong B�o r��ng, ��i hi�p mu�n nh�n v�t ph�m trong r��ng ch� ?", 2,
--				"Ta mu�n nh�n/# GetBonusOpenBox(3,"..nBoxIndex..", "..nKeyIndex..")",
--				"H�y b� /OnCancel")
				GetBonusOpenBox(3,nBoxIndex, nKeyIndex)
	end
	if (result == 4) then
--		Say("<#> ��i hi�p �� t�m ra m� s� m� ng�n th� nh�t trong B�o r��ng, ��i hi�p mu�n nh�n v�t ph�m trong r��ng ch� ?", 2,
--				"Ta mu�n nh�n/# GetBonusOpenBox(4,"..nBoxIndex..", "..nKeyIndex..")",
--				"H�y b� /OnCancel")
				GetBonusOpenBox(4,nBoxIndex, nKeyIndex)
	end
	
	
	
end

function GetBonusOpenBox(nValue, nBoxIndex, nKeyIndex)
	if (nValue==1) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox1,1,"M�i ng�y ch� c� th� m� 1 B�o R��ng Th�n B� lo�i 5 s�","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","H�nh trang kh�ng �� 10 � tr�ng !")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox1,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "Nh�n th��ng B�o R��ng Th�n B� h�ng 1");
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Nh�n th��ng Item B�o R��ng Th�n B� h�ng 1");
		AddEnergy(1000)
		Msg2Player("Ch�c m�ng ��i hi�p v�a nh�n ���c v�t ph�m m� b�o r��ng")
	end
	if (nValue==2) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox2,2,"M�i ng�y ch� c� th� m� 2 B�o R��ng Th�n B� lo�i 4 s�","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","H�nh trang kh�ng �� 10 � tr�ng !")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox2,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "Nh�n th��ng B�o R��ng Th�n B� h�ng 2");
		AddEnergy(500)
		Msg2Player("Ch�c m�ng ��i hi�p v�a nh�n ���c v�t ph�m m� b�o r��ng")
	end
	if (nValue==3) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox3,5,"M�i ng�y ch� c� th� m� 5 B�o R��ng Th�n B� lo�i 3 s�","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","H�nh trang kh�ng �� 10 � tr�ng !")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox3,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "Nh�n th��ng B�o R��ng Th�n B� h�ng 3");
		AddEnergy(100)
		Msg2Player("Ch�c m�ng ��i hi�p v�a nh�n ���c v�t ph�m m� b�o r��ng")
	end
	if (nValue==4) then
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox4,20,"M�i ng�y ch� c� th� m� 20 B�o R��ng Th�n B� lo�i 2 s�","<") ~= 1) then
			return
		end
		if (CalcFreeItemCellCount() <10) then
			Talk(1,"","H�nh trang kh�ng �� 10 � tr�ng !")
			return
		end
		PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox4,1)
		RemoveItemByIndex(nBoxIndex)
		RemoveItemByIndex(nKeyIndex)
		tbAwardTemplet:GiveAwardByList(tbAWard[nValue], "Nh�n th��ng B�o R��ng Th�n B� h�ng 4");
		AddEnergy(20)
		Msg2Player("Ch�c m�ng ��i hi�p v�a nh�n ���c v�t ph�m m� b�o r��ng")
	end
end

function OnCancel()
end
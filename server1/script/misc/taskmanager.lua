-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - �����������
-- �ļ�������taskmanager.lua
-- �����ߡ����ӳ���
-- ����ʱ�䣺2010-01-13 10:39:47
-- Include("\\script\\misc\\taskmanager.lua") �Լ�
-- ======================================================
--����ֱ��ʹ�ø��ļ�������ͨ���ϵͳ������
--�Ȳ����ѱ���ʹ��ʱ������ TaskGroup
local TaskGroup = {}
TaskManager = {}
TaskManager.tbUseGroup = {}
TaskManager.tbTaskGroup = 
{
	
	[1] = 
		-- date:2010-02-04~2010-03-22;	VN����byһ��;
		-- ����;	VN�������byһ��;
	{
		nCurrentVersion = 2,
		nVersionTask = 852,
		tbTaskSet = {853,854,855,856,857,858,859,862,863,864,865,866,867,868,869,870,871,872,873},
	},
	[2] = 
		-- date:2010-02-04~2010-03-29;	VN�������by����;
		-- date:2010-06-28~2010-08-06;	VN������by�ӳ���;
		-- 2011��06��06��0h:00��2011��06��30��0h��00	VN�������ջ
		--2012/4/2��2012/4/30/24:00 �������
	{
		nCurrentVersion = 4,
		nVersionTask = 874,
		tbTaskSet = {875,876,877,878,879,880,881,882,883,884,885,886,887,888,889,890,891,892,893,},
	},
	[3] = 
		-- date:2010-02-04~2010-03-29; VN����÷��by����
		-- date:2010-06-28~2010-08-06;	VN����by����;
		-- date:2011-10-01~2011-10-31   vn ʮ�»
		-- date:2012-03-05 ~ 2012-03-21 vn 3�»
		-- date: �ʾ����
	{
		nCurrentVersion = 5,
		nVersionTask = 894,
		tbTaskSet = {895,896,897,898,899,900,901,902,903,904,905,906,907,908,909,910,911,912,913,},
	},
	[4] = 
		-- date:2010-02-04~2010-03-29; VN��»���by�ӳ���
		-- date:2010-11-18~2010-12-09; VN��ʦ�ڻby���
		-- date:2011-03-28~2011-04-04; VN2011ֲ���ڻby�����
		-- date:2012-02-10~2012-02-29   vn ���˽ڻ
	{
		nCurrentVersion = 4,
		nVersionTask = 914,
		tbTaskSet = {915,916,917,918,919,920,921,922,923,924,925,926,927,928,929,930,931,932,933,},
	},
	[5] = 
	{
		nCurrentVersion = 3,
		-- date:2010-04-09 00:00~2010-06-07 00:00	JXVN������Ҹ�����byһ��
		-- date:2010-12-21 00:00~2011-01-11 00:00	JXVNԪ��ʥ���byһ��
		-- date:2012-01-01 00:00~2012-02-01 00:00	JXVN���ڻ by ������
		nVersionTask = 934,
		tbTaskSet = {935,936,937,938,939,940,941,942,943,944,945,946,947,948,949,950,951,952,953,},
	},
	[6] = 
	{
		nCurrentVersion = 3,
		-- date:2010-04-09 00:00~2010-06-07 00:00	JXVN�����սʿ��byһ��
		-- date:2011��2��12��0��~2011��2��28��24��	JXVN&IB 2011���˽ڻby������
		-- date:2012-01-01 00:00~2012-02-01 00:00	JX1-vng���ڻ by ������
		nVersionTask = 954,
		tbTaskSet = {955,956,957,958,959,960,961,962,963,964,965,966,967,968,969,970,971,972,973,},
	},
	[7] = 
	{
		nCurrentVersion = 3,
		-- date:2010-04-26 00:00~2010-06-07 00:00	JXVN���������by����
		-- date:2011��2��12��0��~2011��2��28��24��	JXVN&IB 2011���˽ڻby������
		--20120402 00:00 - 20120501 00:00

		nVersionTask = 974,
		tbTaskSet = {975,976,977,978,979,980,981,982,983,984,985,986,987,988,989,990,991,992,993,},
	},
	[8] = 
	{
		nCurrentVersion = 3,
		
		-- date:2011-12-01 00:00~2011-12-31 24:00	JXVNʥ���by�ӳ���
		-- 2012-05-04 ~ 2012-07-31 6�²�ˮ��С�
		nVersionTask = 994,
		tbTaskSet = {995,996,997,998,999,1194,1195,1196,1197,1198,1278,1279,1280,1281,1282,1283,1284,1285,1286,},
	},
	[9] = 
	{
		nCurrentVersion = 3,
		-- date:2011-01-20 00:00~2011-2-20 24:00	JXVN���ڴ���Ⱥ��
		--��2012��4��2�տ�ʼ��2012��4��30��24:00����� 
		nVersionTask = 1287,
		tbTaskSet = {1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1299,1300,1310,1311,1312,1313,1314,1315,},
	},
	[10] = 
	{
		nCurrentVersion = 4,
		-- date:2010-06-10 00:00~2010-06-28 00:00	JXVN���籭�by����
		-- date:2010-08-13 00:00~2010-08-31 24:00	JXVNף���
		--20120503-20120601 ���»
		--20120901-20121001 9�» by ����(LIUJUN4)
		nVersionTask = 1316,
		tbTaskSet = {1317,1318,1319,1320,1321,1322,1323,1324,1325,1326,1327,1328,1329,1330,1331,1332,1333,1334,1335,},
	},
	[11] = 
	{
		nCurrentVersion = 3,
		-- date:2010-09-20~2010-10-18 00:00				JXVN����by����
		-- date:2011-09-01~2011-09-30 24:00				JXVN����
		-- ����											�ģ��
		nVersionTask = 1336,
		tbTaskSet = {1337,1338,1339,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355},
	},
	[12] = 
	{
		-- date:2011/04/21/0h:00~2011/05/23/0h:00			JXVN������ͻ�by�����
		-- date:2011/12/01/0h:00~2011/12/31/0h:00			JXVNʥ���by������
		-- date:2012/12/01/0h:00~2013/01/01/0h:00			JXVN2012ʥ���
		nCurrentVersion = 4,
		nVersionTask = 1356,
		tbTaskSet = {1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,},
	},
	[13] = 
	{
		-- date:2011/11/01/00:00~2011/11/30/24:00			JXVN 11�½�ʦ�ڻ by������
		-- date:2013/03/03/00:00~2013/03/31/24:00			JXVN 3�» by ZhangFan4
		nCurrentVersion = 4,
		nVersionTask = 1376,
		tbTaskSet = {1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393,1394,1395,},
	},
	[14] = 
	{
		--2012-05-10~2012-06-01 ���» �ڶ���С�
		nCurrentVersion = 1,
		nVersionTask = 1501,
		tbTaskSet = {1502,1503,1504,1506,1507,1508,1509,1510,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,},
	},
	[15] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1531,
		tbTaskSet = {1532,1533,1534,1535,1536,1537,1538,1539,1540,1541,1542,1543,1544,1545,1546,1547,1548,1549,1552,},
	},
	[16] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1553,
		tbTaskSet = {1554,1555,1556,1557,1558,1559,1560,1561,1562,1563,1564,1565,1566,1567,1568,1569,1582,1583,1584,},
	},
	[17] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1585,
		tbTaskSet = {1586,1587,1588,1589,1590,1591,1592,1593,1594,1595,1596,1597,1598,1599,1760,1761,1762,1763,1764,},
	},
	[18] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1765,
		tbTaskSet = {1766,1767,1768,1769,1770,1771,1780,1781,1782,1783,1784,1785,1786,1787,1788,1789,1790,1791,1792,},
	},
	[19] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1885,
		tbTaskSet = {1886,1887,1888,1889,1890,1891,1892,1893,1894,1895,1896,1897,1898,1899,1900,1901,1902,1903,1904,},
	},
	[20] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 1905,
		tbTaskSet = {1906,1907,1908,1909,1910,1911,1912,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,},
	},
	
	--VN Task, event 14/2
	[100] = 
	{
		nCurrentVersion = 1,
		nVersionTask = 2972,
		tbTaskSet = {2973, 2974, 2975, 2976, 2977, 2978, 2979, 2980},
	},
}

--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:GetTask(nGroupId, nIndex)
	self:ResetTaskGroup(nGroupId)
	return GetTask(self:GetTaskId(nGroupId, nIndex))
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:SetTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId)
	return SetTask(self:GetTaskId(nGroupId, nIndex), nValue)
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:AddTask(nGroupId, nIndex, nValue)
	self:ResetTaskGroup(nGroupId)
	local nTaskId = self:GetTaskId(nGroupId, nIndex)
	return SetTask(nTaskId, GetTask(nTaskId) + nValue)
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:GetTaskBit(nGroupId, nIndex, nBitPos, nBitCount)
	self:ResetTaskGroup(nGroupId)
	return GetBitTask(self:GetTaskId(nGroupId, nIndex), nBitPos, nBitCount)
end
--�ײ�ӿڣ�����ʹ�ã�����TaskGroup
function TaskManager:SetTaskBit(nGroupId, nIndex, nBitPos, nBitCount, nValue)
	self:ResetTaskGroup(nGroupId)
	return SetBitTask(self:GetTaskId(nGroupId, nIndex), nBitPos, nBitCount, nValue)
end

--��ȡĳ�������������������Id
function TaskManager:GetTaskId(nGroupId, nIndex)

	if type(self:GetGroupTaskTable(nGroupId)[nIndex]) ~= "number" then
		return error(format("tbTaskGroup[%s].tbTaskSet[%s] is not a number", nGroupId, nIndex))
	end
	
	return self.tbTaskGroup[nGroupId].tbTaskSet[nIndex]
end
--��ȡ�鵱ǰ�汾��
function TaskManager:GetCurrentVersion(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	
	if type(self.tbTaskGroup[nGroupId].nCurrentVersion) ~= "number" then
		return error(format("tbTaskGroup[%s].nCurrentVersion is not a number", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].nCurrentVersion
end


--���ĳ�����������������������
function TaskManager:GetGroupTaskTable(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	if type(self.tbTaskGroup[nGroupId].tbTaskSet) ~= "table" then
		return error(format("tbTaskGroup[%s].tbTaskSet is not a table", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].tbTaskSet
end




--���ĳ�����������İ汾���������Id
function TaskManager:GetVersionTaskId(nGroupId)
	if type(self.tbTaskGroup[nGroupId]) ~= "table" then
		return error(format("tbTaskGroup[%s] is not a table", nGroupId))
	end
	
	if type(self.tbTaskGroup[nGroupId].nVersionTask) ~= "number" then
		return error(format("tbTaskGroup[%s].nVersionTask is not a number", nGroupId))
	end
	return self.tbTaskGroup[nGroupId].nVersionTask
end

--������������İ汾���Ƿ�һ��
function TaskManager:CheckTaskGroup(nGroupId)
	if GetTask(self:GetVersionTaskId(nGroupId)) == self:GetCurrentVersion(nGroupId) then
		return 1
	end
end

--����һ���������
function TaskManager:ResetTaskGroup(nGroupId)
	
	if self:CheckTaskGroup(nGroupId) ~= 1 then
		SetTask(self:GetVersionTaskId(nGroupId), self:GetCurrentVersion(nGroupId))
	
		for i=1, getn(self:GetGroupTaskTable(nGroupId)) do
			SetTask(self:GetTaskId(nGroupId, i), 0)
	
		end
	end
end

--������ʹ�ñ��õ����������
function TaskManager:ResetUseGroup()
	for nGroupId, bUse in self.tbUseGroup do
		if bUse == 1 then
			self:ResetTaskGroup(nGroupId)
		end
	end
end

--���һ�����������ʹ������
function TaskManager:AddUseGroup(nGroupId)
	if self.tbUseGroup[nGroupId] == 1 then
		return
	end
	self.tbUseGroup[nGroupId] = 1
end

--���Լ����û����д�ظ���TaskId
function TaskManager:DebugCheck()
	local tbFlag = {}
	local tbGroup = TaskManager.tbTaskGroup
	
	for i=1, getn(tbGroup) do
		local Group = tbGroup[i]
		local nId = Group.nVersionTask
		
		if tbFlag[nId] then
			error(format("%d, %d",i, nId))
		else
			tbFlag[nId] = 1
		end
		
		for j=1, getn(Group.tbTaskSet) do 
			local nId = Group.tbTaskSet[j]
			if tbFlag[nId] then
				error(format("%d, %d, %d",i, j, nId))
			else
				tbFlag[nId] = 1
			end
		end
		
	end
end

function TaskManager:Create(nGroupId, nVersion)
	
	--if self:GetCurrentVersion(nGroupId) ~= nVersion then
	--	return error(format("not permission to access TaskGroupId %d by Version %d", nGroupId, nVersion))
	--end

	self:AddUseGroup(nGroupId)
	local tb = {}
	for key , value in %TaskGroup do
		if type(value) == "function" then
			tb[key] = value
		end
	end
	tb:_init(nGroupId, nVersion)
	tb.TaskManager = self
	return tb
end


function TaskGroup:_init(nGroupId, nVersion)
	self.nGroupId = nGroupId
	self.nVersion = nVersion
end

function TaskGroup:GetTask(nIndex)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTask(self.nGroupId, nIndex)
end

function TaskGroup:SetTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
		
	end
	return self.TaskManager:SetTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:AddTask(nIndex, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
		
	end
	return self.TaskManager:AddTask(self.nGroupId, nIndex, nValue)
end

function TaskGroup:GetTaskBit(nIndex, nBitPos, nBitCount)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
	end
	return self.TaskManager:GetTaskBit(self.nGroupId, nIndex, nBitPos, nBitCount)
end

function TaskGroup:SetTaskBit(nIndex, nBitPos, nBitCount, nValue)
	if self.TaskManager:GetCurrentVersion(self.nGroupId) ~= self.nVersion then
		return error(format("not permission to access TaskGroupId %d by Version %d", self.nGroupId, self.nVersion))
		
	end
	return self.TaskManager:SetTaskBit(self.nGroupId, nIndex, nBitPos, nBitCount, nValue)
end

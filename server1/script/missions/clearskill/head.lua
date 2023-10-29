-- ϴ�㹦��(ClearSkillPoint)

-- ����ID����¼��ʱ������
CSP_TID_RevivalSWID 	= 204; -- ������ͼID
CSP_TID_ReviveID 		= 205; -- ������ID
-- ����ID����¼���ϴ����/Ǳ�ܵ����
CSP_TID_ClearFreeTime	= 144;
-- ����ID����¼��ʯϴ��ģʽ(ϴ���ܵ㡢ϴǱ�ܵ㡢ȫϴ)
CSP_TID_ClearType		= 145;
CSP_CTYPE_NONE			= 0; -- ��ϴ�κε���
CSP_CTYPE_SKILL			= 1; -- ϴ���ܵ���
CSP_CTYPE_PROP			= 2; -- ϴǱ�ܵ���
CSP_CTYPE_ALL			= 3; -- ȫϴ���(���ܵ�&Ǳ�ܵ�)

CSP_TID_JewelEnterTime	= 150;	-- ʹ�ñ�ʯ����Ĵ���

CSP_NEEDJEWEL_SKILL		= 3; -- �輼��ˮ���ĸ���
CSP_NEEDJEWEL_PROP		= 6; -- ��Ǳ�ܱ�ʯ�ĸ���

CSP_NEEDJEWEL_SKILL2		= 1;		-- 1������
CSP_NEEDJEWEL_PROP2			= 1;		-- 1������


CSP_NEEDLEVEL			= 50; -- ��ϴ�����С����
CSP_MAXClearTime		= 1; -- ���ϴ�����

CSP_RevieSWID			= 1; -- ������ID
CSP_MaxTestMapCount		= 10; --ÿһ��PK��������

-- �ߴ���е�ͼ
-- 1-����, 2-�ɶ�, 3-����, 4-�꾩, 5-����, 6-����, 7-�ٰ�
CSP_CityMapTab = {1, 11, 162, 37, 78, 80, 176}


-- ϴ���ͼ
CSP_ClearMapTab 	=  {242, 243, 244, 245, 246, 247, 248}
CSP_TestMapBeginTab =  {249, 259, 269, 279, 289, 299, 309,} --ÿһ������һ��PK���ĵ�һ������MapId,��������������



--PK���Ķ�ӦMission����ID
MISSIONID = 10;
JOINSTATE = 100;


--�ξ�/�ξ�ɽ����ͼ�л���
--PK���Զ��ĸ��������
CSP_TestHoleTab = {{1621,3236},{1533,3235},{1520,3352},{1670,3347}};

--�Ӳ��Զ����ξ����ĸ�����
CSP_ClearHoleTab = {{1407,3331},{1741,3264},{1737,2998},{1443,2975}};

--�ξ�ս������/��ս�������ξ��ĸ��л�ս��״̬�����꣬ÿ�����������꣬һ����ս��λ�����꣬��һ���Ƿ�ս��λ������
CSP_ClearTrapTab = {{1584,3232,1592,3222 }, {1657,3243, 1648,3232}, {1653,3172,1645,3184},{1581,3166,1591,3174} }

--������Զ�ͬʱ�������
MAX_MEMBER_COUNT = 20;

CSP_PKTIME = 18 * 60 * 5;
CSP_CAMPMANX = 1582 * 32;
CSP_CAMPMANY = 3303 * 32;

------------------------------------------------------
-- ���ݳ�����ţ�ȡ��Ӧϴ���ͼID
-- nCityIndex: �������
function CSP_GetClearMapID(nCityIndex)
	nCount = getn(CSP_ClearMapTab);
	if (nCityIndex < 1) or (nCityIndex > nCount) then
		return -1;
	end
	
	return CSP_ClearMapTab[nCityIndex];
end;

-- ���ݳ������ ����õ�ǰ���е�ϴ����Ե�ͼMapId
function CSP_GetFreeTestMapID(nCityIndex)
	nCount = getn(CSP_TestMapBeginTab);
	if (nCityIndex < 1) or (nCityIndex > nCount) then
		return -1;
	end
	
	nRet = -1;
	OldSubWorld = SubWorld
	
	for i = 1, CSP_MaxTestMapCount do 
		nMapId = CSP_TestMapBeginTab[nCityIndex] + i - 1;
		idx = SubWorldID2Idx(nMapId);

		if (idx == -1) then 
			print("GetFreeTestMapID Error!!!");
		else
			SubWorld = idx
			if (GetMissionV(1) == 0) then
				nRet = nMapId
				break
			end;
		end;
	end;
	
	SubWorld = OldSubWorld
	return nRet
end;

-- ���ݳ�����ţ�ȡ��Ӧ���е�ͼID
function CSP_GetCityMapID(nCityIndex)
	nCount = getn(CSP_CityMapTab);
	if (nCityIndex < 1) or (nCityIndex > nCount) then
		return -1;
	end
	
	return CSP_CityMapTab[nCityIndex];
end;

--------------------------------------------
-- ����ϴ���ͼID��ȡ�������(��1��ʼ��)
function CSP_GetCityIndexByClearMap(nMapID)
	nCount = getn(CSP_ClearMapTab);
	for i = 1, nCount do
		if (nMapID == CSP_ClearMapTab[i]) then 
			return i;
		end;
	end;
	return -1
end;

-- ����ϴ����Ե�ͼID��ȡ�������(��1��ʼ��)
function CSP_GetCityIndexByTestMap(nMapID)
	nCount = getn(CSP_TestMapBeginTab);
	for i = 1, nCount do
		if (nMapID >= CSP_TestMapBeginTab[i] and nMapID < (CSP_TestMapBeginTab[i] + CSP_MaxTestMapCount)) then 
			return i;
		end;
	end;
	return -1
end;

-- ���ݳ��е�ͼID��ȡ�������(��1��ʼ��)
function CSP_GetCityIndexByCityMap(nMapID)
	nCount = getn(CSP_CityMapTab);
	for i = 1, nCount do
		if (nMapID == CSP_CityMapTab[i]) then 
			return i;
		end;
	end;
	return -1	
end;

--------------------------------------------
-- ���״̬�Ϸ���(1- �Ϸ��� 0 - �Ƿ�)
function CSP_CheckValid()
	-- ����ʹ�ûسǷ����������ص����⣡��
	if (IsDisabledUseTownP() ~= 1) then
		return 0;
	end;
		
	return 1;
end
--------------------------------------------
function CSP_SwitchTrap(trapIndex)
	if (GetFightState() == 0) then 
		SetFightState(1)
		SetPKFlag(0)
		ForbidChangePK(1);
		SetPunish(0)
		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
		SetLogoutRV(1);
		
		SetPos(CSP_ClearTrapTab[trapIndex][1],CSP_ClearTrapTab[trapIndex][2])
	else
		SetFightState(0)	
		SetPKFlag(1)
		ForbidChangePK(0);
		SetPos(CSP_ClearTrapTab[trapIndex][3],CSP_ClearTrapTab[trapIndex][4])
	end;
end

--------------------------------------------
function CSP_WriteLog(str)
	WriteLog(" [T�y T�y ��o]"..date("%H%M%S")..": T�i kho�n:"..GetAccount()..", nh�n v�t:"..GetName()..","..str);
end

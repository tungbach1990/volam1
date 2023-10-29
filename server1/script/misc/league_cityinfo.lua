--------------------------------------------------------------------
-- ʹ�����Žṹ����¼���е���Ϣ (��¼�����ŵ����������)
-- ÿ�����в���һ��������֯(League)
-- ������֯��
--	.��������(LeagueType)��ȫ��Ψһ��ʶ��ע�ⲻҪ����
--	.��������(LeagueName)������ID(�ַ���)
--	.���ų�Ա(LeagueMember)��һ�������⣬Ŀǰ����Ҫ������
--------------------------------------------------------------------

IncludeLib("LEAGUE")

LEAGUETYPE_CITYINFO			= 4	-- ����ID(������Ϣ)��ȫ��Ψһ�ı�ʶ
CITYINFO_LEAGUEJOB			= 1 -- ְλ�����⣬����Ҫ������
CITYINFO_LEAGUETASK_BONUS	= 1	-- ������Ϣ�Ľ�����¼(�������)
CITYINFO_LEAGUETASK_GIFT	= 2	-- ������Ϣ�Ľ�����¼(�������)
CITYINFO_LEAGUETASK_DATE	= 3	-- ������Ϣ�Ľ�����¼(�������)

CITYINFO_GLBVALUEID = {840, 841, 842, 843, 844, 845, 846}
---------------------------------------------------------------
function cityID2LeagueName(nCityID)
	return tostring(nCityID)
end

function debug_print(str)
	print(str)
end

------------------
-- ����������Ϣ��¼
function buildCityInfoLeague(nCityID)
	local strLeagueName = cityID2LeagueName(nCityID)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYINFO, strLeagueName)
	if (leagueObj == 0) then
		-- �˳��еļ�¼�����ڣ�����֮
		leagueObj = LG_CreateLeagueObj()
		local memberObj = LGM_CreateMemberObj()

		LG_SetLeagueInfo(leagueObj, LEAGUETYPE_CITYINFO, strLeagueName)
		LGM_SetMemberInfo(memberObj, strLeagueName, LEAGUEJOB_MASTER, LEAGUETYPE_CITYINFO, strLeagueName)
		LG_AddMemberToObj(leagueObj, memberObj)

		LG_ApplyAddLeague(leagueObj, "\\script\\misc\\league_cityinfo.lua", "OnBuildCityLeague")
	end
end

-- �ص�
function OnBuildCityLeague(nLeagueType, szLeagueName, szMemberName, bSucceed)
	if (bSucceed == 0) then
		debug_print("CityLeague Build Fail: "..szLeagueName)
	end
	print("CityLeague Build OK: "..szLeagueName)
end

-- ����������Ĳ���������Relay���룬Relay���غ�Ż��޸ĳɹ�
-- ���Ϊ��ֹgameserver�����̵����󣬶Դ˲�������״̬��
-- cityinfo_option_lock = {0, 0, 0, 0, 0, 0, 0};
function OnSetCityLeagueTask(nLeagueType, szLeagueName, szMemberName, bSucceed)

	-- cityinfo_option_lock[tonumber(szLeagueName)] = 0
	SetGlbValue(CITYINFO_GLBVALUEID[tonumber(szLeagueName)], 0)
end

-----------------------------------------------------------------------------
-- �˺�������autoexec�ϵ���
function buildAllCityInfoLeague()
	for i = 1 , 7 do
		buildCityInfoLeague(i)
		SetGlbValue(CITYINFO_GLBVALUEID[i], 0)
	end
	debug_print("CityLeague Build...")
end

-- ���õó��н�����ʱ��(��ʽ��20051018) - ������
function set_citybonus_date(nCityID, nDate)
	local strLeagueName = cityID2LeagueName(nCityID)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYINFO, strLeagueName)
	if (leagueObj == 0) then
		-- �˳��еļ�¼�����ڣ�����֮
		debug_print("CityInfoLeague Not Found: "..nCityID)
		return 0
	end
	
	-- �������ڻص������
	--cityinfo_option_lock[nCityID] = 1 
	SetGlbValue(CITYINFO_GLBVALUEID[nCityID], 1)
	
	LG_ApplySetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, CITYINFO_LEAGUETASK_BONUS, nDate,
							"\\script\\misc\\league_cityinfo.lua", "OnSetCityLeagueTask")	
end

-- ��ȡ�ϴε÷����������н�����ʱ��(��ʽ��51018) - ������
function get_maincitybonus_date(nCityID)
	local nDate = 0;
	
	if (GetGlbValue(CITYINFO_GLBVALUEID[nCityID]) == 1) then
		debug_print("Ch� �: V�n ch�a ch�p h�nh m�mh l�nh"..nCityID)
		nDate = get_maincity_deadline(nCityID);--tonumber(date("%y%m%d"))
	else
		debug_print("GetDate ok!")
		local strLeagueName = cityID2LeagueName(nCityID)
		nDate = LG_GetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, CITYINFO_LEAGUETASK_DATE)
	end
	
	return nDate
end

-- ��ȡ�ϴεó��н�����ʱ��(��ʽ��20051018) - ������
function get_citybonus_date(nCityID)
	local nDate = 0;
	
	if (GetGlbValue(CITYINFO_GLBVALUEID[nCityID]) == 1) then
		debug_print("Ch� �: V�n ch�a ch�p h�nh m�mh l�nh"..nCityID)
		nDate = tonumber(date("%Y%m%d"))
	else
		debug_print("GetDate ok!")
		local strLeagueName = cityID2LeagueName(nCityID)
		nDate = LG_GetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, CITYINFO_LEAGUETASK_BONUS)
	end
	
	return nDate
end


function get_citybonus_task(nCityID, nTsk)
	local nValue = 0;
	
	if (GetGlbValue(CITYINFO_GLBVALUEID[nCityID]) == 1) then
		debug_print("Ch� �: V�n ch�a ch�p h�nh m�mh l�nh"..nCityID)
		nValue = 100;	--���������ֵ
	else
		debug_print("GetDate ok!")
		local strLeagueName = cityID2LeagueName(nCityID);
		nValue = LG_GetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, nTsk);
	end;
	return nValue;
end;

function set_citybonus_task(nCityID, nTsk, nValue)
	local strLeagueName = cityID2LeagueName(nCityID)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYINFO, strLeagueName)
	if (leagueObj == 0) then
		-- �˳��еļ�¼�����ڣ�����֮
		debug_print("CityInfoLeague Not Found: "..nCityID)
		return 0
	end
	
	-- �������ڻص������
	--cityinfo_option_lock[nCityID] = 1 
	SetGlbValue(CITYINFO_GLBVALUEID[nCityID], 1)
	
	LG_ApplySetLeagueTask(LEAGUETYPE_CITYINFO, strLeagueName, nTsk, nValue,
							"\\script\\misc\\league_cityinfo.lua", "OnSetCityLeagueTask")	
end;
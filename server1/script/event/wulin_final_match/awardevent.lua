Include("\\script\\event\\wulin_final_match\\awardhead.lua")

Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������
Include("\\script\\lib\\file.lua")

function wl_get_zonename( clientid )
	for i = 1, getn( WL_TAB_ZONEINFO ) do
		if ( WL_TAB_ZONEINFO[ i ][ 2 ] == clientid ) then
			return WL_TAB_ZONEINFO[ i ][ 1 ]
		end
	end
	return nil
end

function safe_tonumber( str )
	local ret=tonumber(str)
	if (ret==nil) then
		return 0
	else
		return	ret
	end
end

function wl_get_zonefile_match( zonename )
	if ( zonename ~= nil and zonename ~= "" ) then
		return "\\data\\wulin\\"..zonename.."award.dat"
	end
	return nil
end

function wl_get_zonefile_actor( zonename )
	if ( zonename ~= nil and zonename ~= "" ) then
		return "\\data\\wulin\\"..zonename.."actoraward.dat"
	end
	return nil
end

------------------------------------------------------------------------------------
-- ��һ���ļ�
function biwu_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
	end
end

--����ļ��е�szSection��key��ֵ
function biwu_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--�����ļ��е�szSection��keyֵΪszValue
function biwu_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function biwu_save(filename)
	IniFile_Save(filename, filename)
end

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end


------------------------------------------------------------------------------------

--��Ҫ���ã��ж��Ƿ������ȡ�����
--==========================================================================
--����ѯ������һ���������Ƚ�����ʱ��
--nMatchType��ZONEAWARD_TASKID_FIRST �� ZONEAWARD_TASKID_SECOND �� ZONEAWARD_TASKID_THIRD
--nAwardLevel������
--[����]�������������
----------------------------------------------
--����ѯ��������ʱ��
--nMatchType����ΪTaskID�������������
--nAwardLevel�������ȼ�
--	nAwardLevel=0��ʾ�����ظý���Ľ����ȼ�
--[����]-1��	��ʾ�Ѿ������
--[����]0��	��ʾû�н���
--[����]1��	��ʾ������ȡ�����
---------------------------------------------------
function wl_CheckAward(nMatchType, nAwardLevel)
	if( GetTask(nMatchType) == -1 ) then
		return -1
	end

	local nClientID = GetGateWayClientID()
	local strPlayerAccount = GetAccount()
	local strZoneName = wl_get_zonename( nClientID )
	local strPlayerName = GetName()
	local strZoneSection = tostring( nClientID )

	--�����Ǳ�������
	if (strZoneName == nil) then
		-- print("�����Ǳ�������")
		return 0
	end
	--����50������
	if (GetLevel() < 50) then
		-- print("����50������")
		return 0
	end

	--ȫ�������һ���������Ƚ�������ȫ��������
	if (nMatchType == ZONEAWARD_TASKID_FIRST or nMatchType == ZONEAWARD_TASKID_SECOND or nMatchType == ZONEAWARD_TASKID_THIRD) then
		local strAwardType
		if (nMatchType == ZONEAWARD_TASKID_FIRST) then
			strMatchType="First"
		elseif (nMatchType == ZONEAWARD_TASKID_SECOND) then
			strMatchType="Second"
		elseif (nMatchType == ZONEAWARD_TASKID_THIRD) then
			strMatchType="Third"
		end

		biwu_loadfile( WL_FILE_ZONEAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_ZONEAWARD, strZoneSection, strMatchType ))
		return nAwardCount
	end

	--�������������ǲ�����Ա
	local nChampTitle = champ_checktitle();
	if (nChampTitle == nil) then
		-- print("�����ǲ�����Ա")
		return 0
	end

	--������Ա��������Ա����ӣ�
	local nReadAwardLevel	--��ȡ���Ľ����ȼ�
	if (nMatchType == ZONEAWARD_TASKID_ACTORAWARD or nMatchType == ZONEAWARD_TASKID_LEADAWARD) then
		if (nMatchType == ZONEAWARD_TASKID_LEADAWARD and nChampTitle~=7) then
			-- print("���������")
			return 0
		end
		biwu_loadfile( WL_FILE_ACTORAWARD )
		nReadAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneAwardType" ))
	--��������������
	elseif (nMatchType == ZONEAWARD_TASKID_ZONE) then
		biwu_loadfile( WL_FILE_ACTORAWARD )
		nReadAwardLevel = safe_tonumber(biwu_getdata( WL_FILE_ACTORAWARD, strZoneSection, "ZoneMatch" ))
	--������������ˡ�˫�ˡ����С�ʮ�ˡ�ʮ���ˣ�
	else
		local strMatchType
		if (nMatchType == ZONEAWARD_TASKID_SINGLE) then
			strMatchType="SingleMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_DOUBLE) then
			strMatchType="DoubleMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_FIVE) then
			strMatchType="FiveMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_TEN) then
			strMatchType="TenMatch"
		elseif (nMatchType == ZONEAWARD_TASKID_SIXTEEN) then
			strMatchType="SixteenMatch"
		else
			-- print("�޴˽������ͣ�")
			return 0
		end

		biwu_loadfile( WL_FILE_MATCHAWARD )
		local strReadPlayerName = biwu_getdata( WL_FILE_MATCHAWARD, strPlayerAccount, "Key" )
		if (strReadPlayerName == nil or strReadPlayerName ~= strPlayerName) then
			-- print("û�иý�ɫ��Ϣ")
			return 0
		end

		nReadAwardLevel = safe_tonumber(biwu_getdata(WL_FILE_MATCHAWARD, GetAccount(), strMatchType))
	end

	if (nAwardLevel == nil or nAwardLevel <= 0) then
		return nReadAwardLevel
	elseif (nAwardLevel == nReadAwardLevel) then
		return 1
	else
		-- print("�����")
		return 0
	end
end

-----------------------------------------------------------

--������ȡ��Ʒ����������
--���أ�1���ɹ���0��ʧ��
function wl_FinalTakeMatch( nTaskID, nCount )
	local nAwardLevel = wl_CheckAward(nTaskID)

	if( nAwardLevel == -1 ) then
		Say("Sao? Ng��i l�nh r�i m�, sao c�n ��n ��y?!!", 0)
		-- print("��Ӧ���Ѿ���ȡ����")
		return 0
	elseif( nAwardLevel == 0 ) then
		Say("Xin l�i! Ng��i kh�ng th� nh�n ph�n th��ng ��!", 0)
		WriteLog("Ph�n th��ng v� l�m ��i h�i b� l�i!!    C� ng��i �ang l�nh th��ng 'nh�n ��i kinh nghi�m' kh�ng ph�i c�a m�nh! ["..GetName().."]  TaskID:"..nTaskID);
		-- print("������ȡ������ȡ�Ľ��	["..GetName().."]  TaskID:"..nTaskID);
		return 0
	end
	
	local nClientID = GetGateWayClientID();
	local strZoneName = tostring( nClientID )

	--һ�Ƚ�����
	if (nTaskID == ZONEAWARD_TASKID_FIRST) then
		if( nCount == nil or nCount <= 0 ) then
			-- print("��ȡ�ɲ�¶��Ŀ������ 0 �� nil ��")
			WriteLog("Ph�n th��ng v� l�m ��i h�i b� l�i!!    L�nh 'Ti�n Th�o L�' kh�ng ���c v��t qu� m�c 0 ho�c nil")
			return 0
		end;
		
		if( wl_get_awardcount( nAwardLevel , nTaskID ) < nCount ) then
			Say("S� l��ng nh�n ���c h�nh nh� kh�ng ��ng!", 0)
			-- print("���˳�����ȡ������ɲ�¶��	["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			WriteLog("Ph�n th��ng v� l�m ��i h�i b� l�i!!    C� ng��i l�nh th��ng 'Ti�n Th�o L�' v��t qu� s� l�n cho ph�p! ["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			return 0
		end;
		
		local nRoom = CalcFreeItemCellCount()
		if ( nRoom < nCount ) then
			Say("H�nh trang �� h�t ch�! S�p x�p l�i r�i h�y ��n ��y!  V��t qu� m�c th��ng 'Ti�n Th�o L�'", 0)
			-- print("��ı�������û����ô��λ��", 0)
			return 0
		end;
		
		SetTask( nTaskID, GetTask( nTaskID ) - nCount )
		if( GetTask( nTaskID ) == 0 ) then
			SetTask( nTaskID, -1 )
		end;
		for i = 1, nCount do
			AddItem( 6, 1, 71, 1, 0, 0, 0 )
		end;
		Msg2Player("Ch�c m�ng, b�n nh�n ���c"..nCount.."1 Ti�n Th�o l� ")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", Ph�n th��ng trong khu v�c nh�n ���c"..nCount.."Ti�n Th�o L� ")
		return 1
	--�������Ƚ����������Ǽ�˫������
	elseif (nTaskID == ZONEAWARD_TASKID_SECOND or nTaskID == ZONEAWARD_TASKID_THIRD) then
		if( nCount == nil or nCount <= 0 ) then
			WriteLog("Ph�n th��ng v� l�m ��i h�i b� l�i!!    L�nh '�i�m kimh nghi�m' kh�ng ���c v��t qu� m�c 0 ho�c nil")
			-- print("��ȡ˫��������Ŀ������ 0 �� nil��")
			return 0
		end;
		
		if( wl_get_awardcount( nAwardLevel , nTaskID ) < nCount ) then
			WriteLog("Ph�n th��ng v� l�m ��i h�i b� l�i!!    C� ng��i l�nh th��ng 'nh�n ��i kinh nghi�m' v��t qu� s� l�n cho ph�p!! ["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			-- print("������ȡ�����˫�����飡	["..GetName().."]:SecondAward:"..nCount.."/"..GetTask( nTaskID ));
			return 0
		end
		SetTask( nTaskID, GetTask(nTaskID) - nCount )
		
		if( GetTask( nTaskID ) == 0 ) then
			SetTask( nTaskID, -1 )
		end
		
		local nDoubleTime = 15 * nCount
		if (nTaskID == ZONEAWARD_TASKID_SECOND) then
			nDoubleTime = nDoubleTime * 2;
		end
		
		AddSkillState(440, 1, 1, nDoubleTime * 60 * 18)
		Msg2Player("Ch�c m�ng, b�n nh�n ���c"..nDoubleTime.."s� ph�t t�ng g�p ��i �i�m kinh nghi�m")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName().."Ph�n th��ng trong khu v�c nh�n ���c"..nDoubleTime.."s� ph�t t�ng g�p ��i �i�m kinh nghi�m")
		return 1
	--����ѡ�ֽ���
	elseif (nTaskID == ZONEAWARD_TASKID_ACTORAWARD) then
		--��������
		biwu_loadfile( WL_FILE_MATCHAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, "ActorAwardGot"))
		if( nAwardCount >= 100 ) then
			Say("Xin l�i! Ph�n th��ng �� �� ���c l�nh h�t!", 0)
			-- print("��Ʒ�Ѿ������ˣ������˳����콱��	["..GetName().."]:ActorAward");
			WriteLog("Ph�n th��ng v� l�m ��i h�i b� l�i!!    C� ng��i �� nh�n th��ng r�i, nh�ng l�i ��n nh�n n�a! ["..GetName().."]:ActorAward");
			return 0
		else
			biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, "ActorAwardGot", nAwardCount+1);
			biwu_save(WL_FILE_MATCHAWARD)
		end
		
		nCount = WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 2 ]
		local nRoom = CalcFreeItemCellCount()
		if( nRoom < nCount ) then
			Say("H�nh trang �� h�t ch�! S�p x�p l�i r�i h�y ��n ��y!Ph�n th��ng n�y �� c� ng��i l�nh r�i.", 0)
			Say("Ch� tr�ng trong h�nh trang c�a b�n kh�ng ��", 0)
			return 0
		end
		
		SetTask( ZONEAWARD_TASKID_ACTORAWARD, -1 )

		wl_addownexp( WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 3 ] )
		AddItem( 6, 1, 831, 1, 0, 0, 0 )		--���ִ����	����
		Msg2Player("Ch�c m�ng, b�n nh�n ���c"..WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 1 ])
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", tuy�n th� tham gia thi ��u khu v�c nh�n ���c"..WL_TAB_ACTORAWARD_INFO[ nAwardLevel ][ 1 ].."X�p h�ng t�ch l�y khu v�c"..nAwardLevel)
		return 1
	--����ӽ���
	elseif (nTaskID == ZONEAWARD_TASKID_LEADAWARD) then
		--��������
		biwu_loadfile( WL_FILE_MATCHAWARD )
		local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, "LeadAwardGot"))
		if( nAwardCount >= 1 ) then
			Say("Xin l�i! Ph�n th��ng �� �� ���c l�nh h�t!", 0)
			WriteLog("Ph�n th��ng v� l�m ��i h�i b� l�i!!    C� ng��i �� nh�n th��ng r�i, nh�ng l�i ��n nh�n n�a! ["..GetName().."]:LeadAward");
			-- print("��Ʒ�Ѿ������ˣ������˳����콱��	["..GetName().."]:LeadAward");
			return 0
		else
			biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, "LeadAwardGot", 1);
			biwu_save(WL_FILE_MATCHAWARD)
		end
		
		nCount = WL_TAB_LEADERAWARD_INFO[ nAwardLevel ][ 2 ]
		local nRoom = CalcFreeItemCellCount()
		
		if( nRoom < nCount or (nAwardLevel == 1 and nRoom < nCount + 6)) then
			Say("H�nh trang �� h�t ch�! S�p x�p l�i r�i h�y ��n ��y!Ph�n th��ng n�y �� c� ng��i l�nh r�i.", 0)
			-- print("�����ռ���񲻹�", 0)
			return 0
		end
		
		if( nAwardLevel == 1 ) then
			wl_addgolditem_random()
		end
		
		for i = 1, nCount do
			AddItem( 6, 1, 831, 1, 0, 0, 0 )		--���ִ����	����
		end;

		SetTask( ZONEAWARD_TASKID_LEADAWARD, -1 )
		Msg2Player("Ch�c m�ng, b�n nh�n ���c"..nCount.."1 V� L�m ��i h�ng bao")
		WriteLog(date("%y-%m-%d,%H:%M,").."Account==["..GetAccount().."],RoleName=="..GetName()..", T�ng l�nh ��i khu v�c nh�n ���c"..WL_TAB_LEADERAWARD_INFO[ nAwardLevel ][ 1 ].."X�p h�ng t�ch l�y khu v�c"..nAwardLevel)
		return 1
	end

	--������������ˡ�˫�ˡ����С�ʮ�ˡ�ʮ���ˡ����壩
	local strMatchName
	if (nTaskID == ZONEAWARD_TASKID_SINGLE) then
		strMatchName = "SingleMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_DOUBLE) then
		strMatchName = "DoubleMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_FIVE) then
		strMatchName = "FiveMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_TEN) then
		strMatchName = "TenMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_SIXTEEN) then
		strMatchName = "SixteenMatch"
	elseif (nTaskID == ZONEAWARD_TASKID_ZONE) then
		strMatchName = "ZoneMatch"
	end

	local strAwardCountName
	if (nTaskID == ZONEAWARD_TASKID_ZONE) then
		strAwardCountName = "ZoneMatchLeft"
	else
		strAwardCountName = strMatchName..tostring(nAwardLevel).."Left"
	end

	--��Ʒ��������
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local nAwardCount = safe_tonumber(biwu_getdata( WL_FILE_MATCHAWARD, strZoneName, strAwardCountName))
	if( nAwardCount <= 0 ) then
		Say("Xin l�i! Ph�n th��ng �� �� ���c l�nh h�t!", 0)
		WriteLog("Ph�n th��ng v� l�m ��i h�i b� l�i!!    C� ng��i �� nh�n th��ng r�i, nh�ng l�i ��n nh�n n�a! ["..GetName().."]:matchtype:"..strMatchName..":award:"..nAwardLevel);
		-- print("��Ʒ�Ѿ������ˣ������˳����콱��	["..GetName().."]:matchtype:"..strMatchName..":award:"..nAwardLevel);
		return 0
	else
		biwu_setdata( WL_FILE_MATCHAWARD, strZoneName, strAwardCountName, nAwardCount-1);
		biwu_save(WL_FILE_MATCHAWARD)
	end

	--��������ɵ������ھ������ǹ̶��� ��ƽ�װ��
	if(nTaskID == ZONEAWARD_TASKID_SINGLE and nAwardLevel == 1) then
		if ( wl_awardgolditem( GetLastFactionNumber(), nTaskID ) ~= nil ) then
			SetTask( nTaskID, -1 )
		end
		return 1
	end
	
	local nCount = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][2]
	if( nCount == nil or nCount == 0 ) then
		WriteLog( "Ph�n th��ng v� l�m ��i h�i b� l�i    count==0 match=="..strMatchName..", ph�n th��ng l� "..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
		-- print( "���ִ�ά������		count==0 match=="..strMatchName..",����Ϊ"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
		return 0
	end
	
	--�����˫�����Ļ����������Ĺھ���ÿ�˻���һ������Ĵ�ƽ�
	if( ( strMatchName == "DoubleMatch" or strMatchName == "FiveMatch" ) and nAwardLevel == 1 ) then
		wl_addgolditem_random()	--��������Ĵ�ƽ�
	end
	
	local q = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][3]
	local g = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][4]
	local d = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][5]
	local l = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][6]
	local f = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][7]
	local k = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][8]
	local m = WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][9]
	for i = 1, nCount do
		AddItem( q, g, d, l, f, k, m )
	end
	SetTask( nTaskID, -1 )
	Msg2Player( "Ch�c m�ng, b�n nh�n ���c"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1] )
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", �� nh�n ���c"..WL_TAB_MATCHAWARD_INFO[ strMatchName ][nAwardLevel][1].."tham gia tr�n ��u l� "..strMatchName)
	return 1
end

--============================================

function wl_get_awardcount( count, taskid )
	if ( GetTask( taskid ) == 0 ) then
		SetTask( taskid, count )
		return count
	end
	if( GetTask( taskid ) == -1 ) then
		return 0
	end
	return GetTask( taskid )
end

function champ_checktitle()
	
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	if( zonename == nil ) then	--���Ǳ�������
		return nil
	end
	local prefix = "\\data\\wulin\\"..nClientID.."\\"
	local name = ""	--�ж��ǲ��������
	biwu_loadfile( prefix .. BID_LEADER )
	name = biwu_getdata( prefix..BID_LEADER, "Leader_Name", "Name")
	if( GetName() == name ) then
		return 7
	end
	
	name = ""	--�ж��ǲ�������ʮ��
	biwu_loadfile(prefix.. LEVELTOP10 )
	for i = 1, 10 do
		name = biwu_getdata(prefix..LEVELTOP10, "LevelTop10", "Top"..i);
		if( name == GetName() ) then
			return 1
		end
	end

	name = ""	--�ж��ǲ���������ǰ����
	local fanctionnum = GetLastFactionNumber()
	--for fanctionnum = 0, 9 do	--temp
	biwu_loadfile( prefix..WL_FACTION[fanctionnum+1][1] )
	for i = 1, 5 do
		name = biwu_getdata(prefix..WL_FACTION[fanctionnum+1][1], WL_FACTION[fanctionnum+1][2], "Top"..i);
		if( name == GetName() ) then
			return 1
		end
	end
	--end	--temp

	name = ""	--�ж��ǲ�������Ӹ���Ĳ����ʸ�
	local count = 0
	biwu_loadfile( prefix..LEADER_MEMBER )
	count = tonumber(biwu_getdata(prefix..LEADER_MEMBER, "LeadMember", "Count"))
	if( count == 0 ) then
		return nil
	end
	for i = 1, count do
		name = biwu_getdata(prefix..LEADER_MEMBER, "LeadMember", "Member"..i)
		if( GetName() == name ) then
			return 1
		end
	end
	
	return nil
end;

------------------------------------------------------------------------------------
--main
function wulin_awardmain()
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local nowday = tonumber(date("%Y%m%d"))
	local bAwardNow = 1
	if (nowday > WL_AWARD_TIME[2] or nowday < WL_AWARD_TIME[1]) then
		bAwardNow = 0
	end
		
	if( zonename == nil or bAwardNow == 0) then	--���Ǳ�������
		Say("V� l�m ��i h�i �� k�t th�c, k�t qu� chi ti�t li�n h� trang ch�.", 0)
		return
	end

	if ( GetLevel() < 50 ) then
		Say("V� l�m ��i h�i �� ch�nh th�c h� m�n, k�t qu� chi ti�t xin li�n h� trang ch�. <color=red>c�p 50<color> tr� l�n c� th� � ch� ta nh�n ph�n th��ng khu v�c", 0)
		return
	end
	
	local zonesection = tostring( nClientID )
	biwu_loadfile( WL_FILE_ZONEAWARD )
	local firstcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "First" ))--biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "First" )
	local secondcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "Second" ))
	local thirdcount = tonumber(biwu_getdata( WL_FILE_ZONEAWARD, zonesection, "Third" ))
	
	WL_FILE_MATCHAWARD = wl_get_zonefile_match( zonesection )
	WL_FILE_ACTORAWARD = wl_get_zonefile_actor( zonesection )
	
	local count = 0
	local tbOpp = {}
	count = firstcount + secondcount + thirdcount
	if (GetLastFactionNumber() ~= -1 and GetCamp() > 0) then
		if ( champ_checktitle() ~= nil ) then	--�ǲ��ǲ���ѡ��
			tbOpp[ getn( tbOpp ) + 1 ] = "Ph�n th��ng v� l�m ��i h�i b�n k�t/wl_matchaward"
			tbOpp[ getn( tbOpp ) + 1 ] = "Ph�n th��ng tuy�n th� tham gia thi ��u khu v�c/wl_joinaward"
			tbOpp[ getn( tbOpp ) + 1 ] = "Nh�n danh hi�u v� l�m ��i h�i b�n k�t/wl_taketitle"
		end
	end
		
	if (nowday >= WL_ZONEAWARD_TIME[1] and nowday <= WL_ZONEAWARD_TIME[2]) then
		if (count > 0 ) then --�������л�ùڡ��ǡ���������
			tbOpp[ getn( tbOpp ) + 1 ] = "Ph�n th��ng khu v�c/#wl_awardall("..firstcount..","..secondcount..","..thirdcount..")"
		end
	end
	
	if( getn( tbOpp ) < 1 ) then	--û�н���
		Say("V� l�m ��i h�i �� k�t th�c, k�t qu� chi ti�t li�n h� trang ch�.", 0)
		return
	end
	
	tbOpp[ getn( tbOpp ) + 1 ] = "Ta ch� ��n ch�i/OnCancel"
	Say( "V� l�m ��i h�i �� k�t th�c, c� th� ��n ch� ta l�nh th��ng.", getn(tbOpp), tbOpp )
end;

--------------------------------------------------------------------------------------------

function wl_matchaward()
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local zonesection = tostring( nClientID )
	--WL_TAB_MATCHAWARD_INFO
	--WL_FILE_MATCHAWARD
	local playeraccount = GetAccount()
	local playername = GetName()

	biwu_loadfile( WL_FILE_MATCHAWARD )
	local rolename = biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "Key" )
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	local zonematch = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneMatch" ))
	
	if( (rolename == nil or playername ~= rolename) and zonematch == 0 ) then
		Say("ng��i kh�ng nh�n ���c th� h�ng n�o qua c�c gi�i ��u, c� g�ng r�n luy�n h�n nh�! K�t qu� chi ti�t xin li�n h� trang ch�.", 0)
		return
	end
	
	local tbOpp = {}
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	if( zonematch ~= 0 and GetTask( ZONEAWARD_TASKID_ZONE ) ~= -1 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = "Ph�n th��ng thi ��u t�p th� khu v�c___"..WL_TAB_MATCHAWARD_INFO[ "ZoneMatch" ][zonematch][1].."/#wl_want2takematch('ZoneMatch',"..zonematch..","..ZONEAWARD_TASKID_ZONE..")"
	end
	
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local singlematch = 0
	local doublematch = 0
	local fivematch = 0
	local tenmatch = 0
	local sixteenmatch = 0
	if( rolename ~= nil and playername == rolename ) then
		singlematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SingleMatch" ))
		doublematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "DoubleMatch" ))
		fivematch 	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "FiveMatch" ))
		tenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "TenMatch" ))
		sixteenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SixteenMatch" ))
		
		if( singlematch ~= 0 and GetTask( ZONEAWARD_TASKID_SINGLE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Ph�n th��ng ��n ��u m�n ph�i___"..WL_TAB_MATCHAWARD_INFO[ "SingleMatch" ][singlematch][1].."/#wl_want2takematch('SingleMatch',"..singlematch..","..ZONEAWARD_TASKID_SINGLE..")"
		end
		if( doublematch ~= 0 and GetTask( ZONEAWARD_TASKID_DOUBLE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Ph�n th��ng Song ��u___"..WL_TAB_MATCHAWARD_INFO[ "DoubleMatch" ][doublematch][1].."/#wl_want2takematch('DoubleMatch',"..doublematch..","..ZONEAWARD_TASKID_DOUBLE..")"
		end
		if( fivematch ~= 0 and GetTask( ZONEAWARD_TASKID_FIVE ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Ph�n th��ng Ng� h�nh ��u___"..WL_TAB_MATCHAWARD_INFO[ "FiveMatch" ][fivematch][1].."/#wl_want2takematch('FiveMatch',"..fivematch..","..ZONEAWARD_TASKID_FIVE..")"
		end
		if( tenmatch ~= 0 and GetTask( ZONEAWARD_TASKID_TEN ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Ph�n th��ng Th�p ph�i ��u___"..WL_TAB_MATCHAWARD_INFO[ "TenMatch" ][tenmatch][1].."/#wl_want2takematch('TenMatch',"..tenmatch..","..ZONEAWARD_TASKID_TEN..")"
		end
		if( sixteenmatch ~= 0 and GetTask( ZONEAWARD_TASKID_SIXTEEN ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Ph�n th��ng Th�p l�c s�t ��u___"..WL_TAB_MATCHAWARD_INFO[ "SixteenMatch" ][sixteenmatch][1].."/#wl_want2takematch('SixteenMatch',"..sixteenmatch..","..ZONEAWARD_TASKID_SIXTEEN..")"
		end
	end
	
	if( getn( tbOpp ) == 0 ) then
		Say( "Ng��i �� nh�n qua ph�n th��ng ho�c kh�ng c� ph�n th��ng, k�t qu� chi ti�t xin v�o trang ch�.", 0 )
		return
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "L�t n�a ta quay l�i/OnCancel"
	Say("Ng��i c� th� nh�n ph�n th��ng m�t l�c, tr��c khi nh�n xin s�p x�p l�i h�nh trang!", getn( tbOpp ), tbOpp)
end

function wl_want2takematch( sectionname ,awardtype, taskid )
	local room = 0
	room = CalcFreeItemCellCount()
	if( room < 12 ) then
		Say("H�nh trang �� h�t ch�! S�p x�p l�i r�i h�y ��n ��y!", 0)
		return
	end
	Say( "Hi�n t�i ng��i c�n l�nh l� "..WL_TAB_MATCHAWARD_INFO[ sectionname ][awardtype][1]..", l�nh ngay b�y gi� ch�?", 2, "��a cho ta nhanh �i!/#wl_FinalTakeMatch("..taskid..")", "�� ta suy ngh� l�i/OnCancel" )
end

function wl_awardgolditem( fact, taskid )
	if ( fact == 0 ) then
		print("c�a Thi�u L�m nh�ng kh�ng c� gi�i Qu�n qu�n Thi�u L�m")
		return nil
	end
	
	if( fact == 1 ) then
		AddGoldItem(0,19)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 H�m Thi�n H� ��u Kh�n Th�c Uy�n")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nh�n ���c gi�i nh�t ��n ��u Thi�n V��ng, ph�n th��ng l� 1 Kh�n Th�c Uy�n")
		return 1
	elseif ( fact == 2 ) then
		AddGoldItem(0,80)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 Thi�n Quang Th�c Thi�n Ph��c ��a Ho�n")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nh�n ���c gi�i nh�t ��n ��u ���ng M�n, ph�n th��ng l� 1 Ph��c ��a Ho�n")
		return 1
	elseif( fact == 3 ) then
		AddGoldItem(0,59)
		Msg2Player("Ch�c m�ng, nh�n ���c m�t U Lung Ng�n Thi�m H� Th� ")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nh�n ���c gi�i nh�t ��n ��u Ng� ��c, ph�n th��ng l� 1 Ng�n Thi�m H� Th� ")
		return 1
	elseif( fact == 6 ) then
		AddGoldItem(0,100)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 ��ch Kh�i Th�o Gian Th�ch Gi�i")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nh�n ���c gi�i nh�t ��n ��u C�i Bang, ph�n th��ng l� 1 Gian Th�ch Gi�i")
		return 1
	elseif( fact == 7 ) then
		AddGoldItem(0,113)
		Msg2Player("Ch�c m�ng b�n nh�n ���c ph�n th��ng Ma Th� Nghi�p H�a U Minh Gi�i")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nh�n ���c gi�i nh�t ��n ��u Thi�n Nh�n, ph�n th��ng l� 1 U Minh Gi�i")
		return 1
	elseif( fact == 4 ) then
		AddGoldItem(0,35)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 V� Gian B�ch Ng�c B�n Ch� ")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nh�n ���c gi�i nh�t ��n ��u Nga My, ph�n th��ng l� 1 V� Gian B�ch Ng�c B�n Ch� ")
		return 1
	elseif( fact == 5 ) then
		AddGoldItem(0,50)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 T� Ho�n Th�y Ng�c Ch� Ho�n")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nh�n ���c gi�i nh�t ��n ��u Th�y Y�u, ph�n th��ng l� 1 Ng�c Ch� Ho�n")
		return 1
	elseif( fact == 8 ) then
		AddGoldItem(0,125)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 C�p Phong Thanh T�ng Ph�p Gi�i")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nh�n ���c gi�i nh�t ��n ��u V� �ang, ph�n th��ng l� 1 Thanh T�ng Ph�p Gi�i")
		return 1
	elseif( fact == 9 ) then
		AddGoldItem(0,130)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 S��ng Tinh Phong B�o ch� ho�n")
		WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", nh�n ���c gi�i nh�t ��n ��u C�n L�n, ph�n th��ng l� 1 S��ng Tinh Phong B�o ch� ho�n")
		return 1
	else
		print("wl_awardgolditem faction wrong!!!!error!!!!")
		return nil
	end
end;

---------------------------------------------------------------------------------------------

function wl_joinaward()		--���������ý�
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local zonesection = tostring( nClientID )
	local tabTitle = {}
	local leader = 0
	local awardtype = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneAwardType" ))
	
	local leader = 0
	leader = champ_checktitle()		--leader == 7Ϊ�����
	if( leader == 7 ) then
		local tbOpp = {}
		if ( GetTask( ZONEAWARD_TASKID_LEADAWARD ) == -1 and GetTask( ZONEAWARD_TASKID_ACTORAWARD ) == -1 ) then
			Say( "Ng��i �� nh�n qua ph�n th��ng. K�t qu� thi ��u chi ti�t xin xem trang ch�.", 0 )
			return
		end;
		if ( GetTask( ZONEAWARD_TASKID_LEADAWARD ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Nh�n ph�n th��ng T�ng l�nh ��i/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_LEADAWARD..")"
		end;
		if ( GetTask( ZONEAWARD_TASKID_ACTORAWARD ) ~= -1 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Nh�n ph�n th��ng tuy�n th� /#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")"
		end;
		tbOpp[ getn( tbOpp ) + 1 ] = "��i m�t l�t �i!/OnCancel" 
		if( awardtype == 5 ) then
			Say("T�ng l�nh ��i nh� ng��i c� th� nh�n"..WL_TAB_LEADERAWARD_INFO[ awardtype ][ 1 ]..", v� tuy�n th� "..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", nh�n ngay b�y gi� ch�? Tr��c khi nh�n xin s�p x�p l�i h�nh trang!", getn( tbOpp ), tbOpp )
		else
			Say("Quan vi�n V� l�m ki�t xu�t:"..zonename.."Trong b�ng th�nh t�ch x�p h�ng th� "..awardtype.."h�ng, do l� T�ng l�nh ��i, b�n nh�n ���c"..WL_TAB_LEADERAWARD_INFO[ awardtype ][ 1 ]..", v� ph�n th��ng tuy�n th� tham gia"..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", nh�n ngay b�y gi� ch�? Tr��c khi nh�n xin s�p x�p l�i h�nh trang!", getn( tbOpp ), tbOpp )
		end
	else
		if ( GetTask( ZONEAWARD_TASKID_ACTORAWARD ) == -1 ) then
			Say( "Ng��i �� nh�n qua ph�n th��ng. K�t qu� thi ��u chi ti�t xin xem trang ch�.", 0 )
			return
		end;
		if( awardtype == 5 ) then
			Say("L� "..zonename.."tuy�n th� trong khu v�c, ng��i c� th� nh�n ���c"..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", nh�n ngay b�y gi� ch�? Tr��c khi nh�n xin s�p x�p l�i h�nh trang!", 2, "Nh�n ngay ��y!/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")", "��i m�t l�t �i!/OnCancel" )
		else
			Say("Quan vi�n V� l�m ki�t xu�t:"..zonename.."Trong b�ng th�nh t�ch x�p h�ng th� "..awardtype..", tuy�n th� trong khu v�c, ng��i c� th� nh�n ���c "..WL_TAB_ACTORAWARD_INFO[ awardtype ][ 1 ]..", nh�n ngay b�y gi� ch�? Tr��c khi nh�n xin s�p x�p l�i h�nh trang!", 2, "Nh�n ngay ��y!/#wl_FinalTakeMatch("..ZONEAWARD_TASKID_ACTORAWARD..")", "��i m�t l�t �i!/OnCancel" )
		end
	end
	
end;

function wl_addgolditem_random()
	local serial = random( WL_GOLDITEMCOUNT )
	AddGoldItem(WL_TAB_MATCHAWARD[serial][3][1], WL_TAB_MATCHAWARD[serial][3][2])
	Msg2Player("Ch�c m�ng, b�n nh�n ���c m�t "..WL_TAB_MATCHAWARD[serial][1])
	WriteLog(date("%y-%m-%d,%H:%M").."Account==["..GetAccount().."] RoleName=="..GetName()..", ph�n th��ng trang b� Ho�ng Kim "..WL_TAB_MATCHAWARD[serial][1])
end;

function wl_addownexp( awardexp )
	tl_addPlayerExp(awardexp)
end;


---------------------------------------------------------------------------------------------
function wl_awardall( firstcnt, secondcnt, thirdcnt )	--��ȡ��������
	local awardfst = 0
	local awardsec = 0
	local awardthd = 0
	local tbOpp = {}
	awardfst = wl_get_awardcount( firstcnt, ZONEAWARD_TASKID_FIRST )
	awardsec = wl_get_awardcount( secondcnt, ZONEAWARD_TASKID_SECOND )
	awardthd = wl_get_awardcount( thirdcnt, ZONEAWARD_TASKID_THIRD )
	
	local nClientID = GetGateWayClientID();
	local zonename = wl_get_zonename( nClientID )
	local str = "Quan vi�n V� l�m ki�t xu�t:"..zonename.."trong khu v�c l�: "
	
	if ( firstcnt ~= 0 ) then
		str = str.."Qu�n qu�n"..firstcnt..", "
	end
	
	if ( secondcnt ~= 0 ) then
		str = str.."� qu�n"..secondcnt..", "
	end
	
	if ( thirdcnt ~= 0 ) then
		str = str.."H�ng 3"..thirdcnt..", "
	end
	
	if ( awardfst == 0 and awardsec == 0 and awardthd == 0 ) then
		str = str.."ng��i �� nh�n t�t c� ph�n th��ng � khu v�c."
		Say(str, 0)
		return
	end
	
	str = str.."ng��i c�n c� th� nh�n:"
	if( awardfst > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardfst).."Ph�n th��ng Qu�n Qu�n___Ti�n Th�o l� /#wl_want2takeaward(1,"..awardfst..")"
	end
	
	if( awardsec > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardsec).."Ph�n th��ng � Qu�n___T�ng ��i �i�m kinh nghi�m trong 30 ph�t/#wl_want2takeaward(2,"..awardsec..")"
	end
	
	if ( awardthd > 0 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = tostring(awardthd).."Ph�n th��ng h�ng 3___T�ng ��i �i�m kinh nghi�m trong 15 ph�t/#wl_want2takeaward(3,"..awardthd..")"
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "��i m�t l�t �i!/OnCancel"
	Say( str, getn( tbOpp ), tbOpp )
end

function wl_want2takeaward(title,awardcount)
	local str = ""
	local cbFunc = ""
	local taskid = 0
	local tbOpp = {}
	if ( title == 1) then
		str = "ng��i c� th� nh�n ���c"..awardcount.."1 Ti�n Th�o l�, nh�n b�y gi� ch�?"
		cbFunc = "c�i/#wl_FinalTakeMatch"
		taskid = ZONEAWARD_TASKID_FIRST
	elseif ( title == 2 ) then
		str = "ng��i c� th� nh�n ���c"..awardcount.."l�n t�ng ��i �i�m kinh nghi�m trong 30 ph�t, nh�n b�y gi� ch�?"
		cbFunc = "l�n/#wl_want2doubleexp_30"
		taskid = ZONEAWARD_TASKID_SECOND
	elseif( title == 3 ) then
		str = "ng��i c� th� nh�n ���c"..awardcount.."l�n t�ng ��i kinh nghi�m trong 15 ph�t, nh�n b�y gi� ch�?"
		cbFunc = "l�n/#wl_want2doubleexp_15"
		taskid = ZONEAWARD_TASKID_THIRD
	end
	
	for i = 1, awardcount do
		tbOpp[ getn( tbOpp ) + 1 ] = "Nh�n!"..tostring(i)..cbFunc.."("..taskid..","..i..")"
	end
	tbOpp[ getn( tbOpp ) + 1 ] = "��i l�t quay l�i nh�n/OnCancel"
	Say(str, getn(tbOpp), tbOpp)
end;

function wl_want2doubleexp_30( taskid, count )	--��ȡ�Ǿ�����
	if( count == 0 or count == nil ) then
		print("wl_want2doubleexp_30(count) error!! count == 0 or count == nil")
		return
	end;
	
	if( GetTask( taskid ) < count ) then
		Say("S� l��ng nh�n ���c h�nh nh� kh�ng ��ng!", 0)
		print( GetTask( taskid ).."== doubleexp30 :::: count=="..count.."not equal" )
		return
	end;
	
	local doubletime = 30 * count
	Say("Ng��i mu�n nh�n l� "..count.."ph�n th��ng � Qu�n + "..doubletime.."ph�t t�ng ��i �i�m kinh nghi�m ��ng kh�ng?", 2, "Mu�n/#wl_FinalTakeMatch("..taskid..","..count..")", "��i m�t l�t ta quay l�i nh�n!/OnCancel")
end

function wl_want2doubleexp_15( taskid, count )	--��ȡ��������
	if( count == 0 or count == nil ) then
		print("wl_want2doubleexp_30(count) error!! count == 0 or count == nil")
		return
	end;
	
	if( GetTask( taskid ) < count ) then
		Say("S� l��ng nh�n ���c h�nh nh� kh�ng ��ng!", 0)
		print( GetTask( taskid ).."== doubleexp30 :::: count=="..count.."not equal" )
		return
	end;
	
	local doubletime = 15 * count
	Say("Ng��i mu�n nh�n l� "..count.."ph�n th��ng � Qu�n + "..doubletime.."ph�t t�ng ��i �i�m kinh nghi�m ��ng kh�ng?", 2, "Mu�n/#wl_FinalTakeMatch("..taskid..","..count..")", "��i m�t l�t ta quay l�i nh�n!/OnCancel")
end

----------------------------------------------------------------------------------------------


function wl_taketitle()
--	WL_FILE_MATCHAWARD = wl_get_zonefile_match( zonesection )
--	WL_FILE_ACTORAWARD = wl_get_zonefile_actor( zonesection )
	local tbOpp = {}
	local zonesection = tostring(GetGateWayClientID())
	local playeraccount = GetAccount()
	biwu_loadfile( WL_FILE_MATCHAWARD)
	local playername = GetName()
	local rolename = biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "Key" )
	
	biwu_loadfile( WL_FILE_ACTORAWARD )
	local zonematch = tonumber(biwu_getdata( WL_FILE_ACTORAWARD, zonesection, "ZoneMatch" ))
	
	if( (rolename == nil or playername ~= rolename) and zonematch == 0 ) then
		Say("Ng��i kh�ng c� th� h�ng n�o qua c�c lo�t tr�n ��u, ta kh�ng c� danh hi�u cho ng��i.", 0)
		return
	end

	biwu_loadfile( WL_FILE_ACTORAWARD )
	if( zonematch > 0 and zonematch <= 3 ) then
		tbOpp[ getn( tbOpp ) + 1 ] = "Nh�n ���c danh hi�u ��u t�p th� khu v�c/#wl_sure2taketitle('ZoneMatch',"..zonematch..")"
	end
	
	biwu_loadfile( WL_FILE_MATCHAWARD )
	local singlematch = 0
	local doublematch = 0
	local fivematch = 0
	local tenmatch = 0
	local sixteenmatch = 0
	if( rolename ~= nil and playername == rolename ) then
		singlematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SingleMatch" ))
		doublematch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "DoubleMatch" ))
		fivematch 	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "FiveMatch" ))
		tenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "TenMatch" ))
		sixteenmatch	=	tonumber(biwu_getdata( WL_FILE_MATCHAWARD, playeraccount, "SixteenMatch" ))
		
		if( singlematch > 0 and singlematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Nh�n ���c danh hi�u ��n ��u m�n ph�i/#wl_sure2taketitle('SingleMatch',"..singlematch..")"
		end
		if( doublematch > 0 and doublematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Nh�n ���c danh hi�u Song ��u/#wl_sure2taketitle('DoubleMatch',"..doublematch..")"
		end
		if( fivematch > 0 and fivematch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Nh�n ���c danh hi�u ng� h�nh ��u/#wl_sure2taketitle('FiveMatch',"..fivematch..")"
		end
		if( tenmatch > 0 and tenmatch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Nh�n ���c danh hi�u Th�p ph�i ��u/#wl_sure2taketitle('TenMatch',"..tenmatch..")"
		end
		if( sixteenmatch > 0 and sixteenmatch <= 3 ) then
			tbOpp[ getn( tbOpp ) + 1 ] = "Nh�n ���c danh hi�u Th�p l�c s�t ��u/#wl_sure2taketitle('SixteenMatch',"..sixteenmatch..")"
		end
	end
	
	if( getn( tbOpp ) == 0 ) then
		Say("Ng��i kh�ng c� th� h�ng n�o qua c�c lo�t tr�n ��u, ta kh�ng c� danh hi�u cho ng��i.", 0)
		return
	end
	
	tbOpp[ getn( tbOpp ) + 1 ] = "��i l�t �� ta suy ngh� ��/OnCancel"
	
	Say("Ng��i c� th� nh�n ���c danh hi�u sau ��y, suy ngh� xem sao:", getn( tbOpp ), tbOpp)
end

function wl_sure2taketitle( sectionname , awardtype)
	if( awardtype < 0 or awardtype > 3 ) then
		return
	end
	
	local title = 0
	local str = ""
	if ( sectionname == "SingleMatch" ) then
		local faction = GetLastFactionNumber()
		if( faction == -1 ) then
			return
		end
		str = "Danh s�ch m�n ph�i thi ��u"
		if( awardtype == 1 ) then
			title = 32 + faction
		elseif( awardtype == 2 ) then
			title = 42 + faction
		else
			title = 52 + faction
		end
	end
	
	if( sectionname == "DoubleMatch" ) then
		title = 61 + awardtype
		str = "Song ��u"
	end
	
	if( sectionname == "FiveMatch" ) then
		title = 64 + awardtype
		str = "Ng� h�nh ��u"
	end
	
	if( sectionname == "TenMatch" ) then
		title = 67 + awardtype
		str = "Th�p ph�i ��u"
	end
	
	if( sectionname == "SixteenMatch" ) then
		title = 70 + awardtype
		str = "Th�p l�c s�t ��u"
	end
	
	if( sectionname == "ZoneMatch" ) then
		title = 73 + awardtype
		str = "�o�n ��i khu v�c ��u"
	end

	Title_AddTitle(title, 1, 30 * 24 * 60 * 60 * 18)
	Title_ActiveTitle( title )
	SetTask( ZONEAWARD_TASKID_TITLEID, title )
	if ( awardtype == 1 ) then
		str = str.."Qu�n qu�n"
	elseif ( awardtype == 2 ) then
		str = str.."� qu�n"
	else
		str = str.."H�ng 3"
	end
	Msg2Player( "Ch�c m�ng b�n ��t ���c"..str.."Danh hi�u" )
end


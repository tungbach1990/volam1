Include ("\\script\\shitu\\shitu_head.lua")
Include ("\\script\\lib\\player.lua")
Include ("\\script\\shitu\\lilian.lua")
Include ("\\script\\shitu\\chushibonus.lua")

IncludeLib("LEAGUE")
IncludeLib("TITLE")
function validateName(name)
	return not strfind(name,");")
end

function GetName()
	local name = %GetName()
	if(not validateName(name)) then
		return ""
	end
	return name
end

--------------------
function st_print(str)
	print(str)
end

--------------------
--����apprenticeIdx,��masterIdx��ʦͽ��ϵ qilei use it 
function BuildRelationship(apprenticeName,masterName)
	
	print("Call BuildRelationship("..tostring(apprenticeName)..","..tostring(masterName)..").")
	local masteridx = SearchPlayer(masterName)
	local apprenticeidx = SearchPlayer(apprenticeName)
	if (masteridx <= 0 or apprenticeidx <= 0) then
		print("player not online")
		return 0
	end
	if (haveLastShituOperation(masteridx) > 0 or haveLastShituOperation(apprenticeidx) > 0) then
		st_print("haveLastShituOperation... fail.");
		return 0
	end

	local lid,mid = GetShituLeagueId(masterName),LGM_CreateMemberObj()
	if(FALSE(lid)) then
		
		lid = LG_CreateLeagueObj()
		LG_SetLeagueInfo(lid, CONST_LEAGUETYPE_SHITU, masterName)
		print(masterName)
		LGM_SetMemberInfo(mid, masterName, CONST_LEAGUEJOB_MASTER,CONST_LEAGUETYPE_SHITU, masterName)
		LG_AddMemberToObj(lid, mid)
		LGM_SetMemberInfo(mid, apprenticeName, CONST_LEAGUEJOB_APPRENTICE,CONST_LEAGUETYPE_SHITU, masterName)
		LG_AddMemberToObj(lid, mid)
		
		--��¼��ʦͽ�Ĳ���
		setPlayerLastShituOperation(masteridx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
		setPlayerLastShituOperation(apprenticeidx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
		
		LG_ApplyAddLeague(lid, "\\script\\shitu\\shitu.lua", "OnBuildShituLeague")
		LGM_FreeMemberObj(mid)	
		LG_FreeLeagueObj(lid)
		return 1
	end

	LGM_SetMemberInfo(mid, apprenticeName, CONST_LEAGUEJOB_APPRENTICE,CONST_LEAGUETYPE_SHITU, masterName)
	setPlayerLastShituOperation(masteridx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
	setPlayerLastShituOperation(apprenticeidx, CONST_OPER_JOINSHITU, FileName2Id(masterName), FileName2Id(apprenticeName))
	LGM_ApplyAddMember(mid, "\\script\\shitu\\shitu.lua", "OnJoinShituLeague")
	LGM_FreeMemberObj(mid)
	return 1
end

function setPlayerLastShituOperation(lplayeridx, operation, data1, data2)
	oldPly = PlayerIndex
	PlayerIndex = lplayeridx
	SetTask(TKID_LAST_SHITU_OPERATION, operation)
	SetTask(TKID_LAST_SHITU_DATA1, data1)
	SetTask(TKID_LAST_SHITU_DATA2, data2)
	st_print("setOperation: "..GetName().."(op:"..operation..") (data1:"..data1..") (data2"..data2..")");
	PlayerIndex = oldPly
end

function haveLastShituOperation(lplayeridx)
	if (lplayeridx == nil) then
		return 0
	end
	oldPly = PlayerIndex
	PlayerIndex = lplayeridx 
	bResult = GetTask(TKID_LAST_SHITU_OPERATION)
	if (bResult > 0) then
		print("last operation is "..bResult)
	end
	PlayerIndex = oldPly
	return bResult
end

function OnBuildShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("Call OnBuildShituLeague("..tostring(nLeagueType)..","..tostring(szLeagueName)..","..tostring(szMemberName)..","..tostring(bSucceed)..").")
	local lid = GetShituLeagueId(szLeagueName)
	if(nLeagueType ~= CONST_LEAGUETYPE_SHITU) then
		print("League type error on build shitu relationship.")
		return 0
	end
	
	if(FALSE(bSucceed)) then
		print("L�p ��i nh�m kh�ng th�nh c�ng!")
		local pappid = SearchPlayer(szMemberName)
		if (pappid > 0) then
				clearLastShituOperation(pappid)
		end
		
		local pmasterid = SearchPlayer(szLeagueName)
		if (pmasterid > 0) then
				clearLastShituOperation(pmasterid)
		end
		return 0
	end

		local num = LG_GetMemberCount(lid)
		if (num == 2) then
			for i=0,num -1 do
				local name,job = LG_GetMemberInfo(lid, i)
				if(job == CONST_LEAGUEJOB_APPRENTICE) then --ͽ����Ҳ
					JoinShituSuccess(nLeagueType, szLeagueName, name)	
					return
				end
			end
		end

	JoinShituSuccess(nLeagueType, szLeagueName, szMemberName)	

end

function JoinShituSuccess(nLeagueType, szLeagueName, szMemberName)
	local lid = LG_GetLeagueObj(CONST_LEAGUETYPE_SHITU, szLeagueName)
	if(FALSE(lid)) then
		print("��i nh�m kh�ng t�n t�i")
		return 0
	end

	local num = LG_GetMemberCount(lid)
	for i=0,num -1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(job == CONST_LEAGUEJOB_APPRENTICE and name == szMemberName) then --ͽ����Ҳ
			mastername = szLeagueName
			local pappid = SearchPlayer(name)
			local pmastid = SearchPlayer(mastername)
			
			if(pappid > 0) then
				setApprenticeEnterData(pappid)
				clearLastShituOperation(pappid)
			end
			if (pmastid > 0) then
				setMasterWhenNewApprentice(pmastid)
				clearLastShituOperation(pmastid)
			end
			
			-- Ϊͽ����ӳƺ�
			--callPlayerFunction(pappid, Title_AddTitle, CONST_SHITU_TU_TITLEID, 0, -1);
			--callPlayerFunction(pappid, Title_ActiveTitle, CONST_SHITU_TU_TITLEID);
			
			return 1
		end
	end
	
	return 0
end

function FindLeagueMember(szLeagueName, nameid)
	local lid = LG_GetLeagueObj(CONST_LEAGUETYPE_SHITU, szLeagueName)
	if(FALSE(lid)) then
		print("��i nh�m kh�ng t�n t�i")
		return "",0
	end

	local num = LG_GetMemberCount(lid)
	for i=0,num -1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if (FileName2Id(name) == nameid) then
			return name, job
		end
	end
	return "", 0
end


function OnJoinShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("Call OnJoinShituLeague("..tostring(nLeagueType)..","..tostring(szLeagueName)..","..tostring(szMemberName)..","..tostring(bSucceed)..").")
	
	if(nLeagueType ~= CONST_LEAGUETYPE_SHITU) then
		print("League type error on build shitu relationship.")
		return 0
	end
	
	if(FALSE(bSucceed)) then
		print("L�p ��i nh�m kh�ng th�nh c�ng!")
		local pappid = SearchPlayer(szMemberName)
		if (pappid > 0) then
				clearLastShituOperation(pappid)
		end
		
		local pmastid = SearchPlayer(szLeagueName)
		if (pmastid > 0) then
			clearLastShituOperation(pmastid)
		end
		
		return 0
	end
	return JoinShituSuccess(nLeagueType, szLeagueName, szMemberName)
end

tb_playerinfo_setapprdata = {"name","level"}
tb_playertask_setapprdata = {TKID_MASTER_COUNT}

--��ʼ��ͽ�ܼ���ʦͽ�����е�����
function setApprenticeEnterData(apprenticeIdx)
--�˺����õ�����������
	print("Call setApprenticeJoinData("..tostring(apprenticeIdx)..").")
	-- local apprentice = getPlayerInfo(apprenticeIdx, {"name","level"}, {TKID_MASTER_COUNT})
	local apprentice = getPlayerInfo(apprenticeIdx, tb_playerinfo_setapprdata, tb_playertask_setapprdata)

	if (FALSE(haveLastShituOperation(apprenticeIdx))) then
		print("TKID_OPERATION hi�n ch�a th� x�c nh�n")
	end
	print("��ng c�p l�c b�i s�:"..apprentice.level)
	print(apprentice.task[TKID_MASTER_COUNT])
------------ͽ�ܳɹ���ʦ�Ժ��������������� yfeng
	local tab = {
		[TKID_MASTER_LILIAN] = 0, --ͽ������һ��ʦ���Ĵ����µĽ����������
		[TKID_ENTER_LEVEL] = apprentice.level,  --��¼��ʦʱ��ĵȼ�
		[TKID_MASTER_COUNT] = apprentice.task[TKID_MASTER_COUNT]+1 --��ʦ����+1
	}
	
	setPlayerTask(apprenticeIdx,tab)
	clearLastShituOperation(apprenticeIdx)
	
	local masterName = GetMaster(apprentice.name)
	if(not masterName) then
		print("S� ph� kh�ng t�n t�i")
		return
	end
	
	sendMessage(apprenticeIdx,"Ch�c m�ng b�n �� b�i th�nh c�ng"..masterName.." l�m s� ph�.")
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then --ʦ��������
		print("X�y d�ng th�nh c�ng quan h� S� �� nh�ng S� ph� kh�ng c� tr�n m�ng.")
		return
	end
	
	sendMessage(masterIdx,"Ch�c m�ng b�n �� ���c th�u nh�n"..apprentice.name.." l�m �� ��.")
	return
end


--�˴���дʦ���¼�ͽ��ʱ��Ҫ�ļ�¼ qilei
--Add
function setMasterWhenNewApprentice(masterIdx)
--�˺����õ�����������
--to add
---ͽ�ܳɹ���ʦ�Ժ�ʦ������������������ yfneg
	--��ͽ������1
	print("setMasterWhenNewApprentice",masterIdx)
	print(callPlayerFunction(masterIdx,GetTask,TKID_APPRENTICE_COUNT))
	callPlayerFunction(masterIdx,SetTask,TKID_APPRENTICE_COUNT,
		callPlayerFunction(masterIdx,GetTask,TKID_APPRENTICE_COUNT)+1)
	print(callPlayerFunction(masterIdx,GetTask,TKID_APPRENTICE_COUNT))	
	clearLastShituOperation(masterIdx)
end

--���ʦͽ��ϵ qilei use it 
function BreakShituLeague(apprentice)
	pidx = SearchPlayer(apprentice)
	
	if (pidx > 0) then 
		if (haveLastShituOperation(pidx) > 0) then
			print("no end last oper")
			return 
		end
	end
	
	print("Call BreakShituLeague("..apprentice..").")
	local lid = GetShituLeagueId(apprentice)
	if(FALSE(lid)) then
		print("Quan h� S� �� kh�ng t�n t�i.")
		return
	end
	
	local leagueName = LG_GetLeagueInfo(lid)
	
	local joinTime = LG_GetMemberJoinTime(CONST_LEAGUETYPE_SHITU, leagueName, apprentice);
	local curTime = GetCurServerTime();
	if (curTime - joinTime < CONST_BREAKSHITU_PROTECTEDTIME) then
		Say("B�n v� "..safeshow(apprentice).."quan h� S� �� kh�ng �� 24 gi�, kh�ng th� x�a b�!", 0);
		Msg2Player("B�n v� "..apprentice.."quan h� S� �� kh�ng �� 24 gi�, kh�ng th� x�a b�!");
		return
	end
	--���һ������1��ʾ��������ʦͽ����ĳ�Աʱ���������ֻʣһ����Ա��ʦ����ʱ����ϵͳ�Զ�ɾ����ʦͽLeague
	LGM_ApplyRemoveMember(CONST_LEAGUETYPE_SHITU, leagueName, apprentice, "\\script\\shitu\\shitu.lua", "OnBreakShituLeague", 1)
end

function OnBreakShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("Call OnBreakShituLeague("..tostring(nLeagueType)..","..tostring(szLeagueName)..","..tostring(szMemberName)..","..tostring(bSucceed)..").")
	if(nLeagueType ~= CONST_LEAGUETYPE_SHITU) then
		print("Lo�i quan h� S� �� kh�c th��ng")
		return
	end
	
	local appIdx = SearchPlayer(szMemberName)
	local masterIdx = SearchPlayer(szLeagueName)

	if (appIdx > 0) then
		sendMessage(appIdx,"B�n �� c�ng"..szLeagueName.."X�a b� quan h� S� ��.")
		clearLastShituOperation(appIdx)	
	end

	if (masterIdx > 0) then
		sendMessage(masterIdx,"B�n �� c�ng"..szMemberName.."X�a b� quan h� S� ��.")
		clearLastShituOperation(masterIdx)
	end
end

--��ͽ���ڳ�ʦ״̬�����ܳ�ʦ
function IsGraduateInLeague(playerIdx)
	local apprentice = getPlayerInfo(playerIdx,nil,{TKID_APPLY_GRADUATE},nil)
	PlayerIndex = playeridx

	local lid = GetShituLeagueId(GetName())
	local num = LG_GetMemberCount(lid)
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid,i)
		if(apprentice.task[TKID_APPLY_GRADUATE] ==FileName2Id(name)) then
			return 1
		end
	end
	return nil 
end

--��ʦqilei use it
tb_playertask_chushimaster = {
	TKID_LAST_SHITU_OPERATION,
	TKID_CHUSHI_MASTER_BONUS,
	TKID_DICHUAN_APPRENTICE_COUNT,
	TKID_ZHIXI_APPRENTICE_COUNT,
	TKID_NORMAL_APPRENTICE_COUNT
}

tb_playerinfo_chushiapprentice = {"name"}
tb_playertask_chushiapprentice = {
	TKID_LAST_SHITU_OPERATION,
	TKID_ENTER_LEVEL,
	TKID_CHUSHI_APPRENTICE_BONUS,
	TKID_CHUSHI_DICHUAN_BONUS,
	TKID_CHUSHI_ZHIXI_BONUS,
	TKID_MASTER_COUNT
}

function OutShituLeague(apprenticeName, masterName)
	print("Call OutShituLeague("..apprenticeName..","..masterName..").")
	local appIdx = SearchPlayer(apprenticeName)
	local masterIdx = SearchPlayer(masterName)
	
	if(FALSE(appIdx)) then
		print("�� �� kh�ng l�n m�ng")
		sendMessage(masterIdx,apprenticeName.."Hi�n kh�ng bi�t tung t�ch.")
		return
	end
	if(FALSE(masterIdx)) then
		print("S� ph� kh�ng l�n m�ng")
		sendMessage(appIdx,masterName.."Hi�n kh�ng bi�t tung t�ch.")
		return
	end
	
	local lidApp = GetShituLeagueId(apprenticeName)
	local lidMaster = GetShituLeagueId(masterName)
	if(FALSE(lidApp) or FALSE(lidMaster) or lidApp ~= lidMaster) then
		print("Quan h� S� �� 2 ng��i n�y kh�c l� ")
		return
	end
	
	--����ʦ���ĳ�ʦ��ʶ�ͽ���
	--�����ʦ��ʶ��Ϊ0�����ʾ������ͽ�������ʦ������δ�ɹ�����ʱ��������ͽ���ٳ�ʦ
	/*
	local master = getPlayerInfo(masterIdx,nil,
																					{TKID_LAST_SHITU_OPERATION,
																						TKID_CHUSHI_MASTER_BONUS,
																						TKID_DICHUAN_APPRENTICE_COUNT,
																						TKID_ZHIXI_APPRENTICE_COUNT,
																						TKID_NORMAL_APPRENTICE_COUNT})																						
	local apprentice = getPlayerInfo(appIdx,
																	{"name"},
																	{TKID_LAST_SHITU_OPERATION,
																	TKID_ENTER_LEVEL,
																	TKID_CHUSHI_APPRENTICE_BONUS,
																	TKID_CHUSHI_DICHUAN_BONUS,
																	TKID_CHUSHI_ZHIXI_BONUS,
																	TKID_MASTER_COUNT})
	*/
	local master = getPlayerInfo(masterIdx, nil, tb_playertask_chushimaster)
	local apprentice = getPlayerInfo(appIdx, tb_playerinfo_chushiapprentice, tb_playertask_chushiapprentice)

	if (apprentice.task[TKID_LAST_SHITU_OPERATION] ~= 0 or master.task[TKID_LAST_SHITU_OPERATION] ~= 0) then
		print("thao t�c l�n tr��c kh�ng th�nh c�ng,   kh�ng th� th�c hi�n thao t�c kh�c!")
		return
	end
																	
	if(FALSE(apprentice.task[TKID_MASTER_COUNT])) then
		print("mastercount no right")
--		return
	end
	
	--���ó�ʦ״̬
	local apprenticeTab = {
		[TKID_LAST_SHITU_OPERATION] = CONST_OPER_GRADUATE,
		[TKID_LAST_SHITU_DATA1] = FileName2Id(apprentice.name),						--��¼���ѵ���������ʾ����Ҫ��ʦ
		[TKID_LAST_SHITU_DATA2] = 0,
		[TKID_CHUSHI_APPRENTICE_BONUS] = CONST_BONUS_COUNT_APPRENTICE				--��¼���ѳ�ʦ�ɹ��Ļ����Եõ�ʲô���Ľ���
	}

	if(apprentice.task[TKID_MASTER_COUNT]==1) then --�մ�/ֱϵ
		if(apprentice.task[TKID_ENTER_LEVEL]>25) then --ֱϵ
			apprenticeTab[TKID_CHUSHI_ZHIXI_BONUS] = apprentice.task[TKID_CHUSHI_ZHIXI_BONUS]+1
		else --�մ�
			apprenticeTab[TKID_CHUSHI_DICHUAN_BONUS] = apprentice.task[TKID_CHUSHI_DICHUAN_BONUS]+1
		end
	else
		apprenticeTab[TKID_CHUSHI_APPRENTICE_BONUS]=0
	end
	
	
	setPlayerTask(appIdx,apprenticeTab)
	
	local masterTab =
	{
		[TKID_LAST_SHITU_OPERATION] = CONST_OPER_GRADUATE,
		[TKID_LAST_SHITU_DATA1] = FileName2Id(apprentice.name),									--��¼��Ҫ��ʦ��ͽ������
		[TKID_LAST_SHITU_DATA2] = 0,
	}
		
	if(apprentice.task[TKID_MASTER_COUNT]==1) then
		if(apprentice.task[TKID_ENTER_LEVEL]<=25) then
			masterTab[TKID_DICHUAN_APPRENTICE_COUNT] = master.task[TKID_DICHUAN_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 5
		elseif(apprentice.task[TKID_ENTER_LEVEL]<50) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 4
		elseif(apprentice.task[TKID_ENTER_LEVEL]<65) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 3
		elseif(apprentice.task[TKID_ENTER_LEVEL]<75) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 2
		elseif(apprentice.task[TKID_ENTER_LEVEL]<80) then
			masterTab[TKID_ZHIXI_APPRENTICE_COUNT] = master.task[TKID_ZHIXI_APPRENTICE_COUNT]+1
			masterTab[TKID_CHUSHI_MASTER_BONUS] = 1
		end
	else
		masterTab[TKID_NORMAL_APPRENTICE_COUNT] = master.task[TKID_NORMAL_APPRENTICE_COUNT]+1
	end
	setPlayerTask(masterIdx, masterTab)
	print("apply remove member")
	
	--���һ������1��ʾ��������ʦͽ����ĳ�Աʱ���������ֻʣһ����Ա��ʦ����ʱ����ϵͳ�Զ�ɾ����ʦͽLeague
	LGM_ApplyRemoveMember(CONST_LEAGUETYPE_SHITU, masterName, apprenticeName, "\\script\\shitu\\shitu.lua", "OnOutShituLeague", 1)
	return
end


function OnOutShituLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	local mastername = szLeagueName
	if (mastername ~= nil or mastername ~= "") then
		local masterIdx = SearchPlayer(mastername)
		if (masterIdx > 0) then
			if (bSucceed == 1) then		--����ʦ��
				graduateForMaster(masterIdx)
			end
			clearGraduateData(masterIdx)
		end		
	end
	
	local apprenticeIdx = SearchPlayer(szMemberName)
	if (apprenticeIdx > 0) then
		if (bSucceed == 1) then			--����ͽ��
			graduateForApprentice(apprenticeIdx)
		end
		clearGraduateData(apprenticeIdx)
	end
end

function patchShituProcess(lplayeridx)
	if (lplayeridx <= 0) then
		return
	end
	oldplayer = PlayerIndex
	PlayerIndex = lplayeridx
	local nApply_Operation = GetTask(TKID_LAST_SHITU_OPERATION)
	local nApply_Data1 = GetTask(TKID_LAST_SHITU_DATA1)
	local nApply_Data2 = GetTask(TKID_LAST_SHITU_DATA2)
	
	if (nApply_Operation == 0) then
		return
	end
	
	if (TABFUNS_PATCHSHITU[nApply_Operation] ~= nil) then
		TABFUNS_PATCHSHITU[nApply_Operation](lplayeridx,nApply_Data1, nApply_Data2)
	else
		print("have no patch funcs"..nApply_Operation)
	end
	PlayerIndex = oldplayer
end

function patchShitu_Join(lplayeridx, nData1, nData2)
	oldplayer = PlayerIndex
	
	PlayerIndex = lplayeridx
	print("Call patchShitu_Join")
	--��������ʦ���Ļ������ҵ�ǰ�Ƿ��Ѿ��и�ͽ���ڶ������ˣ������˵���ɹ������û���򲻳ɹ���
	--��������ͽ�ܵĻ������ҵ�ǰ�Ƿ��Ѿ��ڸ�ʦ���Ķ������ˣ������˵���ɹ���û���򲻳ɹ���
	if (FileName2Id(GetName()) == nData1) then
			local lid = GetShituLeagueId(GetName())
			bSuccess = 0
			if(FALSE(lid)) then
				bSuccess = 0
			else
				if (GetMaster(GetName()) == GetName()) then
					local num = LG_GetMemberCount(lid)
					for i = 0, num - 1 do
						local name,job = LG_GetMemberInfo(lid, i)
						if (FileName2Id(name) == nData2) then
							bSuccess = 1
							break
						end
					end
				end
			
			end		
			
			if (bSuccess == 1) then
				setMasterWhenNewApprentice(lplayeridx)
			end
	elseif(FileName2Id(GetName()) == nData2) then
			local lid = GetShituLeagueId(GetName())
			bSuccess = 0
			
			if(FALSE(lid)) then
				bSuccess = 0
			else
				if (FileName2Id(GetMaster(GetName())) == nData1) then
					bSuccess = 1
				end
			end
			
			if (bSuccess == 1) then
				setApprenticeEnterData(lplayeridx)
			end
	end
	
	clearLastShituOperation(lplayeridx)
	
	PlayerIndex = oldplayer
end


function patchShitu_Graduate(lplayeridx, nData1, nData2)
	oldplayer = PlayerIndex
	--�������������Ҫ��ʦ��ͽ�ܵĻ�
	if (FileName2Id(GetName()) == nData1) then 
		-----------------------------------------------------------------
		--if (��鵱ǰ�Ƿ��Ѿ������κε�ʦͽ�������ˣ����������Ѿ���ʦ����) then
		--	����ǵĻ�����ô˵����һ�εĳ�ʦ�����Ѿ��ɹ��ˣ�������Ӧ�Ľ���
		--else
		--������ǵĻ�����ô˵����һ�εĳ�ʦ������û�гɹ�������ղ���
		--end
		------------------------------------------------------------------
		curjob = GetLeagueJob(GetName())
		if (FALSE(curjob) or curjob == CONST_LEAGUEJOB_MASTER) then
			graduateForApprentice(lplayeridx)
		end
		clearGraduateData(lplayeridx)
	else
		------------------------------------------------------------------
		--if (��鵱ǰ��ҵ�ʦͽ�����в����ڸ�ͽ�ܻ��������Ѿ�����ͽ���ˣ�)
		--	����ǵĻ�����ô˵����һ�ε�ͽ�ܳ�ʦ�����ѳɹ��ˣ���õ���Ӧ�Ľ���
		--else
		--	������ǵĻ�����ô˵����һ�εĳ�ʦ������û�ɹ�������ղ���
		--end
		-----------------------------------------------------------------

		local lid = GetShituLeagueId(GetName())
		local bSuccess = 1
		if(FALSE(lid)) then
			bSuccess = 1
		else
			local num = LG_GetMemberCount(lid)
			for i = 0, num - 1 do
				local name,job = LG_GetMemberInfo(lid, i)
				if (FileName2Id(name) == nData1) then
					bSuccess = 0
					break
				end
			end
		end
		if (bSuccess == 1) then
			graduateForMaster(PlayerIndex)
		end			
		clearGraduateData(PlayerIndex)
	end	

	PlayerIndex = oldplayer
end

function clearGraduateData(lplayeridx)
	--local graduateDataTab = {
		--[TKID_APPLY_GRADUATE] = 0,
		--[TKID_CHUSHI_APPRENTICE_BONUS] = 0,
		--[TKID_TKID_CHUSHI_MASTER_BONUS] = 0,
	--}
	--setPlayerTask(lplayeridx,graduateDataTab)
	setPlayerLastShituOperation(lplayeridx, 0, 0, 0)
end

function clearLastShituOperation(lplayeridx)
	setPlayerLastShituOperation(lplayeridx, 0, 0, 0)
end


--�ڴ˴���дͽ�ܳ�ʦ��ͽ�����ѵõ��Ľ���
--������ͽ�ܵĺ���   qilei 
function graduateForApprentice(appIdx)
	print("graduateforApprentice"..appIdx)
	--ͽ�ܳɹ���ʦ�Ժ�ͽ�ܵ����ݺͽ��������ﴦ�� yfeng
	--������Ҫ����
--�ⱻ�õ���������
	local num = callPlayerFunction(appIdx,GetTask,TKID_CHUSHI_APPRENTICE_BONUS)
	callPlayerFunction(appIdx,SetTask,TKID_CHUSHI_APPRENTICE_BONUS,0)
	if(FALSE(num)) then
		return
	end
	if (num > 0) then
		PayHongbao(appIdx,num)
		sendMessage(appIdx,"Ch�c m�ng b�n �� xu�t s� v� nh�n ���c Th�n b� ��i H�ng Bao"..num.."c�i.")
		name = callPlayerFunction(appIdx,GetName);
		WriteLog(name.."Ch�c m�ng b�n �� xu�t s� v� nh�n ���c Th�n b� ��i H�ng Bao"..num.."c�i.")
	end
	return
	
end


--������ʦ���ĺ���   qilei
--�ڴ˴���дͽ�ܳ�ʦ��ʦ���õ��Ľ���
function graduateForMaster(masterIdx)
--ͽ�ܳɹ���ʦ�Ժ�ʦ�������ݺͽ��������ﴦ�� yfeng
--������Ҫ����
--�ⱻ�õ���������
	print("graduateforMaster"..masterIdx)
	local num = callPlayerFunction(masterIdx,GetTask,TKID_CHUSHI_MASTER_BONUS)
	callPlayerFunction(masterIdx,SetTask,TKID_CHUSHI_MASTER_BONUS,0)
	
	if (FALSE(num)) then
		return
	end
	if (num > 0) then
		PayHongbao(masterIdx,num)
		sendMessage(masterIdx,"Ch�c m�ng b�n �� ��o t�o ���c 1 �� ��, nh�n ���c Th�n b� ��i H�ng Bao"..num.."c�i.")
		name = callPlayerFunction(masterIdx,GetName);
		WriteLog(name.."Ch�c m�ng b�n �� xu�t s� v� nh�n ���c Th�n b� ��i H�ng Bao"..num.."c�i.")
	end
	return
end;

-----------------------------------------------------------------------------------------------
--��ȡʦͽ��ϵ������ID
function GetShituLeagueId(playerName)
	local lid = LG_GetLeagueObjByRole(CONST_LEAGUETYPE_SHITU,playerName)
	return lid
end

tb_playerinfo_degree = {"name","level"}
tb_playertask_degree = {TKID_APPRENTICE_COUNT}

function GetPlayerDegree(playerIdx)
	print("Call GetPlayerDegree("..tostring(playerIdx)..").")
	-- local player = getPlayerInfo(playerIdx,{"name","level"},{TKID_APPRENTICE_COUNT})
	local player = getPlayerInfo(playerIdx, tb_playerinfo_degree, tb_playertask_degree)
	local job = GetLeagueJob(player.name)
	if(job) then
		return job
	end
	if(player.level >= 80) then
		if(TRUE(player.task[TKID_APPRENTICE_COUNT])) then
			return CONST_DEGREE_MASTER
		end
		return CONST_DEGREE_PREMASTER
	end
	return CONST_DEGREE_PREAPPRENTICE
	
end
function GetLeagueJob(player)
	print("Call GetLeagueJob("..tostring(player)..").")
	local lid = GetShituLeagueId(player)
	if(FALSE(lid)) then
		return nil
	end
	local num = LG_GetMemberCount(lid)
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(name == player) then
			return job
		end
	end
	return nil
end

function GetMaster(playerName)
	print("Call GetMaster("..tostring(playerName)..").")
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid)) then
		print("��i ng� kh�ng t�n t�i.")
		return nil
	end
	local num = LG_GetMemberCount(lid)
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(job == CONST_LEAGUEJOB_MASTER) and validateName(name) then
			return name
		end
	end
	print("Trong ��i ng� kh�ng c� s� ph� ")
	return nil
end

--�õ�playerIdx ���ڵ�ʦͽ�����е�ͽ�ܸ���
function GetApprenticeNum(playerName)
	print("GetApprenticeNum("..playerName..")")
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid)) then --player ����������
		local pid = SearchPlayer(playerName)
		if(FALSE(pid)) then
			return nil
		end
		if(callPlayerFunction(pid,GetTask,TKID_APPRENTICE_COUNT)>0) then --playerName ��ʦ��
			return 0
		elseif(callPlayerFunction(pid,GetLevel)>=80) then --player������ʦ��
			return 0
		end
		--��û��ʦ����
		print("return nil")
		return nil
	end
	local num = LG_GetMemberCount(lid)
	return num -1
end

--�õ�playerName����ʦͽ��ϵ�е�����ͽ���б�
function GetApprentice(playerName)
	print("Call GetApprentice("..playerName..").")
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid)) then
		print("Quan h� s� �� kh�ng t�n t�i")
		return nil
	end
	local num = LG_GetMemberCount(lid)
	local tab = {}
	for i=0,num-1 do
		local name,job = LG_GetMemberInfo(lid, i)
		if(job == CONST_LEAGUEJOB_APPRENTICE) and validateName(name) then
			tab[getn(tab) + 1] = name
		end
	end
	if(getn(tab)==0) then
		print("Trong ��i ng� kh�ng c� �� ��")
		return nil
	end
	return tab
end

function ShowLeague()
			local lid = GetShituLeagueId(GetName())
			bSuccess = 0
			if(FALSE(lid)) then
				print(GetName().." no in league")
			else
				local num = LG_GetMemberCount(lid)
				for i = 0, num - 1 do
					local name,job = LG_GetMemberInfo(lid, i)
					print(name..", job"..job)
				end
			end		
end

--����ʦ�����Դ���ͽ����
function ComputeMasterLoad(dichuan)
	if(dichuan < 0) then dichuan = 0 end
	if(dichuan < 5) then 
		return 3
	end
	if(dichuan < 7) then
		return 4
	end
	if(dichuan < 10) then
		return 5
	end
	if(dichuan < 13) then
		return 6
	end
	if(dichuan < 17) then
		return 7
	end
	if(dichuan < 21) then
		return 8
	end
	if(dichuan < 26) then
		return 9
	end
	return 10
end

TABFUNS_PATCHSHITU = 
{
	patchShitu_Join,
	patchShitu_Graduate,
	patchShitu_Leave,
}

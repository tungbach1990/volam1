-- Include Files
Include("\\script\\lib\\objbuffer_head.lua");
Include("\\script\\missions\\basemission\\dungeon.lua");
Include("\\script\\missions\\miniencounter\\player.lua");
Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

IncludeLib("SETTING");

tbPlayerQueue = {} --��ұ����жӣ�

-- Function	: apply_signup
-- Description : player signs up from officer 
function apply_signup()
	if DungeonGlobalData:CheckActivityTime() ~= 1 then
		Talk(1, "", "M�i ng�y t� 9 gi� ��n 23 gi� Ph� Li Xung ��t Chi�n m�i m�, ng��i ��i th�m �i.");
		return nil;
	end

	-- Check Current Player State
	if ST_GetOffliveState() == 1 then						   -- �����й�
		Talk(1, "", "�y th�c r�i m�ng kh�ng th� ti�n h�nh b�o danh.");
		return nil;
	end

	if GetOnlineCommissionStatus() == 1 then					-- �����й�
		Talk(1, "", "�y th�c tr�n m�ng kh�ng th� ti�n h�nh b�o danh.");
		return nil;
	end

	if GetStallState() == 1 then								-- ��̯״̬
		Talk(1, "", "B�n h�ng kh�ng th� ti�n h�nh b�o danh.");
		return nil;
	end

	local nCurMapID = GetWorldPos();
	if DungeonGlobalData:CheckLegalPrepareMap(nCurMapID) ~= 1 then
		Talk(1, "", "Ch� c� th� � th�nh ch�nh v� T�n Th� th�n ti�n h�nh b�o danh.");
		return nil;
	end

	if ST_IsTransLife() ~= 1 and GetLevel() < DungeonGlobalData.PLAYER_LEVEL_LIMIT then
		Talk(1, "", format("C�p %d tr� l�n ho�c ng��i ch�i tr�ng sinh m�i c� th� ti�n h�nh b�o danh.", DungeonGlobalData.PLAYER_LEVEL_LIMIT));
		return nil;
	end

	if (-1 == GetLastFactionNumber()) then
		Talk(1, "", "Chi�n s� phe n�o gia nh�p s� m�n h�c v� ngh� m�i ���c b�o danh, chi�n tr��ng kh�c li�t kh�ng th� ��a ���c!");
		return nil;
	end
	
	-- Notify Relay
	local szRoleName = GetName();							   -- ��ɫ��

	local hObject = OB_Create();								-- ����һ������
	ObjBuffer:PushObject(hObject, szRoleName);
	ObjBuffer:PushObject(hObject, nCurMapID)
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "apply_signup", hObject, "apply_signup_callback");
	OB_Release(hObject);
end

function apply_signup_callback(nParam, ParamHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);		-- ��ɫ��
	local nSignupResult = ObjBuffer:PopObject(ParamHandle);	 -- Relay�ϱ�����������1 - �����ɹ�, 2 - �ѱ���, 3 - �ں�����, ����ֵΪʧ��
	
	local nPlayerIndex =  SearchPlayer(szRoleName)
	if (not nPlayerIndex) or (nPlayerIndex <= 0) then
		return
	end 
	
	local szMag

	if nSignupResult == 1 then
		szMsg = "B�o danh th�nh c�ng! H�y ki�n nh�n ��i � th�nh ch�nh v� T�n Th� th�n �� b�t ��u, ��ng �i ��n b�n �� phi ph�p, b�y h�ng, �y th�c ho�c ��ng xu�t n�u kh�ng ng��i c� th� b� c�m ��u 10 ph�t. N�u nh� ng��i v�n c�n chuy�n kh�c c�n l�m th� h�y b�o danh �i."
	elseif nSignupResult == 2 then
		szMsg = "Ng��i �� trong danh s�ch x�p h�nh r�i, kh�ng c�n b�o danh l�i."
	elseif nSignupResult == 3 then
		szMsg = format(
			"Nam t� H�n ��i tr��ng phu nh�t ng�n c�u ��nh. �� mu�n ra chi�n tr��ng tham chi�n t�i sao l�i c�n do d� s� s�t? %d ph�t sau ng��i quay l�i �i.", 
			DungeonGlobalData.BLACK_LIST_TIME
		)
	elseif nSignupResult == 4 then
		szMsg = "Tr�n chi�n tr��c v�n ch�a k�t th�c, mau ch�ng quay l�i ti�n tuy�n gi�t ��ch �i."
	else
		szMsg = "B�o danh th�t b�i, xin th� l�i!"
	end
	
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", szMsg)
end

function return_map()
	local szRoleName = GetName();

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "return_map", hObject);
	OB_Release(hObject);
end

function cancel_signup()
	local szRoleName = GetName();
	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "cancel_signup", hObject);
	OB_Release(hObject);
end

function allocate_map_dynamically(ParamHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle);

	-- TODO : ������ͼ�ŵ��������ٵ�GS����
	local nGs = mod(EncounterMapManager.nCurrentGs, 8) + 1;
	local nChooseMapId = DungeonGlobalData.tbGameServerInfo[nGs];

	EncounterMapManager.nCurrentGs = EncounterMapManager.nCurrentGs + 1;
	EncounterMapManager.nCurrentGs = mod(EncounterMapManager.nCurrentGs, 8);

	local nChooseMapIdx = SubWorldID2Idx(nChooseMapId);
	if nChooseMapIdx == nil or nChooseMapIdx < 0 then
		print(">> Debug : not this server.");
		return nil;
	end

	-- create a miniencounter dungeon instance
	local tbDungeonType = DungeonType["miniencounter"];
	if tbDungeonType == nil then
		print(">> Error : tbDungeonType is nil, get miniencounter dungeon failed.");
		return nil;
	end

	local tbDungeon = tbDungeonType:new_dungeon(tbDungeonType.nTemplateMapID);		  -- Create a dungeon instance
	if tbDungeon == nil then
		print(">> Error : tbDungeon is nil, tbDungeonType:new_dungeon() failed.");
		return nil;
	end

	local nMapID  = tbDungeon.nMapId;

	-- [���뱾̨GS��tbMapList] --
	tbDungeon.nGameState = 1;
	EncounterMapManager:AddMap(tbDungeon);

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, nMapID);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "allocate_map_dynamically", hObject);
	OB_Release(hObject);

end

function enter_map(ParamHandle)	
	local tbPlayerList = ObjBuffer:PopObject(ParamHandle);
	local nMapID	   = ObjBuffer:PopObject(ParamHandle);
	local nReason	  = ObjBuffer:PopObject(ParamHandle);
	local nGameStartTime = ObjBuffer:PopObject(ParamHandle);
	
	if type(tbPlayerList) ~= "table" then
		return
	end
	
	local tbMap = EncounterMapManager:FindInMapList(nMapID);
	if tbMap then
		tbMap.nGameStartTime = nGameStartTime
		if nReason == 0 then
			tbMap:StartWait()
		end
	end

	for i = 1, getn(tbPlayerList) do
		local szRoleName = tbPlayerList[i][1]
		local nCamp = tbPlayerList[i][2]
		tbPlayerQueue[szRoleName] = nil
		
		local nPlayerIndex = SearchPlayer(szRoleName);
		if nPlayerIndex and nPlayerIndex > 0 then
		
			if CallPlayerFunction(nPlayerIndex, DungeonGlobalData.CheckPlayerState, DungeonGlobalData) then
				local nPosX, nPosY = EncounterMap:GetNewWorldPos(nCamp);
				CallPlayerFunction(nPlayerIndex, SetTask, DungeonGlobalData.TASK_BATTLE_PLAYER_CAMP, nCamp);
				CallPlayerFunction(nPlayerIndex, NewWorld, nMapID, nPosX, nPosY);
			else
				CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Tr�ng th�i c�a ng��i phi ph�p kh�ng th� v�o b�n �� chi�n tr��ng.")
			end
		end
	end
end

function unforbid_msg(ParamHandle, ResultHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle)
	
	local nPlayerIndex = SearchPlayer(szRoleName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ng��i �� ���c m� kh�a, c� th� b�o danh Ph� Li Xung ��t Chi�n.")
end

function return_map_msg(ParamHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle);

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return nil;
	end
	
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ng��i kh�ng c� tham gia Ph� Li Xung ��t Chi�n ho�c tr�n ��u �� k�t th�c, m�i b�o danh l�i.")
end

function cancel_signup_msg(ParamHandle, ResultHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle);
	local nCancelResult = ObjBuffer:PopObject(ParamHandle);	   -- ȡ�������1 - ȡ���ɹ���-1 - ȡ��ʧ�ܣ�0 - δ����

	if nCancelResult == nil then
		return nil;
	end
	
	if nCancelResult == 1 then
		tbPlayerQueue[szRoleName] = nil
	end

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		print(">> Error : nPlayerIndex is invalid.");
		return nil;
	end

		local szMsg
	if nCancelResult == 1 then
		szMsg = "H�y b�o danh th�nh c�ng."
	elseif nCancelResult == -1 then
		szMsg = "H�y b�o danh th�t b�i, xin l�m l�i."
	elseif nCancelResult == 0 then
		szMsg = "Hi�n t�i ng��i kh�ng c� b�o danh kh�ng c�n h�y b�o danh."
	elseif nCancelResult == 2 then
		szMsg = "Tr�n chi�n m� ng��i tham gia b�o danh �� vang l�n, b�y gi� b�t ��u h�i h�n �� mu�n. Mau ch�ng ��n ti�n tuy�n gi�t ��ch th�i"
	end
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", szMsg)
end

-- ������send_forbid_msg2player
-- ˵����relay������������Ϣ�����
-- ����ֵ���ޡ�
function send_forbid_msg2player(ParamHandle, ResultHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);
	if szRoleName == nil then
		return nil;
	end
	
	tbPlayerQueue[szRoleName] = nil

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return nil;
	end
	
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ng��i kh�ng � trong b�n �� h�p ph�p, �� h�y b�o danh v� b� h� th�ng cho v�o danh s�ch �en.")
end

-- ������send_prepare_fight_msg2player
-- ˵����relay������׼����Ϣ�����
-- ����ֵ���ޡ�
function send_prepare_fight_msg2player(ParamHandle, ResultHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);
	if szRoleName == nil then
		print(">> Error : szRoleName is invalid.");
		return nil;
	end

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	
	CallPlayerFunction(nPlayerIndex, Msg2Player, "Ph� Li Xung ��t Chi�n s�p b�t ��u, m�i ng��i h�y mau chu�n b�!")
end

-- ������game_finish
-- ˵����relayɾ����ͼ�ͷ���Դ��ص���gs����Դ�ͷŲ���
-- ����ֵ���ޡ�
function game_finish(ParamHandle, ResultHandle)
	local nMapID = ObjBuffer:PopObject(ParamHandle);
	if nMapID == nil or nMapID <= 0 then
		print(">> Error : nMapID is invalid.");
		return nil;
	end

	EncounterMapManager:DelMap(nMapID)
end

-- ������prepare_query
-- ˵������relay��ѯ׼����������
-- ����ֵ���ޡ�
function prepare_query()
	local hObject = OB_Create();								-- ����һ������

	RemoteExecute(
		"\\script\\missions\\miniencounter\\protocol.lua",
		"get_prepare_list_num",
		hObject,
		"prepare_qurey_callback"
	);

	OB_Release(hObject);
end

-- ������prepare_qurey_callback
-- ˵������relay��ѯ׼�����������ص�����
-- ����ֵ���ޡ�
function prepare_qurey_callback(nParam, ParamHandle)
	local nPrepareNum = ObjBuffer:PopObject(ParamHandle);
	if nPrepareNum == nil or nPrepareNum < 0 then
		Talk(1, "", "Ki�m tra s� li�u b�t th��ng, xin ki�m tra l�i!");
		return nil;
	end
	
	local strMsg = format("Hi�n t�i s� ng��i trong danh s�ch x�p h�ng l�: %d ng��i.", nPrepareNum);
	Talk(1, "", strMsg);
end

-- ������notify_relay_game_finish
-- ˵����֪ͨrelay����������ɾ����ͼ
-- ����ֵ���ޡ�
function notify_relay_game_finish(nMapId)
	if nMapId == nil then
		print(">> Error : nMapId is invalid");
		return nil;
	end
	
	-- ֪ͨrelay����������ɾ����ͼ
	local hObject = OB_Create();							-- ����һ������
	ObjBuffer:PushObject(hObject, nMapId);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "game_finish", hObject);
	OB_Release(hObject);
end

function AddPlayerToQueue(ParamHandle)
	local szPlayer = ObjBuffer:PopObject(ParamHandle)
	tbPlayerQueue[szPlayer] = 1
end

function DelPlayerFromQueue(ParamHandle)
	local szPlayer = ObjBuffer:PopObject(ParamHandle)
	tbPlayerQueue[szPlayer] = nil
end

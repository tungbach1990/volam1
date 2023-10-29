Include("\\script\\event\\qingren_jieri\\200902\\event.lua");

function main(nItemIdx)
	
	local szname_boy  = "";
	local szname_girl = "";
	valentine2009_resetEdition();

	-- ���ڻ����
	if valentine2009_isCarryon() ~= 1 then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_DIE);
		return 0;
	end
	
	-- ��������
	if GetSex()~= 0 then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_NOTMAN);
		return	1;
	end
	
	-- �ȼ�������Ҫ��
	if GetLevel() < VALENTINE2009_LEVEL_LIMIT then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_LEVEL);
		return 1;
	end
	
	-- û�и��ѹ�
	if IsCharged() ~= 1 then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_PAY);
		return 1;
	end
	
	-- ��������ʹ������
	local nUseNum = GetTask(VALENTINE2009_USE_NUM);
	if (nUseNum >= VALENTINE2009_MAX_USE_NUM) then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_MAXUSE);
		return 1;
	end
	
	-- ������Ů˫�����
	if GetTeamSize() ~= 2 then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_TEAM);
		return 1;
	else
		local nBoyIndex = PlayerIndex;
		local nGirlIndex;
		szname_boy = GetName();
		
		if(nBoyIndex == GetTeamMember(1)) then
			nGirlIndex = GetTeamMember(2);
		else
		 	nGirlIndex = GetTeamMember(1);
		end
		
		PlayerIndex = nGirlIndex;
		szname_girl = GetName();
		
		if GetSex()~= 1 then
			PlayerIndex = nBoyIndex;
			valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_TEAM);
			return 1;
		else
			PlayerIndex = nBoyIndex;
		end
	end
	
	-- ���ڳ��л��߳���
	local bInRightMap	= 0;
	local nCurMapId		= SubWorldIdx2ID(SubWorld);

	for i = 1, getn(VALENTINE2009_AREA) do
		if nCurMapId == VALENTINE2009_AREA[i] then
			bInRightMap = 1;
			break
		end
	end
	
	if (bInRightMap == 0) then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_AREA);
		return 1;
	end
	
	-- ����ս��״̬
	if GetFightState() ~= 0 then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_FIGHT);
		return 1;
	end
	
	-- ʹ������
	local _, nx, ny = GetWorldPos();
	--local sztreename = format(VALENTINE2009_TALK_TREENAME, szname_boy, szname_girl);
	local sztreename = VALENTINE2009_TALK_TREENAME;
	local nNpcIdx = AddNpc(VALENTINE2009_NPC_ID[1], 1, SubWorld, (nx-1)*32, (ny-1)*32, 1, sztreename);
	
	if nNpcIdx <= 0 then
		return 1;
	end
	
	local id_boy = String2Id(szname_boy);
	SetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_BOY,   floor(id_boy / 100000));
	SetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_BOY2,  mod(id_boy, 100000) );
	
	local id_girl = String2Id(szname_girl);
	SetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_GIRL, floor(id_girl / 100000));
	SetNpcParam(nNpcIdx, VALENTINE2009_NPC_NAME_GIRL2, mod(id_girl, 100000));
	
	SetNpcParam(nNpcIdx, VALENTINE2009_NPC_HAS_WATER, 0);
	SetNpcParam(nNpcIdx, VALENTINE2009_NPC_STEP, VALENTINE2009_NPC_STEP_A);
	
	SetNpcScript(nNpcIdx, "\\script\\item\\qingren_jieri\\200902\\tree.lua");
	SetNpcTimer(nNpcIdx, VALENTINE2009_TIME_GROW_B);
	
	SetTask(VALENTINE2009_USE_NUM, nUseNum + 1);
	Msg2Player(VALENTINE2009_TALK_PLANT);
	return 0;
	
end
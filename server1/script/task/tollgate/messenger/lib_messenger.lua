-------------------------------------------------------------------------
-- FileName		:	lib_messenger.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 14:25:25
-- Desc			:	��ʹ�����й�����������ӵ����������������Ըı����
-------------------------------------------------------------------------

-- messengertask1 ����ʹ����ͳһʹ�õ�ǰ�ؿ�ɱ�ּ�����
-- mssengertask2   ���������ؿ�ɱ�ּ�����
-- taskgiveexp  ����ǰ��ͼ��Թ��������ľ��齱��

Include("\\script\\event\\great_night\\huangzhizhang\\event.lua") --���ӻԻ�֮ҹ�
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan

function SetMessengerPlayer(messengertask1,messengertask2,taskgiveexp,MapId) --��ֹҵ�����õĸ�����������ҼӾ����ɱ�ּ����Ľű�
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	taskgiveexp = taskgiveexp * greatnight_huang_event(2)
	
		if (nMemCount == 0 ) then
			myMemberTask = GetTask(messengertask1) + 1
			myMemberTaskTwo = GetTask(messengertask2) + 1
			nt_setTask(messengertask1,myMemberTask )
			nt_setTask(messengertask2,myMemberTaskTwo )
			if ( nt_getTask(1273) < 140000000 ) then
				AddOwnExp(taskgiveexp)
				local today_exp = nt_getTask(1273)
				nt_setTask(1273,today_exp+taskgiveexp)
			end
				PlayerIndex = nPreservedPlayerIndex;
			return
		else
			for i = 1, nMemCount do
				PlayerIndex = GetTeamMember(i)
				local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --��õ�ǰ�������λ��
				if ( MapId == prize_mapid ) and ( nt_getTask(1201) == 20 or nt_getTask(1202) == 20 or nt_getTask(1203) == 20 ) then   --�ж��Ƿ���ɱ���������ҵ����ڵ�ͼ
					myMemberTask = GetTask(messengertask1) + 1
					myMemberTaskTwo = GetTask(messengertask2) + 1
					nt_setTask(messengertask1,myMemberTask )
					nt_setTask(messengertask2,myMemberTaskTwo )
					if ( nt_getTask(1273) < 140000000 ) then
						AddOwnExp(taskgiveexp)
						local today_exp = nt_getTask(1273)
						nt_setTask(1273,today_exp+taskgiveexp)
					end
				end
			end
			PlayerIndex = nPreservedPlayerIndex;
			return
		end
		
	if ( nt_getTask(1273) >= 140000000 ) then
		Msg2Player("Xin l�i! �i�m kinh nghi�m h�m nay b�n nh�n ���c trong �i T�n s� �� v��t qu� gi�i h�n. Ng�y mai h�y ��n, c�m �n!")
	end
end;

function messenger_killbugbear_inteam(taskgiveexp,BMapId)  --С�ֹҵ�����õĸ�����������ҼӾ���Ľű�
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local nTaskExp = taskgiveexp * greatnight_huang_event(2)
	
	if ( nt_getTask(1273) < 140000000 ) then
		if (nMemCount == 0 ) then
			AddOwnExp(nTaskExp)	
			AddExp_Skill_Extend(taskgiveexp)
			local today_exp = nt_getTask(1273)
			nt_setTask(1273,today_exp+taskgiveexp)
			PlayerIndex = nPreservedPlayerIndex;
			return
		else
			for i = 1, nMemCount do
				PlayerIndex = GetTeamMember(i)
				local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --��õ�ǰ�������λ��
				if ( BMapId == prize_mapid ) and ( nt_getTask(1201) == 20 or nt_getTask(1202) == 20 or nt_getTask(1203) == 20 ) and (nt_getTask(1273) < 140000000) then   --�ж��Ƿ���ɱ���������ҵ����ڵ�ͼ
					AddOwnExp(nTaskExp)
					AddExp_Skill_Extend(taskgiveexp)
					local today_exp = nt_getTask(1273)
					nt_setTask(1273,today_exp+taskgiveexp)
				end
			end
			PlayerIndex = nPreservedPlayerIndex;
			return
		end
	elseif ( nt_getTask(1273) >= 140000000 ) then
		Msg2Player("Xin l�i! �i�m kinh nghi�m h�m nay b�n nh�n ���c trong �i T�n s� �� v��t qu� gi�i h�n. Ng�y mai h�y ��n, c�m �n!")
	end
end;

function messenger_killnpc_jifen(realjifen,BMapId)
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local Uworld1205 = nt_getTask(3000)
	local Uworld1274 = nt_getTask(1274)
	local nOrgRealjifen = realjifen;
	local nBeishu = greatnight_huang_event(2);
	realjifen = realjifen * nBeishu
	
	local xianzhijifen = 3500 
	if ( nBeishu == 2 or nBeishu == 3 ) then
		  xianzhijifen = 7000
	end
	
	if ( nt_getTask(1274) < xianzhijifen ) then
		if (nMemCount == 0 ) then
			nt_setTask(3000,Uworld1205+realjifen)
			nt_setTask(1274,Uworld1274+realjifen)
			if ( nt_getTask(1224) == 0 ) then
				nt_setTask(1223,nt_getTask(1223)+realjifen)
			end
			if (nBeishu > 0) then
				nOrgRealjifen = floor(nOrgRealjifen / nBeishu);
			end;
			tongaward_message(nOrgRealjifen);	--by Сɽ
			PlayerIndex = nPreservedPlayerIndex;
			return
		else
			local i = random(1,nMemCount)
			PlayerIndex = GetTeamMember(i)
			local Uworld1205 = nt_getTask(3000)
			local Uworld1274 = nt_getTask(1274)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --��õ�ǰ�������λ��
			if ( BMapId == prize_mapid ) and ( nt_getTask(1201) == 20 or nt_getTask(1202) == 20 or nt_getTask(1203) == 20 ) and ( nt_getTask(1274) < xianzhijifen ) then   --�ж��Ƿ���ɱ���������ҵ����ڵ�ͼ
				nt_setTask(3000,Uworld1205+realjifen)
				nt_setTask(1274,Uworld1274+realjifen)
				if ( nt_getTask(1224) == 0 ) then
					nt_setTask(1223,nt_getTask(1223)+realjifen)
				end
				if (nBeishu > 0) then
					nOrgRealjifen = floor(nOrgRealjifen / nBeishu);
				end;
				tongaward_message(nOrgRealjifen);	--by Сɽ
			end
			PlayerIndex = nPreservedPlayerIndex;
			return
		end
	elseif ( nt_getTask(1274) >= xianzhijifen ) then
		Msg2Player("Xin l�i! �i�m kinh nghi�m h�m nay b�n nh�n ���c trong �i T�n s� �� v��t qu� gi�i h�n. Ng�y mai h�y ��n, c�m �n!")
	end
end

function SetTask2Team(nGetTaskid, nRealTaskid, nGoalIdx)
	local nDate = tonumber(GetLocalDate("%y%d%m"));
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	
	local ntaskidx = GetTask(nGetTaskid);
	if (nMemCount == 0 ) then
		if (ntaskidx == nGoalIdx) then
			SetTask(nRealTaskid, GetTask(nRealTaskid) + 1);
		end
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --��õ�ǰ�������λ��
			local nmembertaskidx = GetTask(nGetTaskid);
			if (nmembertaskidx == nGoalIdx and nmembertaskidx == ntaskidx) then   --�ж��Ƿ���ɱ���������ҵ����ڵ�ͼ
				SetTask(nRealTaskid, GetTask(nRealTaskid) + 1);
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
	end
end
-------------------------------------------------------------------------
-- FileName		:	turebug90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-20 11:18:14
-- Desc			:   ǧ����ؿ���С�ֽű�[90������]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\enemy_turebugbear.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --���� nt_getTask ͬ���������ͻ��˵���
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --ȡ������
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --���ü�ʱ��
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --���ͬ�������ı��

Include("\\script\\activitysys\\functionlib.lua")--����lib:DoFunByPlayer

TUREBUGBEAR_EXP =tonumber( TabFile_GetCell( "tollprize" ,10 ,"bug_exp"))  --С�־���
TUREBUGBEAR_MAPID= 395  --ǧ����ĵ�ͼid
TUREBUGBEAR_MESSENGEREXP= tonumber( TabFile_GetCell( "tollprize" ,10 ,"bug_jifen"))  --С�־���

--�����������2����Χ
SHARE_BOSS_DIST_LEN = 80^2--�þ��뷶Χ�ڵĶ���ɱ��boss���Լ����Կ�����

function OnDeath(Npcindex)
	local name = GetName()
	local turesureindex = GetNpcParam(Npcindex,1)
	set_team_task_temp181(turesureindex)
	
	if (  messenger_middletime() == 10 ) then --����ڵ�ͼ�е�ʱ��
		Msg2Player("Xin l�i! "..name.."! B�n �� h�t th�i gian th�c hi�n nhi�m v� T�n s�! Nhi�m v� th�t b�i!.")
		losemessengertask()
	else
		turesure_killbugbear()
	end
end

function set_team_task_temp181(turesureindex)

--Fix bug n�u c�ng t� ��i nh�ng kh�ng c�ng m� s�, kh�ng cho ho�n th�nh nhi�m v� - Modified by DinhHQ - 20110502
	local nTaskCode = GetTask(1201)
	local nOldPlayer = PlayerIndex;
	local nMemberTaskCode = 0
	local nTeamSize = GetTeamSize();
	if (nTeamSize > 1) then
		local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			nMemberTaskCode = GetTask(1201)
			if nMemberTaskCode == nTaskCode then
				lib:DoFunByPlayer(GetTeamMember(i), real_set_task_temp181, turesureindex, nSelfMapId, nSelfX, nSelfY);
			end
		end
		PlayerIndex = nOldPlayer
	else
		real_set_task_temp181(turesureindex, 0, 0, 0)
	end
end

function is_near(nMapId, nPosX, nPosY)
	if not nMapId then
		return 0
	end
	if nMapId == TUREBUGBEAR_MAPID then
		local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
		if nSelfMapId==nMapId then
			local nDis2 = (nPosX - nSelfX)^2 + (nPosY - nSelfY)^2
			if nDis2 < SHARE_BOSS_DIST_LEN then
				return 1
			end
		end
	elseif nMapId == 0 then
		return 1--û�д����ͼid
	end
	return 0
end

function real_set_task_temp181(turesureindex, nMapId, nPosX, nPosY)
	local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
	if is_near(nMapId, nPosX, nPosY)==1 then
		SetTaskTemp(181,turesureindex)
		Msg2Player(format("Ng��i c� th� m� B�o R��ng <color=yellow>%d s�<color> Thi�n B�o Kh�",turesureindex));
	end
end

function testMemberDist(nDist)
	local nSave = SHARE_BOSS_DIST_LEN
	SHARE_BOSS_DIST_LEN = nDist
    local nTeamSize = GetTeamSize();
	if (nTeamSize > 1) then
		local nSelfMapId, nSelfX, nSelfY = GetWorldPos()
		for i=1,nTeamSize do
			lib:DoFunByPlayer(GetTeamMember(i), real_set_task_temp181, 0, nSelfMapId, nSelfX, nSelfY);
		end
	end
	SHARE_BOSS_DIST_LEN = nSave
end



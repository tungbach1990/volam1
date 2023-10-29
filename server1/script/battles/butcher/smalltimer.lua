IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\butcher\\head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\sj_announce.lua")		-- ��Ż֮ǧ��Ӣ��
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\battles\\songjingtetan_position.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")


tbIndex = {}	-- ѡ�е������Index
tbPoint = {}	-- ��ǰ��ѡ������꼯��
tbNpc = 
{
	[1] = 
	{
		nNpcId = 1685,  --npc Id
		nLevel = 95,		-- �ȼ�
		--nSeries = 1,		-- ����
		bNoRevive = 1,			-- ������
		szName = "��c Th�m",		-- ����
		nIsboss = 1,
		nCurCamp = 1,	--��Ӫ 1�� 2��
	},
	[2] = 
	{
		nNpcId = 1686,  --npc Id
		nLevel = 95,		-- �ȼ�
	--	nSeries = 1,		-- ����
		bNoRevive = 1,			-- ������
		szName = "��c Th�m",		-- ����
		nIsboss = 1,
		nCurCamp = 2,	--��Ӫ 1�� 2��
	}
} 

function SelectPosition(nRandomCount)
	for i=1,4 do
		tbIndex[i] = random(1,nRandomCount)
		local bFlag = 1
		for j=1,i-1 do
			if tbIndex[j] == tbIndex[i] then
				bFlag = 0
				break
			end
		end
		if bFlag == 0 then
			i = i - 1
		end
	end
end

function AddTeTan(nNowTimeCount)
	if tbAppearTime[nNowTimeCount - RUNGAME_TIME] == 1 then
		local nrandomCount = 0
		-- �ж���ǰ��ͼ��Id
		local nNowMapId = BT_GetGameData(GAME_MAPID)
		if nNowMapId == 380 then
			tbPoint = tbPoint_map380
			nrandomCount = 10
		elseif nNowMapId == 383 then
			tbPoint = tbPoint_map383
			nrandomCount = 20
		else
			return
		end
		s_area = BT_GetGameData(GAME_CAMP1AREA) 	-- GAME_CAMP1AREA �� GAME_CAMP1AREA ��
		j_area = BT_GetGameData(GAME_CAMP2AREA)
		
		Msg2MSAll(MISSIONID, "��c Th�m m�i �� ti�n v�o chi�n tr��ng r�i, m�i ng��i nhanh ch�ng h�nh ��ng!");
		
		SelectPosition(nrandomCount)
		local tbPosition_s = tbPoint[s_area]
		local tbPosition_j = tbPoint[j_area]
		
		for i=1,4 do
			local nIndex = tbIndex[i]
			tbNpc.szName = "��c Th�m"
			basemission_CallNpc(tbNpc[1], nNowMapId, tbPosition_s[nIndex].x * 32, tbPosition_s[nIndex].y * 32)
			local msg = format("T�ng th�m T�ng Kim ��c Th�m: X = %d Y = %d",tbPosition_s[nIndex].x,tbPosition_s[nIndex].y)
			WriteLog(msg)
			tbNpc.szName = "��c Th�m"
			basemission_CallNpc(tbNpc[2], nNowMapId, tbPosition_j[nIndex].x * 32, tbPosition_j[nIndex].y * 32)
			local msg = format("T�ng th�m Kim ��c Th�m : X = %d Y = %d",tbPosition_j[nIndex].x,tbPosition_j[nIndex].y)
			WriteLog(msg)
		end
	end
end

-- 20s����һ��
function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--��������ͳ�Ƶ�ǰ��ʱ�������˶��ٴ���
	SetMissionV(MS_TIMER1, t)
	
	--Storm �ӽ�������
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu v�c S� c�p "
	elseif (lsf_level == 2) then
		resultstr = "Khu v�c Trung c�p "
	elseif (lsf_level == 3) then
		resultstr = "Khu v�c Cao c�p "
	end
	
	if (t == RUNGAME_TIME) then --���������ʽ��սʱ�̣���ֹͣ��������ʽ����ս���׶�
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."Th�i gian b�o danh Phong V�n Lu�n Ki�m �� h�t! Chi�n ��u ch�nh th�c khai chi�n!", 2);
		Msg2MSAll(MISSIONID, "Phong V�n Lu�n Ki�m ch�nh th�c khai chi�n! C�c chi�n s�! X�ng l�n!");
		WriteLog("butcher battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
		-- �ճ�����ˢ�¶Ի�NPC
		%tbTalkDailyTask:AddTalkNpc(BT_GetGameData(GAME_MAPID), BT_GetGameData(GAME_MAPID));
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>Phong V�n Lu�n Ki�m �ang trong giai �o�n b�o danh. C�c hi�p kh�ch mu�n tham gia h�y nhanh ch�ng ��n T��ng D��ng ho�c Chu Ti�n tr�n �� b�o danh! (ho�c d�ng Phong V�n Chi�u th�) .Th�i gian b�o danh c�n l�i l�:"..RestMin.." ph�t. �i�u ki�n tham gia: C�p kh�ng �t h�n 40, ph� b�o danh 1 Phong V�n Chi�u Binh L�nh. Sau khi khai chi�n n�u nh� v�n ch�a ��n gi�i h�n cao nh�t th� v�n c� th� b�o danh v�o ti�p";
			str2 = "<#>C�ch th�i gian khai chi�n ch� c�n:"..RestMin.."ph�t"
		else
			str1 = resultstr.."<#>Phong V�n Lu�n Ki�m �ang trong giai �o�n b�o danh. C�c hi�p kh�ch mu�n tham gia h�y nhanh ch�ng ��n T��ng D��ng ho�c Chu Ti�n tr�n �� b�o danh! (ho�c d�ng Phong V�n Chi�u th�) .Th�i gian b�o danh c�n l�i l�:"..RestMin.."ph�t"..RestSec.." gi�y. �i�u ki�n tham gia: C�p kh�ng �t h�n 40, ph� b�o danh 1 Phong V�n Chi�u Binh L�nh. Sau khi khai chi�n n�u nh� v�n ch�a ��n gi�i h�n cao nh�t th� v�n c� th� b�o danh v�o ti�p";
			str2 = "<#>C�ch th�i gian khai chi�n ch� c�n:"..RestMin.."ph�t"..RestSec.." gi�y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--֪ͨ������ҿ�սʣ��ʱ��
	end
	
	if (t >= RUNGAME_TIME) then
		AddTeTan(t)  -- �����ν���̽

		--�������ĳһ��Ӫ����������С������������������˶����Ӫֱ�ӻ�ʤ
		local group1count = GetMSPlayerCount(MISSIONID, 1)
		local group2count = GetMSPlayerCount(MISSIONID, 2)
		if ( group1count < but_getminplayerlimit() or group2count < but_getminplayerlimit()) then
			if (group1count > group2count) then
				SetMissionV(MS_MOSTDEATH, 1)
				CloseMission(MISSIONID)
			elseif (group1count < group2count) then
				SetMissionV(MS_MOSTDEATH, 2)
				CloseMission(MISSIONID)
			else
				SetMissionV(MS_MOSTDEATH, 0) 
				CloseMission(MISSIONID)
			end
			return
		end
		if (t > RUNGAME_TIME) then
			--ÿһ����ͨ�浱ǰ˫�����֣���npc
			if (mod(t, 3) == 0 ) then
				msstr = "C�ng c�o: hi�n gi� t�ng t�ch l�y c�a 2 phe l� "..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
				Msg2MSAll(MISSIONID, msstr)
			end
		
			but_pop2home( 1 )
			but_pop2home( 2 )
			
			bt_announce(lsf_level, t);
			TB_QIANQIU_YINGLIE0904:announce(lsf_level, t);
		end
	end

end




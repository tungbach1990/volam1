-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ǧ��Ӣ�� - ��ʾս����Ϣ
-- �ļ�������sj_announce.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-04-08 14:15:25

-- ======================================================

if not TB_QIANQIU_YINGLIE0904 then
	Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\head.lua");
end

Include("\\script\\lib\\common.lua");
Include("\\script\\battles\\battle_rank_award.lua");

function TB_QIANQIU_YINGLIE0904:announce(lsf_level, n_time)
	
	if (mod(n_time, 30) == 0) then
		if (self:check_date() == 1 and lsf_level == 3) then
			local old_player = PlayerIndex;
			-- ��������
--			Msg2MSAll(MISSIONID, strfill_center(format("�������%d��������", 10), 30));
--			Msg2MSAll(MISSIONID, strfill_center("��", 4)..strfill_center("�����", 20)..strfill_center("����", 6));
--			for i = 1, 10 do 
--				local szname, npoint = BT_GetTopTenInfo(i, PL_TOTALPOINT);
--				if (szname and szname ~= "") then
--					Msg2MSAll(MISSIONID, strfill_center(tostring(i), 4)..strfill_center(szname, 20)..strfill_center(tostring(npoint), 6));
--				end
--			end
			
			-- ��ն����
			tbPlayer = {};
			battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_SER);
			Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("Top li�n tr�m", 30));
			Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", 4)..strfill_center("T�n ng��i ch�i", 20)..strfill_center("Li�n tr�m", 6));
			for i = 1, 5 do
				if tbPlayer[i] and tbPlayer[i] > 0 then
					PlayerIndex = tbPlayer[i];
					local szname, npoint = GetName(), BT_GetData(PL_MAXSERIESKILL);
					if (szname and szname ~= "") then
						Msg2MSAll(MISSIONID, strfill_center(tostring(i), 4)..strfill_center(szname, 20)..strfill_center(tostring(npoint), 6));
					end
				end
			end
			
			-- PK�������
			tbPlayer = {};
			battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_PK);
			Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP PK", 30));
			Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", 4)..strfill_center("T�n ng��i ch�i", 20)..strfill_center("PK", 6));
			for i = 1, 5 do 
				if tbPlayer[i] and tbPlayer[i] > 0 then
					PlayerIndex = tbPlayer[i];
					local szname, npoint = GetName(), BT_GetData(PL_KILLPLAYER);
					if (szname and szname ~= "") then
						Msg2MSAll(MISSIONID, strfill_center(tostring(i), 4)..strfill_center(szname, 20)..strfill_center(tostring(npoint), 6));
					end
				end
			end
			
			-- ��ɱNPC���� ��Ԫ˧����ģʽ
			if (MISSIONID == 16) then
				tbPlayer = {};
				battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_NPC);
				Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP NPC", 30));
				Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", 4)..strfill_center("T�n ng��i ch�i", 20)..strfill_center("NPC", 6));
				for i = 1, 5 do 
					if tbPlayer[i] and tbPlayer[i] > 0 then
						PlayerIndex = tbPlayer[i];
						local szname, npoint = GetName(), BT_GetData(PL_KILLNPC);
						if (szname and szname ~= "") then
							Msg2MSAll(MISSIONID, strfill_center(tostring(i), 4)..strfill_center(szname, 20)..strfill_center(tostring(npoint), 6));
						end
					end
				end
			end
		end
	end
end


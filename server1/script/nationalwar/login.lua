Include("\\script\\nationalwar\\head.lua")
Include("\\script\\global\\login_head.lua")

-- ��ҵ�¼����
function nationalwar_login()
	-- �����׶�ռ�ǰ����Ϣ
	SyncCitySummary(CITYIDX_BIANJING, CITYIDX_LINAN)
	if (NW_IsEmperor() == 1) then
		-- ���ӹ⻷������
		AddSkillState(SKILLID_STATE_EMPEROR, 1, 0, 99999999)
		AddSkillState(SKILLID_SKILL_EMPEROR, 1, 0, 99999999)
	else
		local la_tong, _ = GetCityOwner(CITYIDX_LINAN)		-- �ٰ�ռ�ǰ��
		local bj_tong, _ = GetCityOwner(CITYIDX_BIANJING)	-- �꾩ռ�ǰ��
		local my_tong = GetTong()
		if (my_tong == la_tong or my_tong == bj_tong) then
			local pos = NW_GetDuty()
			if (pos == NWPOSITION_NONE) then
				return
			elseif (pos == NWPOSITION_KING) then
				-- �����⻷������
				AddSkillState(SKILLID_STATE_KING, 1, 0, 99999999)
				AddSkillState(SKILLID_SKILL_KING, 1, 0, 99999999)
			elseif (pos == NWPOSITION_MINISTER) then
				-- ��ة��⻷������
				AddSkillState(SKILLID_STATE_MINISTER, 1, 0, 99999999)
				AddSkillState(SKILLID_SKILL_MINISTER, 1, 0, 99999999)
			elseif (pos == NWPOSITION_MARSHAL) then
				-- �����Ԫ˧�⻷
				AddSkillState(SKILLID_STATE_MARSHAL, 1, 0, 99999999)
			elseif (pos == NWPOSITION_PIONEER) then
				-- �ȷ�ٹ⻷
				AddSkillState(SKILLID_STATE_PIONEER, 1, 0, 99999999)
			end
		end
	end
end

login_add(nationalwar_login, 1)

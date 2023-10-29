Include("\\script\\nationalwar\\head.lua")
Include("\\script\\battles\\battlehead.lua")
IncludeLib("BATTLE")

-- ����ͬ��
function OnCongratulation()
	-- ���Ӳ��ܳ����Լ�
	if (NW_IsEmperor() == 1) then
		return
	end
	-- �������ұ�����120������(ת������ҵȼ�������)
	if (GetLevel() <= 120 and ST_IsTransLife() ~= 1) then
		return
	end

	-- �������ƣ�һ������
	local task_count = GetBitTask(TASKNO_NW_CONGRATULATION, 0, 8)
	local task_dtime = GetBitTask(TASKNO_NW_CONGRATULATION, 8, 24)
	local curr_dtime = GetCurServerTime() / SECONDS_ONEDAY
	if (task_dtime == 0 or curr_dtime - task_dtime >= 7) then
		SetBitTask(TASKNO_NW_CONGRATULATION, 8, 24, curr_dtime)
		SetBitTask(TASKNO_NW_CONGRATULATION, 0, 8, 1)
	elseif (task_count < 3) then
		SetBitTask(TASKNO_NW_CONGRATULATION, 0, 8, task_count + 1)
	else
		return
	end
	
	-- �Ӿ���
	AddOwnExp(200000)
	NW_AwardEmperor(10000)
	
	-- �̻�Ч��
	local _, x, y = GetWorldPos()
	CastSkill(687, 1, x * 32, y * 32)
end

function Append(tb, item)
	tb[getn(tb) + 1] = item
end

-- ְλ�仯
function OnPositionChange(pos, flag)
	local tb_add = {}
	local tb_del = {}
	if (pos == NWPOSITION_EMPEROR) then
		if (flag == 1) then
			-- ɾ�������⻷/����
			Append(tb_del, SKILLID_STATE_KING)
			Append(tb_del, SKILLID_SKILL_KING)
			-- �������ӹ⻷/����
			Append(tb_add, SKILLID_STATE_EMPEROR)
			Append(tb_add, SKILLID_SKILL_EMPEROR)
		else
			-- ɾ�����ӹ⻷
			Append(tb_del, SKILLID_STATE_EMPEROR)
			Append(tb_del, SKILLID_SKILL_EMPEROR)
			if (NW_GetDuty() == NWPOSITION_KING) then
				-- ���ӹ����⻷/����
				Append(tb_add, SKILLID_STATE_KING)
				Append(tb_add, SKILLID_SKILL_KING)
			end
		end
	elseif (pos == NWPOSITION_KING) then
		if (flag == 1) then
			-- ���ӹ����⻷/����
			Append(tb_add, SKILLID_STATE_KING)
			Append(tb_add, SKILLID_SKILL_KING)
		else
			-- ɾ�������⻷/����
			Append(tb_del, SKILLID_STATE_KING)
			Append(tb_del, SKILLID_SKILL_KING)
		end
	elseif (pos == NWPOSITION_MINISTER) then
		if (flag == 1) then
			-- ���Ӵ�ة��⻷/����
			Append(tb_add, SKILLID_STATE_MINISTER)
			Append(tb_add, SKILLID_SKILL_MINISTER)
		else
			-- ɾ����ة��⻷/����
			Append(tb_del, SKILLID_STATE_MINISTER)
			Append(tb_del, SKILLID_SKILL_MINISTER)
		end
	elseif (pos == NWPOSITION_MARSHAL) then
		if (flag == 1) then
			-- ���ӱ����Ԫ˧�⻷
			Append(tb_add, SKILLID_STATE_MARSHAL)
			-- �����Ԫ˧����ֻ���ڹ�ս�ν��ͼʹ��
			if (BT_GetGameData(GAME_BATTLEID) == 2) then
				Append(tb_add, SKILLID_SKILL_MARSHAL)
			end
		else
			-- ɾ�������Ԫ˧�⻷/����
			Append(tb_del, SKILLID_STATE_MARSHAL)
			Append(tb_del, SKILLID_SKILL_MARSHAL)
		end
	elseif (pos == NWPOSITION_PIONEER) then
		if (flag == 1) then
			-- �����ȷ�ٹ⻷/����
			Append(tb_add, SKILLID_STATE_PIONEER)
			-- �ȷ�ټ���ֻ���ڹ�ս�ν��ͼʹ��
			if (BT_GetGameData(GAME_BATTLEID) == 2) then
				Append(tb_add, SKILLID_SKILL_PIONEER)
			end
		else
			-- ɾ���ȷ�ٹ⻷/����
			Append(tb_del, SKILLID_STATE_PIONEER)
			Append(tb_del, SKILLID_SKILL_PIONEER)
		end
	else
		return
	end
	-- ��ְ����ɾ������״̬����ֹ�����ۼӼ��ܼ��𳬹����ֵ
	for i = 1, getn(tb_del) do
		RemoveSkillState(tb_del[i])
	end
	-- ����
	for i = 1, getn(tb_add) do
		AddSkillState(tb_add[i], 1, 0, 99999999)
	end
end

-- ��ҽ���/�뿪��ս�ν��ͼ�¼�
function nationalwar_mapevent(flag)
	if (BT_GetGameData(GAME_BATTLEID) ~= 2) then
		return
	end
	local la_tong, _ = GetCityOwner(CITYIDX_LINAN)		-- �ٰ�ռ�ǰ��
	local bj_tong, _ = GetCityOwner(CITYIDX_BIANJING)	-- �꾩ռ�ǰ��
	local my_tong = GetTong()
	if (my_tong == la_tong or my_tong == bj_tong) then
		local pos = NW_GetDuty()
		local skill = 0
		if (pos == NWPOSITION_MARSHAL) then
			-- �����Ԫ˧����
			skill = SKILLID_SKILL_MARSHAL
		elseif (pos == NWPOSITION_PIONEER) then
			-- �ȷ�ټ���
			skill = SKILLID_SKILL_PIONEER
		else
			return
		end
		if (flag == 1) then
			-- �����ͼ
			AddSkillState(skill, 1, 0, 99999999)
		else
			-- �뿪��ͼ
			RemoveSkillState(skill)
		end
	end
end

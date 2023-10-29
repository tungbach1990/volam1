--partner_skillbook.lua (������ű�)
--create by luobaohang @20050802
--last edit by luobaohang @20050816

IncludeLib("FILESYS");
IncludeLib("PARTNER");

Include("\\script\\lib\\string.lua");

TabFile_Load("\\settings\\partner\\skill_requirement.txt", "skill_require")
--randomseed(GetCurrentTime())

function SkillBookScript(iItem, nType)
	local partner_index = PARTNER_GetCurPartner()
	if (partner_index == nil or partner_index <= 0) then
		Msg2Player("<#> B�n ch�a ch�n ��ng h�nh!")
		return 1 
	end
	local id1,id2,id3,item_level = GetItemProp(iItem)
	local index = TabFile_Search("skill_require", 1, tostring(id3))
	local base_level = tonumber(TabFile_GetCell("skill_require", index, 2))
	local level_increment = tonumber(TabFile_GetCell("skill_require", index, 3))
	local series_limit = tonumber(TabFile_GetCell("skill_require", index, 4))
	local skill_id = tonumber(TabFile_GetCell("skill_require", index, 5))
		--�ж���������
	if (series_limit ~= -1) then
		--Msg2Player(series_limit); ����
		--Msg2Player(PARTNER_GetSeries(partner_index));
		if (series_limit ~= PARTNER_GetSeries(partner_index)) then
			Msg2Player("<#> ��ng h�nh c�a b�n ng� h�nh kh�ng h�p v�i s�ch n�y, ch�a th� t�m hi�u b� quy�t b�n trong");
			return 1
		end
	end
		--�ж�ͬ������ȼ�
	local level_require = base_level + (item_level - 1) * level_increment;
	local partner_level = PARTNER_GetLevel(partner_index);
	if (level_require > partner_level) then
		Msg2Player("<#> ��ng h�nh c�a b�n ��ng c�p kh�ng h�p v�i s�ch n�y, ch�a th� t�m hi�u b� quy�t b�n trong");
		return 1
	end
		--�ж��Ƿ����ͬ�鵱ǰ���ܵȼ�
	local skill_level, skill_exp = PARTNER_GetSkillInfo(partner_index, skill_id);
	if (skill_level >= item_level) then
		Msg2Player("<#> ��ng h�nh c�a b�n s�m �� bi�t ���c k� n�ng n�y, c�m th�y kh�ng c�n g� d� h�c n�a.");
		return 1
	elseif (skill_level ~= item_level-1) then --��������
		Msg2Player("<#> ��ng h�nh c�a b�n k� n�ng c�n b�n c�n k�m, ��ng n�n v�i qu�!");
		return 1
	elseif (skill_level == 0) then	--��ǰ����δѧϰ��
		if (nType == 2) then
			--�ж��Ƿ��м��ܿ�λ
			local skill_can_learn = {1, 2, 3, 5, 7, 9, 11, 13, 15, 16} --��ѧϰ�������ȼ�����
			local skills_learn = PARTNER_GetAllSkill(partner_index, 2);
			local nIndexTmp = floor(partner_level/10) + 1;
			if (nIndexTmp < 0) then 
				nIndexTmp = 0;
			elseif (nIndexTmp > 10) then 
				nIndexTmp = 10;
			end
			local nSkillsLearn;
			if (skills_learn == nil) then
				nSkillsLearn = 0;
			else
				nSkillsLearn = getn(skills_learn);
			end
			if (nSkillsLearn >= skill_can_learn[nIndexTmp]) then
				Msg2Player("<#> ��ng c�p ��ng h�nh hi�n t�i c�a b�n kh�ng th� h�c th�m k� n�ng ph� tr� m�i, mu�n h�c k� n�ng ph� tr� ��ng c�p ph�i cao h�n.");
				return 1
			end
		elseif (nType == 3)	then
			local skills_learn = PARTNER_GetAllSkill(partner_index, 3);
			if (skills_learn ~= nil and getn(skills_learn) > 0) then--��ѧ������
			 	Msg2Player("<#> ��ng h�nh c�a b�n �� n�m b�t ���c m�t tuy�t k�, kh�ng th� h�c th�m n�a");
			 	return 1
			 end
		else	--���Ǹ��Ӽ��ܻ��������ѧϰ
			Msg2Player("<#> ��ng h�nh c�a b�n tham kh�o m�t t�ch �� n�a ng�y, ch�a th� t�m ra b� quy�t b�n trong");
		end
	end
	if (nType == 0) then
		local nTaskValue = PARTNER_GetTaskValue(partner_index, 11)
		if (nTaskValue >= 20) then
			Msg2Player("<#> ��ng h�nh c�a b�n kh�ng th� h�c k� n�ng n�y n�a!")
			return 1
		end
		PARTNER_SetTaskValue(partner_index, 11, nTaskValue + 1)
	end
	--ѧϰ������
	--local skills_add = random(skill_level + 1, item_level)
	PARTNER_AddSkill(partner_index, nType, skill_id, item_level)
	Msg2Player("<#> ��ng h�nh c�a b�n �� l�nh ng� ���c k� n�ng c�p "..tostring(item_level).." "..GetSkillName(skill_id))
	return 0
end

function GetDesc(iItem)
	local id1,id2,id3,item_level = GetItemProp(iItem)
	local index = TabFile_Search("skill_require", 1, tostring(id3))
	local base_level = tonumber(TabFile_GetCell("skill_require", index, 2))
	local level_increment = tonumber(TabFile_GetCell("skill_require", index, 3))
	local series_limit = tonumber(TabFile_GetCell("skill_require", index, 4))
	local skill_id = tonumber(TabFile_GetCell("skill_require", index, 5))
	--ͬ������ȼ�
	local skill_name = GetSkillName(skill_id);
	local level_require = base_level + (item_level - 1) * level_increment
	local level_skillrequire = item_level - 1;
	local strDesc = format("<color=yellow> quy�n th� %d", item_level)
	strDesc = strDesc.."\n ��ng c�p ��ng h�nh c�n:"..level_require;
	if (series_limit >= 0) then
		strDesc = strDesc.."\n Ng� h�nh ��ng h�nh c�n:"..toSeries(series_limit);
	end
	if(level_skillrequire > 0) then
		strDesc= strDesc.."\n C�n<"..skill_name..">"..level_skillrequire.."c�p";
	end
	return strDesc;
end
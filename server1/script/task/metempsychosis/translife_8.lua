-- ���ܣ�8ת
-- ���ߣ��θ߲�
-- ����ʱ�䣺2016-10-11

Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\task\\metempsychosis\\translife_7_config.lua")



TransLife8 = {};
tbTL8MainDlg = {};
TSK_TASK_IS_TS8=2683

TransLife8.tbNeedItem = {
    {6, 1, 4476,  "Ng�c Chuy�n Sinh", 3, -1, 5}
};

TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION = 4236;  -- ����8ת�Ի�������ѡ��ļ���ѡ��
TransLife8.TRANSLIFE_8_SKILL = {
    {"��i Di�p Kh� Tr�o", 993},
    {"Tr�ng k�ch tuy�t ��i", 998}
};

TransLife8.TB_SKILL_LEVEL_UP = {
    [10] = 1,
	[150] = 2,
	[151] = 2,
	[152] = 2,
	[153] = 2,
	[154] = 2,
	[155] = 2,
	[156] = 2,
	[157] = 2,
	[158] = 2,
	[159] = 2,
	[160] = 2,
	[161] = 2,
	[162] = 2,
	[163] = 2,
	[164] = 2,
	[165] = 2,
	[166] = 2,
	[167] = 2,
	[168] = 2,
	[169] = 2,
	[170] = 3,
	[171] = 3,
	[172] = 3,
	[173] = 3,
	[174] = 3,
	[175] = 3,
	[176] = 3,
	[177] = 3,
	[178] = 3,
	[179] = 3,
	[180] = 3,
	[181] = 3,
	[182] = 3,
	[183] = 3,
	[184] = 3,
	[185] = 3,
	[186] = 3,
	[187] = 3,
	[188] = 3,
	[189] = 3,
	[190] = 4,
	[191] = 4,
	[192] = 4,
	[193] = 4,
	[194] = 4,
	[195] = 4,
	[196] = 4,
	[197] = 4,
	[198] = 4,
	[199] = 4,
	[200] = 4
};

-- ���ɽ���ŶԻ�ѯ����ν���8ת�����Ļص�
function TransLife8:ShowMainDlg()
	CreateNewSayEx("Sau khi ��t c�p 200 tr�ng sinh 7, c� th� �em cho ta 5 c�i Ng�c Tr�ng Sinh, ��ng th�i ng��i ph�i h�c B�c ��u Tr�ng Sinh Thu�t - C� s� thi�n , ta s� gi�p ng��i tr�ng sinh 8.", tbTL8MainDlg);
end

function TransLife8:Init()
	self:RegisterEvent();
	self:InitDialog();
end

function TransLife8:RegisterEvent()
    for nLevelConfig, tbParam in TransLife8.TB_SKILL_LEVEL_UP do
		EventSys:GetType("OnPlayerLevelUp"):Reg(nLevelConfig, TransLife8.OnLevelUpProcess, self, nLevelConfig);
	end
end

-- The auto level up of the skill of translife 8.
function TransLife8:OnLevelUpProcess(nLevel)
	if ST_GetTransLifeCount() == 8 and TransLife8.TB_SKILL_LEVEL_UP[nLevel] then
		local nSkillLevel = TransLife8.TB_SKILL_LEVEL_UP[nLevel];
		local nSelection = GetTask(TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION);

		if (nSelection > 0) and (TransLife8.TRANSLIFE_8_SKILL[nSelection]) then
			local _, nSkillID = unpack(TransLife8.TRANSLIFE_8_SKILL[nSelection]);
			AddMagic(nSkillID, nSkillLevel);
		end
	end
end

function TransLife8:InitDialog()
	tinsert(tbTL8MainDlg, {"B�t ��u tr�ng sinh 8", self.BeginTransLife8, {self}});
	tinsert(tbTL8MainDlg, {"Ta kh�ng mu�n tr�ng sinh 8"});
end

function TransLife8:BeginTransLife8()

	local nCheckCode = self:CheckCondition()
	if nCheckCode ~= 1 then
		return
	end
	
	self:ChooseOneResistance();
end


function TransLife8:CheckCondition()
	local is_ts7 = GetTask(TSK_TASK_IS_TS7)
	if (is_ts7 < 1) then
		Talk(1,"", "��i hi�p h�y tr�ng sinh 7 r�i ��n g�p ta!");
		return 0
	end

	local is_ts8 = GetTask(TSK_TASK_IS_TS8)
	if (is_ts8 > 0) then
		Talk(1,"", "��i hi�p �� tr�ng sinh l�n 8 r�i. Xin ki�m tra l�i");
		return 0
	end

	if(GetLevel() < 200) then
		Talk(1,"", "��i hi�p h�y ��t c�p 200 r�i quay l�i!");
		return 0
	end

	--admin edit
	-- local nTransLifeCount = ST_GetTransLifeCount()
	-- if nTransLifeCount >= 8 then
	-- 	Talk(1,"", "Ng��i �� ti�n h�nh tr�ng sinh 8 r�i.");
	-- 	return 0;
	-- end

	-- if nTransLifeCount ~= 7 or GetLevel() < TB_LEVEL_LIMIT[8] then
	-- 	Talk(1,"", format("Ch� c� hi�p s� c�p %d tr�ng sinh 7 m�i c� th� ti�n h�nh tr�ng sinh 8.", TB_LEVEL_LIMIT[8]));
	-- 	return 0;
	-- end
	
	-- if (check_zhuansheng_level() ~= 1) then	
	-- 	return 0;
	-- end

	-- local nTaskValue = GetTask(2885);
	-- local nTmpRes = floor(nTaskValue/100);
	-- if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
	-- 	Talk(1,"", "Ng��i �� nh�n nhi�m v� k� n�ng 150, xin h�y ho�n th�nh nhi�m v� r�i h�y ��n g�p ta");
	-- 	return 0;
	-- end

	-- if (CalcItemCount(2,0,-1,-1,-1) > 0) then			--ж��װ��
	-- 	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[1], "���c r�i./OnCancel"});
	-- 	return 0;
	-- end

	-- if check_zhuansheng_league(LG_WLLSLEAGUE) == 1 then	--ս�ӹ�ϵ
	-- 	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[6], "���c r�i./OnCancel"});
	-- 	return 0;
	-- end

	-- if (GetTask(TSK_ZHUANSHENG_FLAG) ~= 1) then			--����ƪ��ѧϰ
	-- 	CreateTaskSay({TB_TRANSLIFE_ERRORMSG[4], "���c r�i./OnCancel"});
	-- 	return 0;
	-- end

	--check item
	if self:CheckItemNeedCondition() == 0 then
		return 0;
	end
	
	return 1;
end

-- ���ת�����Ƿ��㹻
function TransLife8:CheckItemNeedCondition()
	for nIndex, tbItemParam in TransLife8.tbNeedItem do
		local nGenre, nDetail, nParticular, szItemName, nRoomPos, nLevel, nNeedItemCount = unpack(tbItemParam);
		local nCurCount = CalcItemCount(nRoomPos, nGenre, nDetail, nParticular, nLevel)
		if nCurCount < nNeedItemCount then
            local dialogContent = format("<npc>Tr�ng sinh 8 c�n <color=red>%d<color> c�i %s, h�y chu�n b� xong r�i quay l�i.", nNeedItemCount, szItemName);
            local tbSelection = {
                {"���c r�i."}
            };
            CreateNewSayEx(dialogContent, tbSelection);
			return 0;
		end
	end
	
	return 1;
end

-- ����Ƿ��ظ�ѡ����
function TransLife8:CheckResistanceRepetition(nSelection)
    local n_transcount = ST_GetTransLifeCount();
	if (n_transcount >= 2) then
		for i = 2, n_transcount do
			local n_translevel, n_transresist = zhuansheng_get_gre(i);
			
			if i == 7 and n_translevel ~= 0 and n_transresist == nSelection and GetMaxResist(nSelection) < 85 then
			elseif (n_translevel ~= 0 and n_transresist == nSelection) then
                CreateNewSayEx("<npc>"..format("��y l� l�n chuy�n sinh th� %d v� �� ch�n %s kh�ng th� ch�n nhi�u l�n 1 �i�m ph�ng ng�, xin m�i h�y ch�n l�i!", i, TB_BASE_RESIST[nSelection]),
                            {
                                {"L�a ch�n l�i t� ��u", TransLife8.ChooseOneResistance, {TransLife8}},
                                {" K�t th�c ��i tho�i!"}
                            });
				return 0;
			end
		end
	end
    return 1;
end

function TransLife8:onSelectSkill(nSelection)
	Msg2Player("chon skill")
    if (self:CheckCondition() == 0) then
		return 0;
	end
	
	local tbTaskNeedItem = TransLife8.tbNeedItem;
	for nIndex, tbItemParam in tbTaskNeedItem do
		local nGenre, nDetail, nParticular, szItemName, nRoomPos, nLevel, nNeedItemCount = unpack(tbItemParam);
		if ConsumeEquiproomItem(nNeedItemCount, nGenre, nDetail, nParticular, nLevel) ~= 1 then
			Say("��o c� c�n thi�t kh�u tr� nhi�m v� th�t b�i!", 0 );
			return
		end
	end

	-- Record the selection of TRANSLIFE_8_SKILL.
    SetTask(TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION, nSelection);
	print(format("select TransLife8 skill | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));
	WriteLog(format("select TransLife8 skill | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));

    LeaveTeam();	
	
	--ST_DoTransLife();--trung sinh 8 thanh cong
	--Msg2Player("YYYYYYYYYYYYYY")
	--addskill
	self:AfterTranslifeProcess()
end

function TransLife8:onSelectResistance(nSelection)
    if (self:CheckCondition() == 0) then
		return 0;
	end

    if (self:CheckResistanceRepetition(nSelection) == 0) then

        return 0;
    end

    -- Record the index of resistance the player selected.
    SetTaskTemp(TSKM_ZHUANSHENG_RESISTID, nSelection);
	print(format("select resistance | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));
	WriteLog(format("select resistance | playerUUID=%d, PlayerIndex=%d, playerName=%s, selection=%d", GetUUID(), PlayerIndex, GetName(), nSelection));


    local tbSkillOption = {};
    for nIndex, skillItem in TransLife8.TRANSLIFE_8_SKILL do
        tinsert(tbSkillOption, {skillItem[1], TransLife8.onSelectSkill, {self, nIndex}});
    end
    tinsert(tbSkillOption, {" K�t th�c ��i tho�i!"});

    CreateNewSayEx("<npc>H�y ch�n k� n�ng tr�ng sinh 8 mu�n c�:", tbSkillOption);
end

function TransLife8:ChooseOneResistance()
    local tbOption = {};
		
	for nIndex, resistanceName in TB_BASE_RESIST do
		tinsert(tbOption, {resistanceName, TransLife8.onSelectResistance, {self, nIndex}});
	end
	tinsert(tbOption, {" K�t th�c ��i tho�i!"});

    CreateNewSayEx("<npc>H�y ch�n thu�c t�nh kh�ng mu�n t�ng th�m:",tbOption);
end

function TransLife8:AfterTranslifeProcess()
	SetTask(TSK_TASK_IS_TS8, 1)
	ST_LevelUp(-190);
	Talk(1, "", "��i Hi�p �� tr�ng sinh l�n 8 th�nh c�ng. V� c�ng r�t th�m h�u, ta xin b�i ph�c!")
	Msg2Player("��i Hi�p �� tr�ng sinh l�n 8 th�nh c�ng. V� c�ng r�t th�m h�u, ta xin b�i ph�c!")
   -- Say("��i hi�p, tr�ng sinh 8 �� xong, n�ng l�c �� t�ng tr��ng r�t nhi�u, mau mau xem th� s� thay ��i �i!", 0);

	local nSelection = GetTask(TransLife8.TSK_TRANSLIFE_8_SKILL_SELECTION);
	local skillInfo = TransLife8.TRANSLIFE_8_SKILL[nSelection];
	if skillInfo then
		local szSkillName, nSkillID = unpack(skillInfo);
		AddMagic(nSkillID, 1);
	end
	AddMagicPoint(20)--add 20 �i�m k� n�ng
	AddProp(100) --add 100 �i�m ti�m n�ng
end


TransLife8:Init();
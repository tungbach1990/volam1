-- ====================== �ļ���Ϣ ======================

-- ������Ե�����һ������Ͷʦ��ͷ�ļ�

-- Edited by �ӷ��~
-- 2008/02/28 12:10

-- ======================================================

IncludeLib("LEAGUE");
Include("\\script\\misc\\daiyitoushi\\toushi_head.lua");
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua");
Include("\\script\\lib\\gb_modulefuncs.lua");
Include("\\script\\skill\\lvlup150_limit.lua")
Include("\\script\\global\\meridian\\meridian.lua")

-- ��顰����Ͷʦ�����˳����ɵ��������ȼ��ﵽ120������120������
function toushiCheckApplyState()
	if (GetLevel() < 120) then
		return TOUSHI_LVLERR;
	end
	
	if (GetLastFactionNumber() == -1) then
		return TOUSHI_NOFACTERR;
	end
	
	return TOUSHI_SUCCEED;
end


-- ��顰����Ͷʦ������������������
function toushiCheckTransFactState(nFactionNumb, nStage)
	local bFlag			= GetTask(TSK_TOUSHI_FLAG);				-- ���תͶʦ�ŵı��
	local nMyFacNumb	= GetLastFactionNumber();				-- ���ԭ����ID
	local nSex			= GetSex();								-- ��ɫ�Ա�
	local nLastChange   = GetTask(TSK_LAST_CHANGE_FACTION)      -- �ϴ�תͶʦ�ű��
	local nCurTime      = tonumber( GetCurServerTime() );
	
	if (bFlag == 0) then
		return TOUSHI_FLAGERR;
	end
	
	if (bFlag >= 2) then
		return TOUSHI_UNKNOWN;
	end
	
	if (nMyFacNumb == -1) then
		return TOUSHI_NOFACTERR;
	end
	
	--if ((nCurTime - nLastChange) < TOUSHI_COLDDOWN_TIME) then
	--    return TOUSHI_TIMEERR;
	--end
	if nFactionNumb == 10 then
		if CalcEquiproomItemCount(6, 1, 4328, 1) < 1 then
			return TOUSHI_NO_HUASHAN_ITEM
		end
		if ST_GetTransLifeCount() < TRANS_COUNT_LIMIT then
			return TOUSHI_TRANSLIFE_COUNT_LIMIT
		end
	end
	
	if ((nSex == 0 and (nFactionNumb == 4 or nFactionNumb == 5)) or (nSex == 1 and nFactionNumb == 0)) then
		return TOUSHI_MALEERR;
	end
	
	if (nMyFacNumb == nFactionNumb) then
		return TOUSHI_EQFACTERR;
	end
	
	if (GetLevel() < 120) then
		return TOUSHI_LVLERR;
	end
	
	if (nStage == 2) then
		if (check_zhuansheng_league(LG_WLLSLEAGUE) == 1) then
			return TOUSHI_LGERR;
		end
		
		if (CalcItemCount(2,0,-1,-1,-1) > 0) then
			return TOUSHI_EQUIPERR;
		end
	end
	
	if (GetTask(TSK_TOUSHI_COUNT) == 0 and CalcFreeItemCellCount() < 2) then
		return TOUSHI_NOFREEBAG;
	end
	
	return TOUSHI_SUCCEED;
end


function toushiGetHierarchTitle(nFactionNumb)
	if (nFactionNumb == 7 or nFactionNumb == 3) then			-- �嶾�̣����̽� Ϊ����
		return TB_TOUSHI_HIERARCH[2];
	elseif (nFactionNumb == 1 or TB_TOUSHI_HIERARCH == 6) then	-- �����ؤ�� Ϊ����
		return TB_TOUSHI_HIERARCH[3];
	else														-- ���� Ϊ����
		return TB_TOUSHI_HIERARCH[1];
	end
end


function toushiGetSexName(nSex)
	if (nSex == 0) then
		return "Nam";
	else
		return "N� ";
	end
end


function OnCancel()
end

function daiyitoushi_main(nFactionNumb)
	if (gb_GetModule("SWITH_DAIYITOUSHI") ~= 1) then
		Say("Xin l�i, c�ng n�ng n�y t�m th�i �� b� ��ng, th�i gian m� l�i s� ��oc th�ng b�o sau ", 0);
		return 1;
	end
	
	local nFlag	= GetTask(TSK_TOUSHI_FLAG);
	local tbDes	= {"<dec><npc>Thi�n h� ��i lo�n nh�  ng�y h�m nay, c�c ��i m�n ph�i trong v� l�m ai c�ng ch� bi�t lo cho c�i l�i c�a m�nh, t�y theo chi�n s� m� b� quan,  trung nh�n v� l�m th� b� t�n th�t h�n qu� n�a. V� k� v� l�m h��ng h�a, tr�ng t�n ch�n h�ng v� l�m. T�n m�nh v� l�m minh ch�, k� t� h�m nay c�c ��i m�n ph�i x�a b� c�c quy t�c, m� r�ng m�n quy, cho ph�p c�c �� t� gia nh�p c�c m�n ph�i kh�c, �� c�ng nhau �n ch�ng v� h�c, s�ng l�p ra nh�ng tuy�t h�c v� c�ng m�i l�, trung h�ng ng� v� l�m."};
	
	if (nFlag == 0) then
		tinsert(tbDes, format("��i ngh� ��u s�, chuy�n m�n ph�i/#toushiApplyEnter(%d)", nFactionNumb));
	elseif (nFlag == 1) then
		tinsert(tbDes, format("��i ngh� ��u s�, b�i nh�p m�n h�/#toushiTransEnter(%d)", nFactionNumb));
	elseif (nFlag == 2 and GetLastFactionNumber() == nFactionNumb) then
		tbDes	= {"<dec><npc>N�u nh� ng��i �� mu�n gia nh�p b�n ph�i, sau n�y ph�i chuy�n t�m m� kh� luy�n, s�m c� ng�y ng� ra ���c tuy�t k� v� h�c"};
	else
		tbDes	= {"<dec><npc>Xem ra, v� <sex> n�y mang g�nh n�ng tr�n vai tr�ng t�n ch�n h�ng v� l�m."};
	end
	
	tinsert(tbDes, " K�t th�c ��i tho�i!/OnCancel");
	
	CreateTaskSay(tbDes);
end
--

-- ����Ͷʦ��תͶ����
function toushiApplyEnter(nFactionNumb)
	
	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("Ng��i �� nh�n nhi�m v� k� n�ng 150, xin h�y ho�n th�nh nhi�m v� r�i h�y ��n g�p ta")
		return 
	end
	local nSex	= GetSex();
	local szDes = "";
	local szHierarchTitle	= toushiGetHierarchTitle(nFactionNumb);
	
	if (GetLastFactionNumber() ~= nFactionNumb) then
		CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_FLAGERR], " K�t th�c ��i tho�i!/OnCancel"});
		return
	end
	
    local nLastChange   = GetTask(TSK_LAST_CHANGE_FACTION)      -- �ϴ�תͶʦ�ű��
	local nCurTime      = tonumber( GetCurServerTime() );
--Close check time wait to change menpai, by ThanhLD 20131024
--	if ((nCurTime - nLastChange) < TOUSHI_COLDDOWN_TIME) then
--	    CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_TIMEERR], "�����Ի�/OnCancel"});
--	    return
--	end
	
	if (nSex == 1) then
		szDes = "{N�u nh� c� ���c t�n v�t c�a bang ch� thi�n v��ng bang D��ng Anh th� c� th� gia nh�p m�n ph�i thi�n v��ng.}";
	end
	
	szDes	= format("<dec><npc>V� h�c trong gi�i v� l�m c�a ch�ng ta b�c ��i uy�n th�m, l�m s� ph� ta c�ng mu�n m� r�ng m�n quy �� c�ng nhau �ng ch�nh c�c m�n ph�i kh�c, nay ta �� ng��i r�i kh�i  b�n m�n ta c�ng c� th� thu nh�n %s m�n ph�i �� t� . %s<enter>, con ���ng c�u mong v� h�c qu� kh�ng d� d�ng ch�t n�o, l� m�t s� ph� ta c�ng ph�i th� th�ch ng��i m�t phen. N�u nh� ng��i c� th�{{��t ��n c�p 120}} h�n n�a c�n ph�i t�m v� ��y cho b�n ph�i t�n v�t �� b� th�t l�c t� l�u {{ �T�n V�t M�n Ph�i�}}, s� ph�  m�i cho ng��i h� s�n.", 
				toushiGetSexName(nSex),
				szDes);
	
	
	CreateTaskSay({szDes,
					format("%s y�n t�m, �� t� s� �em t�n v�t v� ��y./OnCancel", szHierarchTitle),
					format("%s, Xin m�i xem ��y c� ph�i l� t�n v�t m�n ph�i?/#toushiApplyMenPaiXinWu(%d)", szHierarchTitle, nFactionNumb),
					" K�t th�c ��i tho�i!/OnCancel"
				});
end

-- ��������ύ��������
function toushiApplyMenPaiXinWu()
	local bFlag = toushiCheckApplyState();
	if (bFlag == TOUSHI_SUCCEED) then
		GiveItemUI("Tr�nh t�n v�t m�n ph�i", "B� t�n v�t m�n ph�i v�o � tr�ng b�n d��i.", "toushiApplyShowXinWu", "OnCancel", 1);
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], " K�t th�c ��i tho�i!/OnCancel"});
	end
end

-- ��ʾ�����жϣ��������˳����ɴ���
-- ������˳����ɽ�����������תͶ���ű������
function toushiApplyShowXinWu(nCount)
	if (nCount ~= 1) then
		CreateTaskSay({"<dec><npc>T�n V�t M�n Ph�i kh�ng ph�i l� m�n �� ch�i c�a tr� con. Kh�ng l� ng��i mu�n l�m m� m�t ta hay sao?", 
						"Tr�nh l�i m�n ph�i t�n v�t/toushiApplyMenPaiXinWu",
						"M�n ph�p cho ta t�m l�i m�t l�n n�a/OnCancel"
					});
		return 0;
	end
	
	local nItemIdx = GetGiveItemUnit(nCount);		--�ɸ����������Ʒ��Ż����Ʒ����
	local nG, nD, nP = GetItemProp(nItemIdx);		--�����Ʒ��ID����ֵ
	local szKey = join({nG, nD, nP});
	
	if (szKey ~= join(TB_TOUSHI_MENPAIXINWU)) then
		CreateTaskSay({"<dec><npc>T�n V�t M�n Ph�i kh�ng ph�i l� m�n �� ch�i c�a tr� con. Kh�ng l� ng��i mu�n l�m m� m�t ta hay sao?", 
						"Tr�nh l�i m�n ph�i t�n v�t/toushiApplyMenPaiXinWu",
						"M�n ph�p cho ta t�m l�i m�t l�n n�a/OnCancel"
					});
		return 0;
	end
	
	--
	RemoveItemByIndex(nItemIdx);					-- ɾ����������
	SetTask(TSK_TOUSHI_FLAG, 1);					-- ���ô���Ͷʦ����ɹ����
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tLevel:%d,FactionId:%d%s",
				"��i ngh� ��u s�",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(), GetAccount(),
				GetLevel(), GetLastFactionNumber(),
				"��a ra m�n ph�i t�n v�t, y�u c�u chuy�n m�n ph�i th�nh c�ng"));
				
	CreateTaskSay({"<dec><npc>��ng v�t n�y r�i, ta ph� chu�n cho ng��i h� s�n, ta mong r�ng ng��i s�m c� ng�y ng� ra ���c tuy�t k� v� h�c �� quang ��i ng� v� l�m.", "�� t� nh�t ��nh s� nghe l�i d�y c�a s� ph�/OnCancel"});
end

-- ����Ͷʦ��������ǽ
function toushiTransEnter(nFactionNumb)
	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("Ng��i �� nh�n nhi�m v� k� n�ng 150, xin h�y ho�n th�nh nhi�m v� r�i h�y ��n g�p ta")
		return 
	end
	local bFlag				= toushiCheckTransFactState(nFactionNumb, 1);
	local nSex				= GetSex();
	local szHierarchTitle	= toushiGetHierarchTitle(nFactionNumb);
	
	if (bFlag == TOUSHI_SUCCEED) then
		
		local szDes = "<dec><npc>V� <sex> n�y, ng��i �� t�m ���c ���ng ��n ch� c�a ta ��y, ta bu�c ng��i ph�i qu�n �i nh�ng tuy�t h�c m� ng��i �� l�nh ng� ���c t� s� ph� c�a ng��i. {{ ng��i ph�i bi�t r�ng �� l� gia nh�p b�n m�n, th� nh�ng v� c�ng �� h�c tr��c ��y kh�ng th� s� d�ng, ���ng nhi�n ta s� truy�n th� v� c�ng c�a b�n ph�i cho ng��i, ��a ng��i gia nh�p b�n ph�i, ta tin t��ng r�ng s� kh�ng t�n th�t th� l�c.}} ng��i �� ngh� k� ch�a ��, qu� th�c l� ng��i mu�n gia nh�p b�n ph�i hay kh�ng?";
		
		if (nFactionNumb == 1 and nSex == 1) then
			szDes = "<dec><npc>V� <sex> n�y, ng��i �� t�m ���c ���ng ��n ch� c�a ta ��y, ta bu�c ng��i ph�i qu�n �i nh�ng tuy�t h�c m� ng��i �� l�nh ng� ���c t� s� ph� c�a ng��i. C� �i�u b�n ph�i ta v�n d� kh�ng thu nh�n n� �� t�, l� v� s� r�ng n� �� t� s� kh�ng l�nh ng� ���c c�ng ph�p thu�n d��ng c�a b�n ph�i. M�i cho ��n n�a n�m tr��c ��y b�n bang ch� v� t�nh ��t ���c m�t Thi�p C� Ph��ng, m�i t�m ���c c�ng ph�p ch� gi�i. Ch� l� b� d��c � trong ph��ng thu�c n�y c�ng kh�ng l�y g� �n ��nh cho l�m, c�n ph�i c� b�n bang ch� truy�n c�ng �� th�ng kinh m�ch. N�u nh� ng��i c� th� t�m ���c {{ T�n v�t c�a b�n bang ch� }}, m�i c� th� gia nh�p b�n bang. Ngo�i ra {{ ng��i c�ng ph�i bi�t r�ng �� l� gia nh�p b�n m�n, th� nh�ng v� c�ng �� h�c tr��c ��y kh�ng th� s� d�ng, ���ng nhi�n ta s� truy�n th� v� c�ng c�a b�n ph�i cho ng��i, ��a ng��i gia nh�p b�n ph�i, ta tin t��ng r�ng s� kh�ng t�n th�t th� l�c.}} ng��i �� ngh� k� ch�a ��, qu� th�c l� ng��i mu�n gia nh�p b�n ph�i hay kh�ng?";
		end
		
		CreateTaskSay({szDes, 
				format("%s, ta �� ngh� k� r�i, mu�n gia nh�p m�n ph�i c�a b�n bang./#toushiTransSureTodo(%d)", szHierarchTitle, nFactionNumb),
				format("%s, �� ta suy ngh� th�m/OnCancel", szHierarchTitle),
			});
		
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], " K�t th�c ��i tho�i!/OnCancel"});
	end
end

-- ��ʾתְ�ɹ���,��Ҫ����90������������
function toushiTransSureTodo(nFactionNumb)
	local tbDescrib		= {"<dec><npc>Ng��i c�n ph�i l�a ch�n con ���ng ch� c�ng:"};

	for k, v in TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].tbSkillID[90] do
		if (type(v) == "table") then
			tbDescrib[getn(tbDescrib) + 1]	= format("%s/#toushiTransSure(%d, %d)", v[3], nFactionNumb, k);
		end
	end
	
	tbDescrib[getn(tbDescrib) + 1]	= "Ta c�n ph�i suy ngh� th�m/OnCancel";
	
	CreateTaskSay(tbDescrib);
end


-- ȷ�ϰ�����ǽ���жϽ�ɫ״̬�������ɫ����
function toushiTransSure(nFactionNumb, nMagicIdx)
	local bFlag	= toushiCheckTransFactState(nFactionNumb, 2);
	local nSex	= GetSex();
	local szLog	= "";
	
	if (bFlag == TOUSHI_SUCCEED) then
		
		if (nFactionNumb == 1 and nSex == 1) then
			--local ndnumzimu		= CalcItemCount(23, unpack(TB_TOUSHI_YANGYINGXINWU), -1);	-- �����ĸ��
			local ndnumbeibao	= CalcItemCount(3, TB_TOUSHI_YANGYINGXINWU[1],TB_TOUSHI_YANGYINGXINWU[2],TB_TOUSHI_YANGYINGXINWU[3], -1);	-- ��鱳��
			
			if (ndnumbeibao >= 1) then
				ConsumeItem(3, 1, TB_TOUSHI_YANGYINGXINWU[1],TB_TOUSHI_YANGYINGXINWU[2],TB_TOUSHI_YANGYINGXINWU[3], -1);
			--elseif (ndnumzimu >= 1) then
			--	ConsumeItem(23, 1, unpack(TB_TOUSHI_YANGYINGXINWU), -1);
			
			else
				CreateTaskSay({TB_TOUSHI_ERR_MSG[TOUSHI_TWFEMALEERR], " K�t th�c ��i tho�i!/OnCancel"});
				return TOUSHI_TWFEMALEERR;
			end
			
			szLog = "Giao t�n v�t c�a D��ng Anh th�nh c�ng";
		elseif nFactionNumb == 10 then
			ConsumeEquiproomItem(1, 6, 1, 4328, 1)
			Msg2Player("Ng��i �� n�p 1 cu�n Hoa S�n K� Th�.")
		end
		
		local bTrans = toushiDoTransPlayer(GetLastFactionNumber(), nFactionNumb, nMagicIdx, szLog);			-- �����ɫ�������
		
		-- ������ȴʱ��
		local nCurTime = tonumber( GetCurServerTime() );
		SetTask(TSK_LAST_CHANGE_FACTION, nCurTime);
	else
		CreateTaskSay({TB_TOUSHI_ERR_MSG[bFlag], " K�t th�c ��i tho�i!/OnCancel"});
	end
end


-- ת����ɫ�����Ӧ����
-- ���ý�ɫ���У����ɣ��ƺţ���Ӫ�������������
function toushiDoTransPlayer(nMyFacNumb, nFactionNumb, nMagicIdx, szLog)
	LeaveTeam();															-- ������Ӳ���
	
	local nLevel		= GetLevel();
	local tbOldSkill	= TB_DAIYITOUSHI_FACTS[nMyFacNumb + 1].tbSkillID;
	local tbNewSkill	= TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].tbSkillID;
	local tb90SkillExp		= {};
	local tb120SkillExp	= {};
	local tb150SkillExp	= {};
	
	zhuansheng_clear_skill(0, 0)											-- ����ת�� ϴ���ܵ㺯��
	
	for i = 1, getn(tbOldSkill[90]) do										-- ����ԭ����������
		if (type(tbOldSkill[90][i]) == "table") then
			local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[90][i][1]);

--			if (nMagicLvl == 0) then
--				nMagicLvl = 1;
--			end

			if (tb90SkillExp.nShuliandu == nil) then
				tb90SkillExp.nShuliandu = {};
			end
			if (nMagicLvl > 0) then
				
				tb90SkillExp.nShuliandu[getn(tb90SkillExp.nShuliandu) + 1]	= {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
			end
		else
			
			if (HaveMagic(tbOldSkill[90][i]) >= 0) then
				tb90SkillExp.nJinengdian = 1;
			end
		end
	end
	
	sort(tb90SkillExp.nShuliandu, toushiSortSkillsExp);									-- �������ȵȼ����������򣬸�����·�߼����������
	
	if (HaveMagic(tbOldSkill[120][1][1]) > 0) then							-- ����120������������
		local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[120][1][1]);
		
--		if (nMagicLvl == 0) then
--			nMagicLvl = 1;
--		end
		tb120SkillExp = {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
	end
	
	for i = 1, getn(tbOldSkill[150]) do
		if (type(tbOldSkill[150][i]) == "table") then
			local nMagicLvl, nMagicExp, nMagicExpPre		= toushiGetMagicProp(tbOldSkill[150][i][1]);
			
			if (tb150SkillExp.nShuliandu == nil) then
				tb150SkillExp.nShuliandu = {};
			end
			if (nMagicLvl > 0) then
				
				tb150SkillExp.nShuliandu[getn(tb150SkillExp.nShuliandu) + 1]	= {["nMagicLvl"] = nMagicLvl, ["nMagicExpPre"] = nMagicExpPre};
			end
		else
			
			if (HaveMagic(tbOldSkill[150][i]) >= 0) then
				tb150SkillExp.nJinengdian = 1;
			end
		end
	end
	
	sort(tb150SkillExp.nShuliandu, toushiSortSkillsExp);									-- �������ȵȼ����������򣬸�����·�߼����������
--	for i=1,getn(tb150SkillExp.nShuliandu) do
--		print(tb150SkillExp.nShuliandu[i].nMagicLvl, tb150SkillExp.nShuliandu[i].nMagicExpPre)
--	end
	
	
	local tb150SkillInfo = {} --�������Ѿ�������150�����ܵ�����
	for nSkillLvl, tbLvlSkill in tbOldSkill do							-- ɾ�������ɼ���
		for i = 1, getn(tbLvlSkill) do
			local nDelSkill = 0
			if (type(tbLvlSkill[i]) == "table") then
				nDelSkill = tbLvlSkill[i][1]
			else
				nDelSkill = tbLvlSkill[i]
			end
			if HaveMagic(nDelSkill) > 0 and nSkillLvl == 150 then
				local nSkillId = nDelSkill
				local nSkillLevel = GetCurrentMagicLevel(nSkillId)
				local bIsUnlockNextLevel = tbLvUp150Limit:IsAvailable(nSkillLevel+1, nSkillId)
				tb150SkillInfo[nSkillId] = {nSkillLevel=nSkillLevel, bIsUnlockNextLevel=bIsUnlockNextLevel,bAdded = 0}
				if bIsUnlockNextLevel == 1 then
					tbLvUp150Limit:SetAvoid(nSkillLevel+1, nSkillId)
				end
			end
			DelMagic(nDelSkill)
		end
	end
	--for nSkillLvl, tbLvlSkill in tbNewSkill do							-- ѧϰ�����ɼ���
	for nSkillLvl = 10, 150, 10  do							-- ѧϰ�����ɼ���
		local tbLvlSkill = tbNewSkill[nSkillLvl];
		if (tbLvlSkill) then
			if (nSkillLvl == 150) then
				toushiAdd150Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tb150SkillExp, tbLvlSkill, nMagicIdx, tb150SkillInfo);	
			
			elseif (nSkillLvl == 120) then										-- �����120������,ֱ������Ϊ��120�����ܵȼ���������
				
				toushiAdd120Skill(tb120SkillExp, tbLvlSkill[1][1]);			
				
			elseif (nSkillLvl == 90) then									-- �����90������
				
				toushiAdd90Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tb90SkillExp, tbLvlSkill, nMagicIdx);			-- 
				
			else															-- ����Ǽӵ㼼��
				for i = 1, getn(tbLvlSkill) do 
					AddMagic(tbLvlSkill[i]);
				end
			end
		end
	end
	
	local nOldSeries	= GetSeries();
	local nNewSeries	= TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nSeries;
	
	toushiAddWuXingSkill(nOldSeries, nNewSeries);		-- ��������м��ܣ���ô����Ϊ������
	
	zhuansheng_clear_prop(0, 0, nNewSeries)			-- ����ת�� ϴǱ�ܵ㺯��,��������ϴ��,�����л���Ǳ�ܵ㲻һ��
	
	SetSeries(nNewSeries);							-- ת����ɫ��������
	
	toushiResetMaxLife(nNewSeries, nLevel);			-- ��ɫ��Ӧ���еȼ� �Ļ���Ѫ��
	toushiResetMaxMana(nNewSeries, nLevel);			-- ��ɫ��Ӧ���еȼ� �Ļ�������
	SetTask(TSK_TOUSHI_RESETBASE, 1);										-- 
	
	SetLastFactionNumber(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nFacNumb);					-- ��ɫ����ID
	UpdateMeridianSkill()	--�����˾�������ҲҪתӴ
	
	SetTask(TB_DAIYITOUSHI_FACTS[nMyFacNumb + 1].nTaskId_Fact, 0);				-- ���ɫԭ�����������
	
	if (GetFaction() ~= "M�i nh�p giang h� ") then
		SetFaction(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].szFacName);			-- ��ɫ��������
		
		SetCamp(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nCamp);					-- ��Ӧ������Ӫ
		SetCurCamp(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nCamp);				-- ��Ӧ������Ӫ
		
		SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_Fact, TOUSHI_FACTION_HUISHI);	-- �����������,��ʦ
	else
		SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_Fact, TOUSHI_FACTION_CHUSHI);	-- �����������,��ʦ
	end
	
	SetRank(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nRankId);					-- ��ɫͷ��
	
	SetTask(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nTaskId_137, 
					TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].nValue_137);			-- �����������,��ʦ
	
	SetTask(144, 0);	--���ϴ��
	SetTask(TSK_TOUSHI_FLAG, 0);												-- �����Ͷʦ�ɹ����
	SetTask(TSK_TOUSHI_COUNT, GetTask(TSK_TOUSHI_COUNT) + 1);					-- ���ô���Ͷʦ�ɹ�����
	
	if (GetByte(GetTask(TSK_ZHENPAILINGDAN_USECNT), 3) ~= 1) then
		SetItemBindState(AddItem(unpack(TB_TOUSHI_ZHENPAILINGDAN)), -2);			-- ���͵���ƷΪ���ð�
		SetItemBindState(AddItem(unpack(TB_TOUSHI_ZHENPAILINGYAO)), -2);
		SetTask(TSK_ZHENPAILINGDAN_USECNT, SetByte(GetTask(TSK_ZHENPAILINGDAN_USECNT), 3, 1))
		szLog = szLog..", thu ���c tr�n ph�i linh ��n v� tr�n ph�i linh d��c";
	end
	
	CreateTaskSay({"<dec><npc>N�u nh� ng��i �� mu�n gia nh�p b�n ph�i, sau n�y ph�i chuy�n t�m m� kh� luy�n, s�m c� ng�y ng� ra ���c tuy�t k� v� h�c. ��y l� hai vi�n linh d��c c�a b�n ph�i, c� th� gi�p ng��i n�ng cao c�ng l�c, h�y nh�n l�y m� s� d�ng.",
					" K�t th�c ��i tho�i!/OnCancel"});
	
	Msg2Faction(format(TB_DAIYITOUSHI_FACTS[nFactionNumb + 1].szMsg, GetName()));
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tLevel:%d,OldFactionId:%d,NewFactionId:%d,MainMagic:%d,%s",
				"��i ngh� ��u s�",
				GetLocalDate("%Y-%m-%d %X"),
				GetName(), GetAccount(),
				GetLevel(), nMyFacNumb, nFactionNumb,nMagicIdx,
				"X� l� chuy�n m�n ph�i th�nh c�ng"..szLog));
	KickOutSelf();
end


function toushiSetTask(nTaskId, isHigh, nValue)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	
	if (isHigh == 1) then
		nTaskValue_H	= nValue;
	else
		nTaskValue_L	= nValue;
	end
	
	nTaskValue			= nTaskValue_H * 2^16 + nTaskValue_L;
	
	SetTask(nTaskId, nTaskValue);
	
	return nTaskValue;
end


function toushiAddTask(nTaskId, isHigh, nAdd)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	local nValue		= 0;
	
	if (isHigh == 1) then
		nTaskValue_H	= nValue;
	else
		nTaskValue_L	= nValue;
	end
	
	nValue			= nValue + nAdd;
	
	toushiSetTask(nTaskId, isHigh, nValue)
	
	return nTaskValue;
end


function toushiGetTask(nTaskId, isHigh)
	local nTaskValue	= GetTask(nTaskId);
	local nTaskValue_H	= floor(nTaskValue / 2^16);
	local nTaskValue_L	= mod(nTaskValue, 2^16);
	
	if (isHigh == 1) then
		return nTaskValue_H;
	else
		return nTaskValue_L;
	end
end


function toushiGetMagicProp(nMagicId)
	local nMagicLvl		= HaveMagic(nMagicId)
	local nMaxLevel = GetSkillMaxLevel(nMagicId)
	
	if (nMagicLvl == -1) then
		return 0, 0, 0;
	end
	
	if (nMagicLvl <= 0) then
		nMagicLvl = 1;
	end
	
	if (nMagicLvl > nMaxLevel) then
		nMagicLvl = nMaxLevel
	end
	
	local nMagicExp		= GetSkillExp(nMagicId);
	local nMagicExpPre	= floor((nMagicExp * 10000) / TB_TOUSHI_SKILLEXP[nMagicId][nMagicLvl]);
	
	return nMagicLvl, nMagicExp, nMagicExpPre;
end


-- ��ԭְҵ����������������
function toushiSortSkillsExp(tb1, tb2)
	if (tb1.nMagicLvl ~= tb2.nMagicLvl) then
		return tb1.nMagicLvl > tb2.nMagicLvl;
	else
		return tb1.nMagicExpPre > tb2.nMagicExpPre;
	end

end


-- ���150�����ܴ���
--  150����������ֻ����ɺ�δ���У�soδ���в��������ȫ��
function toushiAdd150Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tbOldSkillExp, tbNewSkill, nMagicIdx, tb150SkillInfo)
	local nOldNumb		= nMyFacNumb + 1;
	local nNewNumb		= nFactionNumb + 1;
	
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
		[10] = 9,
	}
	local tbAddSkill	= {};
	if (mod(floor(GetTask(TSK_LV150_SKILL) / 100), 100) >= TOUSHI_150SKILL_TASKSTATE) then
	-- ���150�������������Ϊ��ɵĴ���
		--�ı�150������ɵ��������������֧�ߵ��޸�
		SetTask(TSK_LV150_SKILL, TOUSHI_150SKILL_TASKSTATE*100+tbFactStepList[nFactionNumb])
		
		local nCount	= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt			= nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};						-- �Ƚ�����·�߼��ܼӼ�¼
		else
			tbAddSkill[1] = {tbNewSkill[nMagicIdx][1], 1, 0};
		end
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then											-- ����������ȼ���
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then											-- ��˳�����������
																								-- ��������ɼ��������Ȳ�������
					if (nCount > nAddCnt) then													-- ����뼼��Ϊһ����������Ϊ0
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
						print(tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre)
					else
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], 1, 0};
						print(tbNewSkill[k][1], 1, 0)
					end
				end
			else																				-- ����Ǽӵ㼼�ܣ����¼Ҫ��
				tbAddSkill[getn(tbAddSkill) + 1] = tbNewSkill[k];								-- �ڸ����ʱ��ֱ�Ӹ�0��
			end
		end
	else
		return
	end
	for k = 1, getn(tbAddSkill) do
		local nSkillId = 0
		if (type(tbAddSkill[k]) == "table") then
			AddMagic(tbAddSkill[k][1], tbAddSkill[k][2])
			AddSkillExp(tbAddSkill[k][1], tbAddSkill[k][3], 1, 1)
			nSkillId = tbAddSkill[k][1]
		else
			AddMagic(tbAddSkill[k])
			nSkillId = tbAddSkill[k]
		end
	end
	local nAvaliable150SkillCount = calc150SkillLimitAvaliableCount(tb150SkillInfo)
	local nMainChooseSkillId = tbNewSkill[nMagicIdx][1]
	if HaveMagic(nMainChooseSkillId) > 0 then
		if set150SkillLimit(nMainChooseSkillId, tb150SkillInfo) == 1 then
			nAvaliable150SkillCount = nAvaliable150SkillCount - 1
		end
	end
	
	for k = 1, getn(tbNewSkill) do
		local nSkillId 
		if type(tbNewSkill[k]) == "table" then
			nSkillId = tbNewSkill[k][1]
		else
			nSkillId = tbNewSkill[k]
		end
		if nAvaliable150SkillCount > 0 and nSkillId ~= nMainChooseSkillId then
			if set150SkillLimit(nSkillId, tb150SkillInfo) == 1 then
				nAvaliable150SkillCount = nAvaliable150SkillCount - 1
			end
		end
	end
end

function calc150SkillLimitAvaliableCount(tb150SkillInfo)
	local nCount = 0
	for nSkillId, tbSkillInfo in tb150SkillInfo do 
		if tbSkillInfo and tbSkillInfo.bIsUnlockNextLevel == 1 then
			nCount = nCount + 1
		end
	end
	return nCount
end

function set150SkillLimit(nSkillId, tb150SkillInfo)
	local nSkillLevel = GetCurrentMagicLevel(nSkillId, 0)
	for _, tbSkillInfo in tb150SkillInfo do
		if tbSkillInfo then
			if tbSkillInfo.bIsUnlockNextLevel == 1 and tbSkillInfo.nSkillLevel == nSkillLevel then
				if tbSkillInfo.bAdded ~= 1 then
					tbLvUp150Limit:SetAvailable(nSkillLevel+1, nSkillId)
					tbSkillInfo.bAdded = 1
					return 1
				end
			end
		end
	end
end

-- ���120�����ܴ������ԭ����120�����������������120������
function toushiAdd120Skill(tbOldSkill, nNewSkill)
	if (tbOldSkill.nMagicLvl and tbOldSkill.nMagicLvl > 0) then
		SetTask(LV120_SKILL_ID, nNewSkill);
		AddMagic(nNewSkill, tbOldSkill.nMagicLvl);
		AddSkillExp(nNewSkill, tbOldSkill.nMagicExpPre, 1, 1);
	end
end

-- ���90�����ܴ���
-- 	���90������������ɣ����������������90������
-- 	���90����������δ��ɣ��򰴾�����90�������������������ɼ���
function toushiAdd90Skill(nMyFacNumb, nFactionNumb, tbOldSkill, tbOldSkillExp, tbNewSkill, nMagicIdx)
	local nOldNumb		= nMyFacNumb + 1;
	local nNewNumb		= nFactionNumb + 1;
	local tbAddSkill	= {};
	
	
	if (GetTask(TB_DAIYITOUSHI_FACTS[nOldNumb].nTaskId_90Skill) == TOUSHI_90SKILL_TASK) then
	-- ���90�������������Ϊ��ɵĴ���
		SetTask(TB_DAIYITOUSHI_FACTS[nNewNumb].nTaskId_90Skill, TOUSHI_90SKILL_TASK);	-- �����ɼ�����������Ϊ���
		
		local nCount	= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt			= nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};						-- �Ƚ�����·�߼��ܼӼ�¼
		else
			tbAddSkill[1] = {tbNewSkill[90][nMagicIdx], 1, 0};
		end
		
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then											-- ����������ȼ���
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then											-- ��˳�����������
																								-- ��������ɼ��������Ȳ�������
					if (nCount > nAddCnt) then													-- ����뼼��Ϊһ����������Ϊ0
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
					else
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], 1, 0};
					end
				end
			else																				-- ����Ǽӵ㼼�ܣ����¼Ҫ��
				tbAddSkill[getn(tbAddSkill) + 1] = tbNewSkill[k];								-- �ڸ����ʱ��ֱ�Ӹ�0��
			end
		end
	else
		local tbOtherMagic	= {tbShuliandu = {}, tbJinengdian = {}};
		local nCount		= getn(tbOldSkillExp.nShuliandu);
		local nAddCnt		= 0;
		local nAddJinengCnt	= 0;
		
		if (nCount > 0) then
			nAddCnt = nAddCnt + 1;
			tbAddSkill[1]	= {tbNewSkill[nMagicIdx][1], tbOldSkillExp.nShuliandu[1].nMagicLvl, tbOldSkillExp.nShuliandu[1].nMagicExpPre};					-- �Ƚ�����·�߼��ܼӼ�¼
		else
			tbOtherMagic.tbShuliandu[getn(tbOtherMagic.tbShuliandu) + 1]	= {tbNewSkill[nMagicIdx][1], 1, 0};
		end
		
		for k = 1, getn(tbNewSkill) do
			if (type(tbNewSkill[k]) == "table") then
				if (tbNewSkill[k][1] ~= tbNewSkill[nMagicIdx][1]) then
					if (nCount > nAddCnt) then
						nAddCnt = nAddCnt + 1;
						tbAddSkill[getn(tbAddSkill) + 1] = {tbNewSkill[k][1], tbOldSkillExp.nShuliandu[nAddCnt].nMagicLvl, tbOldSkillExp.nShuliandu[nAddCnt].nMagicExpPre};
						
					else
						
						tbOtherMagic.tbShuliandu[getn(tbOtherMagic.tbShuliandu) + 1]	= {tbNewSkill[k][1], 1, 0};
					end
				end
				
			else
				
				if (tbOldSkillExp.nJinengdian) then
					tbAddSkill[getn(tbAddSkill) + 1]	= tbNewSkill[k];
					nAddJinengCnt						= nAddJinengCnt + 1;
					
				else
					
					tbOtherMagic.tbJinengdian[getn(tbOtherMagic.tbJinengdian) + 1]	= tbNewSkill[k];
				end
			end
		end
		
		if (getn(tbOtherMagic.tbJinengdian) > 0) then
			for j = 1, getn(tbOtherMagic.tbJinengdian) do
				
				if (nCount - nAddCnt <= 0) then
					break
				end

				nAddCnt								= nAddCnt + 1;
				tbAddSkill[getn(tbAddSkill) + 1]	= tbOtherMagic.tbJinengdian[j];
				
			end
		end
		
		if (getn(tbOtherMagic.tbShuliandu) > 0) then
			for j = 1, getn(tbOtherMagic.tbShuliandu) do
				if (not tbOldSkillExp.nJinengdian or tbOldSkillExp.nJinengdian - nAddJinengCnt <= 0) then
					break
				end
				nAddJinengCnt						= nAddJinengCnt + 1;
				tbAddSkill[getn(tbAddSkill) + 1]	= tbOtherMagic.tbShuliandu[j];
				
			end
		end
		
	end
	
	SetTask(TB_DAIYITOUSHI_FACTS[nOldNumb].nTaskId_90Skill, 0);	-- ȡ��ԭְҵ90����������
	
	for k = 1, getn(tbAddSkill) do
		if (type(tbAddSkill[k]) == "table") then
			AddMagic(tbAddSkill[k][1], tbAddSkill[k][2]);
			AddSkillExp(tbAddSkill[k][1], tbAddSkill[k][3], 1, 1);
			
		else
			
			AddMagic(tbAddSkill[k]);
		end
	end
end

-- �����ɫ���и�������ô���м���Ҳ����
function toushiAddWuXingSkill(nOldSeries, nNewSeries)
	if (nOldSeries ~= nNewSeries) then
		local nMagicLvl1	= HaveMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId1);
		local nMagicLvl2	= HaveMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
		if (nMagicLvl1 ~= -1) then
			DelMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId1);
			AddMagic(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId1);
		elseif (nMagicLvl2 >= 1) then
			local nMagicExp2	= GetSkillExp(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
			DelMagic(TB_WUXING_SKILL_ID[nOldSeries + 1].nMagicId2);
			AddMagic(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId2, nMagicLvl2);
			AddSkillExp(TB_WUXING_SKILL_ID[nNewSeries + 1].nMagicId2, nMagicExp2, 1);
		end
	end
end


function UpdateMeridianSkill()
	for i = 1, getn(%tbFactionToSkillId) do
		if HaveMagic(tbFactionToSkillId[i]) >= 0 then
			DelMagic(tbFactionToSkillId[i])
		end
	end
	
	%SetUpSkillIDAndLevel()
end
Include("\\script\\event\\wulin_2nd\\head.lua")
IncludeLib("TITLE")

_wulin_tb_mem = {}
_wulin_tb_leader = {}
function main()
	nClientID = wl_GetZone()
	if (nClientID == nil or nClientID == WULIN_TB_DISALLOWZONE[nClientID]) then
		wlls_descript("�����������ڵڶ������ִ������ѡ�η�Χ����������ٷ���վjx.kingsoft.com��")
		return
	end
	if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) >= 3) then
		if (getn(_wulin_tb_mem) == 0) then
			local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_REGISTER)
			while (not FALSE(n_lid)) do
				local rolename = LG_GetLeagueInfo(n_lid)
				_wulin_tb_mem[getn(_wulin_tb_mem) + 1] = rolename
				n_lid = LG_GetNextLeague(WULIN_LGTYPE_REGISTER, n_lid)
			end
		end
		if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 4) then
			if (getn(_wulin_tb_leader) == 0) then
				local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_REGISTER)
				while(not FALSE(n_lid)) do
					local rolename = LG_GetLeagueInfo(n_lid)
					local leader_rank = LG_GetLeagueTask(n_lid, WULIN_LGTASK_LEADER)
					if (leader_rank ~= 0) then
						_wulin_tb_leader[getn(_wulin_tb_leader) + 1] = {rolename, leader_rank}
					end
					n_lid = LG_GetNextLeague(WULIN_LGTYPE_REGISTER, n_lid)
				end
				sort(_wulin_tb_leader, ascend)
			end
		end
	end

	local aryszContent = {
		register = {	"��Ҫ��ѯ��ǰ��Χѡ������/wulin_query", 
									"��Ҫȷ���ҵ�ѡ���ʸ�/wulin_register", 
									"��Ҫ����ѡ���ʸ�Ͷ/wulin_compete",
									"��Ҫ��ȡѡ��ͷ��/wulin_title",},
		leader = {	"��ҪͶƱѡ�������/wulin_leader",
								"��Ҫ��ѯ���ѡ������/wulin_queryfinal", 
								"��Ҫȡ�ؾ�Ͷ�ʽ�/wulin_giveback",
								"��Ҫ��ȡѡ��ͷ��/wulin_title",},
		over = {		"��Ҫ��ѯ�����/wulin_queryleader",
								"��Ҫ��ѯ���ѡ������/wulin_queryfinal", 
								"��Ҫȡ�ؾ�Ͷ�ʽ�/wulin_giveback",
								"��Ҫ��ȡѡ��ͷ��/wulin_title",},
		common = {	"�ڶ������ִ������ʸ�Ԥѡ����/wulin_helpinfo",
								"ȡ��/OnCancel"} }
	local szMsg = "�ڶ������ִ�ἴ����ʼ��Ŀǰ����ѡ��ѡ�ν׶Σ�ÿ��������������<color=yellow>"..WULIN_MAXMEMBER.."��<color>����ѡ�֡�<color=yellow>3��3��~3��16��<color>���������������ȷ���Լ���ѡ���ʸ���߲���ѡ���ʸ�Ͷ����ѡ������ȫ��ȷ����<color=yellow>��3��17��~3��23�գ�<color>��������ѡ��Ʊѡ����ӡ���ϸԤѡ��������ٷ���վ<color=yellow>jx.kingsoft.com<color>��"
	local tbOpp = {}
	local curdate = tonumber(GetLocalDate("%m%d%H%M"))
	if (WULIN_TB_TIME.register.open <= curdate and WULIN_TB_TIME.register.close >= curdate and gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 1) then
		for i = 1, getn(aryszContent.register) do
			tbOpp[getn(tbOpp) + 1] = aryszContent.register[i]
		end
	elseif (WULIN_TB_TIME.leader.open<= curdate and gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 3) then

		for i = 1, getn(aryszContent.leader) do
			tbOpp[getn(tbOpp) + 1] = aryszContent.leader[i]
		end
	elseif (WULIN_TB_TIME.leader.close <= curdate and gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 4) then

		for i = 1, getn(aryszContent.over) do
			tbOpp[getn(tbOpp) + 1] = aryszContent.over[i]
		end
	end
	for i = 1, getn(aryszContent.common) do
		tbOpp[getn(tbOpp) + 1] = aryszContent.common[i]
	end
	wlls_descript(szMsg, tbOpp)
end

function wulin_register()
	local curdate = tonumber(GetLocalDate("%m%d%H%M"))
	local rolename = GetName()
	local n_gtype = wulin_canregister(rolename) 
	if (n_gtype== nil) then
	elseif (n_gtype == 0) then
		wlls_descript("�����߱���ǰ��Χ�ʸ����ѯ��Χѡ�������Ժ˶Ա����ʸ���������ٷ���վ<color=yellow>jx.kingsoft.com<color>��")
	else
		local szParam = GetName().." "..GetAccount().." "..tostring(GetLevel()).." "..tostring(GetLastFactionNumber()).." "..tostring(n_gtype)
		--֪ͨrelay�������˼���ս�ԣ�����log��Name��Account��Level��Faction
		LG_ApplyDoScript(1, "", "", "\\script\\event\\wulin_2nd\\members.lua", "wulin_register", szParam , "", "")
		SetTask(WULIN_TASK_LOGIN, 1)
		WriteLog(date().." Name:"..GetName().."\tAccount:"..GetAccount().."\tȷ������ǰ��Χ���ִ��ѡ���ʸ�")
	end
end

function wulin_canregister(rolename)
	if (not FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, rolename))) then
		wlls_descript("���������Ѿ��ڵڶ������ִ�Ứ�����ϵǼǣ���ֻ�谲����׼���������ִ����Ļ��ʽ�ҿ����Ϳɴ�չ���֣���ս���֡�")
		return nil
	elseif (GetLevel()< 90) then
		wlls_descript("���ִ����������Ӣ���۽�����֮�أ���ȼ�������90�����������»�ǷȱЩ��򣬻��ǻ�ȥ������ϰ����Ϊ�ã�")
		return nil
	elseif (GetLastFactionNumber() == -1) then
		wlls_descript("���ִ����������Ӣ���۽�����֮�أ������������»�ǷȱЩ��򣬻��ǻ�ȥ������ϰ����Ϊ�ã�")
		return nil
	end
	local n_gtype = wulin_check_player(rolename)
	if (n_gtype == nil) then	--����������
		return 0
	elseif (n_gtype == 6) then		--�Ͻ�����ھ�
		if (GetTask(CP_TASKID_TITLE) ~= 9) then	--���ֿ������Ͻ�����ھ���������û�вμӹ��Ͻ����ִ��
			return 0
		end
	elseif (GetLevel() < 120) then		--����ѡ�ֶ���120����
		return 0
	end
	return n_gtype
end

--���Ľ�����������õ�ѡ���ʸ�
function wulin_check_player(strRoleName)
--	do return WULIN_TB_ROLES[nClientID][strRoleName] end
	
	for n_gtype, tb_gname in WULIN_TB_HISTORY[nClientID] do
		if n_gtype == 3 then
			for n_ftype, tb_fname in tb_gname do
				for i = 1, getn(tb_fname) do
					if (strRoleName == tb_fname[i]) then
						return n_gtype
					end
				end
			end
		else
			for i = 1, getn(tb_gname) do
				if (strRoleName == tb_gname[i]) then
					return n_gtype
				end
			end
		end
	end
	return nil
end

function wulin_query()
	local aryszContent = {"����ʮ����֣�����2��28�գ�/#wulin_want2query(1)",
				"��һ����������֮˫����/#wulin_want2query(2)",
				"�ڶ�����������֮������/#wulin_want2query(3)",
				"��������������֮ʦͽ��/#wulin_want2query(4)",
				"���Ľ���������֮˫����/#wulin_want2query(5)",
				"�Ͻ����ִ������ھ�/#wulin_want2query(6)",}
	local tbOpp = {"����/main",
				"ȡ��/OnCancel"}
	for i = 6, 1, -1 do
		if (not FALSE(getn(WULIN_TB_HISTORY[nClientID][i]))) then
			tinsert(tbOpp, 1, aryszContent[i])
		end
	end
	if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_REGCNT) == 0) then
		wlls_descript("<color=red>��ǰ��û��ѡ����ȷ���ʸ���ѡ����ǰ��Χ�ʸ�ѡ�����<color>", tbOpp)
	else
		wlls_descript("<color=red>��ǰ����<color=yellow>"..gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_REGCNT).."��<color>ѡ��ȷ���ʸ���ѡ����ǰ��Χ�ʸ�ѡ�����<color>", tbOpp)
	end
end

function wulin_want2query(nSel)
	if (nSel == 3) then	--������ɵ�����,����һ��
		wulin_query2faction()
	else
		if (not WULIN_TB_HISTORY[nClientID][nSel] or getn(WULIN_TB_HISTORY[nClientID][nSel]) == 0) then
			wlls_descript("��������Χ�ʸ�û����ǰ��Χѡ�֡�", "����/wulin_query", "ȡ��/OnCancel")
			return
		end
		wulin_query2member(WULIN_TB_HISTORY[nClientID][nSel])
	end
end

function wulin_query2faction()
	local tbOpp = {"���ֵ�����/wulin_factmember",
				"����������/wulin_factmember",
				"���ŵ�����/wulin_factmember",
				"�嶾������/wulin_factmember",
				"���ҵ�����/wulin_factmember",
				"���̵�����/wulin_factmember",
				"ؤ�ﵥ����/wulin_factmember",
				"���̵�����/wulin_factmember",
				"�䵱������/wulin_factmember",
				"���ص�����/wulin_factmember",
				"����/wulin_query",
				"ȡ��/OnCancel"}
	wlls_descript("<color=red>��ѡ���������ɣ�<color>", tbOpp)
end

function wulin_factmember(nSel)
	local faction = nSel + 1
	local tb_mem = WULIN_TB_HISTORY[nClientID][3][faction]
	if (getn(tb_mem) == 0) then
		wlls_descript("������û��ѡ����Χ��", "����/wulin_query2faction", "ȡ��/OnCancel")
		return
	end
	wulin_query2member(tb_mem)
end


function wulin_query2member(tb_mem)
	local szmsg = "<color=red>ѡ���������£�<color>\n"
	for i = 1, getn(tb_mem) do
		if (not FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, tb_mem[i]))) then
			szmsg = safeshow(szmsg..tb_mem[i]).."    <color=red>���ѱ�����<color>\n"
		else
			szmsg = safeshow(szmsg..tb_mem[i]).."\n"
		end
	end
	wlls_descript(szmsg)
end

--��Ͷѡ���ʸ�
function wulin_compete()
	local curdate = tonumber(GetLocalDate("%m%d%H%M"))
	if (WULIN_TB_TIME.elector.open > curdate or WULIN_TB_TIME.elector.close < curdate) then
		wlls_descript("��Ͷ���ִ��ѡ���ʸ���<color=yellow>2006��3��10��0��00~2006��3��16��24��00<color>���Է�����ʱ��Ϊ׼�����С�\n�������뾺Ͷ����ҵȼ���С��<color=yellow>90��<color>��ÿ����ҿ�������Ͷע��ÿ����<color=yellow>100��<color>Ϊ���Ͷ���\n������Ͷ�ɹ�����ң���Ͷע����Ϊ��Ͷ�ʽ���ϵͳ��ȡ����Ͷʧ�ܵ���ң������ȫ������Լ���Ͷע��")
		return
	end

	if (wulin_canregister(GetName()) == nil) then
		
	elseif(not FALSE(wulin_canregister(GetName()))) then
		wlls_descript("���Ѿ߱���ǰ��Χ���ִ����ʸ�ֻҪ��������ȷ�ϱ�������ӵ����ʽѡ���ʸ񣬲��ز��뾺Ͷ��", "��Ҫȷ��ѡ���ʸ�/wulin_register", "�����ҿ��ǿ���/OnCancel")
	else
		local n_money, rank = LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_MONEY), LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_RANK) 
		local szmsg = ""
		if (n_money ~= 0 and rank == 0) then
			szmsg = "����ǰ�ľ�Ͷ���Ϊ<color=red>"..(n_money * WULIN_MONEYBASE).."<color>������ʱ��û�����Σ������Ժ��ѯ������\n����"
		elseif (n_money ~= 0 and rank ~= 0) then
			szmsg = "����ǰ�ľ�Ͷ���Ϊ<color=red>"..(n_money * WULIN_MONEYBASE).."<color>������ǰ����Ϊ��<color=red>"..rank.."<color>����\n����"
		end
		wlls_descript(szmsg.."��������ǰ��Χѡ�ֹ�<color=green>"..wl_GetMember().."��<color>����ȷ����Χ�ʸ�ѡ������Ϊ<color=green>"..gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_REGCNT).."��<color>��\n����<color=yellow>��Ͷ����<color>������������<color=red>"..(WULIN_MAXMEMBER-wl_GetMember()).."��<color>�̶������ִ�ᾺͶѡ�����ͬʱ���ڹ涨ʱ����û��ȷ�ϱ����μ����ִ��ģ�ӵ����Χ�ʸ�ģ�ѡ����������Զ����뾺Ͷѡ�������У��һ����Ͷע���˳��ѡȡ��һ�ȡ�ڶ������ִ��ѡ���ʸ�\n����<color=yellow>��Ͷ����<color>��ÿһ������Ͷע<color=red>100��<color>�����Ͷע<color=red>5��<color>����ҿɽ���<color=red>���Ͷע<color>��Ͷ���ʽ��<color=red>���޲��ⶥ<color>�����뾺Ͷ����ҵȼ���С��<color=red>90��<color>����Ͷ�ɹ�����ң���Ͷע����Ϊ��Ͷ�ʽ���ϵͳ��ȡ����Ͷʧ�ܵ���ң������ȫ������Լ���Ͷע��", "��Ҫ��Ͷѡ���ʸ�/wulin_want2compete", "�ҿ��ǿ�����/OnCancel")
	end
end

function wulin_want2compete()
	AskClientForNumber("wulin_sure2compete", 1000000, 500000000, "������Ͷע���:");
end

function wulin_sure2compete(nMoney)
	--���Ͷע���
	if (nMoney < 1000000 or nMoney > 500000000) then
		wlls_descript("ÿ�ξ�Ͷ���100����߲�����5�ڣ���ȷ��������Ľ�")
		return
	end
	if (mod(nMoney, WULIN_MONEYBASE) ~= 0) then
		wlls_descript("��Ͷÿ����<color=red>100��<color>Ϊ���Ͷ�����Ͷ�����Ϊ<color=red>100��<color>���������������¾�Ͷ��")
		return
	end
	wlls_descript("��Ͷע�Ľ��Ϊ<color=red>"..nMoney.."��<color>����ȷ�����Ľ������", "��ȷ��/#wulin_final2compete("..nMoney..")", "ȡ����Ͷ/OnCancel")
end

function wulin_final2compete(nMoney)
	--�ٴ�ȷ�Ͼ�Ͷ�ʸ�
	if (wulin_canregister(GetName()) == nil or wulin_canregister(GetName()) == 1) then
		return
	end
	if (GetCash() >= nMoney) then
		local result, rank = wulin_docompete(GetName(), GetAccount(), nMoney)
		if (result) then
			Pay(nMoney)
			if (rank == 0) then
				wlls_descript("���ɹ����뱾�ξ�Ͷ����ǰ��Ͷ���Ϊ<color=red>"..(result * WULIN_MONEYBASE).."��<color>����ʱ��û�����Σ����Ժ��ѯ���ĵ�ǰ���Ρ�")
			else
				wlls_descript("���ɹ����뱾�ξ�Ͷ����ǰ��Ͷ���Ϊ<color=red>"..(result * WULIN_MONEYBASE).."��<color>����ʱ����Ϊ<color=yellow>"..rank.."<color>����������û��ˢ�£����Ժ�������ѯ���ĵ�ǰ���Ρ�")
			end
			WriteLog(date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t��Ͷ���ִ��ѡ���ʸ�Ͷ��"..nMoney.."������Ͷ��"..(result * WULIN_MONEYBASE).."����")
		else--ʧ��
			wlls_descript("��Ͷ�������⣬���Ժ�������")
		end
	else
		wlls_descript("�����Ϻ���û�д���<color=red>"..nMoney.."<color>����Ŷ�������Ҫ����Ͷ�𣿿ɲ�Ҫ������Ц�������Ǵ������������ɡ�")
	end
end

function wulin_docompete(rolename, roleaccount, n_money)
	local n_lid = LG_GetLeagueObj(WULIN_LGTYPE_ELECTOR, rolename)
	if (FALSE(n_lid)) then	--���ս�ӻ�δ���������ڴ���
		wulin_creatNewmember(WULIN_LGTYPE_ELECTOR, rolename, roleaccount)
		local n_level = GetLevel()
		local n_faction = GetLastFactionNumber()
		LG_ApplySetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_FACTION, n_faction)
		LG_ApplySetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_LEVEL, n_level)
	end
--		local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
--		LG_SetLeagueInfo(nNewLeagueID, WULIN_LGTYPE_ELECTOR, rolename)	--����������Ϣ(���͡�����)
--		LG_ApplyAddLeague(nNewLeagueID, "", "")
--		LG_FreeLeagueObj(nNewLeagueID)
--		--����ս�����˺�
--		local nMemberID = LGM_CreateMemberObj()	--�������ų�Ա���ݶ���(���ض���ID)
--		--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
--		LGM_SetMemberInfo(nMemberID, roleaccount, 0, WULIN_LGTYPE_ELECTOR, rolename)
--		LGM_ApplyAddMember(nMemberID, "", "")
--		LGM_FreeMemberObj(nMemberID)
--	end
	local pre_money = LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_MONEY)
	LG_ApplyAppendLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_MONEY, floor(n_money / WULIN_MONEYBASE))	--Ͷע���
	LG_ApplySetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_DATE, tonumber(GetLocalDate("%d%H")))	--Ͷע����
	LG_ApplySetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_TIME, tonumber(GetLocalDate("%M%S")))	--Ͷעʱ��
	return (pre_money + floor(n_money / WULIN_MONEYBASE)),LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, rolename, WULIN_LGTASK_RANK)
end

--Ʊѡ�����
function wulin_leader()
	if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 3) then
		--n_lid, rolename
		if (getn(_wulin_tb_mem) == 0) then
			local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_REGISTER)
			while (not FALSE(n_lid)) do
				local rolename = LG_GetLeagueInfo(n_lid)
				_wulin_tb_mem[getn(_wulin_tb_mem) + 1] = rolename
				n_lid = LG_GetNextLeague(WULIN_LGTYPE_REGISTER, n_lid)
			end
		end
		if (not FALSE(wulin_check_canleader())) then
			wlls_descript("<color=yellow>Ʊѡ�����<color>��2006��3��17��0��00~2006��3��23��24��00���Է�����ʱ��Ϊ׼���ڼ䣬��ȷ�������ִ��ѡ�������У�ͶƱѡ������������������ӣ�ÿ�˽���һƱ����������������ͶƱ��", "����ָ��ѡ��ͶƱ/wulin_askforleadername", "�������ִ��ѡ���б�ͶƱ/#wulin_showmember(0,1)", "ȡ��/OnCancel")
		end
	end
end

function wulin_check_canleader()
	if (FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, GetName()))) then
		wlls_descript("�����ǵڶ������ִ��ѡ�֣����ܲμ�Ʊѡ����ӡ�")
		return nil
	elseif (LG_GetLeagueTask(WULIN_LGTYPE_REGISTER, GetName(), WULIN_LGTASK_CANVOTE) ~= 0) then--�Ѿ�Ͷ��Ʊ
		wlls_descript("���Ѿ�Ͷ��Ʊ�ˣ��Ͳ����ٶ�ѡ�ֽ���ͶƱ��")
		return nil
	end
	return 1
end

function wulin_askforleadername()
	AskClientForString("wulin_want2leader", "", 1, 16, "�������ɫ��");
end

function wulin_showmember(start, pages)
	local tbOpp = {}
	if (getn(_wulin_tb_mem) - start <= 10) then
		for i = 1, getn(_wulin_tb_mem) - start do
			tbOpp[getn(tbOpp) + 1] = safeshow(_wulin_tb_mem[start + i]).."/#wulin_want2leader(\""..safestr(_wulin_tb_mem[start + i]).."\")"
		end
	else
		for i = 1, 10 do
			tbOpp[getn(tbOpp) + 1] = safeshow(_wulin_tb_mem[start + i]).."/#wulin_want2leader(\""..safestr(_wulin_tb_mem[start + i]).."\")"
		end
		tbOpp[getn(tbOpp) + 1] = "��һҳ/#wulin_showmember("..(start + 10)..","..(pages + 1)..")"
	end
	if (pages ~= 1) then
		tbOpp[getn(tbOpp) + 1] = "��һҳ/#wulin_showmember("..(start - 10)..","..(pages - 1)..")"
	end
	tbOpp[getn(tbOpp) + 1] = "ȡ��/OnCancel"
	wlls_descript("�������£���ѡ��<color=red>��"..wulin_getPage(pages).."��<color>", tbOpp)
end

function wulin_want2leader(rolename)
	wlls_descript("����Ҫ��<color=red>"..safeshow(rolename).."<color>����ͶƱ��", "��ȷ��/#wulin_sure2leader(\""..safestr(rolename).."\")", "�һ��ڿ���/OnCancel")
end

function wulin_sure2leader(rolename)
	if (FALSE(wulin_check_canleader())) then
		return
	end
	if (FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, rolename))) then
		wlls_descript("���<color=red>"..rolename.."<color>�������ִ��ѡ�֣����ܶԸ���ҽ���ͶƱ��")
		return
	end
	
	LG_ApplyAppendLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_VOTEDCNT, 1)--ͶƱ+1
	LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_DATE, date("%d"))
	LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_TIME, date("%H%M"))
	LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, GetName(), WULIN_LGTASK_CANVOTE, 1)--��ͶƱ
	wlls_descript("����<color=yellow>"..safeshow(rolename).."<color>��ͶƱ�ɹ���")
	WriteLog(date().." Name:"..GetName().." Account:"..GetAccount().."\t��["..rolename.."]ͶƱѡ�����")
end

function  wulin_getPage(page)
	local tb_pagename = {
		[1] = "��һҳ",
		[2] = "�ڶ�ҳ",
		[3] = "����ҳ",
		[4] = "����ҳ",
		[5] = "����ҳ",
		[6] = "����ҳ",
		[7] = "����ҳ",
		[8] = "�ڰ�ҳ",
		[9] = "�ھ�ҳ",
		[10] = "��ʮҳ",
		[11] = "��ʮһҳ",
		[12] = "��ʮ��ҳ",
	}
	return tb_pagename[page]
end

function wulin_queryfinal()
	wulin_showqueryfinal(0,1)
end

function wulin_showqueryfinal(start, pages)
	local tbOpp = {}
	local szMsg = "ѡ���������£�<color=red>��"..wulin_getPage(pages).."��<color>"
	if (getn(_wulin_tb_mem) - start <= 10) then
		for i = 1, getn(_wulin_tb_mem) - start do
			szMsg = szMsg.."\n����"..safeshow(_wulin_tb_mem[start + i])
		end
	else
		for i = 1, 10 do
			szMsg = szMsg.."\n����"..safeshow(_wulin_tb_mem[start + i])
--			tbOpp[getn(tbOpp) + 1] = _wulin_tb_mem[start + i].."/#wulin_showqueryfinal("..(start + 10)..","..(pages + 1)..")"
		end
		tbOpp[getn(tbOpp) + 1] = "��һҳ/#wulin_showqueryfinal("..(start + 10)..","..(pages + 1)..")"
	end
	if (pages ~= 1) then
		tbOpp[getn(tbOpp) + 1] = "��һҳ/#wulin_showqueryfinal("..(start - 10)..","..(pages - 1)..")"
	end
	tbOpp[getn(tbOpp) + 1] = "ȡ��/OnCancel"
	wlls_descript(szMsg, tbOpp)
end

function wulin_giveback()
	if (FALSE(wulin_check_cangiveback())) then
		return
	end
	local n_money = LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_MONEY)
	if (n_money > 500) then
		wlls_descript("��������Ͷ���Ϊ<color=red>"..(n_money*WULIN_MONEYBASE).."��<color>����<color=red>5��<color>���ҽ��ִ��˻���������Ͷע��ÿ���˻��������Ϊ<color=red>5��<color>��", "�����ˣ����˻�����/#wulin_sure2giveback(500)", "���Ժ�������ȡ/OnCancel")
	else
		wlls_descript("����Ͷע���Ϊ<color=red>"..(n_money*WULIN_MONEYBASE).."<color>��������ȡ����", "�������˻�����/#wulin_sure2giveback("..n_money..")", "���Ժ�������ȡ/OnCancel")
	end
end

function wulin_sure2giveback(n_money)
	if (FALSE(wulin_check_cangiveback())) then
		return
	end
	local curmoney =  LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_MONEY)
	if (n_money > curmoney) then
		return
	end
	LG_ApplyAppendLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_MONEY, (-n_money))
	Earn(n_money * WULIN_MONEYBASE)
	if (n_money == curmoney) then
		wlls_descript("����Ͷע��<color=red>"..(n_money * WULIN_MONEYBASE).."<color>�����Ѿ��˻������������ա�")
	else
		wlls_descript("����Ͷע��<color=red>"..(n_money * WULIN_MONEYBASE).."<color>�����Ѿ��˻������������ա�������ʣ����"..((curmoney - n_money) * WULIN_MONEYBASE).."����ǵ���ȡ�ء�")
	end
	WriteLog(date().." Name:"..GetName().." Account:"..GetAccount().." ��ȡ��Ͷע��"..(n_money*WULIN_MONEYBASE))
end

function wulin_check_cangiveback()
	if (FALSE(LG_GetLeagueObj(WULIN_LGTYPE_ELECTOR, GetName()))) then
		wlls_descript("��û�й��μ����ִ��ѡ���ʸ�ľ�Ͷ��ֻ�вμӾ�Ͷ���Ҿ�Ͷʧ�ܵ���Ҳ������ȫ���Ͷע��")
		return nil
	else
		if (not FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, GetName()))) then
			wlls_descript("���ɹ���ͶΪ���ִ��ѡ�֣��Ͳ����������û�Ͷע���ˡ�")
			return nil
		elseif (LG_GetLeagueTask(WULIN_LGTYPE_ELECTOR, GetName(), WULIN_LGTASK_MONEY) <= 0) then
			wlls_descript("���Ѿ�ȫ�������Ͷע��û��ʲô�����˻�������ඣ�")
			return nil
		elseif (GetCash() >= 1000000000) then
			wlls_descript("�����ϴ���Ǯ̫�࣬�Է���һ���������Ƚ�������Ǯ��������ȡ�ɡ�")
			return nil
		end
	end
	return 1
end

WULIN_TB_INFO = {
	"������������<color=red>���ִ����ǰ�ʸ�ȷ��<color>\n�����߱���Χ�ʸ��ѡ�֣���һ������<color=yellow>��3��3��~3��16�գ�<color>�ڣ���������ȷ�������μӵڶ������ִ�ᣬ����Ի�õڶ������ִ��-ѡ���ʸ��ڹ涨ʱ���ڣ�û��ȷ�������μӵ�ѡ������Ϊ<color=yellow>�Զ���Ȩ<color>���������Զ����뾺Ͷѡ�������С�\n����<color=yellow>������ǰ��Χ�ʸ��ѡ�ְ�����<color>\n������ǰ����ʮ����֣���ֹ2006��2��28��24��00����\n�����Ͻ����ִ�����б��������������⣩������ھ���\n����������������ǰ4�������ݸ����������Ĳ�ͬ���������ͬ��\n<color=red>��������ٷ���վjx.kingsoft.com<color>",
	"������������<color=red>���ִ��ѡ���ʸ�Ͷ<color>\n����ÿ�������ӵ��<color=yellow>"..WULIN_MAXMEMBER.."��<color>���ִ��ѡ�֣���ȥ��ǰ��Χ�ʸ��ѡ�֣�������һ���ľ�Ͷѡ�����ͬʱ�ڹ涨ʱ���ڣ�û��ȷ�������μ����ִ��ģ�ӵ����Χ�ʸ�ģ�ѡ������Ϊ�Զ���Ȩ���������Զ����뾺Ͷѡ�������С�\n������Ͷ������ȡ<color=yellow>���꾺Ͷ<color>��ÿ����ҿ�������Ͷע����ֻ�ܲ�ѯ�Լ���<color=yellow>Ͷע����Լ��������<color>���ھ�Ͷʱ��<color=yellow>��3��10��~3��16�գ�<color>�����󣬻����Ͷע���������������Ӧѡ�ֵڶ������ִ��-ѡ���ʸ�\n������Ͷ�ɹ���ѡ�֣���Ͷע����Ϊ��Ͷ�ʽ���ϵͳ��ȡ����Ͷʧ�ܵ�ѡ�֣������ȫ������Լ���Ͷע��ÿ������˷���ѡ�ֵĽ������Ϊ5�ڡ�\n�������뾺Ͷ����ҵȼ�����<color=yellow>��С��90��<color>�����Ұ����ĳ��<color=yellow>����<color>���ѻ�ȡ��ǰ��Χ�ʸ�����ִ��ѡ���ʸ��ѡ�ֲ��ܲ��뾺Ͷ��",
	"������������<color=red>Ʊѡ���ִ�������<color>\n���������ִ��ѡ���ʸ�ȷ���Ժ�����ѡ�ֿ�����������ͶƱѡ������������ӣ�ѡ�񷽷�Ϊ<color=yellow>��д���ֻ�ֱ���г�ѡ����ѡ��<color>��ÿ��ѡ��ֻ��<color=yellow>Ͷ1Ʊ<color>��ͶƱʱ��<color=yellow>��3��17��~3��23�գ�<color>��ֹ��Ʊ����һ��ѡ�ֳ�Ϊ��������<color=yellow>�����<color>�������ִ��������÷��������İ�������Ʊ����2-8����Ϊ���ִ��������÷���������<color=yellow>����<color>��"
}
--���ִ��Ԥѡ����
function wulin_helpinfo()
	wlls_descript(WULIN_TB_INFO[1], "���ִ��ѡ���ʸ�Ͷ/wulin_helpinfo_1", "Ʊѡ���ִ�������/wulin_helpinfo_2", "лл���������/OnCancel")
end

function wulin_helpinfo_1()
	wlls_descript(WULIN_TB_INFO[2], "���ִ����ǰ�ʸ�ȷ��/wulin_helpinfo", "Ʊѡ���ִ�������/wulin_helpinfo_2", "лл���������/OnCancel")
end

function wulin_helpinfo_2()
	wlls_descript(WULIN_TB_INFO[3], "���ִ����ǰ�ʸ�ȷ��/wulin_helpinfo", "���ִ��ѡ���ʸ�Ͷ/wulin_helpinfo_1", "лл���������/OnCancel")
end

function OnCancel()
end

--��ѯ�����
function wulin_queryleader()
	local szMsg = "����ӣ�������������ӣ����ϣ����£�"
	for i = getn(_wulin_tb_leader), 1, -1 do
		if (_wulin_tb_leader[i][2] == 1) then
			szMsg = szMsg.."\n����"..safeshow(_wulin_tb_leader[i][1]).."<color=red>��������<color>"
		else
			szMsg = szMsg.."\n����"..safeshow(_wulin_tb_leader[i][1]).."<color=red>�����ϣ�<color>"
		end
	end
	wlls_descript(szMsg)
end

function wulin_creatNewmember(n_lgtype, pname, paccount)
	--����ս��
	local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
	LG_SetLeagueInfo(nNewLeagueID, n_lgtype, pname)	--����������Ϣ(���͡�����)
	LG_ApplyAddLeague(nNewLeagueID, "", "")
	LG_FreeLeagueObj(nNewLeagueID)

	--����ս��
	--��account��Ϊ��һ��ս��
	--WULIN_LGTYPE_ACCOUNT
	--roleaccount
	if (FALSE(LG_GetLeagueObj(WULIN_LGTYPE_ACCOUNT, paccount))) then
		local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
		LG_SetLeagueInfo(nNewLeagueID, WULIN_LGTYPE_ACCOUNT, paccount)	--����������Ϣ(���͡�����)
		LG_ApplyAddLeague(nNewLeagueID, "", "")
		LG_FreeLeagueObj(nNewLeagueID)
	end
		
	--����ս�����˺�
	local nMemberID = LGM_CreateMemberObj()	--�������ų�Ա���ݶ���(���ض���ID)
	--�������ų�Ա����Ϣ(��ɫ����ְλ���������͡���������)
	LGM_SetMemberInfo(nMemberID, pname, 0, WULIN_LGTYPE_ACCOUNT, paccount)
	LGM_ApplyAddMember(nMemberID, "", "")
	LGM_FreeMemberObj(nMemberID)
end

function wulin_title()
	wlls_descript("���л�õڶ������ִ��ѡ���ʸ����ң�������ȡ<color=red>���ڶ������ִ��ѡ�֡�<color>�ĳƺš��óƺų���ʱ����<color=red>4��30��<color>����ȷ��������ȡ��", "��Ҫ��ȡ/wulin_sure2title", "ȡ��/OnCancel")
end

function wulin_sure2title()
	if (not FALSE(LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, GetName()))) then
			Title_AddTitle(99, 2, 4302359);	--����Ϸʱ���ֹ,����ʱ��
			Title_ActiveTitle(99);
			SetTask(1122, 99)
			wlls_descript("��ϲ�����<color=red>���ڶ������ִ��ѡ�ֳƺš�<color>��")
	else
		wlls_descript("�����ڲ��ǵڶ������ִ��ѡ�֣�����ͨ��ȷ����ǰ��Χ�ʸ���߾�Ͷ���ѡ��ȡ��ѡ���ʸ��������ȡѡ��ͷ�Ρ�")
	end
end
--����������Ա

Include( "\\script\\missions\\leaguematch\\head.lua" )
Include( "\\script\\missions\\leaguematch\\npc\\head.lua" )
Include("\\script\\lib\\log.lua")


--���Ի���
function main()
	local n_level = wlls_getcityinfo()
	if (not wlls_CheckIsOpen(n_level)) then
		return
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if (not FALSE(n_lid)) then
		--��鲢��ʾ�Ҵ��Ա�����
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_mtype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_MTYPE)
		local n_mylevel = WLLS_TAB[n_mytype].match_type[n_mtype].level
		if (n_mylevel ~= n_level) then
			wlls_descript("<enter>   C�c h� �� gia nh�p<color=red>"..WLLS_LEVEL_DESC[n_mylevel].."<color> Ta l� <color=red>"..WLLS_LEVEL_DESC[n_level].."<color>, c� ph�i �� t�m nh�m ng��i?", wlls_add_option({}, "Kh�ng c� chuy�n g� h�t"))
			return
		end
		
		--�ж��Ƿ�Խ��
		local str = wlls_levelcheck(GetName())
		if (str) then
			Say(wlls_npcname()..str, 3,
				"Ta mu�n r�i kh�i nh�m!/wlls_want2leaveleague",
				"Ta mu�n xem th� m�nh c� ph�n th��ng kh�ng/wlls_wantaward",
				"Ta s� quay l�i sau/OnCancel")
			return
		end
	end

	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local str = "<enter>  "..WLLS_TAB[n_next].text_main[n_level]
	local str_des = WLLS_LEVEL_DESC[n_level]
	local tb_option = {}
	tb_option[getn(tb_option) + 1] = "Ta mu�n ��n "..str_des.."h�i tr��ng/wlls_want2signmap"
	tb_option[getn(tb_option) + 1] = " "..str_des.."nh�m/wlls_mylg"
	tb_option[getn(tb_option) + 1] = "Ta mu�n l�nh ph�n th��ng li�n ��u/wlls_wantaward"
	tb_option[getn(tb_option) + 1] = "Ta mu�n ki�m tra �i�m Uy Danh/wlls_ShowRespect"
	tb_option[getn(tb_option) + 1] = "��ng/ m� nh�n kinh nghi�m/wlls_show_expswitch"
	wlls_descript(str, wlls_add_option(tb_option, "Ta ch� ti�n gh� qua"))
end

--��ȡ�������Ի���
function wlls_wantaward()
	local n_matchphase = GetGlbValue( GLB_WLLS_PHASE )
	local str_des = wlls_get_desc(1)
	local n_awardmin = wlls_get_award_min()
	local str = "<enter>####b�t k� tham gia V� l�m li�n ��u hay v� l�m ki�t xu�t ��u ���c nh�n ph�n th��ng. Ph�n th��ng bao g�m <color=red>Ph�n th��ng x�p h�ng<color> v� <color=red>�i�m Vinh d�<color>. Sau m�i giai ��an thi ��u k�t th�c, s� c�n c� v�o<color=red>�i�m tich l�y, t� l� th�ng, t�ng th�i gian thi ��u<color> �� x�p h�ng. <color=red>"..n_awardmin.."��i x�p cao nh�t<color> s� nh�n ���c <color=red>ph�n th��ng ��c bi�t<color>. Ng��i ch�i trong qu� tr�nh thi ��u c� th� d�ng �i�m vinh d� �� ��i ph�n th��ng danh d�. Ng��i mu�n nh�n ph�n th��ng g�?"
	local tb_option = {}
	if (n_matchphase == 1) then
		tb_option[getn(tb_option)+1] = "Ta mu�n l�nh ph�n th��ng x�p h�ng!/wlls_wantaward_rank"
		tb_option[getn(tb_option)+1] = "Ta mu�n l�nh gi�i th��ng danh hi�u!/wlls_wantaward_title"
	end
	tb_option[getn(tb_option)+1] = "Ta mu�n ��i ph�n th��ng danh d�/wlls_buy_honour"
	tb_option[getn(tb_option)+1] = "Ta mu�n mua ph�n th��ng uy danh/wlls_buy_Respect"
	
	tb_option[getn(tb_option)+1] = "Ta ch� ti�n gh� qua/OnCancel"
	wlls_descript(str, tb_option)
end

--��ȡ�����������Ի���
function wlls_wantaward_rank()
	--�����������	
	local nAward, nLevel, szLGName, nRank = wlls_checkaward_rank()
	if nAward then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[nLevel][nAward]
		local str = "<enter>  Chi�n ��i c�a b�n:<color=yellow>"..szLGName.."<color>Trong l�n thi ��u "..str_des.." n�y ���c x�p h�ng <color=yellow>"..nRank.."<color>. Ng��i c� th� nh�n ���c �i�m vinh d�"..tb_award[2].."�i�m."
		if (tb_award[3]) then	--�жӳ����⽱��
			if (LG_GetMemberTask(WLLS_LGTYPE, szLGName, GetName(), WLLS_LGMTASK_JOB) == 1) then
				str = str.."��i tr��ng (S� ph�) nh�n th�m �i�m vinh d�"..tb_award[3].."�i�m."
			end
		end
		str = str.."L�nh ngay b�y gi� ch�?"
		wlls_descript(str,
			"Ta mu�n l�nh gi�i th��ng!/wlls_getaward_rank",
			"Ta s� quay l�i sau!/OnCancel")
		return
	end
end

--����Ƿ������ȡ�������������ؿ���������ͣ�nilΪ������
function wlls_checkaward_rank(b_silent)
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then	--�պ��ڿ�������ʱ��Ҫ�콱
		if (not b_silent) then
			Msg2Player("Hi�n nay li�n ��u �� ti�n h�nh cu�c thi m�i, kh�ng th� nh�n gi�i th��ng x�p h�ng li�n ��u l�n tr��c.")
		end
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local str_des = wlls_get_desc(1)
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_awardmin = wlls_get_award_min()
	local n_rank = 0
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > n_awardmin) then
		if (not b_silent) then
			wlls_descript("<enter>  L�n n�y"..str_des.." <color=red>"..n_awardmin.."<color> hi�n �� x�p h�ng, h�nh nh� chi�n ��i c�a C�c h� kh�ng c� trong ��y!"..n_awardmin.."�� ta gi�p ki�m tra l�i")
		end
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter>  ��ng t��ng gia nh�p nh�m kh�c l� c� th� ��n gi� m�o nh�n gi�i th��ng! Ta ch�a c� l�m c�m! M�a thi ��u sau C�c h�  h�y quay l�i!")
		end
		return nil
	end
	if (GetByte(GetTask(WLLS_TASKID_GOTAWARD), 1) >= n_sid) then
		if (not b_silent) then
			wlls_descript("<enter>  C�c h� �� l�nh th��ng r�i! ��nh g�t ta n�a �?")
		end
		return nil
	end
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local tb_award = WLLS_TAB[n_type].award_rank[n_level]
	local n_award
	for i = getn(tb_award), 1, -1 do
		if (tb_award[i][1] >= n_rank) then
			n_award = i
		else
			break
		end
	end
	return n_award, n_level, str_lgname, n_rank
end

--��ȡ�ƺŽ���
function wlls_wantaward_title()
	if (GetGlbValue(GLB_WLLS_PHASE) ~= 1) then
		Msg2Player("�� ti�n h�nh cu�c thi ��u m�i, kh�ng th� nh�n gi�i th��ng!")
		return nil
	end
	local n_level, n_group = wlls_getcityinfo()
	local n_lid = wlls_check_player(GetName(), n_level)
	local n_rank
	if (not FALSE(n_lid)) then
		n_rank = LG_GetLeagueTask(n_lid, WLLS_LGTASK_RANK)
	end
	if (FALSE(n_lid) or n_rank <= 0 or n_rank > 4) then
		Say(wlls_npcname().."Gi�i th��ng n�y ch� t�ng"..wlls_get_desc(1).."trong, ng��i xu�t s�c nh�t (4 ��i h�ng ��u) . Ng��i kh�ng thu�c nh�m ��, ��ng ��n ��y ph� r�i!", 0)
		return nil
	end
	local n_sid = GetGlbValue(GLB_WLLS_SID)
	local str_lgname = LG_GetLeagueInfo(n_lid)
	local n_addsid = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_ADDSID)
	if (n_addsid >= n_sid) then
		wlls_descript("<enter>  ��ng t��ng gia nh�p nh�m kh�c l� c� th� ��n gi� m�o nh�n gi�i th��ng! Ta ch�a c� l�m c�m! M�a thi ��u sau C�c h�  h�y quay l�i!")
		return nil
	end
	local n_title = WLLS_AWARD_TITLE[n_level] + n_rank - 1
	
	
	if (n_level == 2) then
		if WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)] then
			n_title = WLLS_AWARD_TITLE_EX[GetGlbValue(GLB_WLLS_TYPE)][n_rank]
		end
	end
	
	local nServerTime = GetCurServerTime()+ 1728000; --20*24*60*60
	local nDate	= FormatTime2Number(nServerTime);
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	
	local nTime	= nMon * 1000000 + nDay * 10000	-- �������½���������
	_M("Title_AddTitle", n_title, nTime)
	
	--Remove h�o quang VLMC n�u c� tr��c khi add h�o quang m�i - Modified by DinhHQ - 20110524
	if Title_GetActiveTitle() == 3000 then
		Title_RemoveTitle(3000)		
	end
	if GetSkillState(1500) ~= -1 then
		RemoveSkillState(1500)
	end
		
	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	
	
	SetTask(1122, n_title)	--��ǰ�����ȡ�����ĸ�ͷ��ID
	local tb = {"Qu�n qu�n", "� ", "H�ng 3", "H�ng 4"}
	Msg2Player("Ch�c m�ng b�n ��t ���c danh hi�u <color=yellow>"..wlls_get_desc(1)..tb[n_rank].."<color>! Danh hi�u n�y c� th� duy tr� trong <color=yellow>20<color> ng�y.")
end

--������ȡ���н���
function wlls_getaward_rank()
	local n_award, n_level, str_lgname, nRank = wlls_checkaward_rank();
	if (n_award) then
		local str_des = wlls_get_desc(1)
		local n_type = GetGlbValue(GLB_WLLS_TYPE)
		local tb_award = WLLS_TAB[n_type].award_rank[n_level][n_award]
		local n_got = GetGlbValue(GLB_WLLS_SID)
		n_got = SetByte(n_got, 4, n_type)
		n_got = SetByte(n_got, 3, n_level)
		n_got = SetByte(n_got, 2, n_award)
		SetTask(WLLS_TASKID_GOTAWARD, n_got)
		local nPoint	= tb_award[2]
		Msg2Player("Ch�c m�ng b�n ��t ���c"..str_des.."Ph�n th��ng x�p h�ng: �i�m vinh d�"..tb_award[2].."�i�m")
		wlls_award_log(format("Nh�n ���c ph�n th��ng x�p h�ng %s: �i�m vinh d� %d �i�m",
											str_des, tb_award[2]))
		if (tb_award[3]) then	--�жӳ����⽱��
			--���ж�ֻ�Զӳ�����ת�Ƶ������ʦͽ������ȫ
			if (LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB) == 1) then
				nPoint	= nPoint + tb_award[3]
				Msg2Player("Ch�c m�ng b�n ��t ���c"..str_des.."Ph�n th��ng x�p h�ng (��i tr��ng): �i�m vinh d�"..tb_award[3].."�i�m")
				wlls_award_log(format("Nh�n ���c ph�n th��ng x�p h�ng %s (��i tr��ng): �i�m vinh d�: %d �i�m",
											str_des, tb_award[3]))
			end
		end
		SetTask(WLLS_TASKID_HONOUR, GetTask(WLLS_TASKID_HONOUR) + nPoint)
		wlls_award_log(format("T�ng c�ng c� %d �i�m vinh d�", GetTask(WLLS_TASKID_HONOUR)))
		
		if (nRank == 1) then -- ��õ�һ�� �������а� ����ֵ��1
		    local nCurPoint = GetTask(2601);
		    nCurPoint = nCurPoint + 1;
		    SetTask(2601, nCurPoint);
		end

		SyncTaskValue(WLLS_TASKID_HONOUR)
	end
end

--����Ƿ���Խ���ս��
function wlls_cancreate(n_level)
	local n_mylevel = wlls_player_level()
	--�ȼ�����
	if (n_mylevel ~= n_level) then
		if (n_level == 1) then
			if (n_mylevel < n_level) then
				wlls_descript("<enter>  <color=red>V� l�m ki�t xu�t li�n ��u<color> tuy n�i l� �� ch�n ra nh�ng h�o ki�t �u t� c�a c�c m�n ph�i trong giang h�, nh�ng ��ng c�p c�a b�n v�n ch�a ��!"..WLLS_LEVEL_JUNIOR.."c�p, v� ngh� ch�a tinh, ch� s� �ao ki�m v� nh�n, l�m ng��i b� th��ng. Ng��i n�n ti�p t�c luy�n t�p!")
			else
				wlls_descript("<enter>  C�c h� �� l� ��i hi�p giang h� ��nh ��nh ��i danh, <color=red>li�n ��u V� l�m ki�t xu�t<color> l� �� ch�n ra nh�ng t�i n�ng tr�, ng��i c�n g� ph�i ra oai v�i ��m h�u b�i ch�? Hay l� ng��i tham gia <color=red>V� l�m li�n ��u<color> �i!")
			end
		else
			wlls_descript("<enter>  <color=red>V� l�m li�n ��u<color> v�n l� n�i Anh h�ng thi�n h� lu�n ki�m, ��ng c�p c�a ng��i v�n ch�a ��!"..WLLS_LEVEL_SENIOR.."c�p, anh h�ng kh�p n�i t� t�, ng�a h� t�ng long, e r�ng ng��i ch� l� k� h�u b�i! T�t h�n n�n luy�n t�p th�m!")
		end
		return nil
	end
	if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName()))) then
		wlls_descript("<enter>  C�c h� �� v�o nh�m r�i, kh�ng th� th�nh l�p nh�m kh�c!")
		return nil
	end
	return wlls_player_type()
end

--�ҵ�ս��
function wlls_mylg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local n_type

	if (FALSE(n_lid)) then
		n_type = GetGlbValue(GLB_WLLS_NEXT)
	else
		n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)		
	end
	
	WLLS_TAB[n_type].npc_mylg()
end

function wlls_want2create()
	local n_level = wlls_getcityinfo()
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	if (not wlls_cancreate(n_level)) then return end
	wlls_descript("<enter>"..WLLS_TAB[n_next].text_creat,
		"Ta mu�n l�p nh�m!/wlls_inputstr_lgname",
		"�� ta xem l�i/OnCancel")
end

--����ս����
function wlls_inputstr_lgname()
	local n_level = wlls_getcityinfo()
	if (not wlls_cancreate(n_level)) then return end
	AskClientForString("wlls_createleague", "", 1, 16, "Nh�p t�n nh�m mu�n th�nh l�p")
end

--����ս�ӣ����գ�
function wlls_createleague(str_lgname)
	if (not str_lgname) then
		str_lgname = GetName()
	end
	local n_level = wlls_getcityinfo()
	local n_mtype = wlls_cancreate(n_level)
	if (not n_mtype) then return end
	str_lgname = strsub(str_lgname,1,16)
	local forbidstr={" ","\"","/","#","|","\t","\n"}
	local str
	for i = 1, getn(forbidstr) do
		if (not FALSE(strfind(str_lgname,forbidstr[i]))) then
			str = "Xin l�i! Nh�m c�a b�n kh�ng ch�a ch� n�y:"
			for i = 1, getn(forbidstr) do
				if (forbidstr[i]==" ") then
					str = str .. " [Space]"
				elseif (forbidstr[i]=="|") then
					str = str .. " [ch�p h�nh]"
				elseif (forbidstr[i]=="\t") then
					str = str .. "[TAB]"
				elseif (forbidstr[i]=="\n") then
					str = str .. " [Enter]"
				else
					str = str .. forbidstr[i]
				end
			end
			break
		end
	end
	if (not str) then
		if (not FALSE(LG_GetLeagueObj(WLLS_LGTYPE, str_lgname))) then
			str = "Xin l�i! T�n ��i thi ��u n�y �� c� ng��i s� d�ng."
		elseif (FALSE(ST_CheckTextFilter(str_lgname))) then
			str = "Xin l�i! Nh�m c�a b�n ch�a t� kh�ng ��ng."
		end
	end
	if (str) then
		Say(wlls_npcname()..str, 2, "Hi�u r�i! Ta s� nh�p l�i!/wlls_inputstr_lgname", "Kh�ng c�n!/OnCancel")
		return
	end
	local n_next = GetGlbValue(GLB_WLLS_NEXT)
	local szParam = GetName().." "..n_next.." "..n_mtype.." "..str_lgname
	LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, GetName(), "\\script\\leaguematch\\league.lua", "wlls_create", szParam , "", "")
	
	
	SetRespect(0)
end


--��ӳ�Ա���Ի���
function wlls_want2addmember()
	local teammember, _, str_lgname = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local str = wlls_npcname().."B�n mu�n nh�ng ng��i d��i ��y"..getn(teammember).."gia nh�p nh�m c�a b�n ["..str_lgname.."] ph�i kh�ng?<enter>";
	for i = 1, getn(teammember) do
		str = str.." <color=yellow>"..teammember[i];
	end

	Say(str, 2, "��ng r�i! ��ng k� �� anh �y (c� �y) gia nh�p ��i thi ��u/wlls_sure2addmember","Kh�ng c�n!/OnCancel")
end

--��ӳ�Ա�����գ�
function wlls_sure2addmember()
	local teammember = wlls_checkteam()
	
	if (teammember == nil) then
		return
	end

	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	local str_lgname = LG_GetLeagueInfo(n_lid)
	for i = 1, getn(teammember) do
		local nPlayerIndex = SearchPlayer(teammember[i])
		if nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, SetRespect, 0)
			local szParam = teammember[i].." "..str_lgname.." "..GetName()
			LG_ApplyDoScript(WLLS_LGTYPE, str_lgname, teammember[i], "\\script\\leaguematch\\league.lua", "wlls_add", szParam , "", "")
		end	
	end
end

--�����Ӷ�Ա�Ƿ���Ա���ӵ���ǰ�����У��ɹ�������Ӷ�Ա������ս�����͡�ս���������򷵻�nil
function wlls_checkteam()
	if (IsCaptain() ~= 1) then
		Say(wlls_npcname().."Xin l�i! B�n c�n ph�i l� <color=red> ��i tr��ng<color> trong <color=red>nh�m<color>, m�i c� th� ��ng k� ��i vi�n gia nh�p chi�n ��i.",0)
		return nil
	end

	local teamsize = GetTeamSize()
	if (teamsize < 2) then
		Say(wlls_npcname().."Nh�m c�a b�n h�nh nh� kh�ng c� th�nh vi�n nh�m kh�c? B�n mu�n cho ai v�o chi�n ��i c�a m�nh?",0)
		return nil
	end

	local n_lid, n_mtype, n_job, str_lgname, n_mcount = wlls_lg_info()
	if (FALSE(n_lid)) then
		Say(wlls_npcname().."Xin l�i! B�n ch�a l�p nh�m, kh�ng th� cho ng��i kh�c v�o nh�m!", 0)
		return nil
	end
	if (n_job ~= 1) then
		Say(wlls_npcname().."Xin l�i! B�n kh�ng ph�i l� ��i tr��ng, kh�ng th� cho ng��i kh�c v�o chi�n ��i!", 0)
		return nil
	end
	local n_next	= GetGlbValue(GLB_WLLS_NEXT)
	local n_stype	= LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
	if (n_stype ~= n_next) then
		Say(wlls_npcname().."Xin l�i! Lo�i h�nh li�n ��u k� sau �� thay ��i, chi�n ��i c�a b�n hi�n t�i �� qu� h�n, kh�ng th� ti�p t�c s� d�ng.", 0)
		return nil
	end
	local n_maxmem = WLLS_TAB[n_next].max_member
	n_mcount = n_maxmem - n_mcount
	if (n_mcount <= 0) then
		Say(wlls_npcname().."Xin l�i! Chi�n ��i c�a b�n ["..str_lgname.."]�� �� s� l��ng, kh�ng th� gia nh�p th�m ��i vi�n!",0)
		return nil
	end
	if (GetTeamSize()-1 > n_mcount) then
		Say(wlls_npcname().."Xin l�i! Chi�n ��i c�a b�n ["..str_lgname.."]ch� c�n nh�p l�i "..n_mcount.." ng��i, kh�ng th� cho to�n b� th�nh vi�n c�a b�n gia nh�p! Xin h�y cho th�nh vi�n th�a t�m th�i r�i kh�i nh�m!",0)
		return nil
	end

	local teammember = {}
	local str_capname = GetName()
	local n_capidx = PlayerIndex
	for i = 2 , teamsize do
		PlayerIndex = GetTeamMember(i)
		local membername = GetName()
		--�����ظ������Ա
		if (not FALSE(LG_GetLeagueObjByRole(WLLS_LGTYPE, membername))) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname().."Xin l�i! ��i vi�n trong nh�m:"..membername.." �� l� th�nh vi�n c�a chi�n ��i kh�c, cho n�n kh�ng th� v�o chi�n ��i c�a b�n!", 0)
		 	return nil
		end
		--�����Ա������
		local str = wlls_check_addmem(n_capidx, n_lid, n_mtype)
		if (str) then
		 	PlayerIndex = n_capidx
		 	Say(wlls_npcname()..str, 0)
		 	return nil
		end
		teammember[i-1] = membername
	end
	PlayerIndex = n_capidx
	return teammember, n_mtype, str_lgname
end

--�뿪ս�ӣ��Ի���
function wlls_want2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if (FALSE(n_lid)) then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	local str_lgname, _, n_memcount = LG_GetLeagueInfo(n_lid)
	local n_job = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, GetName(), WLLS_LGMTASK_JOB)
	local str = wlls_npcname().."Ng��i mu�n r�i kh�i chi�n ��i ["..str_lgname.."]ph�i kh�ng?"
	if(n_memcount <= 1) then
		str = str .. "B�n hi�n l� <color=red>th�nh vi�n duy nh�t<color> c�a chi�n ��i c�a b�n. N�u nh� b�n r�i kh�i chi�n ��i, chi�n ��i s� b� gi�i t�n."
	elseif (not FALSE(n_job)) then
		local n_type = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		if (n_type == 3) then	--ʦͽ��
			str = str .. "Hi�n t�i b�n l� <color=red>��i tr��ng (s� ph�)<color> c�a chi�n ��i, n�u b�n r�i kh�i chi�n ��i, �� �� c�a b�n s� <color=red>kh�ng ���c tham gia thi ��u<color>."
		else	--��������
			str = str .. "B�n hi�n l� <color=red>��i tr��ng<color>, n�u nh� b�n r�i kh�i nh�m, ch�c ��i tr��ng s� ���c chuy�n cho th�nh vi�n kh�c."
		end
	end
	Say(str, 2, "��ng v�y!/wlls_sure2leaveleague","Kh�ng c�n!/OnCancel")
end

--�뿪ս�ӣ�ȷ�϶Ի���
function wlls_sure2leaveleague()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	Say(wlls_npcname().."Sau khi b�n r�i kh�i nh�m, s� <color=yellow>kh�ng th� l�nh gi�i th��ng c�a chi�n ��i<color>, b�n x�c nh�n mu�n r�i kh�i nh�m?", 2, "��ng v�y!/wlls_leaveleague_final","Kh�ng c�n!/OnCancel")
end

--�뿪ս�ӣ����գ�
function wlls_leaveleague_final()
	local n_lid, str = wlls_check_leavelg()
	if not n_lid then
		Say(wlls_npcname()..str, 0)
		return
	end
	
	LG_ApplyDoScript(WLLS_LGTYPE, "", GetName(), "\\script\\leaguematch\\league.lua", "wlls_leave", GetName() , "", "")
end

--����᳡���Ի���
function wlls_want2signmap()
	local n_matchphase = GetGlbValue(GLB_WLLS_PHASE)
	
	if (n_matchphase < 2) then
		Say(wlls_npcname().."Hi�n t�i l� th�i gian li�n ��u t�m ngh�, h�i tr��ng s� t�m ��ng c�a, b�n h�y ch� ��n k� thi ��u h�y quay l�i!", 0)
		return 
	end
		
	local n_level, n_group = wlls_getcityinfo()
	local n_lid, n_mtype = wlls_check_player(GetName(), n_level)
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	if (FALSE(n_lid)) then
		local str_des = wlls_get_desc(1)
		if (WLLS_TAB[n_type].max_member == 1) then
			wlls_descript("B�n ch�a "..str_des.."chi�n ��i, n�u tham gia thi ��u, h� th�ng s� l�p cho b�n 1 chi�n ��i. B�n c� mu�n l�p 1 chi�n ��i kh�ng?", "Ta mu�n l�p chi�n ��i!/#wlls_createleague()", "Ta kh�ng mu�n thi ��u!/OnCancel")
		else
			wlls_descript("<enter>  L�n n�y"..str_des.." ch�a th�y b�o danh chi�n ��i c�a b�n, c� nh�m l�n g� kh�ng? Quy ��nh c�a V� l�m minh ch� nghi�m ng�t, ta mu�n gi�p ng��i c�ng kh�ng ���c. ��i hi�p h�y �i x�c nh�n l�i, r�i h�y ��n t�m ta!")
		end
		return
	end

	if (not WLLS_TAB[n_type].match_type[n_mtype].map[n_group]) then
		n_group = 1
	end
	--��¼�볡�ص�
	local x,y,z = GetWorldPos();
	SetTask(WLLS_TASKID_FROMMAP, x);
	SetTask(WLLS_TASKID_FROM_X, y);
	SetTask(WLLS_TASKID_FROM_Y, z);

	--���͵��������ͼ
	local n_signmap = wlls_get_mapid(1, n_mtype, n_group)
	NewWorld(n_signmap, WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])
	Msg2Player("B�n �� ��n<color=yellow>"..wlls_get_desc(3, n_mtype, n_group).."<color>khu v�c thi ��u")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhThamGiaLienDau")
end

--����Ƿ�����뿪ս�ӡ����Է���n_lid�����򷵻�nil,ԭ���ַ���
function wlls_check_leavelg()
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, GetName())
	if(n_lid == 0) then
		return nil, "B�n v�n ch�a v�o chi�n ��i!"
	end
	
	local n_total = LG_GetLeagueTask(n_lid, WLLS_LGTASK_TOTAL)
	local n_phase = GetGlbValue(GLB_WLLS_PHASE)
	if(n_phase ~= 1 and n_total ~= 0) then
		return nil, "Do chi�n ��i c�a b�n �ang thi ��u, b�n kh�ng th� r�i kh�i chi�n ��i, h�y ch� ��n l�c thi ��u xong h�y quay l�i!"
	end
	
	if(n_phase > 3) then
		return nil, "�ang trong thi ��u, kh�ng th� r�i kh�i chi�n ��i, xin ��i sau tr�n ��u l�c th�i gian ngh� ng�i m�i r�i kh�i chi�n ��i."
	end
	
	return n_lid
end

--ȡ�õ�ǰ������������������Ҫ������
function wlls_get_award_min()
	local n_type = GetGlbValue(GLB_WLLS_TYPE)
	local n_level = wlls_getcityinfo()
	local tb = WLLS_TAB[n_type].award_rank[n_level]
	return tb[getn(tb)][1]
end

--������ȡ����
function wlls_show_expswitch()
	local b_exps = GetBit(GetTask(WLLS_TASKID_SWITCH), 1)
	local str = "<enter>   Ph�n th��ng v� l�m li�n ��u l�n n�y phong ph� l�m! N�u c�c ng��i kh�ng mu�n s� d�ng ngay �i�m kinh nghi�m th� � ch� ta c� thi�t l�p n�t ��ng, m� �i�m kinh nghi�m, ng��i c� th� kh�a ph�n th��ng �i�m kinh nghi�m c�a m�nh.<enter>"
	str = str.."<enter>   Tr�ng th�i ��ng/m� hi�n t�i c�a b�n l�:"..iif(b_exps == 0, "<color=red>m�<color> (c� th� nh�n ph�n th��ng kinh nghi�m) ", "<color=red>��ng<color> (kh�ng th� nh�n ph�n th��ng kinh nghi�m) ")..""
	wlls_descript(str, iif(b_exps == 0, "Ta mu�n ��ng ph�n th��ng/#wlls_set_expswitch(1)", "Ta mu�n m� ph�n th��ng/#wlls_set_expswitch(0)"), "���c th�i! Ta �� thi�t l�p xong r�i!/OnCancel")
end

--���þ�����ȡ����
function wlls_set_expswitch(b_exps)
	local n_switch = GetTask(WLLS_TASKID_SWITCH)
	SetTask(WLLS_TASKID_SWITCH, SetBit(n_switch, 1, b_exps))
	Talk(1, "wlls_show_expswitch", "Th�nh c�ng"..iif(b_exps == 0, "m� ", "��ng").."ph�n th��ng kinh nghi�m li�n ��u!")
end

--��������ȡ��Ʒ
function wlls_buy_honour()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end

	Msg2Player("b�n hi�n �ang c� <color=yellow>"..GetTask(WLLS_TASKID_HONOUR).."<color> �i�m vinh d�")
	if (GetBoxLockState() == 0) then
		Sale(146,11) -- �̵���������ֱ��Ϊ11
	else
		Say(wlls_npcname().."Xin m� kh�a r��ng tr��c r�i h�y mua! ", 0)
	end
end


function wlls_ShowRespect()
	Talk(1, "", "Hi�n t�i ��i hi�p c� �i�m uy danh l� <color=yellow>"..GetRespect().."<color>")
end

--��������ȡ��Ʒ
function wlls_buy_Respect()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end
	--B� gi�i h�n th�i gian b�n ��o c� trong shop danh v�ng - Modified by DinhHQ - 20110429
--	local nDate = tonumber(GetLocalDate("%d"))
--	if (nDate >= 8 and nDate <= 28) then
--		Talk(1, "", "Hi�n t�i kh�ng th� mua ��o c� danh v�ng")
--		return 
--	end
	
	
	Msg2Player("Hi�n t�i ��i hi�p c� �i�m uy danh l� <color=yellow>"..GetRespect().."<color>")
	if (GetBoxLockState() == 0) then
		Sale(173,13) -- �̵���������ֱ��Ϊ11
	else
		Say(wlls_npcname().."Xin m� kh�a r��ng tr��c r�i h�y mua! ", 0)
	end
end
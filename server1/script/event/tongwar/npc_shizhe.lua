--���ֵ�һ��ʹ��
-- �������µ�һ�� ��һ�����������ԵǼ��Լ��Ķ���

Include("\\script\\event\\tongwar\\head.lua");		--���µ�һ��ͷ�ļ�
Include("\\script\\task\\system\\task_string.lua");	--�Ի�����ͷ�ļ�
Include("\\script\\global\\titlefuncs.lua");		-- �ƺ�

Include("\\script\\vng_event\\give_support_item.lua")
Include("\\script\\vng_feature\\thdnb\\baodanh.lua")
SZONETONG_LGNAME	=	"ONETONG_ONETONG";
ONETONG_LGTYPE		=	541;
ONETONG_ACC_LGTYPE	=	542;
_TB_ONETONG_MEMLIST	=	{-1, {}};
local SZTONGNAME_ONETONG = "BC";
local N_TTITLE_ID = 199;

ONETONG_START_SIGNUP	= 20130415						-- ���µ�һ�￪ʼ�Ǽ�ʱ��
ONETONG_ENDLE_SIGNUP	= 20130421						-- ���µ�һ������Ǽ�ʱ��

ONETONG_START_TITLE		= 20100118						-- ����һ����ȡͷ�ο�ʼʱ��
ONETONG_ENDLE_TITLE		= 20100214						-- ����һ����ȡͷ�ν���ʱ��

ONETONG_MAX_SIGNMEM		= 74

function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= ONETONG_START_SIGNUP and nDate <= ONETONG_ENDLE_SIGNUP) then
		if (getn(_TONGWAR_ARRRANK) == 0) then
			tongwar_create()
			tongwar_cityrank();
		end;
		CreateTaskSay({"<dec><npc>Ho�t ��ng ��ng k� chi�n ��i Thi�n H� �� Nh�t Bang �ang ti�n h�nh, ng��i t�m ta c� vi�c g�: ",
					"Xem danh s�ch th�nh vi�n/onetong_showlistmem",
					"B�o danh tham gia Thi�n H� �� Nh�t Bang/onetong_signupmem",
					"Giao n�p v�t ph�m h� tr� T�ng Kim/#GiveSupportItem:OpenUI()",
					"B�o danh Thi�n H� �� Nh�t Bang d�nh cho bang ��t top n�p l�nh b�i/#tbTHDNBReg:AddDialog()",
					"K�t th�c ��i tho�i/OnCancel"});
		
	elseif (nDate >= ONETONG_START_TITLE and nDate <= ONETONG_ENDLE_TITLE) then
		
		CreateTaskSay({format("<dec><npc>T�i h� ph� tr�ch t�ng danh hi�u %s cho bang %s. Ng��i t�m ta c� vi�c g�?", "Cao C�p �� Nh�t Bang", %SZTONGNAME_ONETONG ),
					format("Ta l� th�nh vi�n c�a bang %s./onetong_awardtitle", %SZTONGNAME_ONETONG),
					"K�t th�c ��i tho�i/OnCancel"});
	else
		CreateTaskSay({format("<dec><npc>Ch�o %s!", GetName()), "K�t th�c ��i tho�i/OnCancel" });
	end;
	
end;

function onetong_showlistmem()
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L�m �� Nh�t Bang l�n 11 m�i c� th� th�c hi�n thao t�c n�y.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L�m �� Nh�t Bang l�n 11 m�i c� th� th�c hi�n thao t�c n�y.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == -1) then
		onetong_createlist();	--��������
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == 0) then
		CreateTaskSay({"<dec><npc>Hi�n kh�ng c� th�nh vi�n n�o trong danh s�ch.", "K�t th�c ��i tho�i/OnCancel"});
		return 1;
	end;
	
	local tbOpp = onetong_selfinfo2next(0);
	tinsert(tbOpp, 1, "<dec><npc>Danh s�ch th�nh vi�n: ")
	CreateTaskSay(tbOpp);
	
end;

function onetong_createlist()
	local n_lid = LG_GetLeagueObj(ONETONG_LGTYPE, SZONETONG_LGNAME);
	if (FALSE(n_lid)) then
		local nLeagueID = LG_CreateLeagueObj()
		LG_SetLeagueInfo(nLeagueID, ONETONG_LGTYPE, SZONETONG_LGNAME)
		local ret = LG_ApplyAddLeague(nLeagueID, "", "")
		LG_FreeLeagueObj(nLeagueID);
		_TB_ONETONG_MEMLIST[1] = 0;
		if (ret == 1) then
			onetong_applyaddmem(ONETONG_LGTYPE, SZONETONG_LGNAME, GetName());
			LG_ApplySetMemberTask(ONETONG_LGTYPE, SZONETONG_LGNAME, GetName(), 1, 1);
			onetong_addacclist(GetName())
			_TB_ONETONG_MEMLIST[1] = 1;
			tinsert(_TB_ONETONG_MEMLIST[2], GetName())
			--_TB_ONETONG_MEMLIST[2][getn(_TB_ONETONG_MEMLIST[2]) + 1] = GetName();
		end;
		return 1;
	end;
	_TB_ONETONG_MEMLIST[1] = LG_GetMemberCount(n_lid);
	for i = 0, _TB_ONETONG_MEMLIST[1]-1 do
		local sz_pl = LG_GetMemberInfo(n_lid, i);
		tinsert(_TB_ONETONG_MEMLIST[2], sz_pl)
		--_TB_ONETONG_MEMLIST[2][i + 1] = sz_pl;
	end;
	return 1;
end;

function OnCancel()
end;

function onetong_managemem(szmem, npos)
	CreateTaskSay({format("<dec><npc>Th�nh vi�n mu�n xem: <enter>%s", szmem), 
			format("Lo�i b� th�nh vi�n/#onetong_delonemem([[%s]], %d)",szmem, npos),
			"K�t th�c ��i tho�i/OnCancel"		});
end;

function onetong_delonemem(szmem, npos)
	local n_lid = LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmem);
	if (FALSE(n_lid)) then
		return
	end;
	CreateTaskSay({format("<dec><npc>X�c nh�n mu�n lo�i b� th�nh vi�n:<enter>%s",szmem),
			format("��ng �!/#onetong_suredelmem([[%s]], %d)",szmem, npos),
			"H�y b� /OnCancel"});
end;

function onetong_suredelmem(szmem, npos)
	
	local n_lid = LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmem);
	if (FALSE(n_lid)) then
		return
	end;
	if (LG_GetMemberTask(ONETONG_LGTYPE, SZONETONG_LGNAME, szmem, 1) == 1) then
		CreateTaskSay({"<dec><npc>Bang ch� Thi�n H� �� Nh�t Bang kh�ng th� b� lo�i kh�i danh s�ch.", "K�t th�c ��i tho�i/OnCancel"});
		return
	end;
	
	if (_TB_ONETONG_MEMLIST[2][npos] ~= szmem) then
		return
	end;
	
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L�m �� Nh�t Bang l�n 11 m�i c� th� th�c hi�n thao t�c n�y.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L�m �� Nh�t Bang l�n 11 m�i c� th� th�c hi�n thao t�c n�y.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end;
	
	LGM_ApplyRemoveMember(ONETONG_LGTYPE, SZONETONG_LGNAME, szmem, "", "", 0);
	tremove(_TB_ONETONG_MEMLIST[2], npos);
	_TB_ONETONG_MEMLIST[1] = getn(_TB_ONETONG_MEMLIST[2]);
	
	WriteLog(format("%s\tName:%s\tAccount:%s\tTongName:%s Delete OneTong Member %s",
					GetLocalDate("%d-%m-%Y %X"),
					GetName(),
					GetAccount(),
					GetTongName(),
					szmem
					));
	
	if (_TB_ONETONG_MEMLIST[1] == 0) then
		_TB_ONETONG_MEMLIST[1] = -1;
	end;
	CreateTaskSay({format("<dec><npc>�� lo�i b� th�nh vi�n:<enter>%s", szmem), "K�t th�c ��i tho�i/OnCancel"});
end;

function onetong_selfinfo2next( num )
	local opp = {};
	--if ( getn(_TB_ONETONG_MEMLIST[2]) - num > 10 ) then
	if ( _TB_ONETONG_MEMLIST[2].n - num > 10 ) then
		for i = num+1, num+10 do
			opp[ getn(opp) + 1 ] = format("%s/#onetong_managemem([[%s]],%d)", _TB_ONETONG_MEMLIST[2][i],_TB_ONETONG_MEMLIST[2][i], i);
		end
		opp[getn(opp)+1] = format("Trang k� /#onetong_selfinfo2next(%d)", (num+10));
	else
		--for i = num+1, getn( _TB_ONETONG_MEMLIST[2] ) do
		for i = num+1, _TB_ONETONG_MEMLIST[2].n do
			opp[ getn(opp) + 1 ] = format("%s/#onetong_managemem([[%s]],%d)", _TB_ONETONG_MEMLIST[2][i],_TB_ONETONG_MEMLIST[2][i], i);
--			opp[getn(opp) + 1] = _TB_ONETONG_MEMLIST[2][i];
		end;
	end;
	opp[getn(opp)+1] = "��ng/OnCancel";
	if( num == 0 ) then
		return opp;
	end;
	tinsert(opp, 1, "<dec><npc>Danh s�ch th�nh vi�n: ");
	CreateTaskSay(opp);
end

function onetong_signupmem()
	local n_lid = tongwar_check_ownerright(1);
	if (FALSE(n_lid)) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L�m �� Nh�t Bang l�n 11 m�i c� th� th�c hi�n thao t�c n�y.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end;
	
	local szLeagueName = LG_GetLeagueInfo(n_lid);
	if (szLeagueName ~= _TONGWAR_ARRRANK[1][1]) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� V� L�m �� Nh�t Bang l�n 11 m�i c� th� th�c hi�n thao t�c n�y.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end;
	
	if (_TB_ONETONG_MEMLIST[1] == -1) then
		onetong_createlist();	--��������
	end;
	
	local szmastername = GetName();
	local n_size = GetTeamSize();
	
	if (n_size < 2) then
		CreateTaskSay({"<dec><npc>H�y t� ��i v�i th�nh vi�n tr��c r�i m�i b�o danh tham gia.", "K�t th�c ��i tho�i/OnCancel"});
		return
	elseif (n_size > 2) then
		CreateTaskSay({"<dec><npc>M�i l�n b�o danh c�n t� ��i v�i 1 th�nh vi�n.", "K�t th�c ��i tho�i/OnCancel"});
		return
	end;
	
	if (IsCaptain() == 0) then
		CreateTaskSay({"<dec><npc>Ch� c� ��i tr��ng m�i c� th� ti�n h�nh b�o danh.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end;
	
	local n_onetongid = LG_GetLeagueObj(ONETONG_LGTYPE, SZONETONG_LGNAME);
	local nCurMemCnt = LG_GetMemberCount(n_onetongid);
	if (nCurMemCnt < _TB_ONETONG_MEMLIST[1]) then
		nCurMemCnt = _TB_ONETONG_MEMLIST[1];
	end;
	if (nCurMemCnt >= ONETONG_MAX_SIGNMEM) then
		CreateTaskSay({"<dec><npc>Danh s�ch th�nh vi�n Thi�n H� �� Nh�t Bang �� �� s�, kh�ng th� ti�p t�c b�o danh.", "K�t th�c ��i tho�i/OnCancel"});
		return 0;
	end;
	
	local szmemname = "";
	local bp = 0;
	local nfact = -1;
	local oldPlayer = PlayerIndex;
	for i = 1, 2 do
		local nplayer = GetTeamMember(i);
		PlayerIndex = nplayer;
		
		if (GetName() ~= szmastername) then
			szmemname = GetName();
			if (FALSE(LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmemname))) then
				bp = 1;
				nfact = GetLastFactionNumber();
			end;
			break
		end;
	end;
	PlayerIndex = oldPlayer;
	if (bp == 1) then
		if (nfact ~= -1) then
			CreateTaskSay({format("<dec><npc>Ng��i x�c nh�n mu�n b�o danh cho <color=yellow>%s<color> kh�ng?",szmemname), format("Ta ��ng �/#onetong_addmemlist([[%s]])", szmemname),"K�t th�c ��i tho�i/OnCancel"});
		else
			CreateTaskSay({"<dec><npc>Th�nh vi�n ch� tr�ng kh�ng th� b�o danh tham gia!", "K�t th�c ��i tho�i/OnCancel"});
		end;
	else
		CreateTaskSay({format("<dec><npc>Ng��i ch�i <color=yellow>%s<color> hi�n �� c� t�n trong danh s�ch!",szmemname), "K�t th�c ��i tho�i/OnCancel"});
	end;
end;

function onetong_addmemlist(szmemname)
	--Fix bug member disconnect while registrering - Modified by DinhHQ - 20110520
	local nPIndex = SearchPlayer(szmemname)
	if nPIndex <= 0 then
		CreateTaskSay({format("<dec><npc>Ng��i ch�i <color=yellow>%s<color> b�o danh th�t b�i.", szmemname), "K�t th�c ��i tho�i/OnCancel"});
		return
	end
	
	if (FALSE(LG_GetLeagueObjByRole(ONETONG_LGTYPE, szmemname))) then
		
		nPIndex = SearchPlayer(szmemname)
		if nPIndex <= 0 then
		CreateTaskSay({format("<dec><npc>Ng��i ch�i <color=yellow>%s<color> b�o danh th�t b�i.", szmemname), "K�t th�c ��i tho�i/OnCancel"});
		return
	end
		
		local ret = onetong_applyaddmem(ONETONG_LGTYPE, SZONETONG_LGNAME, szmemname);
		if (ret == 1 and onetong_addacclist(szmemname) == 1) then
			CreateTaskSay({format("<dec><npc>Ng��i ch�i <color=yellow>%s<color> b�o danh th�nh c�ng!", szmemname), "K�t th�c ��i tho�i/OnCancel"});
			Msg2Team(format("Ng��i ch�i <color=yellow>%s<color> b�o danh th�nh c�ng!", szmemname))
			_TB_ONETONG_MEMLIST[1] = _TB_ONETONG_MEMLIST[1] + 1;
			--_TB_ONETONG_MEMLIST[2][getn(_TB_ONETONG_MEMLIST[2]) + 1] = szmemname;
			tinsert(_TB_ONETONG_MEMLIST[2], szmemname);
			
			WriteLog(format("%s\tName:%s\tAccount:%s\tTongName:%s ApplyAdd OneTong Member %s",
					GetLocalDate("%d-%m-%Y %X"),
					GetName(),
					GetAccount(),
					GetTongName(),
					szmemname
					));
		else
			CreateTaskSay({format("<dec><npc>Ng��i ch�i <color=yellow>%s<color> b�o danh th�t b�i.", szmemname), "K�t th�c ��i tho�i/OnCancel"});
		end;
	end;
end;

function onetong_addacclist(szmemname)
	local nPIdx = SearchPlayer(szmemname);
	if (nPIdx > 0) then	--��ɫ����
		local nOldPlayerIndex = PlayerIndex;
		PlayerIndex = nPIdx;
		local szmemacc = GetAccount();
		local n_lid = LG_GetLeagueObj(ONETONG_ACC_LGTYPE, szmemacc);
		if (FALSE(n_lid)) then
			local nLeagueID = LG_CreateLeagueObj();
			LG_SetLeagueInfo(nLeagueID, ONETONG_ACC_LGTYPE, szmemacc);
			local ret = LG_ApplyAddLeague(nLeagueID, "", "")
			LG_FreeLeagueObj(nLeagueID);
			if (ret == 1) then
				return onetong_applyaddmem(ONETONG_ACC_LGTYPE, szmemacc, szmemname);
			else
				return 0;
			end;
		end;
		return onetong_applyaddmem(ONETONG_ACC_LGTYPE, szmemacc, szmemname);
	else
		return 0;
	end;
end;

function onetong_applyaddmem(nlgtype, szlgname, szmemname)
	local n_lid = LG_GetLeagueObjByRole(nlgtype, szmemname);
	if (FALSE(n_lid)) then
		local nMemberID = LGM_CreateMemberObj();
		LGM_SetMemberInfo(nMemberID, szmemname, 0, nlgtype, szlgname) 
		local ret = LGM_ApplyAddMember(nMemberID, "", "");
		LGM_FreeMemberObj(nMemberID);
		return ret;
	end;
	return 1;
end;


function onetong_awardtitle()
	local szTongName, nTongID = GetTong();
	local n_title = %N_TTITLE_ID;
	local n_titletype = Title_GetTitleInfo(n_title);
	
	if((nTongID == 0 or nTongID == -1) or szTongName ~= %SZTONGNAME_ONETONG or n_titletype == 1 or GetJoinTongTime() < 10080) then
		CreateTaskSay({"<dec><npc>".."C�c h� kh�ng ph� h�p �i�u ki�n l�nh th��ng", "K�t th�c ��i tho�i/OnCancel"});
		return
	end
	
	--Remove h�o quang VLMC n�u c� tr��c khi add h�o quang m�i - Modified by DinhHQ - 20110524
	if Title_GetActiveTitle() == 3000 then
		Title_RemoveTitle(3000)		
	end
	if GetSkillState(1500) ~= -1 then
		RemoveSkillState(1500)
	end
	
	SetTask(TASK_ACTIVE_TITLE, n_title);
	Title_AddTitle(n_title, 1, 90 * 24 * 60 * 60 * 18);
	Title_ActiveTitle(n_title);
	
	local sz_title = Title_GetTitleName(n_title);
	
	CreateTaskSay({"<dec><npc>".."Ch�c m�ng, t�i h� r�t ��ng ���c ta k�nh ph�c.", "K�t th�c ��i tho�i/OnCancel"});
	
	Msg2Player(format("Ch�c m�ng b�n �� nh�n ���c danh hi�u <color=yellow>%s<color>", sz_title));
end

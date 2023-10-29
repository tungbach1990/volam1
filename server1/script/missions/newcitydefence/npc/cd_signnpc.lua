----------------------------------------------------------------
--FileName:	cd_signnpc.lua
--Creater:	firefox
--Date:		2005-
--Comment:	��ĩ�������ս��֮�������
--			���ܣ������㱨����
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\head.lua")
CD_SIGNNPCNAME = "T��ng qu�n th� th�nh"
function main()
	local signmap = SubWorldIdx2ID( SubWorld )
	if ( signmap == tbDEFENCE_SIGNMAP[1] ) then
		camp = 1
		cityname = "Phe T�ng"
		defencemap = tbDEFENCE_MAPID[1]
		defencesidx = SubWorldID2Idx( defencemap )
	elseif ( signmap == tbDEFENCE_SIGNMAP[2] ) then
		camp = 2
		cityname = "Phe Kim"
		defencemap = tbDEFENCE_MAPID[2]
		defencesidx = SubWorldID2Idx( defencemap )
	else
		print("citydefence signmap error!!! mapid = "..signmap)
		return
	end
	local guanyuanname = cityname.."T��ng qu�n th� th�nh"
	
	local level = GetLevel()
	if ( level < CD_LEVEL_LIMIT ) then
		Talk(1, "", CD_SIGNNPCNAME..": Ti�u qu� t� ��u ��n? Kh�ng mu�n s�ng �? ��ng c�p c�n ch�a ��!"..CD_LEVEL_LIMIT.."c�p, ch�y ��n ti�n tuy�n, ng��i t��ng ��y l� ��u? ��ng c� m� �i lung tung, n�u kh�ng ng��i c� ch�t c�ng kh�ng bi�t t�i sao!")
		Msg2Plalyer("��ng c�p l�n h�n"..CD_LEVEL_LIMIT.."c�p m�i c� th� tham gia chi�n tranh v� qu�c.")
		return
	end
	local oldSubWorld = SubWorld
	
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": Chi�n tr��ng ph�a tr��c x�y ra v�n ��, t�m th�i kh�ng th� v�o.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end

	SubWorld = defencesidx;
	local state = GetMissionV(MS_STATE)
	if ( state ~= 1 and state ~= 2 ) then
		Say(CD_SIGNNPCNAME..":Kh�ng c� g� b�m c�o ��ng ��n qu�y r�y ta!", 0)
		Msg2Player("V� qu�c Phong H�a li�n th�nh"..cityname.."Ho�t ��ng th� th�nh v�n ch�a b�t ��u.")
		SubWorld = oldSubWorld
		return
	end
	
	local randkey = GetMissionV( MS_RANDKEY );
	local memcount = GetMSPlayerCount(MISSIONID, 0)
	local nday = tonumber(date("%m%d"));
	local time = GetMissionV(MS_SMALL_TIME)
	SubWorld = oldSubWorld
	
	if (time >= CALLBOSS_ZHUSHUAI) then
		Say(CD_SIGNNPCNAME..": qu�n vi�n tr� c�a ta �� b� ��ch qu�n chia c�t, kh�g th� ��n ��y ���c!", 2, "�i�m t�p k�t/OnCancel", "Lu�n c�ng ban th��ng/cd_awardforpayout")
		return
	end
	
	if ( memcount >= MAX_MEMBERCOUNT ) then
		Talk(2, "", CD_SIGNNPCNAME..": Ng��i l� ai?", CD_SIGNNPCNAME..": �! Ng��i mu�n gi�p ta ch�ng l�i k� ��ch? Ng��i qu� l� y�u n��c! Binh l�c qu�n ta r�t ��y ��, ng��i c� l�ng l� t�t, nh�ng xin ng��i h�y v� �i!")
		Msg2Player("S� ng��i tham gia chi�n tranh v� qu�c �� ��y<color=yellow>"..MAX_MEMBERCOUNT.."<color>ng��i, kh�ng th� v�o chi�n tr��ng.")
		return
	end
	
--	if ( GetTask( TASKID_FIRE_DAY ) == nday and GetTask( TASKID_FIRE_KEY ) ~= randkey ) then	--��������
--		Say(CD_SIGNNPCNAME.."������ս��֮������ǻһ��ֻ�ܲμ�һ�����㻹�Ǻú����������´������ɡ�", 0)
--	elseif ( nday ~= GetTask( TASKID_FIRE_DAY ) ) then	--������
	if ( GetTask( TASKID_FIRE_KEY ) ~= randkey or  GetTask( TASKID_FIRE_DAY ) ~= nday) then	--������
		Say(CD_SIGNNPCNAME..": L� Nh�! T�n ti�u t� nh� ng��i mau �i k�u T�n S� l�i ��y, qu�n ��ch l�i ��nh ��n r�i! �? Ng��i l� ai? B�y gi� l� l�c n�o? C� ng��i �ang t�n c�ng th�nh c�a ta, ng��i c�n k�o d�i qu�n c� s� b� ch�m ��u bi�t kh�ng?", 3, "T��ng qu�n! Ta ��n gi�p th� th�nh!/#want2joincd1("..defencemap..")", "Lu�n c�ng ban th��ng/cd_awardforpayout", "�� (B�n kh�ng n�i l�i g�, ch� c��i nh�t m�t ti�ng r�i �i ) /laughtoleave")
		cd_clear_lastsumexp();		--����ϴμ�����ۼƾ���ֵ
	else
		Say(CD_SIGNNPCNAME..": �? Ch�ng ph�i ng��i �� v�o chi�n tr��ng sao? Hay l� ta bi hoa m�t? enter> Th�i ���c r�i! Ng��i ch�un b� v�o trong �� �i!", 3, "Ta mu�n gia nh�p/#sure2joincd("..defencemap..")", "Lu�n c�ng ban th��ng/cd_awardforpayout", "Ta ch� gh� qua xem/OnCancel")
	end
end

function sure2joincd(defencemap)
	local oldSubWorld = SubWorld;
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencesidx = SubWorldID2Idx( defencemap )
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": Chi�n tr��ng ph�a tr��c x�y ra v�n ��, t�m th�i kh�ng th� v�o.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end
	SubWorld = defencesidx
	local state = GetMissionV( MS_STATE )
	local time = GetMissionV(MS_SMALL_TIME)
	local memcount = GetMSPlayerCount(MISSIONID, 0)
	if ( state ~= 1 and state ~= 2 ) then
		SubWorld = oldSubWorld
		return
	end
	if (time >= CALLBOSS_ZHUSHUAI) then
		SubWorld = oldSubWorld
		return
	end
	if (memcount >= MAX_MEMBERCOUNT) then
		SubWorld = oldSubWorld
		return
	end
	local randkey = GetMissionV( MS_RANDKEY )
	local nday = tonumber(date("%m%d"))
	if ( GetTask( TASKID_FIRE_KEY ) ~= randkey or  GetTask( TASKID_FIRE_DAY ) ~= nday) then
		if (Pay(FIRE_JOINUP_FEE) == 1) then
			SetTask( TASKID_FIRE_DAY,  nday)
			SetTask( TASKID_FIRE_KEY,  randkey)
		else
			Say(CD_SIGNNPCNAME..": Sao th�, ng��i kh�ng mang theo"..floor(FIRE_JOINUP_FEE / 10000).." v�n l��ng, ta kh�ng th� cho ng��i v�o. H�y chu�n b� ti�n r�i h�y ��n t�m ta!", 0);
			return -1;
		end;
	end;
	cd_setsign_levelexp();
	JoinMission(MISSIONID, GetMissionV( MS_CITYCAMP ))
	SubWorld = oldSubWorld
end

function want2joincd1(defencemap)
	Say(CD_SIGNNPCNAME..": �! Ng��i mu�n gi�p ch�ng ta ch�ng l�i k� ��ch? �i ch�! M�y t�n n�y kh�ng gi�ng binh s� t�m th��ng, b�n ch�ng v� ngh� cao c��ng, c��i ng�a r�t t�i, l�i c�n bi�t ph�ng �m kh�.", 1, "T��ng qu�n! �ng kh�ng sao ch�?/#want2joincd2("..defencemap..")")
end

function want2joincd2(defencemap)
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencesidx = SubWorldID2Idx( defencemap )
	oldSubWorld = SubWorld
	SubWorld = defencesidx
	local cd_membercount = GetMSPlayerCount(MISSIONID, 0)
	SetTask(TSKID_PLAYER_ZHANGONG,0) --���ս��ֵ
	SubWorld = oldSubWorld
	Say(CD_SIGNNPCNAME..": ���c r�i! Kh�ng c�n n�i nhi�u, n�i chung ta c�m th�y lai l�ch c�a b�n h� r�t kh� nghi, trong l�c chi�n ��u n�u ng��i nh�t ���c th� h�m th� h�y �em ��n ta xem, ta s� tr�ng th��ng! S� ng��i tham gia th� th�nh l�<color=yellow>"..cd_membercount.."<color> ng��i. Tr��c ti�n ph�i n�p 10 v�n l� ph� b�o danh, chu�n b� s�n s�ng ch�a?", 2, "��ng v�y!/#sure2joincd("..defencemap..")", "�� ta chu�n b� ��!/OnCancel")
end

function laughtoleave()
	Talk(1, "", CD_SIGNNPCNAME.."Ta ch�ng s� b�n du m�c n�y! Ph�i cho ch�ng bi�t t�i ngh� c�a nh�n s� Trung nguy�n")
end

function cd_awardforpayout()
	if (camp == 1) then
		Talk(1, "", format("%s: H�y nghe ��y, m�i ng��i h�y d�c h�t to�n l�c cho cu�c chi�n n�y.", CD_SIGNNPCNAME))
	else
		Talk(1, "", format("%s: Qu�n Nam Man v�n ch�a nh�c ch�, ch�ng quy�t t�m gi�nh l�i chi�n l�i ph�m m� binh s� ta ph�i bao phen �� m�u m�i c� ���c. C�c d�ng s� h�y quy�t ��u tr�n n�y!", CD_SIGNNPCNAME))
	end;
end;

function OnCancel()
end
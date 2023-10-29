----------------------------------------------------------------
--FileName:	cd_signnpc.lua
--Creater:	firefox
--Date:		2005-
--Comment:	��ĩ�������ս��֮�������
--			���ܣ������㱨����
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\headinfo.lua")
CD_SIGNNPCNAME = "T��ng qu�n th� th�nh"
function main()
	local signmap = SubWorldIdx2ID( SubWorld )
	if ( signmap == tbDEFENCE_SIGNMAP[1] ) then
		camp = 1
		cityname = "Phe T�ng"
	elseif ( signmap == tbDEFENCE_SIGNMAP[2] ) then
		camp = 2
		cityname = "Phe Kim"
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
	signmap = SubWorldIdx2ID( SubWorld )
	defencemap = signmap - 2
	defencesidx = SubWorldID2Idx( defencemap )
	
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
	SubWorld = oldSubWorld
	
	if ( memcount >= MAX_MEMBERCOUNT ) then
		Talk(2, "", CD_SIGNNPCNAME..": Ng��i l� ai?", CD_SIGNNPCNAME..": �! Ng��i mu�n gi�p ta ch�ng l�i k� ��ch? Ng��i qu� l� y�u n��c! Binh l�c qu�n ta r�t ��y ��, ng��i c� l�ng l� t�t, nh�ng xin ng��i h�y v� �i!")
		Msg2Player("Hi�n nay s� ng��i tham gia chi�n tranh v� qu�c li�n th�nh �� ��y"..MAX_MEMBERCOUNT.."ng��i, kh�ng th� v�o chi�n tr��ng.")
		return
	end
	
	if ( GetTask( TASKID_FIRE_DAY ) == nday and GetTask( TASKID_FIRE_KEY ) ~= randkey ) then	--��������
		Say(CD_SIGNNPCNAME..": Ho�t ��ng chi�n tranh v� qu�c li�n th�nh 1 ng�y ch� c� th� tham gia 1 tr�n, l�n sau h�y quay l�i!", 0)
	elseif ( nday ~= GetTask( TASKID_FIRE_DAY ) ) then	--������
		Say(CD_SIGNNPCNAME..": L� Nh�! T�n ti�u t� nh� ng��i mau �i k�u T�n S� l�i ��y, qu�n ��ch l�i ��nh ��n r�i! �? Ng��i l� ai? B�y gi� l� l�c n�o? C� ng��i �ang t�n c�ng th�nh c�a ta, ng��i c�n k�o d�i qu�n c� s� b� ch�m ��u bi�t kh�ng?", 2, "T��ng qu�n! Ta ��n gi�p th� th�nh!/want2joincd1", "�� (B�n kh�ng n�i l�i g�, ch� c��i nh�t m�t ti�ng r�i �i ) /laughtoleave")
	else
		Say(CD_SIGNNPCNAME..": �? Ch�ng ph�i ng��i �� v�o chi�n tr��ng sao? Hay l� ta bi hoa m�t? enter> Th�i ���c r�i! Ng��i ch�un b� v�o trong �� �i!", 2, "Ta mu�n gia nh�p/sure2joincd", "Ta ch� gh� qua xem/OnCancel")
	end
end

function sure2joincd()
	local oldSubWorld = SubWorld;
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencemap = signmap - 2
	local defencesidx = SubWorldID2Idx( defencemap )
	if ( defencesidx < 0 ) then
		Say(CD_SIGNNPCNAME..": Chi�n tr��ng ph�a tr��c x�y ra v�n ��, t�m th�i kh�ng th� v�o.", 0)
		print("citydefence defencemap error!!!! defencemap = "..defencemap)
		return
	end
	SubWorld = defencesidx
	local state = GetMissionV( MS_STATE )
	if ( state ~= 1 and state ~= 2 ) then
		SubWorld = oldSubWorld
		return
	end
	SetTask( TASKID_FIRE_DAY, tonumber(date("%m%d")) )
	SetTask( TASKID_FIRE_KEY, GetMissionV( MS_RANDKEY ) )
	JoinMission(MISSIONID, GetMissionV( MS_CITYCAMP ))
	SubWorld = oldSubWorld
end

function want2joincd1()
	Say(CD_SIGNNPCNAME..": �! Ng��i mu�n gi�p ch�ng ta ch�ng l�i k� ��ch? �i ch�! M�y t�n n�y kh�ng gi�ng binh s� t�m th��ng, b�n ch�ng v� ngh� cao c��ng, c��i ng�a r�t t�i, l�i c�n bi�t ph�ng �m kh�.", 1, "T��ng qu�n! �ng kh�ng sao ch�?/want2joincd2")
end

function want2joincd2()
	local signmap = SubWorldIdx2ID( SubWorld )
	local defencemap = signmap - 2
	local defencesidx = SubWorldID2Idx( defencemap )
	oldSubWorld = SubWorld
	SubWorld = defencesidx
	local cd_membercount = GetMSPlayerCount(MISSIONID, 0)
	SubWorld = oldSubWorld
	Say(CD_SIGNNPCNAME..": ���c r�i! Kh�ng c�n n�i nhi�u, n�i chung ta c�m th�y lai l�ch c�a b�n h� r�t kh� nghi, trong l�c chi�n ��u n�u ng��i nh�t ���c th� h�m th� h�y �em ��n ta xem, ta s� tr�ng th��ng! S� ng��i tham gia th� th�nh l�<color=yellow>"..cd_membercount.."<color>ng��i. B�n �� s�n s�ng v�o chi�n tr��ng ch�a?", 2, "��ng v�y!/sure2joincd", "�� ta chu�n b� ��!/OnCancel")
end

function laughtoleave()
	Talk(1, "", CD_SIGNNPCNAME..": (S� ��n to�t m� h�i tr�n")
end

function OnCancel()
end
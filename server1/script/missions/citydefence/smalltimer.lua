----------------------------------------------------------------
--FileName:	smalltimer.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	��ĩ�������ս��֮�������
--			���ܣ���ʱ����ÿ20�봥��
--				
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\head.lua")
function OnTimer()
	local t = GetMissionV( MS_SMALL_TIME ) + 1
	SetMissionV( MS_SMALL_TIME, t )
	
	local citycamp = GetMissionV( MS_CITYCAMP )
	local cityname = GetMissionS(MS_S_CD_NAME)
	
	if ( t == RUNGAME_TIME ) then	--��սʱ�䵽����ʾ�سǿ�ʼ����ˢ��һ����
		RunMission(MISSIONID)
		AddGlobalNews("Chi�n tranh v� qu�c �� b�t ��u, "..tbDEFENCE_ANNOUNCE[citycamp])
		Msg2MSAll( MISSIONID, "<color=yellow>Qu�n ��ch �� b�t ��u c�ng th�nh, v� �� b�o v� th�nh ch�ng ta c�c T��ng s� h�y x�ng l�n!" )
		cd_writelog(cityname.."B�t ��u.\ts� ng��i\t"..GetMSPlayerCount(MISSIONID, 0))
		cd_buildfightnpc()
		return
	end
	
	if ( t > RUNGAME_TIME ) then
		local RestTime = (TOTAL_TIME - t * SMALL_TIME) / FRAME2TIME
		local RestMin, RestSec = GetMinAndSec(RestTime);

		if ( mod( t, 9 ) == 0 ) then
			cd_sendmsg2msall()		--ÿ��10���ӣ���ʾ��ǰXX���͹֣����ж���Ҫɱ
		end
		if ( mod(t, 15) == 0 ) then
			cd_callnpc()			--ÿ��10���ӣ�����ǰ10���ӵı�ɱ������ͨ����������ˢ��һ��
		end
		if ( mod(t, 60) == 0 and RestMin ~= 0) then
			cd_sendmsg2global()
		end
		if ( t < LASTREPORT_TIME ) then	--ÿ��5������ʾ����ʱ�䣬���5����ÿ������ʾһ��
			if ( mod( t, 15 ) == 0 ) then
				Msg2MSAll( MISSIONID, "Th�i gian k�t th�c th� th�nh c�n<color=yellow>"..RestMin.."ph�t" )
			end
		else
			if ( mod( t, 3 ) == 0 ) then
				Msg2MSAll( MISSIONID, "Th�i gian k�t th�c th� th�nh c�n<color=yellow>"..RestMin.."ph�t" )
			end
		end
	else
		if ( mod( t, 18 ) == 0 ) then	--����ʱ���У�û6������ʾ��������ʱ�䣬����������Ϣ
			RestTime = (RUNGAME_TIME - t) * SMALL_TIME / FRAME2TIME;
			RestMin, RestSec = GetMinAndSec(RestTime);
			if ( RestMin > 0 ) then
				Msg2MSAll( MISSIONID, "Th�i gian b�o danh c�n l�i l�:<color=yellow>"..RestMin.."ph�t" )
				AddGlobalNews("Cu�c chi�n �� b�t ��u nh�n b�o danh, c� mu�n tham gia kh�ng?"..tbDEFENCE_ANNOUNCE[citycamp].."Th�i gian khai chi�n c�n"..RestMin.."ph�t")
			end
		end
	end
end

function cd_callnpc()
	local tempnpc_1 = GetMissionV( MS_1RSTNPC_CCNT )
	local tempnpc_2 = GetMissionV( MS_2CNDNPC_CCNT )
	local tempnpc_3 = GetMissionV( MS_3RDNPC_CCNT )
--	local tempnpc_4 = GetMissionV( MS_4THNPC_CCNT )
--	local tempnpc_5 = GetMissionV( MS_5THNPC_CCNT )

	local tempnpc_total = tempnpc_1 + tempnpc_2 + tempnpc_3;
	if ( tempnpc_total <= 0 ) then
		return
	end
	
	local commonfile = GetMissionS( MS_S_CMNPCFILE );
	local commonxypos = {};
	local tbpos = {}
	local count = 0;
	local filehigh = GetTabFileHeight( commonfile )
	
	while ( count < tempnpc_total ) do	--���ѡ��������ĳЩ���ظ����У���Ϊnpc��������
		rannum = random( filehigh )
		flag, tbpos = cd_insertcell( tbpos, rannum )
		if ( flag == 1 ) then
			count = count + 1
		end
	end
	
	cd_addcommonnpc( tempnpc_1, tempnpc_2, tempnpc_3, tbpos, commonfile )
	cd_writelog(date("%m%d%H%M ")..format("call xiaoxiao = %d, call duizhang = %d, call xianfeng = %d",tempnpc_1, tempnpc_2, tempnpc_3))
	SetMissionV( MS_1RSTNPC_CCNT, 0 )	--ˢ��ֺ����¼���
	SetMissionV( MS_2CNDNPC_CCNT, 0 )
	SetMissionV( MS_3RDNPC_CCNT, 0 )
end

function cd_addcommonnpc( npccount_1, npccount_2, npccount_3, tbxypos, npcfile )
	local count = 0
	local citycamp = GetMissionV( MS_CITYCAMP )
	local npccamp = 1
	local npcname = "Qu�n T�ng"
	if ( citycamp == 1 ) then
		npccamp = 2
		npcname = "Qu�n Kim"
	end
	
	if ( npccount_1 > 0 ) then
		cd_addfightnpc(npcfile, 1, npccount_1, tbTNPC_SOLDIER[npccamp][1], tbSOLDIER_LEVEL[1], npcname..tbSOLDIER_NAME[1], 0, npccamp, tbFILE_NPCDEATH[1])
	end
	if ( npccount_2 > 0 ) then
		cd_addfightnpc(npcfile, (npccount_1 + 1), (npccount_1 + npccount_2), tbTNPC_SOLDIER[npccamp][2], tbSOLDIER_LEVEL[2], npcname..tbSOLDIER_NAME[2], 2, npccamp, tbFILE_NPCDEATH[2])
	end
	if ( npccount_3 > 0 ) then
		cd_addfightnpc(npcfile, (npccount_1 + npccount_2 + 1), (npccount_1 + npccount_2 + npccount_3), tbTNPC_SOLDIER[npccamp][3], tbSOLDIER_LEVEL[3], npcname..tbSOLDIER_NAME[3], 1, npccamp, tbFILE_NPCDEATH[3])
	end
end


function cd_insertcell( tbnum, cell )
	local flag = 0
	
	if( getn( tbnum ) == 0 ) then
		tbnum[ 1 ] = cell
		return 1, tbnum
	end
	
	for i = 1, getn( tbnum ) do
		if ( tbnum[i] == cell ) then
			flag = -1
			break
		end
	end
	
	if ( flag ~= -1 ) then
		tbnum[ getn( tbnum ) + 1 ] = cell
		return 1, tbnum
	end
	return 0, tbnum
end


function cd_sendmsg2msall()
	local restnpc_1 = GetMissionV( MS_1RSTNPC_TCNT )
	local restnpc_2 = GetMissionV( MS_2CNDNPC_TCNT )
	local restnpc_3 = GetMissionV( MS_3RDNPC_TCNT )
	local restnpc_4 = GetMissionV( MS_4THNPC_TCNT )
	local restnpc_5 = GetMissionV( MS_5THNPC_TCNT )
	
	local szMsg = "Chi�n b�o th� th�nh:";
	Msg2MSAll(MISSIONID, "vi�n binh tham gia th� th�nh l�c tr��c g�m<color=yellow>"..GetMSPlayerCount(MISSIONID, 0).." ng��i")
	if ( restnpc_1 ~= 0 ) then
		Msg2MSAll( MISSIONID, szMsg.."c�n h� th� th�m<color=yellow>"..tbSOLDIER_NAME[1].." "..restnpc_1.."<color> ng��i" )
	end
	if ( restnpc_2 ~= 0 ) then
		Msg2MSAll( MISSIONID, szMsg.."c�n h� th� th�m<color=yellow>"..tbSOLDIER_NAME[2].." "..restnpc_2.."<color> ng��i" )
	end
	if ( restnpc_3 ~= 0 ) then
		Msg2MSAll( MISSIONID, szMsg.."c�n h� th� th�m<color=yellow>"..tbSOLDIER_NAME[3].." "..restnpc_3.."<color> ng��i" )
	end
	
	if ( restnpc_1 == 0 and restnpc_2 == 0 and restnpc_3 == 0 ) then
		if ( restnpc_4 ~= 0 ) then
			Msg2MSAll( MISSIONID, szMsg.."c�n h� th� th�m<color=yellow>"..tbSOLDIER_NAME[4].." "..restnpc_4.."<color> ng��i" )
		else
			Msg2MSAll( MISSIONID, szMsg.."c�n h� th� th�m<color=yellow>"..tbSOLDIER_NAME[5].." "..restnpc_5.."<color> ng��i" )
		end
	end
	cd_writelog(date("%m%d%H%M\t")..format("c�n l�i %s %d\t%s %d\t%s %d\t%s %d\t%s %d",tbSOLDIER_NAME[1],restnpc_1,tbSOLDIER_NAME[2],restnpc_2,tbSOLDIER_NAME[3],restnpc_3,tbSOLDIER_NAME[4],restnpc_4,tbSOLDIER_NAME[5],restnpc_5))
end

function cd_sendmsg2global()
	local szMsg = "V� qu�c Phong H�a li�n th�nh"..GetMissionS(MS_S_CD_NAME).."Chi�n tranh �ang trong giai �o�n �c li�t."..tbDEFENCE_ANNOUNCE[GetMissionV(MS_CITYCAMP)]
	AddGlobalNews(szMsg)
end
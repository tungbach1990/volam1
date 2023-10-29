IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function OnTimer()
	local t = GetMissionV(MS_TIMER1_TIME) + 1;--��������ͳ�Ƶ�ǰ��ʱ�������˶��ٴ���
	SetMissionV(MS_TIMER1_TIME, t);
	
	--Storm �ӽ�������
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu v�c S� c�p "
	elseif (lsf_level == 2) then
		resultstr = "Khu v�c Trung c�p "
	elseif (lsf_level == 3) then
		resultstr = "Khu v�c Cao c�p "
	end
	
	if (t == RUNGAME_TIME) then --���������ʽ��սʱ�̣���ֹͣ��������ʽ����ս���׶�
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."Th�i gian b�o danh cho T�ng Kim ph��ng th�c V�n l��ng �� ��n, cu�c chi�n ch�nh th�c b�t ��u!", 2);
		Msg2MSAll(MISSIONID, "T�ng Kim ch�nh th�c khai chi�n! C�c chi�n s�! X�ng l�n!");
		WriteLog("battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end
	local gamemode = GetMissionV(MS_FLAGMODE)

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>T�ng Kim ��i chi�n ph��ng th�c V�n l��ng �ang trong th�i gian b�o danh, m�i ng��i h�y mau ��n T��ng D��ng ho�c Chu Ti�n tr�n �� b�o danh, ho�c c� th� d�ng T�ng Kim chi�u th� �� tr�c ti�p ��n �i�m b�o danh. Th�i gian khai chi�n c�n l�i l�: 	"..RestMin.."ph�t. �i�u ki�n tham gia: ��ng c�p t� 40, ph� b�o danh 3000 l��ng. Sau khi khai chi�n, n�u t�ng s� ng��i ch�a �� v�n c� th� ti�p t�c b�o danh!";
			str2 ="<#> Th�i gian b�o danh c�n l�i l�:"..RestMin.."ph�t"
		else
			str1 = resultstr.."<#>T�ng Kim ��i chi�n ph��ng th�c V�n l��ng �ang trong th�i gian b�o danh, m�i ng��i h�y mau ��n T��ng D��ng ho�c Chu Ti�n tr�n �� b�o danh, ho�c c� th� d�ng T�ng Kim chi�u th� �� tr�c ti�p ��n �i�m b�o danh. Th�i gian khai chi�n c�n l�i l�: 	"..RestMin.."ph�t"..RestSec.."gi�y. �i�u ki�n tham gia: ��ng c�p t� 40, ph� b�o danh 3000 l��ng. Sau khi khai chi�n, n�u t�ng s� ng��i ch�a �� v�n c� th� ti�p t�c b�o danh!";
			str2 = "<#> Th�i gian b�o danh c�n l�i l�:"..RestMin.."ph�t"..RestSec.." gi�y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--֪ͨ������ҿ�սʣ��ʱ��
	end
	
	if (t >= RUNGAME_TIME) then
		if (t == RUNGAME_TIME) then --��ʽ��ս�ĵ�һ�δ���ʱ������ս��Npc�����ɹ�������
			sf_buildfightnpcdata()
		else
			--ÿһ���Ӳ���һ��Npc������ͨ�浱ǰ����ʳ��������
			if (t <= VANISHGAME_TIME and mod(t, 3) == 0 ) then
				sf_callnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- ����ս��Npc				
			end
			
			bt_pop2signmap()	--���ں�Ӫ��fight=0��������ͻر�����
			
			if (mod(t, 3 ) == 0) then
				msstr = format("C�ng b�: T� l� Bao l��ng phe T�ng v� phe Kim v�n chuy�n ���c l� <color=yellow>%d:%d",BT_GetGameData(GAME_CAMP1),BT_GetGameData(GAME_CAMP2));
				Msg2MSAll(MISSIONID, msstr);
			end
		end
		
		if (t > RUNGAME_TIME) then
			local bp = mod(t - RUNGAME_TIME*2, 3*10);
			local n_b = floor((t - RUNGAME_TIME*2) / (3*10));
			
			if (bp == 0)  then
				sf_creategraingharry(n_b+1);
			end
		end
		
	end;
	
end;

function sf_creategraingharry(n_branch)
	if (n_branch > 3) then
		print("error, add grain branch is overflow !"..n_branch);
		return 0;
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	local area1 = BT_GetGameData(GAME_CAMP1AREA);
	local area2 = BT_GetGameData(GAME_CAMP2AREA);
	
	local flagposfile1 = GetIniFileData(mapfile, "Area_"..area1, "grainpos");
	local flagposfile2 = GetIniFileData(mapfile, "Area_"..area2, "grainpos");
	local flagposfile = {flagposfile1, flagposfile2};
	for n_camp = 1, 2 do
		local sz_file = flagposfile[n_camp]
		local count = GetTabFileHeight(sz_file) - 1;
		if (count < 9) then
			print("error, flagposfile height not enough!"..sz_file, count);
			return
		end
		
		for i = ((n_branch-1)*3+1), (n_branch*3) do
			local srcx = GetTabFileData(sz_file, i + 1, 1)
			local srcy = GetTabFileData(sz_file, i + 1, 2)
		
			sf_addgharry(n_camp, srcx, srcy, 0);
		end
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>Xe l��ng m�i �� ��n, h�y mau cho ng��i �i v�n l��ng.");
	end
	
end

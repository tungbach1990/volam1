Include("\\script\\missions\\fengling_ferry\\fld_head.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

function fenglingdu_main()
	orgworld = SubWorld
	for i = 1, getn( boatMAPS ) do
		mapid = boatMAPS[ i ]

		boatidx = SubWorldID2Idx(mapid)
		if (boatidx < 0) then
			local SignMapId = SubWorldIdx2ID(SubWorld);
			print("ERROR !!!BoatMap1 Is Not In This Server!", mapid); 
			SubWorld = orgworld;
			return
		end
		SubWorld = boatidx
		CloseMission(MISSIONID);
		OpenMission(MISSIONID)
		SetMissionV(MS_STATE, 1)
	end
	SubWorld = orgworld
	str = "Cu�c �ua thuy�n � Phong L�ng �� chu�n b� khai cu�c, h�y mau ��n B� Nam Phong L�ng �� g�p Thuy�n phu n�p Phong L�ng �� l�nh b�i ho�c 200 quy�n M�t �� th�n b� �� ��ng k� thuy�n!"
	AddGlobalCountNews(str, 3)
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));		-- by bel ����ǰ10���ӷ�������ˮ����Ĺ���
	if (nDate >= jf0904_act_dateS and nDate < jf0904_act_dateE) then
		local szNews = "C�n 10 ph�t n�a Quan ph� s� ph�t ��ng chi�n d�ch ti�u di�t Th�y T�c. C�c cao th� h�y chu�n b�!";
		AddGlobalNews(szNews);
	end
end
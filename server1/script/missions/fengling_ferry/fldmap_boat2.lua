Include("\\script\\missions\\fengling_ferry\\fld_head.lua")
function main()
	mapid = boatMAPS[2]
	orgworld = SubWorld
	boatidx = SubWorldID2Idx(mapid)
	if (boatidx < 0) then
		local SignMapId = SubWorldIdx2ID(SubWorld);
		print("ERROR !!!BoatMap2 Is Not In This Server!", mapid); 
		return
	end
	SubWorld = boatidx
	OpenMission(MISSIONID)
	str = "Cu�c �ua thuy�n � Phong L�ng �� chu�n b� khai cu�c, h�y mau ��n B� Nam Phong L�ng �� g�p Thuy�n phu �t n�p Phong L�ng �� l�nh b�i ho�c 200 quy�n M�t �� th�n b� �� ��ng k� thuy�n!"
	AddGlobalCountNews(str, 3)
	SetMissionV(MS_STATE, 2)
	SubWorld = orgworld
end
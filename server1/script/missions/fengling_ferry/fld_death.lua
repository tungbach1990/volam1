Include("\\script\\missions\\fengling_ferry\\fld_head.lua")

function OnDeath(Launcher)
	Msg2Player("B�n kh�ng may t� vong trong l�c �i thuy�n.")
--	Msg2MSAll(GetName().."�ڶɴ��ϲ���������")
	camp = GetCamp()
	SetCurCamp(camp)
--	SetCreateTeam(1)
--	SetDeathScript("")
	JiluDeathCount(1)		-- ��������һ��
	
	DelMSPlayer(MISSIONID, 0)	--ǿ�Ƹ�����뿪Mission
	SetLogoutRV(0);
		
	local mapid = SubWorldIdx2ID(SubWorld)
	if (mapid == 337) then
		NewWorld(fld_landingpos(1))
	elseif (mapid == 338) then
		NewWorld(fld_landingpos(2))
	elseif (mapid == 339) then
		NewWorld(fld_landingpos(3))
	else
		print("error:i don't know why")
	end
end

function JiluDeathCount(nCount)
	local mapid = SubWorldIdx2ID(SubWorld)
	if (mapid == 337) then
		AddStatData("fld_chuan1siwangrenshu", nCount)
	elseif (mapid == 338) then
		AddStatData("fld_chuan2siwangrenshu", nCount)
	elseif (mapid == 339) then
		AddStatData("fld_chuan3siwangrenshu", nCount)
	end
end
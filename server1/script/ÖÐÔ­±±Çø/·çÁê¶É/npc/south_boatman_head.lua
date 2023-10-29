Include("\\script\\missions\\fengling_ferry\\fld_head.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\lib\\common.lua");
local tbNpcname	= {"Thuy�n phu Gi�p", "Thuy�n phu �t", "Thuy�n phu B�nh"};

function south_boatman_main(BOATID)
	local MapId = boatMAPS[ BOATID ]
	if (MapId > 0) then
		local idx = SubWorldID2Idx(MapId)
		if (idx < 0) then
			Say("Xin l�i! Ph�a tr��c �ang c� nguy hi�m! T�m th�i ch�a th� l�n thuy�n!.",0)
			local SignMapId = SubWorldIdx2ID(SubWorld);
			print("ERROR !!!BoatMap[%d] and SignMap[%d] Must In Same Server!", MapId, SignMapId); 
			return
		end
		local orgworld = SubWorld
		SubWorld = idx

		boatstate = GetMissionV(MS_STATE)

		nowtime = GetMissionV(MS_TIMEACC_1MIN)

		SubWorld = orgworld

		local szNpcname = %tbNpcname[BOATID];
		if (boatstate == 1) then
			remaintime = 10 - nowtime
			if (remaintime > 0) then
				local nDate = tonumber(GetLocalDate("%Y%m%d"));
				tbBoatmanDialog	= {format("L�n thuy�n/#fld_wanttakeboat(%d)", BOATID), "L�t n�a s� quay l�i/fld_cancel"};
				if (nDate >= jf0904_act_dateS) then
					tinsert(tbBoatmanDialog, 2, "Ta ��n tham gia ho�t ��ng 'Ti�u di�t th�y t�c'/join_shuizei_act");
				end
				Say(format("%s: L�n thuy�n th�ch th�t ��! C�n %d l� thuy�n b�t ��u ch�y r�i.", szNpcname, remaintime), getn(tbBoatmanDialog), unpack(tbBoatmanDialog));
			else
				Say(format("%s: Th�t kh�ng may, thuy�n �� xu�t ph�t r�i, ng�i ��i chuy�n sau v�y nh�.", szNpcname), 0)
			end
		else
			Say(format("%s: Th�i gian ��t thuy�n n�y v�n ch�a ��n, h�y ��i th�m t� n�a ho�c �i b�n kh�c th� xem.", szNpcname), 0)
		end
		SubWorld = orgworld
	end
end




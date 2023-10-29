CP_MAPTAB = {
				{396, 397, "Thi�u L�m"},
				{398, 399, "Thi�n V��ng"},
				{400, 401, "���ng M�n"},
			 	{402, 403, "Ng� ��c"},
			 	{404, 405, "Nga Mi"},
			 	{406, 407, "Th�y Y�n"},
			 	{408, 409, "C�i Bang"},
			 	{410, 411, "Thi�n Nh�n"},
			 	{412, 413, "V� �ang"},
			 	{414, 415, "C�n L�n"}
			 }
MISSIONID = 18;
MS_STATE = 1; --�����м�¼����״̬�ı���ID
MS_ROUND = 4	--��¼�������µ��ִ�
CP_UPTO_TRYOUT = 5060120
CP_END_TRYOUT = 5061023
CP_BEGIN_HOUR = 20
CP_END_HOUR = 23



function CP_CheckOpenTime()
	if (tonumber(date("%y%m%d%H")) >= CP_UPTO_TRYOUT and tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		if(tonumber(date("%H")) >= CP_BEGIN_HOUR and tonumber(date("%H")) < CP_END_HOUR) then
			orgworld = SubWorld
			for i = 1, getn(CP_MAPTAB) do
				mapid = CP_MAPTAB[i][1]
				mapindex = SubWorldID2Idx(mapid)
				if (mapindex < 0) then
					print("ANNOUNCE: H�i tr��ng ��i h�i v� l�m"..CP_MAPTAB[i][3].."Kh�ng c� tr�n sever, ", mapid);
				else
					SubWorld = mapindex
					if(GetMissionV(MS_STATE) == 0) then
						OpenMission(MISSIONID)
						str = date("%mth�ng%dng�y").."c�a V� l�m"..CP_MAPTAB[i][3].."Thi ��u ki�t xu�t �� b�t ��u, ng��i ch�i mu�n tham gia h�y ��n h�y ��n L�m An g�p S� gi� ki�t xu�t (203, 202) b�o danh. �i�u ki�n b�o danh: ��ng c�p t� c�p 50 ��n c�p 89, s� tr�n thi ��u �t h�n 40."
						WriteLog(date("%Yn�m%mth�ng%dng�y%Hgi�%Mph�t:").."��i h�i v� l�m"..CP_MAPTAB[i][3].."Thi ��u d� tuy�n m�n ph�i �� b�t ��u!")
						AddGlobalCountNews(str, 1)
						SetMissionV(MS_STATE, 1)
						SetMissionV(MS_ROUND, 1)						
					end
				end
			end
			SubWorld = orgworld
		end
	end
end
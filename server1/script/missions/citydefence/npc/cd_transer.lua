----------------------------------------------------------------
--FileName:	transer.lua
--Creater:	firefox
--Date:		2005-
--Comment:	��ĩ�������ս��֮�������
--			���ܣ�ս���ڳ��򣬸�����Ҵ��͵�������
-----------------------------------------------------------------
Include("\\script\\missions\\citydefence\\head.lua")
--TASKID_FIRE_ADDR
function main()
	Say("Xa phu: Chi�n tranh �ang k�ch li�t! S�m bi�t ta �� b�o danh �i ti�n ph��ng r�i! ��ng r�i! Ng��i c� chuy�n g� v�y?", 2, "Ta c� chuy�n quan tr�ng b�o v�i T��ng qu�n! Xin m�i �ng ta v� h�u doanh!/sure2leave", "Kh�ng c� chi! Ta ch� ��n ��y ch�i./OnCancel" )
end

function sure2leave()
	--bt_getsignpos(camp)
	local mapid = SubWorldIdx2ID( SubWorld )
	if ( mapid == tbDEFENCE_MAPID[1] ) then
		camp = 1;
	else
		camp = 2;
	end
	SetLogoutRV(0);
	SetRevPos(tbDEFENCE_SIGNMAP[camp], random(3))
	NewWorld(bt_getsignpos(camp))
end

function OnCancel()
end
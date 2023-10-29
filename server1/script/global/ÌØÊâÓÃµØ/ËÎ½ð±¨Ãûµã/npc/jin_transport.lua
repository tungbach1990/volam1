-- ����Ի�
CurStation = 1;
Include("\\script\\global\\station.lua")
IncludeLib("BATTLE");

function main(sel)
	BT_LeaveBattle()
	SetCurCamp(GetCamp())
	SetFightState(0)
	local mapid = SubWorldIdx2ID(SubWorld);
	local tbOpp = {"Nh�ng n�i �� �i qua/WayPointFun", 
					"Nh�ng th�nh th� �� �i qua/StationFun", 
					"Tr� l�i ch� l�c n�y/TownPortalFun"};
--	if (mapid == 325) then
		tinsert(tbOpp, format("��n �i�m b�o danh phe V�ng (T)/#battle_transprot(1,%d)", mapid));
--	end;
	tinsert(tbOpp, "Kh�ng c�n ��u/OnCancel");
	Say("Nh�ng ng��i xa phu chi�n tr��ng ch�ng t�i v�o sinh ra t�, ki�m ti�n b�ng sinh m�ng m�nh! Xin gi�p cho v�i l��ng b�c!", getn(tbOpp), tbOpp);
end;

function OnCancel()
end;
function battle_transprot(nSel, mapid)
	local tbsongjin_pos = {1541, 3178};	--�η������
	local szstr = "phe V�ng (T)";
	if (nSel == 2) then
		tbsongjin_pos = {1570, 3085};
		szstr = "phe T�m (K)";
	end;
	if (mapid >= 323 and mapid <= 325) then
		NewWorld( mapid, tbsongjin_pos[1], tbsongjin_pos[2]);
		Msg2Player( "�� v�o �i�m b�o danh" );
	end
end;

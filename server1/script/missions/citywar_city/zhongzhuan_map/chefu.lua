--����ս ����Ի�
CurStation = 1;
Include("\\script\\global\\station.lua")

function main(sel)
	SetCurCamp(GetCamp())
	SetFightState(0)
	BT_LeaveBattle()
	Say("Nh�ng ng��i xa phu chi�n tr��ng ch�ng t�i v�o sinh ra t�, ki�m ti�n b�ng sinh m�ng m�nh! Xin gi�p cho v�i l��ng b�c!", 5, "Nh�ng n�i �� �i qua/WayPointFun", "Nh�ng th�nh th� �� �i qua/StationFun", "Quay l�i ��a �i�m c� /TownPortalFun","R�i kh�i ��u tr��ng /LeaveChefu","Kh�ng c�n ��u/OnCancel");
end;

function OnCancel()
end;

function LeaveChefu()
	w,x,y = RevID2WXY(GetPlayerRev());
	NewWorld(w,x/32, y/32);
end;
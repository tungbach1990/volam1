--��ɽ��ְ�ܡ�����
-- by��Dan_Deng(2003-09-16)

CurStation = 7
Include("\\script\\global\\station.lua")

function main(sel)
	Say("Thi ��u xong r�i �? C� c�n ta ��a v� kh�ng?", 4, "Nh�ng n�i �� �i qua/WayPointFun", "Nh�ng th�nh th� �� �i qua/StationFun","Tr� l�i ��a �i�m c� /TownPortalFun", "Kh�ng c�n ��u/OnCancel")
end;

function  OnCancel()
   Talk(1,"","C� ti�n th� h�y quay l�i nh�! ")
end;

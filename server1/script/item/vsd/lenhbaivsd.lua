Include("\\script\\maps\\checkmap.lua");
function main(nItemIndex)
	local pMapID, pMx, pMy = GetWorldPos();
	if GetFightState()>=1 or (IsCityMap(pMapID)~=1 and IsFreshmanMap(pMapID)~=1 and pMapID ~= 175)  then
		Msg2Player("<color=yellow>L�nh b�i Vi S�n ��o ch� c� th� s� d�ng t�i khu v�c phi chi�n ��u c�a th�nh th�, t�n th� th�n v� t�y s�n th�n<color>");
		return 1;
	end;
	--DinhHQ
	--20110407: kh�ng cho s� d�ng l�nh b�i VSD trong v��t �i 30
	if pMapID == 957 then
		Msg2Player("<color=yellow>Cu�n truy�n t�ng M�c B�c ch� c� th� s� d�ng t�i khu v�c phi chi�n ��u c�a th�nh th�, t�n th� th�n v� t�y s�n th�n<color>");
		return 1;
	end
	NewWorld(342, 1417, 2801)
	SetFightState(0);
	return 0
end



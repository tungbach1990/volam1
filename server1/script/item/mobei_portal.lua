-- Į�����;�
-- ���ú��͵�Į����ԭ��ս������
-- Edit: �ӷ���
-- Date: 2007-06-06 19:47
Include("\\script\\maps\\checkmap.lua");

function main()
	local pMapID, pMx, pMy = GetWorldPos();
	if GetFightState()>=1 or (IsCityMap(pMapID)~=1 and IsFreshmanMap(pMapID)~=1 and pMapID ~= 175)  then
		Msg2Player("<color=yellow>Cu�n truy�n t�ng M�c B�c ch� c� th� s� d�ng t�i khu v�c phi chi�n ��u c�a th�nh th�, t�n th� th�n v� t�y s�n th�n<color>");
		return 1;
	end;
	--DinhHQ
	--20110407: kh�ng cho s� d�ng m�c b�c truy�n t�ng trong v��t �i 30
	if pMapID == 957 then
		Msg2Player("<color=yellow>Cu�n truy�n t�ng M�c B�c ch� c� th� s� d�ng t�i khu v�c phi chi�n ��u c�a th�nh th�, t�n th� th�n v� t�y s�n th�n<color>");
		return 1;
	end
	local tbPos = {
		{1265,2493},
		{1281,2502},
		{1291,2546},
		{1289,2482},
	};
	local nrand = random(getn(tbPos));
	NewWorld(341, tbPos[nrand][1], tbPos[nrand][2]);
	SetFightState(0);
	SetRevPos(175,1)	--�趨����������Ϊ��ɽ��
	return 0;
end;
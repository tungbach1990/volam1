--��������
--1��������ڵ�Npc�Ի���ѡ�����ڼ���ս��
--2��������ϲ������������ս���ڣ���һ�ŵ�ͼ��������0��Ӫģʽ����
--3����������ߵ�Npc�Ի�������ѡ��������Ӫ��
--4�����Pk�������Զ����Գ����⣬���ڱ���ͼ��
--5�����������ʱ�����Զ���ͬ��ͼ��������ҹ�����ǰ��ս����
--6��������ԣ����Դ�Npc�Ի����˽⵱ǰ��������
--7���������԰��յȼ��ֳɸ�������
--��ս����Npc��ѡ����Ӫ��Npc
Include("\\script\\missions\\challenge\\challengehead.lua");

MapTab = {};

MapTab[1]= {209, 1568, 3278};
MapTab[2]= {210, 1568, 3278};
MapTab[3]= {211, 1568, 3278};

MapCount = getn(MapTab);

function main()
	if (GetCamp() == 0) then 
		Say("B�n kh�ng ph�i l� ng��i trong giang h�! Kh�ng th� v�o khi v�c chi�n ��u!",0);
		return
	end;

	--���÷��ص�
	SetTask(300, 80);
	SetTask(301, 1908);
	SetTask(302, 2844);
	Say("Hoan ngh�nh tham gia thi ��u! Ch� c� nh�ng tuy�n th� �� b�o danh m�i ���c v�o v� tr��ng! B�n mu�n v�o khu ��u n�o?", 4 , "Khu ��u th� nh�t /DoJoin", "Khu ��u th� hai /DoJoin", "Khu ��u th� ba /DoJoin","Ta kh�ng ph�i tuy�n th� tham gia thi ��u, ta kh�ng v�o. /OnCancel");
end;

function DoJoin(nSel)
	if (nSel + 1 > MapCount) then
		return
	end;
	LeaveTeam();
	WantToJoin(MapTab[nSel + 1][1], MapTab[nSel + 1][2], MapTab[nSel + 1][3]);
end;


function WantToJoin(nMapId, nX, nY)
	SetFightState(0);
	SetLogoutRV(1);
	SetTaskTemp(200,1);--��ʱ�޷��޸İ����Ӫ
	w, x, y = GetLeavePos();
	SetTempRevPos(w, x * 32 , y * 32); --������ʱ������Ϊ�����㸽��
	NewWorld(nMapId, nX, nY);
end;

function OnCancel()

end;

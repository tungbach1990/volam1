
function OnTongJoin()
	OpenMission(13);
	OnTongJoin1();
end;

function OnTongJoin1()
	tname = GetTong()
	if (tname ~= "") then
		if (GetMissionS(1) == "") then 
			SetMissionS(1,tname)
		elseif (GetMissionS(1) ~= tname) and (GetMissionS(2) == "") then
			SetMissionS(2,tname)
		end;
	end;

	if (tname == GetMissionS(1)) and (GetTask(626) > 0) then 
		if (GetJoinTongTime() >= 1440) then
			JoinTongCamp(3);
		else
			Say("��������ʱ��̫�̣����ܲμ�ս����", 0);
		end;
	elseif (tname == GetMissionS(2)) and (GetTask(626) > 0) then 
		if (GetJoinTongTime() >= 1440) then
			JoinTongCamp(2);
		else
			Say("��������ʱ��̫�̣����ܲμ�ս����", 0);
		end;
	else
		Say("�㲻�Ǳ���˫���ĳ�Ա�������볡��",0)
	end;

end;

function OnTongFighting()
	Say("Ŀǰ˫���������ڽ���֮�У������볡��",0)
end;

function JoinTongCamp(Camp)

	SetFightState(0);
	LeaveTeam();
	if (GetMSPlayerCount(13, Camp) >= 16) then
		Say("Ŀǰ�÷��������������޷��ټ����ˣ�",0)
		return
	end;
	
	AddMSPlayer(13, Camp);
	SetTaskTemp(242, 1);
	SetCurCamp(Camp);
	
	--���������йصı�������������ս���иı�ĳ�������Ӫ�Ĳ���
	SetTaskTemp(200, 1);
	
	--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetLogoutRV(1);
	
	--�������ͷ�
	SetPunish(0);
	
	--�ر���ӹ���
	SetCreateTeam(0);
	
	--��PK����
	SetPKFlag(1)
	ForbidChangePK(1);
	
	--���������㣬һ����ѡ���������ĳ���
	SetRevPos(176, 67);
	
	--���õ�ǰ��ҵ������ű�
	SetDeathScript("\\script\\missions\\olympic\\tong\\death.lua");

	x = GetTask(300);
	y = GetTask(301);
	z = GetTask(302);
	SetTempRevPos(x, y * 32, z * 32);
	if (Camp == 3) then
		str = GetName().."<#>������"..GetMissionS(1).."<#>һ����Ŀǰ������Ϊ"..GetMSPlayerCount(13,3);
		SetPos(CampPos1[1], CampPos1[2])
	elseif (Camp == 2) then
		str = GetName().."<#>������"..GetMissionS(2).."<#>һ����Ŀǰ������Ϊ"..GetMSPlayerCount(13,2);
		SetPos(CampPos2[1], CampPos2[2])
	else 
		return
	end;
		
	Msg2MSAll(13, str);
end;

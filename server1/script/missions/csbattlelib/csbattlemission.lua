function InitMission()
	SetMissionV(1,1);--��������
end;

function RunMission()

end;

function EndMission()
	for i = 1, 20 do 
		SetMissionV(i , 0);
	end;
	GameOver();
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	str2 = GetName().."R�i kh�i chi�n tr��ng, ";
	-- SetLogoutRV(0);  ��ҵ���Ҳ���Mission��OnLeave����˲����ڴ˵���SetLogoutRV(0)�������ڰ����NewWorld��Mission��ͼ�ĵط����� Fanghao_Wu 2006-3-21
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	SetPKFlag(0)--�ر�PK����
	ForbidChangePK(0);
	Msg2MSAll(1, str2);
	SetTaskTemp(200, 0);
end;
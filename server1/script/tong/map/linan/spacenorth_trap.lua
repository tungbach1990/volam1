--Include( "\\script\\tong\\map\\spacenorth_trap.lua" )
function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬����������
		SetPos(1649, 3156);		-- �����߳�Trap�㣬Ŀ�ĵ�������
		SetFightState(1);		-- ת��Ϊս��״̬
		SetTempRevPos(SubWorldIdx2ID(SubWorld),1660 * 32,3257 * 32)
	else
		SetPos(1643, 3167);		-- �����߳�Trap�㣬Ŀ�ĵ�������	
		SetFightState(0);		-- ת��Ϊ��ս��״̬
		SetRevPos(GetPlayerRev())
		SetCurCamp(GetCamp())
	end;
end;
-- ��ɽ��  ս���л���2 ��

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬����������
		SetPos(1387, 2762);		-- �����߳�Trap�㣬Ŀ�ĵ�������print (44384/32,88384/32)
		SetFightState(1);		-- ת��Ϊս��״̬
	else
		SetPos(1391, 2771);		-- �����߳�Trap�㣬Ŀ�ĵ�������	print (44512/32,88672/32)
		SetFightState(0);		-- ת��Ϊ��ս��״̬
	end;
end;
-- ��ɽ��  ս���л���1 �ҷ�

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬����������
		SetPos(1421, 2754);		-- �����߳�Trap�㣬Ŀ�ĵ�������print (45472/32,88128/32)
		SetFightState(1);		-- ת��Ϊս��״̬
	else
		SetPos(1416, 2764);		-- �����߳�Trap�㣬Ŀ�ĵ�������	print(45312/32,88448/32)
		SetFightState(0);		-- ת��Ϊ��ս��״̬
	end;
end;


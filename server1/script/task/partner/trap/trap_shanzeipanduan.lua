-- ɽ����  ս���л���

function main(sel)
	if ( GetFightState() == 1 ) then	-- ��Ҵ���ս��״̬
		SetPos(1823,3184);		-- �����߳�Trap�㣬Ŀ�ĵ��ڷ�ս������
		SetFightState(0);		-- ת��Ϊ��ս��״̬
	else
		SetPos(1826,3178);		-- �����߳�Trap�㣬Ŀ�ĵ���ս������
		SetFightState(1);		-- ת��Ϊս��״̬
	end;
end;
--������ ����������ͷ ս��״̬�л�Trap

function main(sel)

if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬�����ڳ���
	SetPos(1490, 3062)		-- �����߳�Trap�㣬Ŀ�ĵ���Ұ��	
	SetFightState(1)		-- ת��Ϊս��״̬
else			       		-- ��Ҵ���ս��״̬�����ڳ���
	SetPos(1488, 3057)		-- �����߳�Trap�㣬Ŀ�ĵ�����ͷ	
	SetFightState(0)		-- ת��Ϊ��ս��״̬
end;

end;
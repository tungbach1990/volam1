--������ ����������ͷ ս��״̬�л�Trap

function main(sel)

if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬�����ڳ���
	SetPos(1536, 3377)		-- �����߳�Trap�㣬Ŀ�ĵ���Ұ��	
	SetFightState(1)		-- ת��Ϊս��״̬
else			       		-- ��Ҵ���ս��״̬�����ڳ���
	SetPos(1532, 3380)		-- �����߳�Trap�㣬Ŀ�ĵ�����ͷ	
	SetFightState(0)		-- ת��Ϊ��ս��״̬
end;

end;
-- ս��ϵͳ
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	-- ���÷�������
	TaskName( "Tin t�c t� ��ng - th�ng b�o" );
	-- 10����һ��
	TaskInterval( 1 );
	-- 0ʱ0�ֿ�ʼ������TaskTme, ����Relay����ʱ�Ϳ�ʼ��
--	TaskTime( 18, 32 );
	-- ���ô���������0��ʾ���޴���
	TaskCountLimit( 0 );
	-- ���������Ϣ
	OutputMsg( "BATTLE 1 startup..." );
end

function TaskContent()
	Battle_StartNewRound( 1, 1 );	-- GMָ�������ս��
end
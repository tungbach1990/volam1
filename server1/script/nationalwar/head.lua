-- ��ս�ν����������������������ڹ�ս�ν�ר�������С�

TASKNO_NW_CONGRATULATION 		= 2602				-- ����������������ֽڣ���һ���ֽڣ����泯�ش������ڶ����ĸ��ֽ�time_t/(24 * 3600)

NW_TASKNO_WARRESULT				= 0					-- ��ս�ν�����1Ϊ��Ӯ��0Ϊ��Ӯ
NW_TASKNO_CONGRATULATION 		= 1					-- �ϴο�������ͬ���ʱ��
NW_TASKNO_LEVY 			 		= 2					-- �ϴ�ļ���ʱ��
NW_TASKNO_ABSOLVE		 		= 3					-- �ϴδ������µ�ʱ��
NW_TASKNO_MESSAGETIME			= 4					-- �ϴη���گ���ʱ��
NW_TASKNO_MESSAGECOUNT			= 5					-- ���ܷ���گ��Ĵ���
NW_TASKNO_FORBIDCHATTIME		= 6					-- �ϴ���ʹ����Ȩ����ʱ��
NW_TASKNO_GETDOMAINRING			= 7					-- �Ƿ���ȡ�˵ۻ�֮��
NW_TASKNO_GETEMPIRERING			= 8					-- �Ƿ���ȡ������֮��
NW_TASKNO_GETEMPIRESEAL			= 9					-- �Ƿ���ȡ����������
NW_TASKNO_NATIONALTITLE			= 10				-- �Ƿ��Ѿ����ù�����

NW_MAXLEN_NATIONTITLE 			= 20					-- ���ų�������
NW_MAXLEN_CONGRATULATIONWORDS 	= 48				-- ����ͬ��شʳ�������
NW_MAXLEN_MESSAGE				= 79				-- گ����ֽ�
NW_MINLEN_MESSAGE				= 4					-- گ�������ֽ�
NW_MAXCOUNT_MESSAGE				= 10				-- һ�ܿ��Է��͵�گ��������Ŀ

NWPOSITION_NONE					= 0					-- ��ս�ν�ְλ����
NWPOSITION_EMPEROR				= 1					-- ��ս�ν�ְλ������
NWPOSITION_KING					= 2					-- ��ս�ν�ְλ���������������Σ��������⣩
NWPOSITION_MINISTER				= 3					-- ��ս�ν�ְλ����ة��
NWPOSITION_MARSHAL				= 4					-- ��ս�ν�ְλ������Ԫ˧
NWPOSITION_PIONEER				= 5					-- ��ս�ν�ְλ���ȷ��

SECONDS_ONEWEEK 				= 7 * 24 * 3600		-- һ�ܵ�����
SECONDS_ONEDAY					= 24 * 3600			-- һ�������
SECONDS_ONEHOUR					= 3600				-- һСʱ������

CITYIDX_LINAN					= 7					-- �ٰ���������
CITYIDX_BIANJING				= 4					-- �꾩��������

SKILLID_STATE_EMPEROR			= 957				-- ���ӹ⻷
SKILLID_STATE_KING				= 956				-- �����⻷
SKILLID_STATE_MINISTER			= 955				-- ��ة��⻷
SKILLID_STATE_MARSHAL			= 954				-- �����Ԫ˧�⻷
SKILLID_STATE_PIONEER			= 953				-- �ȷ�ٹ⻷

SKILLID_SKILL_EMPEROR			= 962				-- ���Ӽ���
SKILLID_SKILL_KING				= 961				-- ��������
SKILLID_SKILL_MINISTER			= 960				-- ��ة�༼��
SKILLID_SKILL_MARSHAL			= 959				-- �����Ԫ˧����
SKILLID_SKILL_PIONEER			= 958				-- �ȷ�ټ���


TAB_TOKEN = {
	[CITYIDX_LINAN] = {6, 1, 2057},
	[CITYIDX_BIANJING] = {6, 1, 2058},
}

-- ����������
function nw_clear_task()
	
	NW_SetTask(NW_TASKNO_WARRESULT, 0)
	NW_SetTask(NW_TASKNO_CONGRATULATION, 0)
	NW_SetTask(NW_TASKNO_LEVY, 0)
	NW_SetTask(NW_TASKNO_ABSOLVE, 0)
	NW_SetTask(NW_TASKNO_MESSAGETIME, 0)
	NW_SetTask(NW_TASKNO_MESSAGECOUNT, 0)
	NW_SetTask(NW_TASKNO_FORBIDCHATTIME, 0)
	NW_SetTask(NW_TASKNO_GETDOMAINRING, 0)
	NW_SetTask(NW_TASKNO_GETEMPIRERING, 0)
	NW_SetTask(NW_TASKNO_GETEMPIRESEAL, 0)
	NW_SetTask(NW_TASKNO_NATIONALTITLE, 0)
	
end